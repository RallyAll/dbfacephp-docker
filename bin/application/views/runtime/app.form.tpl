<div class="box box-solid"> <div class="box-header"> <h3 class="box-title">[{if $formTitle}][{$formTitle}][{/if}]</h3> </div> <form role="form" class="form-horizontal" id="[{$FORM_ID}]"> <input type="hidden" name="__at__" value="[{if $at}][{$at}][{else}]__at__[{/if}]"/> <input type="hidden" name="appid" value="[{$appid}]"/> [{if isset($embed)}] <input type="hidden" name="embed" value="1"/> [{/if}] <input type="hidden" name="FORMID" value="[{$FORM_ID}]"/> <div class="box-body">[{$formHTML}]</div> <div class="box-footer"> <button type="reset" class="btn btn-default pull-right">[{'Reset'|translate}]</button> <button type="submit" data-style="expand-right" data-size="l" class="btn btn-primary ladda-button">[{'strSubmit'|translate}]</button> <span id="form_msg" class="pull-right" style="display:none"></span> </div> </form> [{include file="runtime/app.inc.loading.tpl"}] </div> <script>$(function(){var f="[{$appid}]";var g="[{$FORM_ID}]";var e="[{$rpf}]";var a=$("#"+g);var d="[{if $hasLoadingScript}]1[{else}]0[{/if}]";var b=a.find("button[type='submit']").ladda("bind");var c="[{if $targetID}][{$targetID}][{else}]#sec_resultset_[{$appid}][{/if}]";a.submit(function(i){i.preventDefault();var j=a.serialize();$.post("?module=App",j,function(k){$(c).html(k);$.ladda("stopAll")});return false});a.find("[data-script-required='1']").prop("required",true);a.find("[data-script-disabled='1']").prop("disabled",true);a.find("[data-script-onchange]").change(function(i){var j=a.serialize();j+="&"+$.param({onchange_script:$(this).attr("data-script-onchange")});_form_script_event(a,j,function(){if(e!="editapp"){a.trigger("submit")}})});var h=[];$.each($.merge(a.find("[data-script-sourcetype='directly']"),a.find("[data-script-sourcetype='mappingscript']")),function(k,m){var o=a.serialize();o+="&"+$.param({st:$(m).attr("data-script-sourcetype"),ss:$(m).attr("data-script-source")});var n=$(m).parents("div[data-widget='widget']");var l=n.attr("data-widget-name");var j=$(m).attr("name");h.push($.post("?module=App&action=src",o,function(i){if(l=="radio"){var p=$(m).empty();$.each(i,function(q,r){p.append("<label class='radio-inline'><input type='radio' name='"+j+"' id='optionsRadios1' value='"+r.key+"'>"+r.value+"</label>")})}else{if(l=="checkbox"){var p=$(m).empty();$.each(i,function(q,r){p.append("<label class='checkbox-inline'><input type='checkbox' name='"+j+"' id='optionsRadios1' value='"+r.key+"'>"+r.value+"</label>")})}else{if(l=="dropdown"||l=="multiselect"){var p=$(m).empty();$.each(i,function(q,r){p.append(new Option(r.value,r.key))})}}}},"json"))});$.when.apply($,h).done(function(){$.each(a.find("[data-defaultvalue]"),function(m,o){try{var l=$(o).attr("name");var j=$(o).attr("id");var p=$(o).parents("div[data-widget='widget']");var n=p.attr("data-widget-name");if(n=="singleline"||n=="dropdown"){$(o).val($(o).attr("data-defaultvalue"))}else{if(n=="radio"){$("input[name='"+l+"']").val([$(o).attr("data-defaultvalue")])}else{if(n=="checkbox"){var k=$(o).attr("data-defaultvalue").split(",");$.each($("input[name='"+l+"']"),function(r,i){if($.inArray($(i).val(),k)>=0){$(i).prop("checked",true)}})}else{if(n=="multiselect"){var k=$(o).attr("data-defaultvalue").split(",");$(o).val(k)}}}}}catch(q){console.log(q)}});if(d=="1"){_form_script_event(a,a.serialize(),function(){a.parents("div.box").find(".overlay").remove();a.parents("div.box").find(".loading-img").remove()})}else{a.parents("div.box").find(".overlay").remove();a.parents("div.box").find(".loading-img").remove()}if(e!="editapp"){a.trigger("submit")}})});</script>