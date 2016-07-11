<div id="[{$ID_RESULTSET}]"></div> <script>
  function setupPivot(input){
    input.callbacks = {afterUpdateResults: function(){
      $('#[{$ID_RESULTSET}] > table').dataTable();
    }};
    $('#pivot-[{$ID_RESULTSET}]').pivot_display('setup', input);
  };

  $(function() {
    var json_string = [{$pivotdata}];
    var fields = [{$fields}];
    var rowLabels = [{$rowLabels}];
    var columnLabels = [{$columnLabels}];
    var summaries = [{$summaries}];
    setupPivot({json:json_string, resultsDivID:'[{$ID_RESULTSET}]', fields: fields, rowLabels:rowLabels, columnLabels:columnLabels, summaries:summaries});
  });
</script>