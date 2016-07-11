<div id="[{$CHARTID}]" class="chartdiv" style="height:[{if isset($chartheight)}][{$chartheight}][{else}]300[{/if}]px"></div> <div id="previewdialog"></div> <script>
$(function() {
  var uniqueid = '[{$CHARTID}]';
  var sid = '[{if isset($SID) && !empty($SID)}][{$SID}][{/if}]';
  var formid = '[{if isset($FORMID) && !empty($FORMID)}][{$FORMID}][{/if}]';
  var cacheflag = '[{$no_cache}]';

  var view_charttype = '[{$view_charttype}]';

  var linked_app = "[{$chart_linkapp}]";
  
  var formparams = "";
  if (formid!="") {
    formparams = $('#'+formid).serialize();
  }
  if (sid !="") {
    formparams = "&SID="+sid
  }
    
  var appid = '[{$appid}]';
  var nc = cacheflag == '1';
  var params = {};
  params['appid'] = appid;
  params['json'] = 1;
  if (nc) {
    params['nc'] = 1;
  }
  if (!dbface.charts) {
    dbface.charts = {}
  }
  
  if (view_charttype) {
    params['view_charttype'] = view_charttype;
    params['t'] = new Date().getTime();
  }
	 [{if $parameters}]
	 [{foreach from=$parameters key=k item=v}]
	 params['[{$k}]'] = '[{$v}]';
	 [{/foreach}]
	 [{/if}]
  
  params = $.param(params);
  if (formparams) {
    params = params + "&" + formparams;
  }
  
  var domMain = document.getElementById(uniqueid);
  var chart_theme = "[{if isset($chart_theme)}][{$chart_theme}][{else}]infographic[{/if}]";
  var myChart = echarts.init(domMain, chart_theme);
  
  try {
    myChart.showLoading({
      text : "Loading...",
      effect : "whirling",
      textStyle : {
        fontSize : 20
      }
    });
  } catch(err) {
  }

  if (linked_app != "") {
    myChart.on("click", function (param) {
      openLinkedApp(linked_app, param.name);
    });
  }
  dbface.charts_params = dbface.charts_params || {};
  dbface.charts_params[uniqueid] = params;
  
  $.post( "?module=App", params, function( json ) {
    try {
      myChart.hideLoading();
    } catch(e) {
    }
    if (json.flag == 'message') {
      $('#overlay'+uniqueid).hide();
      $('#loading-img'+uniqueid).hide();
      $("#"+uniqueid).html(json.message);
      return;
    }
    dbface.charts[uniqueid] = myChart;
    $('#overlay'+uniqueid).hide();
    $('#loading-img'+uniqueid).hide();
    if (json && json.option) {
      try {
        myChart.setOption(json.option, true);
        myChart.resize();
      } catch(e) {
        alert(e.name  +   " :  "   +  e.message);
      }
    }
  });  

  $("#" + uniqueid).resize(function () {
    var chart = dbface.charts[uniqueid];
    if (chart && chart.resize) {
       chart.resize();
    }
  });
  
  $(window).on('resize', function () {
    var chart = dbface.charts[uniqueid];
    if (chart) {
      chart.resize();
    }
  });  
});

function saveAsImage(uniqueid) {
  var chart = dbface.charts[uniqueid];
  var image = chart.getConnectedDataURL("png");
  var downloadDiv = document.createElement('div');
  downloadDiv.id = '__echarts_download_wrap__';
  downloadDiv.style.cssText = 'position:fixed;'
      + 'z-index:99999;'
      + 'display:block;'
      + 'top:0;left:0;'
      + 'background-color:rgba(33,33,33,0.5);'
      + 'text-align:center;'
      + 'width:100%;'
      + 'height:100%;'
      + 'line-height:' 
      + document.documentElement.clientHeight + 'px;';
              
  var downloadLink = document.createElement('a');
  //downloadLink.onclick = _saveImageForIE;
  downloadLink.href = image;
  downloadLink.setAttribute('download', "download.png");
  downloadLink.innerHTML = '<img style="vertical-align:middle" src="' + image 
              + '" title="'
              + (!!(window.attachEvent 
                   && navigator.userAgent.indexOf('Opera') === -1)
                ? 'Click the right mouse button and save image...'
                : ('Click to save'))
              + '"/>';
          
  downloadDiv.appendChild(downloadLink);
  document.body.appendChild(downloadDiv);
  downloadLink = null;
  downloadDiv = null;
  setTimeout(function (){
      var _d = document.getElementById('__echarts_download_wrap__');
      if (_d) {
          _d.onclick = function () {
              var d = document.getElementById(
                  '__echarts_download_wrap__'
              );
              d.onclick = null;
              d.innerHTML = '';
              document.body.removeChild(d);
              d = null;
          };
          _d = null;
      }
  }, 500);
}
</script>