[{if isset($standalone)}] <section class="content"> <div class="row"> <section class="col-sm-12"> <div class="box box-danger"> <div class="box-header"> <i class="fa fa-warning"></i> <h3 class="box-title">Application Error</h3> </div> <div class="box-body"> [{include file="runtime/app.inc.errormessage.tpl"}] </div> </div> </section> </div> </section> [{elseif $embed}] <section class="col-sm-12"> <div class="box box-danger"> <div class="box-header"> <i class="fa fa-warning"></i> <h3 class="box-title">Application Error</h3> </div> <div class="box-body"> [{include file="runtime/app.inc.errormessage.tpl"}] </div> </div> </section> [{else}] <section class="content-header"> <h1> [{$appname}] <small>Control panel</small> </h1> <ol class="breadcrumb"> [{include file="inc/breadcrumbs.item.home.tpl"}] </ol> </section> <section class="content"> <div class="row"> <section class="col-sm-12"> <div class="box box-danger"> <div class="box-header"> <i class="fa fa-warning"></i> <h3 class="box-title">Application Error</h3> </div> <div class="box-body"> [{include file="runtime/app.inc.errormessage.tpl"}] </div> </div> </section> </div> </section> [{/if}]