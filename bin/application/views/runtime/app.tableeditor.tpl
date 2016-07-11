<script>
  var columnTypes = new Array();
  [{section name=i loop=$fields}]columnTypes[[{$smarty.section.i.index}]] = [{$fields[i].type}];[{/section}]
</script> <div class="box-body table-responsive"> <div id="pagebanner"> [{include file="new/pagebanner.tpl"}] </div> <form method="post" id="mainForm" name='mainForm'> <input type="hidden" name="appid" value="[{$appid}]"> <input type="hidden" name="viewname" value="[{$viewname}]"> <input type="hidden" name="orderColumnName" value=""> <input type="hidden" name="orderMethod" value=""> <input type="hidden" name="pageNo" value=""> <input type="hidden" name="rowNo" value=""> <input type="hidden" name="downloadType" value=""> <input type="hidden" name="filterDisplay" value="none"> <div id="moreFilterDialog" style="display:none;margin-top:10px;margin-bottom:10px"> <table border="0" cellpadding="0" cellspacing="0" class="filterdialog" id="filter_table"> <tbody id="filter_body"> <tr id="filter_row0"> <td style="text-align:center;align:center" nowrap> <select name="sqlcondition[]" class="sqlcondition"> [{section name=i loop=$fields}] <option value="[{$fields[i].name}]" [{if $filter_column == $fields[i].name}]selected[{/if}]>[{$fields[i].name}]</option> [{/section}] </select> <select name="sqlop[]" class="sqlop" onchange="javascript:change_operator(this);"> <option value="=" [{if !empty($filter_column)}]selected[{/if}]>equals</option> <option value=">">greater than</option> <option value=">=">greater or equal</option> <option value="<">less than</option> <option value="<=">less or equal</option> <option value="<>">not equal to</option> <option value="like">contains</option> <option value="not like">does not contain</option> <option value="in">includes</option> <option value="not in">not includes</option> <option value="between">between</option> <option value="not between">not between</option> <option value="is null">is null</option> <option value="is not null">is not null</option> <option value="ignore" [{if empty($filter_column)}]selected[{/if}]>--No Filter--</option> </select> <input type="text" name="sqlvalue[]" class="sqlvalue" value="[{if !empty($filter_column)}][{$filter_value}][{/if}]"> <select name="sqljoin[]" class="config-picklist"> <option value="and" selected>and</option> <option value="or">or</option> </select> <a href="javascript:void(0);" onclick="javascript:pick_data2(this, '[{$viewname}]', '[{$appid}]')"><img src="[{#s_base#}]/dbfacephp/img/pickdt.gif" alt="Pick distinct data from table" title="Pick distinct data from table" align="absmiddle"/></a><a href="javascript:;" onclick="javascript:addCondition();"><img src="[{#s_base#}]/dbfacephp/img/add2.gif" alt="add new condition." title="add new condition." align="absmiddle"/></a><a href="javascript:;" onclick="javascript:delFilter(this);"><img src="[{#s_base#}]/dbfacephp/img/delete2.gif" alt="Remove the condition." title="Remove the condition." align="absmiddle"/></a> </td> </tr> <tr id="filter_button"> <td style="text-align:center;align:center" nowrap> <input type="button" class="btn btn-primary btn-sm" onclick="javascript:sv_filter();" value="[{'strApply'|translate}]"/> <input type="button" class="btn btn-default btn-sm" onclick="$('#moreFilterDialog').toggle();document.mainForm.filterDisplay.value='none';" value="[{'strClose'|translate}]"/> <a style="valign:bottom" href="javascript:resetFilters();sv_filter();" class="subopen">[{'strClearAllFilters'|translate}]</a> </td> </tr> </tbody> </table> </div> <div id="orderDialog" style="display:none;margin-top:10px;margin-bottom:10px"> <table border="0" cellpadding="0" cellspacing="0" class="filterdialog" id="filter_table"> <tbody id="filter_body"> <tr id="filter_row0"> <td style="text-align:center;align:center" nowrap> <select name="sql_order_columns[]" class="sql_order_columns"> [{section name=i loop=$fields}] <option value="[{$fields[i].name}]" [{if $filter_column == $fields[i].name}]selected[{/if}]>[{$fields[i].name}]</option> [{/section}] </select> <select name="sql_order_types[]" class="sql_order_types" onchange="javascript:change_operator(this);"> <option value="asc" [{if !empty($filter_column)}]selected[{/if}]>ASC</option> <option value="desc">DESC</option> <option value="ignore" [{if empty($filter_column)}]selected[{/if}]>--No Order--</option> </select> <a href="javascript:;" onclick="javascript:addCondition();"><img src="[{#s_base#}]/dbfacephp/img/add2.gif" alt="add new condition." title="add new condition." align="absmiddle"/></a> <a href="javascript:;" onclick="javascript:delFilter(this);"><img src="[{#s_base#}]/dbfacephp/img/delete2.gif" alt="Remove the condition." title="Remove the condition." align="absmiddle"/></a> </td> </tr> <tr id="filter_button"> <td style="text-align:center;align:center" nowrap> <input type="button" class="btn btn-primary btn-sm" onclick="javascript:sv_filter();" value="[{'strApply'|translate}]"/> <input type="button" class="btn btn-default btn-sm" onclick="$('#orderDialog').toggle();document.mainForm.filterDisplay.value='none';" value="[{'strClose'|translate}]"/> <a style="valign:bottom" href="javascript:resetFilters();sv_filter();" class="subopen">Clear all orders</a> </td> </tr> </tbody> </table> </div> </form> <div id="column-data-grid" class="popover popover-default"> <div class="arrow"></div> <div class="popover-title"><span class="close" data-dismiss="popover-x">&times;</span>[{'strSelectDatas'|translate}]</div> <div class="popover-content" style="overflow-y:auto;max-height:300px"> </div> <div class="popover-footer"> <button type="button" class="btn btn-sm btn-primary" onclick="javascript:datalist_choose(this);">[{'strOK'|translate}]</button> </div> </div> <div class="box box-primary collapse" id="insertpageBOX"> <div class="box-header"> <h3 class="box-title">[{'strNewRecord'|translate}]</h3> </div> <div class="box-body"> <form class="form-horizontal" role="form"> [{section name=k loop=$fields}] <input type="hidden" name="columnNames[]" value="[{$fields[k].name}]"/> <div class="form-group"> <label class="col-sm-2 control-label">[{$fields[k].name}]:</label> <div class="col-sm-10"> <input type="text" class="form-control input-sm" name="keyValues[]" data-columnname="[{$fields[k].name}]" value=""/> </div> </div> [{/section}] <div class="form-group"> <div class="col-sm-offset-2 col-sm-10"> <button type="button" class="btn btn-default btn-sm" data-widget='dismissinsertbox'>[{'strClose'|translate}]</button> <button type="button" class="btn btn-primary btn-sm" data-widget='saveinsertbox'>[{'strSaveChanges'|translate}]</button> </div> </div> </form> </div> </div> <div id="te_container" class="borderbrown" style="overflow:auto;width:100%;height:80%;_height:400px;min-height:300px;display:block;" cellpadding="0" cellspacing="0"> [{include file="datagrid.tpl"}] </div> </div> <div class="modal fade" tabindex="-1" role="dialog" id="dialog_columnlinks"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="modal_title"></h4> </div> <div class="modal-body"> <p id="modal"></p> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary" id="btn_save_link">Save</button> </div> </div> </div> </div> <script>
$(function() {
  var hasInitFilter = '[{if $filter_column}]1[{else}]0[{/if}]';
  $("button[data-widget='dismissinsertbox']").click(function() {
    $('#insertpageBOX').collapse('hide');
  });

  $("button[data-widget='saveinsertbox']").click(function() {
    var form = $('#insertpageBOX').find("form");
    // convert the keyChecks_ to keyChecks
    var params = form.serialize();
     // appid
     var appid = $("input[name='appid']").val();
     var viewname = $("input[name='viewname']").val();
     params += "&appid="+appid+"&viewname="+viewname;

     // submit the form with the params
     $.post('?module=App&action=rowinsert', params, function(json) {
      if (json.result) {
        sv_search(1);
        $.scojs_message(json.message, $.scojs_message.TYPE_OK);
        $('#insertpageBOX').collapse('hide');
      } else {
        bootbox.alert(json.message);
      }
     }, 'json');
  });

  if (hasInitFilter == '1') {
    sv_filter();
  }

  var columnLinksDialog = $("#dialog_columnlinks");
  $('#btn_save_link').click(function() {
    $.post('?module=Structure&action=save_table_link', $('#form_link').serialize(), function(json) {
      $.scojs_message(json.message, $.scojs_message.TYPE_OK);
      sv_search(1);
    }, 'json');
    columnLinksDialog.modal('hide');
  });
});
</script>