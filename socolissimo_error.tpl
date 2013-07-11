{**
 * ---------------------------------------------------------------------------------
 *
 * 1997-2013 Quadra Informatique
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to ecommerce@quadra-informatique.fr so we can send you a copy immediately.
 *
 * @author Quadra Informatique <ecommerce@quadra-informatique.fr>
 * @copyright 1997-2013 Quadra Informatique
 * @version Release: $Revision: 1.0 $
 * @license http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 *
 * ---------------------------------------------------------------------------------
 *}
<script type="text/javascript">
    {literal}
    var soCarrierIdSeller = "{$id_carrier_seller}";
	$(document).ready(function(){
    {/literal}
    {foreach from=$ids item=id}
{literal}$($('#id_carrier{/literal}{$id}{literal}').parent().parent()).remove();{/literal}
{/foreach}
{literal}
    $('#id_carrier'+soCarrierIdSeller).parent().parent().remove();
	});
{/literal}
</script>
