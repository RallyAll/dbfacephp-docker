<div id="summaryViewFields_tabular" style="display: none;"> <div class="row"> <label class="col-xs-6">[{'strSelectColumns'|translate}]:</label> <label class="col-xs-6">[{'strOrderColumns'|translate}]:</label> </div> <div class="row"> <div class="col-xs-6"> <div class="DropArea"> <ul id="container_select_fields" funlist="actual,sum,max,min,count,avg,countdist,custom,datefun" defaultfun="actual" holder="true" class="dropyourfields list-unstyled" single="false" scrollel="content" number="DISCRETE,MEACATEGORY"> [{if $select}][{include file="appbuilder/advrep_clist.column.tpl" filter_columnnames=$select filter_columnfuns=$selectfun filter_columnlabels=$selectlabel}][{/if}] </ul> </div> </div> <div class="col-xs-6"> <div class="DropArea"> <ul id="container_order_fields" funlist="desc,asc" defaultfun="asc" holder="true" class="dropyourfields list-unstyled"> [{if $order}][{include file="appbuilder/advrep_clist.column.tpl" filter_columnnames=$order filter_columnfuns=$orderfun filter_columnlabels=$orderlabel}][{/if}] </ul> </div> </div> </div> </div>