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
  
  dbface.charts_params = dbface.charts_params || {};
  dbface.charts_params[uniqueid] = params;

  $.post("?module=App", params, function( json ) {
    if (json.flag == 'message') {
      $('#overlay'+uniqueid).hide();
      $('#loading-img'+uniqueid).hide();
      $("#"+uniqueid).html(json.message);
      return;
    }
    if (json && json.option) {
      if (linked_app != "") {
        json.option.series[0].events = {click: function(e) {
          openLinkedApp(linked_app, e.point.name);
        }};
      }
      var myChart = $('#'+uniqueid).highcharts(json.option);
      dbface.charts[uniqueid] = myChart;
      $('#overlay'+uniqueid).hide();
      $('#loading-img'+uniqueid).hide();
    }
  });
});
</script>