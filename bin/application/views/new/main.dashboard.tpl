<section class="content-header"> <h1> [{'strDashboard'|translate}] <small>[{'strControlpanel'|translate}]</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] </ol> </section> <section class="content"> [{include file="inc/account.expired.message.tpl"}] [{include file="inc/account.email.activation.tpl"}] [{if $login_permission == 0}] [{if count($conns) > 0}] <div class="row"> <section class="col-md-12" id="sec_appbox"> [{include file="new/box.apps.tpl"}] </section> <section class="col-md-12"> [{include file="new/box.conns.tpl"}] </section> <section class="col-md-6"> [{include file="new/box.accounts.tpl"}] </section> <section class="col-md-6"> [{include file="new/box.categories.tpl"}] </section> </div> [{else}] [{include file="new/dashboard.welcome.tpl"}] [{/if}] [{elseif $login_permission == 1}] <div class="row"> <section class="col-md-12" id="sec_appbox"> [{include file="new/box.apps.tpl"}] </section> </div> [{else}] [{include file="new/dashboard.defaultuser.welcome.tpl"}] [{/if}] </section>