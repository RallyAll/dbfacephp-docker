[{if !isset($standalone)}] <section class="content-header"> <h1>[{if empty($appname)}]&nbsp;[{else}][{$appname}][{include file="runtime/app.inc.desc.tpl"}][{/if}]</h1> <ol class="breadcrumb">[{include file="inc/breadcrumbs.item.home.tpl"}]</ol> </section> [{else}] <h1 class="text-center">[{if empty($appname)}]&nbsp;[{else}][{$appname}][{include file="runtime/app.inc.desc.tpl"}][{/if}]</h1> <hr/> [{/if}] <section class="content"> [{if $formHTML}] <div class="row no-pad"> <div class="col-sm-12"> [{include file="runtime/app.form.tpl" targetID='#sec_dashboardhtml'}] </div> </div> [{/if}] <div class="row no-pad"> <section class="col-sm-12" id="sec_dashboardhtml"> [{include file="dashboard/dashboard.content.tpl"}] </section> </div> </section>