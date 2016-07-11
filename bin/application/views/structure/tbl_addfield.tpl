<section class="content-header"> <h1> Add fields to [{$table}] <small>Control panel</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] <li>Database Structure</li> <li class="active">[{$table}]</li> <li class="active">Add fields to [{$table}]</li> </ol> </section> <section class="content"> <div class="row"> <section class="col-md-12"> <div class="box box-primary"> <form id="form_fields"> <div class="box-body table-responsive"> <input type="hidden" name="connid" value="[{$connid}]"/> <input type="hidden" name="db" value="[{$dbname}]"/> <input type="hidden" name="table" value="[{$table}]"/> <input type="hidden" name="num_fields" value="[{$num_fields}]"/> <input type="hidden" name="field_where" value="[{$field_where}]"/> <input type="hidden" name="after_field" value="[{$after_field}]"/> [{include file="structure/tbl_fields_table.tpl"}] </div> <div class="box-footer clearfix"> <input type="button" class="btn btn-default" value="Cancel" id="backbtn"/> <div class="pull-right"> <input type="button" class="btn btn-primary" id="btn_savefield" name="do_save_data" value="Save"/> Or Add <input type="number" class="config-textfield" id="added_fields" name="added_fields" size="2" value="1" onfocus="this.select()"/> field(s) <input type="button" class="btn btn-default" name="submit_num_fields" id="btn_addfields" value="Go"/> </div> </div> </form> </div> </section> </div> </section> <script>
$(function () {
  $('#backbtn').click(function () {
    broadcast.propagateAjax("#module=Tablestructure&connid=" + [{$connid}] + "&viewname=" + '[{$table}]');
  });

  $('#btn_savefield').click(function () {
    $.post("?module=Tablestructure&action=addfield",
      $('#form_fields').serialize() + "&do_save_data=Save",
      function (json) {
        var status = json.status;
        var message = json.message;
        if (status == 0) {
          $.scojs_message(message, $.scojs_message.TYPE_ERROR);
        } else {
          // success, open the table structure
          var tablename = json.table;
          broadcast.propagateAjax("#module=Tablestructure&viewname=" + '[{$table}]' + "&connid=" + [{$connid}]);
        }
      }, 'json'
    );
  });

  $('#btn_addfields').click(function() {
    $.post("?module=Tablestructure&action=addfield",
      $('#form_fields').serialize(),
      function(data,status){
        $('#content').html(data);
      }
    );
  });
});
</script>