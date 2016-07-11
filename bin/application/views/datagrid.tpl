<table id="databody" class="gridAreaTable" cellpadding="0" cellspacing="0"> <tbody> <tr> <td class="rowHead">&nbsp;</td> <td class="colHeadOP">&nbsp;</td> [{section name=i loop=$fields}] [{if $fields[i].shown}] <td class="colHead" onclick="javascript:te_selColumn(event, this);" cname="[{$fields[i].name}]"> <a href="javascript:sv_columnorder('[{$fields[i].name}]', '[{if $orderColumnName == $fields[i].name && $orderMethod == 1}]1[{elseif $orderColumnName == $fields[i].name && $orderMethod == 0}]0[{else}]2[{/if}]');">[{$fields[i].name}] <a class="btn_linkcolumn" data-table="[{$viewname}]" data-field="[{$fields[i].name}]"> <img src="[{#s_base#}]/dbfacephp/img/s/b_sdb.png" title="Link columns" alt="Link columns" class="icon" width="10" height="10"/> </a>[{if $orderColumnName == $fields[i].name && $orderMethod == 1}]<img src='[{#s_base#}]/dbfacephp/img/arrow_up.png' align='absmiddle'/>[{elseif $orderColumnName == $fields[i].name && $orderMethod == 2}]<img src='[{#s_base#}]/dbfacephp/img/arrow_down.png' align='absmiddle'/>[{else}]<img src='[{#s_base#}]/dbfacephp/img/arrow_off.png' align='absmiddle'/>[{/if}]</a> </td> [{else}] <td class="colHead" cname="[{$fields[i].name}]" style="display:none"></td> [{/if}] [{/section}] <td>&nbsp;</td> </tr> [{section name=i loop=$datas}] <tr class="tetr" onmouseover="javascript:this.className='tetrhover';" onmouseout="javascript:this.className='tetr';"> <td class="rowHead" onclick="javascript:te_selRow(event, this);">[{$smarty.section.i.index+$start}]</td> <td class="dataCell" nowrap> <div align="center"> <a href="javascript:;" data-widget="showeditform"><img src="[{#s_base#}]/dbfacephp/img/modify20.gif" align='absmiddle' title="View the selected row in a form." alt="View the selected row in a form."></a> <a href="javascript:;" data-widget="deleterow"><img src="[{#s_base#}]/dbfacephp/img/delete20.gif" align='absmiddle' title="Delete the selected row." alt="Delete the selected row."></a> </div> </td> [{section name=j loop=$fields}] [{if $fields[j].shown}] [{if $fields[j].type == $smarty.const.CDT_UPLOAD}] <td class="dataCell" cdt="[{$fields[j].type}]" style="background-color:#EEEEEE;text-align:center;"><a href="#" sethref="openblob('viewblob','[{$smarty.section.i.index+1}]','[{$smarty.section.j.index+2}]')" class="thickbox">View</a>&nbsp;<a href="#" sethref="openblob('editblob','[{$smarty.section.j.index+1}]','[{$smarty.section.j.index+2}]')" class="thickbox">Edit</a></td> [{else}] <td class="dataCell" cdt="[{$fields[j].type}]" data-columnname="[{$fields[j].name}]" data-column="[{$smarty.section.j.index+2}]" data-row="[{$smarty.section.i.index+1}]">[{if $fields[j].haslink && !empty($datas[i][j])}]<a type="button" title="Link to [{$fields[j].link.dsttable}].[{$fields[j].link.dstcolumn}]" data-dsttable="[{$fields[j].link.dsttable}]" data-dstcolumn="[{$fields[j].link.dstcolumn}]" data-value="[{$datas[i][j]}]" class="btn btn-xs btn-primary btn-tablelink">[{$datas[i][j]}]</a>[{else}][{$datas[i][j]}][{/if}]</td> [{/if}] [{else}] <td cdt="[{$fields[j].type}]" data-columnname="[{$fields[j].name}]" data-column="[{$smarty.section.j.index+2}]" data-row="[{$smarty.section.i.index+1}]" style="display:none">[{$datas[i][j]}]</td> [{/if}] [{/section}] <td>&nbsp;</td> </tr> <tr class="tetr collapse"> <td class="align-left" colspan="[{$showFieldCount + 3}]"> <div style="margin:10px;max-width:600px"> <form class="form-horizontal" role="form"> [{section name=k loop=$fields}] [{if $fields[k].primary}] <input type="hidden" name="pkColumnNames[]" value="[{$fields[k].name}]"/> <input type="hidden" name="pkColumnValues[]" value="[{$datas[i][k]}]"/> [{/if}] [{if $fields[k].shown}] <input type="hidden" name="keyColumns[]" value="[{$fields[k].name}]"/> <div class="form-group"> <label class="col-sm-4 control-label">[{$fields[k].name}]:</label> <div class="col-sm-8"> <div class="input-group input-group-sm"> <span class="input-group-addon"> <input type="checkbox" name="keyChecks_"/> </span> <input type="text" name="keyValues[]" data-columnname="[{$fields[k].name}]" class="form-control" value="[{$datas[i][k]}]" onchange="javascript:setChecked(this);"/> </div> </div> </div> [{/if}] [{/section}] <div class="form-group"> <div class="col-sm-offset-4 col-sm-9"> <button type="button" class="btn btn-default btn-sm" data-widget="dismisseditform">[{'strClose'|translate}]</button> <button type="button" class="btn btn-primary btn-sm" data-widget="saveeditform">[{'strSaveChanges'|translate}]</button> </div> </div> </form> </div> </td> </tr> [{/section}] </tbody> </table> <script>
  var lastselectCell = null;
