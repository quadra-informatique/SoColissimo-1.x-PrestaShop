{*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6735 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<style type="text/css">
    .soBackward_compat_tab {literal}{ text-align: center; }{/literal}
    .soBackward_compat_tab a {literal}{ margin: 10px; }{/literal}
</style>

<a href="#"  style="display:none" class="thickbox" id="soLink"></a>

<script type="text/javascript">
    var opc = false;
</script>

{if isset($already_select_delivery) && $already_select_delivery}
    <script type="text/javascript">
        var already_select_delivery = true;
    </script>
{else}
    <script type="text/javascript">
        var already_select_delivery = false;
    </script>
{/if}
<script type="text/javascript">
var soInputs = new Object();
var soBwdCompat = "{$SOBWD_C}";
var soCarrierId = "{$id_carrier}";
var soToken = "{$token}";

    {foreach from=$inputs item=input key=name name=myLoop}
        soInputs.{$name} = "{$input|strip_tags|addslashes}";
    {/foreach}

    {literal}

        $(document).ready(function()
        {
            $('#soLink').attr('href', 'modules/socolissimo/redirect.php' + serialiseInput(soInputs)+'?keepThis=true&TB_iframe=true&height=450&width=550')
          
                     $('[name=processCarrier]').click( function() {
              if (($('#id_carrier' + soCarrierId).is(':checked')) || ($('.delivery_option_radio:checked').val() == soCarrierId+','))
                {
                    if (acceptCGV('{/literal}{l s='Please accept the terms of service before the next step.'}{literal}'))
                        $("#soLink").trigger("click");
                    return false;
                }
                return true;
          });

        });



function serialiseInput(inputs)
{
    var str = '?first_call=1&';
    for ( var cle in inputs )
        str += cle + '=' + inputs[cle] + '&';
    return (str + 'gift=' + $('#gift').attr('checked') + '&gift_message='+ $('#gift_message').attr('value'));
}

    {/literal}
</script>
