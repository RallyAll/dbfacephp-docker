<table class="table table-striped"> <tr> <th style="width: 10px">#</th> <th>[{'strEmail'|translate}]</th> <th>[{'strUsername'|translate}]</th> <th>[{'strRole'|translate}]</th> <th></th> </tr> [{section name=i loop=$accounts}] <tr> <td>[{$smarty.section.i.index+1}]</td> <td>[{$accounts[i].email}]</td> <td>[{$accounts[i].name}]</td> <td>[{if $accounts[i].permission == 0}]Administrator[{elseif $accounts[i].permission == 1}]Developer[{else}]User[{/if}]</td> <td class="text-right"> <a type="button" name="?module=Account&action=edit&userid=[{$accounts[i].userid}]" href="#module=Account&action=edit&userid=[{$accounts[i].userid}]" class="btn btn-primary btn-flat btn-xs"><i class="glyphicon glyphicon-edit"></i></a> <a type="button" href="javascript:;" onclick="javascript:delaccount('[{$accounts[i].userid}]', '[{$accounts[i].name}]')" class="btn btn-danger btn-flat btn-xs"><i class="glyphicon glyphicon-remove"></i></a> </td> </tr> [{/section}] </table>