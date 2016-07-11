<div class="[{$builderboxstyle}]"> <div class="box-header"> <h3 class="box-title">[{'strOptions'|translate}]</h3> </div> <div class="box-body"> <form role="form" class="form-horizontal"> <div class="form-group"> <label class="col-sm-2 control-label">[{'strTitle'|translate}]:</label> <div class="col-sm-10"> <input type="text" class="form-control" name="app_title" id="app_title" [{if $appinfo && $appinfo['title']}]value="[{$appinfo.title|escape}]"[{/if}] placeholder="[{'strAppTitlePl'|translate}]"/> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">[{'strDescription'|translate}]:</label> <div class="col-sm-10"> <input type="text" class="form-control" name="app_desc" id="app_desc" [{if $appinfo && $appinfo['desc']}]value="[{$appinfo.desc|escape}]"[{/if}] placeholder="[{'strAppDescPl'|translate}]"/> </div> </div> [{include file="appbuilder/section.options.tabular.tpl"}] [{include file="appbuilder/section.options.tableeditor.tpl"}] [{include file="appbuilder/section.options.chart.tpl"}] [{include file="appbuilder/section.options.phpreport.tpl"}] [{include file="appbuilder/section.options.editapp.tpl"}] [{include file="appbuilder/section.options.singlenumber.tpl"}] </form> </div> </div>