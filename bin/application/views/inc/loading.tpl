<style>.status-window{z-index:10000;position:absolute;border:#98bfe2 2px solid;color:#000;font-weight:bold;background-color:#eef6fd}.status-window-table{font-weight:bold;font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;border:0 none;margin-bottom:10px}</style> <div id="loading" style="display:none;width:[{if $width}][{$width}][{else}]220[{/if}]px" class="status-window"> <table cellpadding="3" cellspacing="0" border="0" class="status-window-table"> <tr align="center" valign="top"> <td colspan="2" style="text-align:center;align:center"><img src="[{#s_base#}]/dbfacephp/img/loading_b.gif" width="32" height="32"></td> </tr> <tr align="left" valign="top"> <td width="100%" colspan="2" valign='top' id='loadingmsg' nowrap>[{$loadingmsg}]</td> </tr> </table> </div>