[{if $valid_license}] <div class="box box-solid"> <div class="box-body"> <form role="form" class="form-horizontal"> <div class="form-group"> <label class="col-sm-2 control-label">Version:</label> <div class="col-sm-10"> <p class="form-control-static">[{#build_version#}]</p> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">License To:</label> <div class="col-sm-10"> <p class="form-control-static">[{$license_email}]</p> </div> </div> </form> </div> </div> [{else}] <div class="box box-solid"> <div class="box-body"> <form role="form" id="licenseForm" class="form-horizontal"> <div class="form-group"> <label class="col-sm-2 control-label">Version:</label> <div class="col-sm-10"> <p class="form-control-static">[{#build_version#}]</p> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">Expired:</label> <div class="col-sm-10"> <p class="form-control-static">[{#expiredate#}]</p> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">[{'strEmail'|translate}]:</label> <div class="col-sm-10"> <input type="email" name="licenseEmail" id="licenseEmail" class="form-control" value="" placeholder="The order email..." required/> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">License Code:</label> <div class="col-sm-10"> <input type="text" class="form-control" name="licenseCode" id="licenseCode" value="" placeholder="Enter license code here to register online..." required/> </div> </div> <div class="form-group"> <div class="col-sm-offset-2 col-sm-10"> <button class="btn btn-primary" type="submit">Register</button> </div> </div> </form> <fieldset> <legend>Get License Code</legend> <form role="form" class="form-horizontal" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank"> <div class="form-group"> <label class="col-sm-2 control-label"></label> <div class="col-sm-10"> <input type="hidden" name="cmd" value="_s-xclick"> <input type="hidden" name="hosted_button_id" value="N6AW6M6FCGXV4"> <input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal – The safer, easier way to pay online."> <img alt="" border="0" src="https://www.paypalobjects.com/zh_XC/i/scr/pixel.gif" width="1" height="1"> <span class="help-block">Once your order is processed you will receive the license code via email in 24 hours.</span> </div> </div> </form> </fieldset> </div> </div> <script>$(function(){$("#licenseForm").submit(function(b){b.preventDefault();var a=$("#licenseEmail").val();var c=$("#licenseCode").val();$.post("?module=Account&action=license",{ce:a,cd:c},function(d){broadcast.propagateAjax("module=Account&action=editprofile")})})});</script> [{/if}]