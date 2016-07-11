<!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <title>[{#title#}]</title> <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'> [{include file="inc/allcss.tpl"}] <script>
    dbface.standalone = 1;
  </script> </head> <body class="skin-blue"> <div> <div class="row"> <div class="col-sm-12"> <div class="box box-solid"> <div class="box-body" id="content"> </div> </div> </div> </div> </div> [{include file="inc/alljs.tpl"}] <script>
     var OBJID = '[{$OBJID}]';
	 var params = {};
	 [{if $parameters}]
   [{foreach from=$parameters key=k item=v}]
	 params['[{$k}]'] = '[{$v}]';
	 [{/foreach}]
	 [{/if}]
     $.post('?module=App&embed=1&OBJID='+OBJID, params, function(html) {
       $("#content").html(html);
     });
   </script> </body> </html>