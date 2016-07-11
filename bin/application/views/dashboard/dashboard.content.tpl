<script>
	function _pk_translate(key) {
	return key;
	}
	dbface.defaultdashboard = '[{$defaultdashboardId}]';
	dbface.globalparameters = {};
	[{if $parameters}]
	[{foreach from=$parameters key=k item=v}]
	dbface.globalparameters['[{$k}]'] = '[{$v}]';
	[{/foreach}]
	[{/if}]
</script> <div id="dashboard"> <div id="dashboardWidgetsArea"></div> </div> <script>
$(function() {
  "use strict";

  $(".connectedSortable").sortable({
      placeholder: "sort-highlight",
      connectWith: ".connectedSortable",
      handle: ".box-header, .nav-tabs",
      forcePlaceholderSize: true,
      zIndex: 999999
  }).disableSelection();
  
  $(".connectedSortable .box-header, .connectedSortable .nav-tabs-custom").css("cursor", "move");
  
  widgetsHelper.availableWidgets = null;

  initDashboard('[{$dashboardId}]', [{$dashboardLayout}], '[{$name}]', '[{$dashboardMenu}]');
  
  [{if !$embed}]
  $('.beastselect').val('[{$dashboardMenu}]');
  
  $("#save-embedcode").click(function() {
    var shareAppDialog = $('#shareAppDialog');
    var appid = $(this).attr('dashboardid');
    var sharestatus = $('#sharestatus').prop('checked') ? 1 : 0;
    $.post('?module=Dashboard&action=saveembedcode', {dashboardId: appid, embedcode: $('#embed_code').val(), sharestatus: sharestatus}, function(result) {
      shareAppDialog.modal('hide')
    });
  });
  [{/if}]
});

</script>