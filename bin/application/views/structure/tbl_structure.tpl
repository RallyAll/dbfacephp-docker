<section class="content-header"> <h1> [{$table}] <small>Control panel</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] <li>Database Structure</li> <li class="active">[{$table}]</li> </ol> </section> <section class="content"> <div class="row"> <section class="col-md-12"> <div class="box"> <div class="box-header"> <h3 class="box-title">Table Structure</h3> </div> <div class="box-body table-responsive"> <form method="post" action="[{#dbfacephp_base_url#}]/index.php?c=tablestructure" name="fieldsForm" id="fieldsForm"> <input type="hidden" name="db" value="[{$dbname}]"/> <input type="hidden" name="table" value="[{$table}]"/> <table class="table table-bordered table-striped"> <thead> <tr> <th></th> <th>Action</th> <th>Field</th> <th>Type</th> <th>Null</th> <th>Default</th> <th id="th8">Extra</th> </tr> </thead> <tbody> [{section name=i loop=$fields}] <tr> <td align="center">[{$smarty.section.i.index+1}]</td> <td align="center"> <a class="" href="#module=Tablestructure&action=editfield&connid=[{$connid}]&fieldname=[{$fields[i].Field}]&table=[{$table}]"> <img src="[{#s_base#}]/dbfacephp/img/s/b_edit.png" title="Change" alt="Change" class="icon" width="16" height="16"/> </a> <a class="btn-sql" data-st= "dropcolumn" data-table="[{$table}]" data-field="[{$fields[i].Field}]" data-message="Do you really want to drop column [{$fields[i].Field}]?"> <img src="[{#s_base#}]/dbfacephp/img/s/b_drop.png" title="Drop" alt="Drop" class="icon" width="16" height="16"/> </a> <a class="btn-sql" data-st="setprimary" data-table="[{$table}]" data-field="[{$fields[i].Field}]" data-message="Do you really want to set [{$fields[i].Field}] as primary key?"> <img src="[{#s_base#}]/dbfacephp/img/s/b_primary.png" title="Primary" alt="Primary" class="icon" width="16" height="16"/> </a> <a class="btn-sql" data-st="uniquekey" data-table="[{$table}]" data-field="[{$fields[i].Field}]" data-message="Do you really want to set [{$fields[i].Field}] as unique key?"> <img src="[{#s_base#}]/dbfacephp/img/s/b_unique.png" title="Unique" alt="Unique" class="icon" width="16" height="16"/> </a> <a class="btn-sql" data-st="addindex" data-table="[{$table}]" data-field="[{$fields[i].Field}]" data-message="Do you really want to add index on [{$fields[i].Field}]?"> <img src="[{#s_base#}]/dbfacephp/img/s/b_index.png" title="Index" alt="Index" class="icon" width="16" height="16"/> </a> <a class="btn_linkcolumn" data-table="[{$table}]" data-field="[{$fields[i].Field}]"> <img src="[{#s_base#}]/dbfacephp/img/s/b_tblanalyse.png" title="Link columns" alt="Link columns" class="icon" width="16" height="16"/> </a> </td> <th nowrap="nowrap"><label for="checkbox_row_[{$smarty.section.i.index+1}]">[{$fields[i].Field}]</label></th> <td nowrap="nowrap"><bdo>[{$fields[i].Type}]</bdo></td> <td>[{$fields[i].Null}]</td> <td nowrap="nowrap"><i>[{$fields[i].Default}]</i></td> <td nowrap="nowrap">[{$fields[i].Extra}]</td> </tr> [{/section}] </tbody> </table> </form> </div> <div class="box-footer clearfix"> <form id="form_addfield"> <input type="hidden" name="connid" value="[{$connid}]"/> <input type="hidden" name="db" value="[{$dbname}]"/> <input type="hidden" name="table" value="[{$table}]"/> <img class="icon" src="[{#s_base#}]/dbfacephp/img/s/b_insrow.png" width="16" height="16" alt="Add new field"/>Add <input type="number" name="num_fields" size="2" maxlength="2" value="1" style="vertical-align: middle" onfocus="this.select()"/> field(s)<input type="radio" name="field_where" id="field_where_last" value="last" checked="checked"/> <label for="field_where_last" style="vertical-align: middle">At End of Table</label><input type="radio" name="field_where" id="field_where_first" value="first"/> <label for="field_where_first" style="vertical-align: middle">At Beginning of Table</label><input type="radio" name="field_where" id="field_where_after" value="after"/> <label for="field_where_after">After </label> <select name="after_field" class="config-picklist" style="vertical-align: middle" onclick="this.form.field_where[2].checked=true" onchange="this.form.field_where[2].checked=true"> [{section name=i loop=$fields}] <option value="[{$fields[i].Field}]">[{$fields[i].Field}]</option> [{/section}] </select> <input type="submit" value="Go" id="btn_addfield" style="vertical-align: middle"/> </form> </div> </div> </section> </div> <div class="row"> <section class="col-md-12"> <div class="box"> <div class="box-header"> <h3 class="box-title">Indexes: <a href="http://dev.mysql.com/doc/refman/5.1/en/optimizing-database-structure.html" target="mysql_doc"><img class="icon" src="[{#s_base#}]/dbfacephp/img/s/b_help.png" width="11" height="11" alt="Documentation" title="Documentation"/></a></h3> </div> <div class="box-body table-responsive"> <div id="tablestatistics_indexes"> <table class="table table-bordered table-striped"> <thead> <tr> <th>Action</th> <th>Keyname</th> <th>Type</th> <th>Unique</th> <th>Packed</th> <th>Field</th> <th>Cardinality</th> <th>Collation</th> <th>Null</th> <th>Comment</th> </tr> </thead> <tbody> [{section name=i loop=$indexs}] [{section name=j loop=$indexs[i].Fields}] <tr> [{if $smarty.section.j.rownum == 1}] <td align="center" rowspan="[{$indexs[i].fieldnum}]"> <a name="?module=Tablestructure&action=editindex&connid=[{$connid}]&table=[{$table}]&index=[{$indexs[i].Key_name}]" href="#module=Tablestructure&action=editindex&connid=[{$connid}]&table=[{$table}]&index=[{$indexs[i].Key_name}]"> <img src="[{#s_base#}]/dbfacephp/img/s/b_edit.png" title="Edit" alt="Edit" class="icon" width="16" height="16"/> </a> [{if $indexs[i].Key_name=='PRIMARY'}] <a type="button" class="btn-sql" data-st="dropprimary" data-table="[{$table}]" data-field="[{$fields[i].Field}]" data-message="Do you really want to remove the primary key on table of [{$table}]?"> [{else}] <a type="button" class="btn-sql" data-st="dropindex" data-table="[{$table}]" data-field="[{$indexs[i].Key_name}]" data-message="Do you really want to drop the index [{$indexs[i].Key_name}]?"> [{/if}] <img src="[{#s_base#}]/dbfacephp/img/s/b_drop.png" title="Drop" alt="Drop" class="icon" width="16" height="16"/> </a> </td> <th rowspan="[{$indexs[i].fieldnum}]">[{$indexs[i].Key_name}]</th> <td rowspan="[{$indexs[i].fieldnum}]">[{$indexs[i].Index_type}]</td> <td rowspan="[{$indexs[i].fieldnum}]">[{if $indexs[i].Non_unique == 0}]Yes[{else}]No[{/if}]</td> <td rowspan="[{$indexs[i].fieldnum}]">[{$indexs[i].Packed}]</td> [{/if}] <td>[{$indexs[i].Fields[j].Column_name}]</td> <td>[{$indexs[i].Fields[j].Cardinality}]</td> <td>[{$indexs[i].Fields[j].Collation}]</td> <td>[{$indexs[i].Fields[j].Null}]</td> [{if $smarty.section.j.rownum == 1}] <td rowspan="[{$indexs[i].fieldnum}]">[{$indexs[i].Comment}]</td> [{/if}] </tr> [{/section}] [{/section}] </tbody> </table> </div> </div> <div class="box-footer clearfix"> <form method="post" id="form_addindex"> <input type="hidden" name="connid" value="[{$connid}]"/> <input type="hidden" name="db" value="[{$dbname}]"/> <input type="hidden" name="table" value="[{$table}]"/> Create an index on&nbsp;<input type="number" size="2" name="fieldnum" value="1"/>&nbsp;columns&nbsp;&nbsp;<input type="submit" name="create_index" value="Go" onclick="return checkFormElementInRange(this.form, 'idx_num_fields','Column count has to be larger than zero.',1)"/> </form> </div> </div> </section> </div> </div> </section> <div class="modal fade" tabindex="-1" role="dialog" id="dialog_columnlinks"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="modal_title"></h4> </div> <div class="modal-body"> <p id="modal"></p> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> <button type="button" class="btn btn-primary" id="btn_save_link">Save</button> </div> </div> </div> </div> <script>
$(function() {
  $('#form_addfield').submit(function(event) {
    event.preventDefault();
    broadcast.propagateAjax("module=Tablestructure&action=addfield&"+$("#form_addfield").serialize());
  });
  
  $('#form_addindex').submit(function(event) {
    event.preventDefault();
    broadcast.propagateAjax("module=Tablestructure&action=createindex&"+$("#form_addindex").serialize());
  });

  var columnLinksDialog = $("#dialog_columnlinks");

  $('#btn_save_link').click(function() {
    $.post('?module=Structure&action=save_table_link', $('#form_link').serialize(), function(json) {
      $.scojs_message(json.message, $.scojs_message.TYPE_OK);
      
    }, 'json');
    columnLinksDialog.modal('hide');
  });
  $('a.btn_linkcolumn').click(function() {
    var table = $(this).attr('data-table');
    var field = $(this).attr('data-field');
    $.post('?module=Structure&action=get_link_tables', {connid : '[{$connid}]', table: table, field:field}, function(data) {
      columnLinksDialog.find(".modal-body").html(data);
      columnLinksDialog.modal('show');
    });
  });

  $('a.btn-sql').click(function() {
    var btn = $(this);
    var message =btn.attr('data-message');

    $.scojs_confirm({
      content: message,
      action: function() {
        var st = btn.attr('data-st');
        var table = btn.attr('data-table');
        var field = btn.attr('data-field');
        var connid = '[{$connid}]';

        var form_post =  {st: st, connid: connid, table: table, field:field};

        $.post('?module=Sql', form_post, function(json) {
          var type = json.flag ? $.scojs_message.TYPE_OK : $.scojs_message.TYPE_ERROR;
          $.scojs_message(json.message, type);
          if (json.flag && json.continue) {
            broadcast.propagateAjax(json.continue);
          }
        }, 'json');
        this.destroy();
      }
    }).show();
  });
});
</script>