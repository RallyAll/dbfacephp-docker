<div id="u-left-panel" class="u-left-panel1"> <div class="panel-user-wrapper style1"> [{if $enable_gravatar}] <div class="panel-user"> <img src="[{$login_avatar}]" alt="Avatar"/> </div> [{/if}] <div class="panel-user-name"> [{$login_username}] </div> <br> <div class="btn-group btn-group-xs panel-user-option"> <a onclick="javascript:return dbfaceMenu.onItemClick(this);" name="?module=Account&action=editprofile" href="#module=Account&action=editprofile" class="btn btn-primary"><i class="fa fa-cog"></i></a> [{if $login_permission == 0}] <a onclick="javascript:return dbfaceMenu.onItemClick(this);" name="?module=Conn" href="#module=Conn" class="btn btn-primary"><i class="fa fa-database"></i></a> [{/if}] <a href="?module=Logout" class="btn btn-primary"><i class="fa fa-sign-out"></i></a> </div> </div> <div id="u-left-menu"> <ul class="left-menu-wrapper list-unstyled" id="app_menu_container"> [{include file="new/menu.new.applist.tpl"}] </ul> </div> </div>