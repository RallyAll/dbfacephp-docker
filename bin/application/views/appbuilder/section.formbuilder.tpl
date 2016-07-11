<script src="[{#s_base#}]/theme/js/form.js"></script> <div class="[{$builderboxstyle}] [{if $appinfo && !empty($appinfo['form_org'])}][{else}]collapsed-box[{/if}]"> <div class="box-header"> <h3 class="box-title">[{'strBuildAForm'|translate}]</h3> <div class="box-tools pull-right"> <button type="button" class="active btn btn-xs btn-primary" onclick="javascript:handleFormEditDialog(this);return false;"><i class="glyphicon glyphicon-edit "></i> [{'strProperties'|translate}]</button> <div class="btn-group" data-toggle="buttons-radio"> <button type="button" id="edit" class="active btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit "></i> [{'strEdit'|translate}]</button> <button type="button" class="btn btn-xs btn-primary" id="sourcepreview"><i class="glyphicon-eye-open glyphicon"></i> [{'strPreview'|translate}]</button> </div> <button class="btn btn-primary btn-xs" data-widget="collapse"><i class="fa [{if $appinfo && !empty($appinfo['form_org'])}]fa-minus[{else}]fa-plus[{/if}]"></i></button> </div> </div> <div class="box-body" [{if $appinfo && !empty($appinfo['form_org'])}][{else}]style="display:none"[{/if}]> <div id="container_formbuilder" class="row edit"> <div class="col-xs-3"> <div class="sidebar-nav"> [{include file="appbuilder/section.formbuilder.grid.tpl"}] <ul class="nav nav-list accordion-group"> <li class="nav-header"><i class="glyphicon glyphicon-plus"></i> [{'strFormControls'|translate}] </li> <li class="boxes" id="elmBase"> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> [{include file="appbuilder/section.formbuilder.editfieldtoolbox.tpl"}] <div class="preview">[{'strSingleLine'|translate}]</div> <div class="view"> <div class="form-group" data-widget="widget" data-widget-name="singleline"> <label for="singleLine" class="control-label col-md-3" data-widget="label">Single Line</label> <div class="col-md-9"> <input type="text" class="form-control" name="singleLine" id="singleLine" data-widget="field"/> </div> </div> </div> </div> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> [{include file="appbuilder/section.formbuilder.editfieldtoolbox.tpl"}] <div class="preview">[{'strMultiLine'|translate}]</div> <div class="view"> <div class="form-group" data-widget="widget" data-widget-name="multiLine"> <label for="multiLine" class="control-label col-md-3" data-widget="label">Multi Line</label> <div class="col-md-9"> <textarea class="form-control" data-widget="field" id="multiLine" name="multiLine" rows="3"></textarea> </div> </div> </div> </div> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> [{include file="appbuilder/section.formbuilder.editfieldtoolbox.tpl"}] <div class="preview">[{'strDropdown'|translate}]</div> <div class="view"> <div class="form-group" data-widget="widget" data-widget-name="dropdown"> <label class="control-label col-md-3" for="dropdown" data-widget="label">Dropdown</label> <div class="col-md-9"> <select class="form-control" data-widget="field" id="dropdown"></select> </div> </div> </div> </div> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> [{include file="appbuilder/section.formbuilder.editfieldtoolbox.tpl"}] <div class="preview">[{'strRadioGroup'|translate}]</div> <div class="view"> <div class="form-group" data-widget="widget" data-widget-name="radio"> <label class="control-label col-md-3" data-widget="label" for="optionsRadios">Radio Group</label> <div class="col-md-9"> <div data-widget="field"> <label class="radio-inline"> <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio Button2 </label> </div> </div> </div> </div> </div> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> [{include file="appbuilder/section.formbuilder.editfieldtoolbox.tpl"}] <div class="preview">[{'strCheckbox'|translate}]</div> <div class="view"> <div class="form-group" data-widget="widget" data-widget-name="checkbox"> <label class="control-label col-md-3" for="checkBox" data-widget="label">Checkbox</label> <div class="col-md-9"> <div data-widget="field"> <label class="checkbox-inline"> <input type="checkbox" name="checkBox" value=""/>Checkbox </label> </div> </div> </div> </div> </div> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> [{include file="appbuilder/section.formbuilder.editfieldtoolbox.tpl"}] <div class="preview">[{'strMultiSelect'|translate}]</div> <div class="view"> <div class="form-group" data-widget="widget" data-widget-name="multiselect"> <label class="control-label col-md-3" data-widget="label" for="multiSelect">Multi Select</label> <div class="col-md-9"> <select multiple data-widget="field" class="form-control" id="multiSelect"> </select> </div> </div> </div> </div> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> [{include file="appbuilder/section.formbuilder.editfieldtoolbox.tpl"}] <div class="preview">[{'strStaticLabel'|translate}]</div> <div class="view"> <div class="form-group" data-widget="widget" data-widget-name="staticlabel"> <label class="control-label col-md-3" data-widget="label">Static Label</label> <div class="col-md-9"> <p class="form-control-static" data-widget="field">Static Label</p> </div> </div> </div> </div> <div class="layoutbox box-element"> <a href="#close" class="remove label label-danger"><i class="glyphicon glyphicon-remove"></i> [{'strRemove'|translate}]</a> <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i> [{'strDrag'|translate}]</span> <span class="configuration"> <span class="btn-group btn-group-xs"> <a class="btn btn-default" data-target="#editorModal" role="button" data-toggle="modal">[{'strEdit'|translate}]</span></a> </span> </span> <div class="preview">[{'strText'|translate}]</div> <div class="view"> <div contenteditable="true">[{'strTextSample'|translate}]</div> </div> </div> </li> </ul> </div> </div> <form class="form-horizontal" role="form"> <div id="div_formbuilder" class="demo col-xs-9" style="min-height:200px"> [{if $appinfo}][{$appinfo.form_org}][{/if}] </div> </form> </div> </div> </div> <div class="modal fade" id="FormOptionsDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> <h4 class="modal-title" id="myModalLabel">[{'strFormOptions'|translate}]</h4> </div> <div class="modal-body"> <form role="form"> <div class="form-group"> <label for="form_option_name">[{'strName'|translate}]:</label> <input type="text" class="form-control" id="form_option_name" name="form_option_name" value="[{$form_option_name}]" placeholder="[{'strFormNamePl'|translate}]"/> </div> <div class="form-group"> <label for="form_option_loadingscript">[{'strLoadingScript'|translate}]&nbsp;<a href="javascript:void(0);" onclick="javascript:generateScriptHelper(this, $('#app_connid').val(), 'form_option_loadingscript');return false;"><img src="[{#s_base#}]/dbfacephp/img/pickdt.gif" title="Generate script from database" align="absmiddle"/></a></label> <textarea rows="3" id="form_option_loadingscript" name="form_option_loadingscript" style="width:100%" id="form_option_loadingscript">[{$form_option_loadingscript}]</textarea> <span class="help-block">[{'strLoadingScriptTip'|translate}]</span> </div> </form> </div> <div class="modal-footer"> <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveChangeBtn">[{'strSaveChanges'|translate}]</button> </div> </div> </div> </div> <div class="modal fade" id="FieldOptionsDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">[{'strClose'|translate}]</span></button> <h4 class="modal-title" id="myModalLabel">[{'strFieldOptions'|translate}]</h4> </div> <div class="modal-body"> <form role="form"> <div class="form-group"> <label>[{'strFieldLableName'|translate}]:</label> <input type="text" class="form-control" id="field_option_label" placeholder="Enter ..."/> </div> <div class="form-group"> <label>[{'strFieldName'|translate}]:</label> <input type="text" class="form-control" id="field_option_name" placeholder="Referring this value in script with tags. ..."/> </div> <div class="form-group"> <label>[{'strFieldDefaultValue'|translate}]:</label> <input type="text" class="form-control" id="field_option_defaultvalue" placeholder="Default value of this field, sperate by , for multi values..."/> </div> <div class="form-group" id="field_onlyinput"> <label>[{'strDataType'|translate}]:</label> <div> <label class="radio-inline"> <input type="radio" name="field_option_datatype" id="field_option_datatype_text" value="text" checked>Text </label> <label class="radio-inline"> <input type="radio" name="field_option_datatype" id="field_option_datatype_number" value="number"/>Number </label> <label class="radio-inline"> <input type="radio" name="field_option_datatype" id="field_option_datatype_date" value="date">Date </label> <label class="radio-inline"> <input type="radio" name="field_option_datatype" id="field_option_datatype_datetime" value="datetime">DateTime </label> <label class="radio-inline"> <input type="radio" name="field_option_datatype" id="field_option_datatype_email" value="email">Email </label> <label class="radio-inline"> <input type="radio" name="field_option_datatype" id="field_option_datatype_password" value="passoword">Password </label> </div> </div> <div class="form-group"> <label class="checkbox-inline"> <input type="checkbox" id="field_option_required"/>[{'strRequired'|translate}] </label> <label class="checkbox-inline"> <input type="checkbox" id="field_option_disabled"/>[{'strDisabled'|translate}] </label> </div> <div class="form-group" id="field_onlysupportsrc"> <label class="radio-inline"> <input type="radio" name="field_option_sourcetype" id="field_option_sourcetype1" value="unrestricted" onclick="javascript:$('#field_option_source').hide()" checked>[{'strUnrestricted'|translate}] </label> <label class="radio-inline"> <input type="radio" name="field_option_sourcetype" id="field_option_sourcetype3" value="directly" onclick="javascript:$('#field_option_source').show()"/>[{'strEntervaluesdirectly'|translate}]&nbsp;<a href="javascript:void(0);" onclick="javascript:pickDataHelper(this, $('#app_connid').val(), 'field_option_source');return false;"><img src="[{#s_base#}]/dbfacephp/img/pickdt.gif" title="pick data from database" align="absmiddle"/></a> </label> <label class="radio-inline"> <input type="radio" name="field_option_sourcetype" id="field_option_sourcetype2" value="mappingscript" onclick="javascript:$('#field_option_source').show()">[{'strMappingScript'|translate}]&nbsp;<a href="javascript:void(0);" onclick="javascript:generateScriptHelper(this, $('#app_connid').val(), 'field_option_source');return false;"><img src="[{#s_base#}]/dbfacephp/img/pickdt.gif" title="Generate script from database" align="absmiddle"/></a> </label> </div> <div class="form-group"> <textarea rows="3" style="width:100%;display:none" id="field_option_source"></textarea> </div> <div class="form-group"> <label> <a onclick="javascript:$('#field_option_onchange').toggle();return false;">[{'strOnChangeScript'|translate}]:</a> <a href="javascript:void(0);" onclick="javascript:generateScriptHelper(this, $('#app_connid').val(), 'field_option_onchange');return false;"><img src="[{#s_base#}]/dbfacephp/img/pickdt.gif" title="Generate script from database" align="absmiddle"/></a> </label> <textarea rows="3" style="width:100%;display:none" id="field_option_onchange"></textarea> <span class="help-block">[{'strOnChangeScriptTip'|translate}]</span> </div> </form> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">[{'strClose'|translate}]</button> <button type="button" class="btn btn-primary" id="saveChangeBtn">[{'strSaveChanges'|translate}]</button> </div> </div> </div> </div> <div id="download-layout" style="display:none"><div class="container"></div></div> <div class="modal fade" role="dialog" id="editorModal"> <div class="modal-dialog"> <div class="modal-content"> <div class="modal-header"> <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">[{'strClose'|translate}]</span></button> <h4 class="modal-title" id="myModalLabel">[{'strEdit'|translate}]</h4> </div> <div class="modal-body"> <textarea id="contenteditor"></textarea> </div> <div class="modal-footer"> <button type="button" class="btn btn-default" data-dismiss="modal">[{'strClose'|translate}]</button> <button type="button" id="savecontent" class="btn btn-primary" data-dismiss="modal">[{'strSaveChanges'|translate}]</button> </div> </div> </div> </div>