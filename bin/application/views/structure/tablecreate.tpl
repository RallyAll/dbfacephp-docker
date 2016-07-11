<section class="content-header"> <h1> Create table [{$table}] <small>Control panel</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] <li class="active">Database Structure</li> <li class="active">Create table [{$table}]</li> </ol> </section> <section class="content"> <div class="row"> <section class="col-md-12"> <div class="box box-primary"> <form id="form_table"> <div class="box-body table-responsive"> <input type="hidden" name="connid" value="[{$connid}]"/> <input type="hidden" name="db" value="[{$dbname}]"/> <input type="hidden" name="table" value="[{$table}]"/> <input type="hidden" name="num_fields" value="[{$num_fields}]"/> [{include file="structure/tbl_fields_table.tpl"}] <table class="table table-bordered"> <tr valign="top"> <th>Table comments:&nbsp;</th> <th>Storage Engine:&nbsp; <a href="http://dev.mysql.com/doc/refman/5.1/en/storage-engines.html" target="mysql_doc"><img class="icon" src="[{#s_base#}]/dbfacephp/img/s/b_help.png" width="11" height="11" alt="Documentation" title="Documentation"/></a> </th> <th>Collation:</th> </tr> <tr> <td><input type="text" name="comment" size="40" maxlength="80" value="[{$comment}]" class="config-textfield"/></td> <td> <select name="tbl_type" class="config-picklist"> [{section name=i loop=$engines}] [{if $engines[i].Support != 'NO'}] <option value="[{$engines[i].Engine}]" title="[{$engines[i].Comment}]" [{if $engines[i].Support == 'DEFAULT' || $engines[i].Engine==$tbl_type}]selected[{/if}]>[{$engines[i].Engine}]</option> [{/if}] [{/section}] </select> </td> <td> <select name="tbl_collation" class="config-picklist"> <option value=""></option> [{foreach key=charset item=collation from=$collations}] <optgroup label="[{$charset}]" title="[{$charset}]"> [{section name=j loop=$collation}] <option value="[{$collation[j]}]" title="[{$collation[j]}]" [{if $collation[j] == $tbl_collation}]selected[{/if}]>[{$collation[j]}]</option> [{/section}] </optgroup> [{/foreach}] </select> </td> </tr> </table> </div> <div class="box-footer clearfix"> <ul> <li>If field type is "enum" or "set", please enter the values using this format: 'a','b','c'...</li> <li>If you ever need to put a backslash ("\") or a single quote ("'") amongst those values, precede it with a backslash (for example '\\xyz' or 'a\'b').</li> </ul> <input type="button" id="backbtn" class="btn btn-default" value="Cancel"/> <div class="pull-right"> <input type="button" id="btn_savetable" class="btn btn-primary" name="do_save_data" value="Save"/> Or Add <input type="number" class="config-textfield" id="added_fields" name="added_fields" size="2" value="1" onfocus="this.select()"/> field(s) <input type="button" id="btn_addfields" class="btn btn-info" name="submit_num_fields" value="Go"/> </div> </div> </form> </div> </section> </div> </section> <div class="modal fade" tabindex="-1" role="dialog" id="dialog_message"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="modal_title"></h4> </div> <div class="modal-body"> <p id="modal_message"></p> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> </div> </div> </div> </div> <script>
$(function() {
  $('#backbtn').click(function() {
    broadcast.propagateAjax("#module=Structure&connid="+[{$connid}]);
  });

  $('#btn_addfields').click(function() {
    $.post("?module=Structure&action=createtable",
      $('#form_table').serialize(),
      function(data,status){
        $('#content').html(data);
      }
    );
  });

  $('#btn_savetable').click(function() {
    $.post("?module=Structure&action=createtable",
      $('#form_table').serialize()+"&do_save_data=1",
      function(json){
        var status = json.status;
        var message = json.message;
        if (status == 0) {
          $('#modal_title').html(json.title);
          $('#modal_message').html(message);
          $('#dialog_message').modal('show');
        } else {
          // success, open the table structure
          var tablename = json.table;
          broadcast.propagateAjax("#module=Tablestructure&viewname="+tablename+"&connid="+[{$connid}]);
        }
      }, 'json'
    );
  });
});
</script>