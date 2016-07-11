<section class="content-header"> <h1> Database Structure <small>Control panel</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] <li class="active">Database Structure</li> </ol> </section> <section class="content"> [{if $has_sqlconfirm == true}][{include file="sqlconfirm.tpl"}][{/if}] <div class="row"> <section class="col-md-12"> <div class="box"> <div class="box-header"> <h3 class="box-title">Database Structure</h3> </div> <div class="box-body table-responsive"> <form name="tablesForm" id="tablesForm"> <input type="hidden" name="db" value="[{$dbname}]"/> <table class="table table-hover"> <thead> <tr> <th></th> <th>Action</th> <th>Table</th> <th>Records</th> <th>Type</th> <th>Collation</th> <th>Size</th> </tr> </thead> <tbody> [{section name=i loop=$tables}] <tr> <td>[{$smarty.section.i.index+1}]</td> <td> <a type="button" class="btn btn-primary btn-xs btn-flat" name="?module=App&connid=[{$connid}]&viewname=[{$tables[i].TABLE_NAME}]&o=1" href="#module=App&connid=[{$connid}]&viewname=[{$tables[i].TABLE_NAME}]&o=1"><i class="fa fa-external-link"></i></a> <a type="button" class="btn btn-info btn-xs btn-flat" name="?module=Tablestructure&connid=[{$connid}]&viewname=[{$tables[i].TABLE_NAME}]" href="#module=Tablestructure&connid=[{$connid}]&viewname=[{$tables[i].TABLE_NAME}]"><i class="fa fa-cogs"></i></a> <a type="button" class="btn btn-danger btn-xs btn-flat btn-sql" data-st="truncate" data-message="Do you really want to empty table [{$tables[i].TABLE_NAME}]?" data-table="[{$tables[i].TABLE_NAME}]"><i class="fa fa-trash"></i></a> <a type="button" class="btn btn-warning btn-xs btn-flat duplicatebtn" data-tablename="[{$tables[i].TABLE_NAME}]" href="javascript:;"><i class="fa fa-copy"></i></a> <a type="button" class="btn btn-danger btn-xs btn-flat btn-sql" data-st="droptable" data-message="Do you really want to drop table [{$tables[i].TABLE_NAME}]?" data-table="[{$tables[i].TABLE_NAME}]"><i class="fa fa-remove"></i></a> <a type="button" data-table="[{$tables[i].TABLE_NAME}]" class="btn btn-primary btn-xs btn-flat btn-upload" href="javascript:;"><i class="fa fa-upload"></i></a> </td> <th><label for="checkbox_tbl_[{$smarty.section.i.index+1}]" title="[{$tables[i].TABLE_NAME}]">[{$tables[i].TABLE_NAME}]</label></th> <td class="value">[{$tables[i].TABLE_ROWS}]</td> <td nowrap="nowrap">[{$tables[i].ENGINE}]</td> <td nowrap="nowrap">[{$tables[i].TABLE_COLLATION}]</td> <td class="value">[{$tables[i].DATA_LENGTH}]</td> </tr> [{/section}] </tbody> </table> </form> </div> </div> </section> </div> <div class="row"> <section class="col-md-12"> <div class="box"> <div class="box-header"> <h3 class="box-title"><img class="icon" src="[{#s_base#}]/dbfacephp/img/addapp.gif" width="16" height="16"/>Create new table on database [{$dbname}]</h3> </div> <form class="form-horizontal" id="form_create_table"> <input type="hidden" name="connid" value="[{$connid}]"/> <div class="box-body"> <div class="form-group"> <label for="tblname" class="col-sm-2 control-label">Name:</label> <div class="col-sm-10"> <input type="text" id="tblname" class="form-control" name="table" value="[{$table}]"/> </div> </div> <div class="form-group"> <label for="tblnumfields" class="col-sm-2 control-label">Number of fields:</label> <div class="col-sm-10"> <input id="tblnumfields" type="number" class="form-control" name="num_fields" value="[{$num_fields}]"/> </div> </div> </div> <div class="box-footer clearfix"> <button type="submit" class="btn btn-primary pull-right">Create</button> </div> </form> </div> </section> </div> </section> <div id="uploadDIV" class="modal fade"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> <h4 class="modal-title">Upload CSV file to table [{$dbname}]</h4> </div> <form role="form" id="form_csvupload"> <input type="hidden" name="csv_table_input" id="csv_table_input"/> <input type="hidden" name="connid" value="[{$connid}]"/> <div class="modal-body clearfix"> <div class="form-group"> <div class="col-sm-12"> <div> <label>Delimiter:</label> <select id="delimiter" name="delimiter" onchange="javascript:changeDelimiter()"> <option value="1" selected>,</option> <option value='0'>;</option> <option value='2'>Tab</option> </select> <label>Line Delimiter:</label> <select id="linedelimiter" name="linedelimiter" onchange="javascript:changeDelimiter()"> <option value="0">\n</option> </select> <label>Enclosure:</label> <select id="enclosure" name="enclosure" onchange="javascript:changeDelimiter()"> <option value='0' selected>&quot;</option> <option value="1">'</option> <option value="2">None</option> </select> </div> </div> </div> <div class="form-group"> <div class="col-sm-12"> <div class="uploadtarget"></div> </div> </div> <div class="form-group"> <div class="col-sm-12"> <div id="csv_table" class="table-responsive" style="display:none"></div> </div> </div> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">[{'strClose'|translate}]</button> <button type="submit" data-style="expand-right" data-size="l" class="btn btn-primary ladda-button"><span class="ladda-label">[{'Upload'|translate}]</span></button> </div> </form> </div> </div> </div> <div id="duplicateDIV" class="modal fade"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> <h4 class="modal-title">Duplicate table on database [{$dbname}]</h4> </div> <div class="modal-body"> <form role="form"> <input type="hidden" id="duplicate_orgtable" value=""/> <div class="form-group"> <label>New Table Name:</label> <input type="text" id="duplicate_newtable" class="form-control"/> </div> <div class="form-group"> <label class="checkbox-inline"><input type="checkbox" id="duplicaterecord" checked>Duplication records</label> </div> </form> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">[{'strClose'|translate}]</button> <button type="button" class="btn btn-primary" id="btn_duplicatetable">[{'strConfirm'|translate}]</button> </div> </div> </div> </div> <script>
  function check_tbl() {
    var tblname = document.getElementById('tblname').value.replace(/(^\s*)|(\s*$)/g, "");
    var tblnumfields = document.getElementById('tblnumfields').value.replace(/(^\s*)|(\s*$)/g, "");
    if (tblname == "") {
      alert("The table name is empty! ");
      return false;
    }
    if (isNaN(tblnumfields)) {
      alert("Please enter a valid number!");
      return false;
    }
    return true;
  }

  $(function () {
    function onStart(e, files) {
    }

    function onComplete(e, file, response) {
    }

    function onFileStart(e, file) {
    }

    function onFileProgress(e, file, percent) {
    }

    function onFileComplete(e, file, response) {
      if (response.indexOf('!message!') == 0) {
        var msg = response.substring('!message!'.length);
        $.scojs_message(msg, $.scojs_message.TYPE_ERROR);
        return;
      }
      // All done!
      $('#csv_table').html(response).show();
    }

    function onFileError(e, file, error) {
      $.scojs_message('File Upload Error: ' + error, $.scojs_message.TYPE_ERROR);
    }

    function get_upload_action() {
      var delimiter = $('#delimiter').val();
      var linedelimiter = $('#linedelimiter').val();
      var enclosure = $('#enclosure').val();
      return "?module=Conn&action=csvupload&delimiter="+delimiter+"&linedelimiter="+linedelimiter+"&enclosure="+enclosure;
    }

    $('#form_csvupload').submit(function(event) {
      event.preventDefault();
      var param = $('#form_csvupload').serialize();
      $.post('?module=Conn&action=confirm_csv_upload', param, function(json) {
        if (json.status == 0) {
          $.scojs_message('File Upload Failed.' + json.message, $.scojs_message.TYPE_ERROR);
        } else {
          $.scojs_message('CSV file has imported into the table!', $.scojs_message.TYPE_OK);
          $('#uploadDIV').modal('hide');

        }
      }, 'json');
    });

    $("#form_create_table").submit(function (event) {
      event.preventDefault();
      broadcast.propagateAjax("module=Structure&action=createtable&" + $("#form_create_table").serialize());
    });

    $('a.btn-upload').click(function () {
      var table = $(this).attr('data-table');

      $('#csv_table_input').val(table);
      $('#uploadDIV').modal({show:true});
    });

    $('.btn-sql').click(function () {
      var st = $(this).attr('data-st');
      var table = $(this).attr('data-table');
      var connid = '[{$connid}]';
      var message = $(this).attr('data-message');

      $.scojs_confirm({
        content: message,
        action: function () {
          $.post('?module=Sql', {st: st, connid: connid, table: table}, function (json) {
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

    $(".uploadtarget").dropper({
      action: get_upload_action,
      label: "[{'strUploadLabel'|translate}]",
      postKey: 'userfile',
      maxSize: 524288000
    }).on("start.dropper", onStart)
      .on("complete.dropper", onComplete)
      .on("fileStart.dropper", onFileStart)
      .on("fileProgress.dropper", onFileProgress)
      .on("fileComplete.dropper", onFileComplete)
      .on("fileError.dropper", onFileError);

    $('#btn_duplicatetable').click(function () {
      $('#duplicateDIV').modal('hide');
      var connid = '[{$connid}]';
      var tblname = $('#duplicate_newtable').val();
      var duprecord = $('#duplicaterecord').checked ? 1 : 0;
      var orgtable = $('#duplicate_orgtable').val();
      $.post('?module=Duplicatetable&action=doduplicate', {connid: connid, tblname: tblname, orgtable: orgtable, duprecord: duprecord}, function (json) {
        if (json.flag) {
          broadcast.propagateAjax("module=Tablestructure&connid=" + [{$connid}] + "&viewname=" + tblname);
        } else {
          broadcast.propagateAjax("module=Structure&connid=" + [{$connid}]);
        }
      }, 'json');
    });

    $('.duplicatebtn').click(function () {
      var viewname = $(this).attr('data-tablename');
      $('#duplicate_orgtable').val(viewname);
      $('#duplicateDIV').modal({show:true, backdrop:'static'});
    });
  });
</script>