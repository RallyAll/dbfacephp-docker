<section class="content-header"> <h1>[{'strAccounts'|translate}]<small>[{if $account}][{'strUpdatenewsubaccount'|translate}][{else}][{'strCreatenewsubaccount'|translate}][{/if}]</small></h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] <li class="active">[{'strDashboard'|translate}]</li> </ol> </section> <section class="content"> <div class="box box-solid"> <div class="box-header"> <h3 class="box-title">[{if $account}][{'strUpdatenewsubaccount'|translate}][{else}][{'strCreatenewsubaccount'|translate}][{/if}]</h3> </div> <div class="box-body"> <div id="error_div" class="alert alert-danger alert-dismissable" style="display:none"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> <b>Error!</b> <span id="error_div_message"></span> </div> <form role="form" id="account_form" class="form-horizontal"> <input type="hidden" name="tag" value="__confirm__"/> [{if $account}]<input type="hidden" name="userid" value="[{$account.userid}]"/>[{/if}] <div class="form-group"> <label class="col-sm-2 control-label">[{'strUsername'|translate}]:</label> <div class="col-sm-10"> <input type="text" name="username" class="form-control" [{if $account}]value="[{$account.name}]"[{/if}] placeholder="[{'strAccountNamePl'|translate}]" required/> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">[{'strEmail'|translate}]:</label> <div class="col-sm-10"> <input type="email" name="email" class="form-control" [{if $account}]value="[{$account.email}]"[{/if}] placeholder="[{'strEmail'|translate}] ..." required/> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">[{'strPassword'|translate}]:</label> <div class="col-sm-10"> <input type="password" name="password" pattern=".{6,}" title="At least 6 characters" class="form-control" placeholder="[{'strPassword'|translate}] ..." required/> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">[{'strConfirm'|translate}]:</label> <div class="col-sm-10"> <input type="password" name="password2" pattern=".{6,}" title="At least 6 characters" class="form-control" placeholder="[{'strConfirm'|translate}] ..." required/> </div> </div> <div class="form-group"> <label class="col-sm-2 control-label">[{'strPermission'|translate}]:</label> <div class="col-sm-10"> <div class="radio"> <label> <input type="radio" name="permission" id="permissionRadio1" value="1" [{if $account && $account.permission==1}]checked[{/if}]>[{'strDeveloperDesc'|translate}] </label> </div> <div class="radio"> <label> <input type="radio" name="permission" id="permissionRadio2" value="9" [{if $account}][{if $account.permission==9}]checked[{/if}][{else}]checked[{/if}]>[{'strUserDesc'|translate}] </label> </div> </div> </div> <div class="form-group"> <div class="col-sm-offset-2 col-sm-10"> <button type="submit" class="btn btn-primary">[{'strSubmit'|translate}]</button> </div> </div> </form> </div> </div> </section> <script>$(function(){$("#account_form").submit(function(a){a.preventDefault();$.ajax({url:"?module=Account&action=create",type:"post",dataType:"json",data:$("#account_form").serialize(),success:function(d){var b=d.result;var c=d.message;if(!b){$("#error_div_message").html(c);$("#error_div").show()}else{broadcast.propagateAjax("module=Account&action=index")}}})})});</script>