{*
*  1997-2012 QUADRA INFORMATIQUE
*
*  @author QUADRA INFORMATIQUE <ecommerce@quadra-informatique.fr>
*  @copyright 1997-2012 QUADRA INFORMATIQUE
*  @version  Release: $Revision: 1.0 $
*  @license  http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  
*}
<script type="text/javascript">
{literal}
	$(document).ready(function(){ 
{/literal}
{foreach from=$ids item=id}
	{literal}$($('#id_carrier{/literal}{$id}{literal}').parent().parent()).remove();{/literal}
{/foreach}
{literal}
	});
{/literal}
</script>
