<div class="[{$builderboxstyle}]"> <div class="box-header"> <h3 class="box-title">[{'strDashboardApplicationBuilder'|translate}]</h3> <div class="box-tools pull-right"> <button class="btn btn-primary btn-xs" title="Change dashboard layout" onclick="javascript:showChangeDashboardLayoutDialog();"><i class="fa fa-bars"></i> Change dashboard layout</button> </div> </div> <div class="box-body"> <script>
  function _pk_translate(key) {
    return key;
  }
  dbface.defaultdashboard = '[{$defaultdashboardId}]';
</script> <span id="dashboardSettings"> <span>Add a widget</span> <ul class="submenu"> <li> <ul class="widgetpreview-categorylist"></ul> </li> </ul> <ul class="widgetpreview-widgetlist"></ul> <div class="widgetpreview-preview"></div> </span> <div class="content"> <div id="dashboard"> <div id="dashboardWidgetsArea"></div> </div> </div> <div class="ui-confirm" id="changeDashboardLayout"> <h2>[{'Dashboard_SelectDashboardLayout'|translate}]</h2> <div id="columnPreview"> [{foreach from=$availableLayouts item=layout}] <div> [{foreach from=$layout item=column}] <div class="width-[{$column}]"><span></span></div> [{/foreach}] </div> [{/foreach}] </div> <input role="yes" type="button" value="[{'General_Save'|translate}]"/> </div> <script>
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
});

</script> </div> </div>