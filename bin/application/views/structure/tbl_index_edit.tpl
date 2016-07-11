<section class="content-header"> <h1> [{if $indexaction=='createindex'}]Create Index[{else}]Edit Index [{$index.Key_name}][{/if}] <small>Control panel</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] <li>Database Structure</li> <li class="active">[{$table}]</li> <li class="active">[{if $indexaction=='createindex'}]Create Index[{else}]Edit Index [{$index.Key_name}][{/if}]</li> </ol> </section> <section class="content"> <div class="row"> <section class="col-md-12"> <div class="box box-primary"> <form class="form-horizontal" id="form_index"> <div class="box-body"> <input type="hidden" name="connid" value="[{$connid}]"/> <input type="hidden" name="table" value="[{$table}]"/> <input type="hidden" name="create_index" value="1"/> <input type="hidden" name="fieldnum" value="[{$fieldnum}]"/> <input type="hidden" name="old_index" value="[{$index.Key_name}]"/> <div class="form-group"> <label for="input_index_name" class="col-sm-2 control-label">Index name:</label> <div class="col-sm-10"> <input type="text" name="index[Key_name]" id="input_index_name" class="form-control" size="25" value="[{$index.Key_name}]" onfocus="this.select()"/> </div> </div> <div class="form-group"> <label for="select_index_type" class="col-sm-2 control-label">Index type:</label> <div class="col-sm-10"> <select class="form-control" name="index[Index_type]" id="select_index_type"> <option value="PRIMARY" [{if $index.Key_name=='PRIMARY'}]selected[{/if}]>PRIMARY</option> <option value="INDEX" [{if $index.Non_unique==1}]selected[{/if}]>INDEX</option> <option value="UNIQUE" [{if $index.Key_name!='PRIMARY'&&$index.Non_unique==0}]selected[{/if}]>UNIQUE</option> <option value="FULLTEXT" [{if $index.Key_type=='FULLTEXT'}]selected[{/if}]>FULLTEXT</option> </select> </div> </div> <div class="form-group"> <div class="col-sm-offset-2 col-sm-10"> <table class="data"> <thead> <tr> <th>Field</th> <th></th> <th>Size</th> </tr> </thead> <tbody> [{section name=f loop=$index.Fields}] <tr> <td style="padding-top: 1px; padding-bottom:1px"> <select class="form-control" name="index[columns][names][]"> <option value="">-- Ignore --</option> [{section name=i loop=$fields}] <option value="[{$fields[i].Field}]" [{if $index.Fields[f].Column_name == $fields[i].Field}]selected[{/if}]> [{$fields[i].Field}] [[{$fields[i].Type}]] </option> [{/section}] </select> </td> <td>&nbsp;&nbsp;</td> <td style="padding-top: 1px; padding-bottom:1px"> <input type="number" size="5" class="form-control" name="index[columns][sub_parts][]" value="[{$index.Fields[f].Sub_part}]"/> </td> </tr> [{/section}] </tbody> </table> </div> </div> </div> <div class="box-footer clearfix"> <input type="button" class="btn btn-default" id="backbtn" value="Cancel"/> <input type="button" class="btn btn-primary pull-right" id="btn_save_index" value="Save"/> </div> </form> </div> </section> </div> </section> <script>
$(function() {
  $('#backbtn').click(function() {
    broadcast.propagateAjax("#module=Tablestructure&connid="+[{$connid}]+"&viewname="+'[{$table}]');
  });

  $('#btn_save_index').click(function() {
    $.post("?module=Tablestructure&action=editindex",
      $('#form_index').serialize()+"&do_save_data=Save",
      function(json){
        var status = json.status;
        var message = json.message;
        if (status == 0) {
          $.scojs_message(message, $.scojs_message.TYPE_ERROR);
        } else {
          // success, open the table structure
          var tablename = json.table;
          broadcast.propagateAjax("#module=Tablestructure&viewname="+'[{$table}]'+"&connid="+[{$connid}]);
        }
      }, 'json'
    );
  });
});
</script>