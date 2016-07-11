<section class="content-header"> <h1> [{if $indexaction=='createindex'}]Create Index[{else}]Edit Index [{$index.Key_name}][{/if}] <small>Control panel</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] <li>Database Structure</li> <li class="active">[{$table}]</li> </ol> </section> <section class="content"> <div class="row"> <section class="col-md-12"> <div class="box"> <form id="form_index" class="form-horizontal"> <div class="box-body"> <input type="hidden" name="connid" value="[{$connid}]"/> <input type="hidden" name="table" value="[{$table}]"/> <input type="hidden" name="create_index" value="1"/> <input type="hidden" name="fieldnum" value="[{$fieldnum}]"/> <div class="form-group"> <label for="input_index_name" class="col-sm-2 control-label">Index name:</label> <div class="col-sm-10"> <input type="text" name="index[Key_name]" class="form-control" id="input_index_name" size="25" value="[{$index.Key_name}]" onfocus="this.select()"/> </div> </div> <div class="form-group"> <label for="select_index_type" class="col-sm-2 control-label">Index type:<a href="http://dev.mysql.com/doc/refman/5.1/en/alter-table.html" target="mysql_doc"><img class="icon" src="[{#s_base#}]/dbfacephp/img/s/b_help.png" width="11" height="11" alt="Documentation" title="Documentation"/></a></label> <div class="col-sm-10"> <select name="index[Index_type]" id="select_index_type" class="form-control"> <option value="PRIMARY" [{if $index.Key_name=='PRIMARY'}]selected[{/if}]>PRIMARY</option> <option value="INDEX" [{if $index.Non_unique==1}]selected[{/if}]>INDEX</option> <option value="UNIQUE" [{if $index.Key_name!='PRIMARY'&&$index.Non_unique==0}]selected[{/if}]>UNIQUE</option> <option value="FULLTEXT" [{if $index.Key_type=='FULLTEXT'}]selected[{/if}]>FULLTEXT</option> </select> </div> </div> <div class="form-group"> <div class="col-sm-offset-2 col-sm-10"> <table class="data"> <thead> <tr> <th>Field</th> <th></th> <th>Size</th> </tr> </thead> <tbody> [{section name=f start=0 loop=$fieldnum}] <tr> <td style="padding-top: 1px; padding-bottom:1px"> <select name="index[columns][names][]" class="form-control"> <option value="">-- Ignore --</option> [{section name=i loop=$fields}] <option value="[{$fields[i].Field}]">[{$fields[i].Field}] [[{$fields[i].Type}]]</option> [{/section}] </select> </td> <td>&nbsp;&nbsp;</td> <td style="padding-top: 1px; padding-bottom:1px"><input type="number" class="form-control" size="5" onfocus="this.select()" name="index[columns][sub_parts][]" value=""/></td> </tr> [{/section}] </tbody> </table> </div> </div> <fieldset class="tblFooters"> </fieldset> </div> <div class="box-footer clearfix"> <input type="button" class="btn btn-default" id="backbtn" value="Cancel"/> <div class="pull-right"> <input type="button" class="btn btn-primary" name="do_save_data" id="btn_saveindex" value="Save"/> Or Add to index &nbsp;<input type="number" class="config-textfield" name="added_fields" size="2" value="1"/>&nbsp;column(s) <input type="button" class="btn btn-default" name="add_fields" id="btn_add_fields" value="Go"/> </div> </div> </form> </div> </section> </div> </section> <script>
  $(function() {
    $('#backbtn').click(function() {
      broadcast.propagateAjax("#module=Tablestructure&connid="+[{$connid}]+"&viewname=[{$table}]");
    });

    $('#btn_add_fields').click(function() {
      $.post("?module=Tablestructure&action=createindex",
              $('#form_index').serialize()+"&add_fields=1",
              function(data,status){
                $('#content').html(data);
              }
      );
    });

    $('#btn_saveindex').click(function() {
      $.post("?module=Tablestructure&action=createindex",
              $('#form_index').serialize()+"&do_save_data=Save",
              function(json){
                var status = json.status;
                var message = json.message;
                if (!status) {
                  $.scojs_message(message, $.scojs_message.TYPE_ERROR);
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