　$(function() {
    $("td.dataCell").dblclick(function(event) {
      var editTR = $(this).parents("tr").next("tr");
      
      if (lastselectCell == event.target) {
        editTR.collapse('toggle')
      } else {
        editTR.collapse('show')
      }
      // focus current double click element
      var columnname = $(this).attr('data-columnname');
      editTR.find("input[data-columnname=" + columnname+ "]").focus();

      lastselectCell = event.target;      
    });
    
    $("button[data-widget='dismisseditform']").click(function(event) {
      $(event.target).parents("tr").collapse('hide')
    });
    
    $("button[data-widget='saveeditform']").click(function(event) {
       // submit the form
       var form = $(event.target).parents("form");
       // convert the keyChecks_ to keyChecks
       var params = form.serialize();
       $.each(form.find("input[name='keyChecks_']"), function(i, ele) {
         if ($(ele).prop('checked')) {
           params += "&keyChecks[]=1";
         } else {
           params += "&keyChecks[]=0";
         }
       });
       // appid
       var appid = $("input[name='appid']").val();
       var viewname = $("input[name='viewname']").val();
       params += "&appid="+appid+"&viewname="+viewname;
       
       // submit the form with the params
       $.post('?module=App&action=rowupdate', params, function(json) {
        if (json.result) {
          sv_search(1);
          $.scojs_message(json.message, $.scojs_message.TYPE_OK);
        } else {
          bootbox.alert(json.message);
        }
       }, 'json');
 
    });

   $("a.btn-tablelink").click(function() {
     var dsttable = $(this).attr("data-dsttable");
     var dstcolumn = $(this).attr("data-dstcolumn");
     var value = $(this).attr("data-value");

     broadcast.propagateAjax("#module=App&viewname="+dsttable + "&connid="+[{$connid}]+"&o=1&srctable=[{$viewname}]&filter_column="+dstcolumn+"&filter_value="+value);
   });
   
    var columnLinksDialog = $("#dialog_columnlinks");
    $('a.btn_linkcolumn').click(function() {
      var table = $(this).attr('data-table');
      var field = $(this).attr('data-field');
      $.post('?module=Structure&action=get_link_tables', {connid : '[{$connid}]', table: table, field:field}, function(data) {
        columnLinksDialog.find(".modal-body").html(data);
        columnLinksDialog.modal('show');
      });
    });
    
    $("a[data-widget='showeditform']").click(function(event) {
      $(event.target).parents("tr").next("tr").collapse('toggle')    
    });
    
    $("a[data-widget='deleterow']").click(function(event) {
      var form = $(event.target).parents("tr").next("tr").find("form");
      bootbox.confirm("All data of the selected row will be lost. Do you really want to delete the row data?\n\nPress OK to delete or press Cancel to return back.", function(result) {
        if (result) {          
          // convert the keyChecks_ to keyChecks
          var params = form.serialize();
          // appid
          var appid = $("input[name='appid']").val();
          var viewname = $("input[name='viewname']").val();
          params += "&appid="+appid+"&viewname="+viewname;
           
           // submit the form with the params
          $.post('?module=App&action=rowdelete', params, function(json) {
            if (json.result) {
              sv_search(1);
              $.scojs_message(json.message, $.scojs_message.TYPE_OK);
            } else {
              bootbox.alert(json.message);
            }
           }, 'json');          
        }
      }); 
     
    });    
  });
</script>