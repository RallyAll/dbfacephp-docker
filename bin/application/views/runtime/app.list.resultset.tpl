[{include file="runtime/app.list.resultset.table.tpl"}] <script>
var pagerows = [{$pagerows}];
$(function() {
  $('#[{$ID_RESULTSET}]').dataTable({
    "aLengthMenu": [[pagerows, pagerows * 2, pagerows * 3, -1], [pagerows, pagerows * 2, pagerows * 3, "All"]],
    "iDisplayLength":pagerows
  });
});
</script>