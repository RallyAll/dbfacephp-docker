<ul class="sidebar-menu"> [{if $login_permission == 0 || $login_permission == 1}] <li class="active"> <a href="#module=Dashboard" name="?module=Dashboard" onclick="javascript:dbfaceMenu.onItemClick(this)"> <i class="fa fa-dashboard"></i> <span>[{'strDashboard'|translate}]</span> </a> </li> [{/if}] <li class="treeview" data-menuname="[{$category}]"> <a href="javascript:void(0);"> <i class="fa fa-th"></i> <span>Data</span> <i class="fa fa-angle-left pull-right"></i> </a> <ul class="treeview-menu"> <li><a onclick="javascript:return dbfaceMenu.onItemClick(this);" name="?module=App&appid=[{$apps[i].appid}]&o=1" href="#module=App&appid=[{$apps[i].appid}]&o=1"><i class="fa fa-angle-double-right"></i>User</a></li> <li><a onclick="javascript:return dbfaceMenu.onItemClick(this);" name="?module=App&appid=[{$apps[i].appid}]&o=1" href="#module=App&appid=[{$apps[i].appid}]&o=1"><i class="fa fa-angle-double-right"></i>Role</a></li> </ul> </li> [{foreach from=$categoryapps key=category item=apps}] <li class="treeview" data-menuname="[{$category}]"> <a href="javascript:void(0);"> <i class="fa fa-th"></i> <span>[{$category}]</span> <i class="fa fa-angle-left pull-right"></i> </a> <ul class="treeview-menu"> [{section name=i loop=$apps}] <li><a onclick="javascript:return dbfaceMenu.onItemClick(this);" name="?module=App&appid=[{$apps[i].appid}]&o=1" href="#module=App&appid=[{$apps[i].appid}]&o=1"><i class="fa fa-angle-double-right"></i>[{$apps[i].name}]</a></li> [{/section}] </ul> </li> [{/foreach}] </ul>