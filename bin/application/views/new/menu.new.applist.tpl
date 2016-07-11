<li class="left-menu-parent left-menu-active"> <a href="#module=Dashboard" name="?module=Dashboard" onclick="javascript:dbfaceMenu.onItemClick(this)"> <span class="left-menu-link-icon"> <i class="fa fa-home"></i> </span> <span class="left-menu-link-info"> <span class="link-name">[{'strDashboard'|translate}]</span> </span> </a> </li> [{if $login_permission != 9 && isset($tables)}] <li class="left-menu-parent"> <a href="#"> <span class="left-menu-link-icon"> <i class="fa fa-database"></i> </span> <span class="left-menu-link-info"> <span class="link-name">[{'Data'|translate}]</span> <span class="link-state"></span> </span> </a> <ul class="left-menu-sub list-unstyled"> [{if $tables}] [{section name=i loop=$tables}] <li> <a title="[{$tables[i]}]" href="?module=App&connid=[{$connid}]&viewname=[{$tables[i]}]" name="?module=App&connid=[{$connid}]&viewname=[{$tables[i]}]" onclick="javascript:return dbfaceMenu.onItemClick(this);"> <span class="left-menu-link-info"> <span class="link-name">[{$tables[i]}]</span> </span> </a> </li> [{/section}] [{/if}] </ul> </li> [{/if}] [{foreach from=$categoryapps key=category item=apps}] <li class="left-menu-parent"> <a href="#"> <span class="left-menu-link-icon"> <i class="fa [{if isset($category_icons[$category])}][{$category_icons[$category]}][{else}]fa-area-chart[{/if}]"></i> </span> <span class="left-menu-link-info"> <span class="link-name">[{$category}]</span> <span class="link-state"></span> </span> </a> <ul class="left-menu-sub list-unstyled" id="ul_menu_applist"> [{section name=i loop=$apps}] <li> <a onclick="javascript:return dbfaceMenu.onItemClick(this);" name="?module=App&appid=[{$apps[i].appid}]&o=1" href="#module=App&appid=[{$apps[i].appid}]&o=1"> <span class="left-menu-link-info"> <span class="link-name">[{$apps[i].name}]</span> </span> </a> </li> [{/section}] </ul> </li> [{/foreach}] [{if !$hide_cloud_code_menu && $login_permission != 9}] <li class="left-menu-parent"> <a href="#module=Code" name="?module=Code" onclick="javascript:dbfaceMenu.onItemClick(this)"> <span class="left-menu-link-icon"> <i class="fa fa-code"></i> </span> <span class="left-menu-link-info"> <span class="link-name">[{'CloudCode'|translate}]</span> </span> </a> </li> [{/if}] <li class="left-menu-parent"> <a href="#"> <span class="left-menu-link-icon"> <i class="fa fa-cog"></i> </span> <span class="left-menu-link-info"> <span class="link-name">[{'General_Settings'|translate}]</span> <span class="link-state"></span> </span> </a> <ul class="left-menu-sub list-unstyled"> <li> <a href="?module=Account&action=editprofile" name="?module=Account&action=editprofile" onclick="javascript:return dbfaceMenu.onItemClick(this);"> <span class="left-menu-link-info"> <span class="link-name">General</span> </span> </a> </li> [{if $login_permission == 0}] <li> <a href="?module=Conn" name="?module=Conn" onclick="javascript:return dbfaceMenu.onItemClick(this);"> <span class="left-menu-link-info"> <span class="link-name">[{'strConnections'|translate}]</span> </span> </a> </li> <li> <a href="?module=Account" name="?module=Account" onclick="javascript:return dbfaceMenu.onItemClick(this);"> <span class="left-menu-link-info"> <span class="link-name">[{'strSubAccounts'|translate}]</span> </span> </a> </li> <li> <a href="?module=CssEditor" name="?module=CssEditor" onclick="javascript:return dbfaceMenu.onItemClick(this);"> <span class="left-menu-link-info"> <span class="link-name">[{'strCustomThemeEditor'|translate}]</span> </span> </a> </li> [{/if}] </ul> </li>