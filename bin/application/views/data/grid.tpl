<style>.htCore>tbody>tr:nth-child(even)>td{background-color:#f6fafb}.htCore>tbody>tr:nth-child(odd)>td{background-color:#fff}</style> <section class="content-header"> <h1> [{$viewname}] </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] </ol> </section> <section class="content"> <div id="myGrid"></div> <div id="grid_footer"></div> </section> <script>
$(document).ready(function () {
  var container = document.getElementById('myGrid');

  var pkColumnNames = new Array();

  [{section name=i loop=$pkColumnNames}]
  pkColumnNames.push('[{$pkColumnNames[i]}]');
  [{/section}]

  var hot = null;
  var currentPage = 1;
  var rowsPerPage = 20;
  function loadGridData(currentPage, rowsPerPage) {
    $.post('?module=Data&action=view', {connid: "[{$connid}]", vn: '[{$viewname}]', currentPage: currentPage, rowsPerPage: rowsPerPage}, function(json) {
      var advancedData = json.data;
      hot.loadData(advancedData);
    }, 'json');
  }

  hot = new Handsontable(container, {
      height: 396,
      colHeaders: [{$colHeaders}],
      rowHeaders: true,
      manualColumnResize: true,
      stretchH: 'last',
      columnSorting: true,
      contextMenu: true,
      className: "htLeft htMiddle",
      readOnly: false,
      startRows: [{$rowsPerPage}],
      columns: [{$columns}],
      afterChange: function (changes, source) {
        console.log(changes);
        if (changes == null) {
          return;
        }
        if (source == 'edit') {
          $.each(changes, function (index, change) {
            var row = change[0];
            var column = change[1];
            var oldvalue = change[2];
            var newvalue = change[3];
            var params = {};
            params["connid"] = "[{$connid}]";
            params["vn"] = "[{$viewname}]";
            params["oldvalue"] = oldvalue;
            params["newvalue"] = newvalue;
            params['md'] = column;
            for (var i = 0; i<pkColumnNames.length; i++) {
              params[pkColumnNames[i]] = hot.getDataAtRowProp(row, pkColumnNames[i]);
            }
            params['pk[]'] = pkColumnNames;
            $.post('?module=Data&action=edit', params, function (json) {
            }, "json");
          });
        }
      },
      beforeRemoveRow: function(index, amount) {
        console.log("removed: " + index + ", amount: " + amount);
        var params = {};
        params["connid"] = "[{$connid}]";
        params["vn"] = "[{$viewname}]";
        for (var i = 0; i<pkColumnNames.length; i++) {
          params[pkColumnNames[i]] = hot.getDataAtRowProp(index, pkColumnNames[i]);
        }
        params['pk[]'] = pkColumnNames;
        $.post('?module=Data&action=removeRow', params, function (json) {
          loadGridData(currentPage, rowsPerPage);
        }, "json");
      }
  });
  

  $("#grid_footer").bs_pagination({
    totalPages: [{$totalRows}],
    rowsPerPage: [{$rowsPerPage}],
    onChangePage: function(event, data) {
      currentPage = data.currentPage;
      rowsPerPage = data.rowsPerPage;
      loadGridData(data.currentPage, data.rowsPerPage);
    },
    onLoad: function(event, data) {
      currentPage = data.currentPage;
      rowsPerPage = data.rowsPerPage;

      loadGridData(data.currentPage, data.rowsPerPage);
    }
  });
});
</script>