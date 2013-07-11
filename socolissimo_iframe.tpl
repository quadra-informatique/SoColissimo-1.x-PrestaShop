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

<style type="text/css">
    .soBackward_compat_tab {literal}{ text-align: center; }{/literal}
    .soBackward_compat_tab a {literal}{ margin: 0px; }{/literal}
</style>

<iframe id="soFr" width="575" height="800" style="border:none;display:none;"src=""></iframe>

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
var soCarrierIdSeller = "{$id_carrier_seller}";
var soToken = "{$token}";
var initialCost = "{$initialCost}";
var baseDir = '{$content_dir}';
    {foreach from=$inputs item=input key=name name=myLoop}
        soInputs.{$name} = "{$input|strip_tags|addslashes}";
    {/foreach}

    {literal}

        $(document).ready(function()
        {
$($('.std input#id_carrier'+soCarrierId).parent().parent()).find('.carrier_price .price').text(initialCost);
    $('#id_carrier'+soCarrierIdSeller).parent().parent().remove();
                $($('.std input#id_carrier'+soCarrierId).parent().parent()).find('.carrier_price').css('white-space','nowrap');
                     $('[name=processCarrier]').click( function() {
              if (($('#id_carrier' + soCarrierId).is(':checked')) || ($('.delivery_option_radio:checked').val() == soCarrierId+','))
                {
                    if (acceptCGV('{/literal}{l s='Please accept the terms of service before the next step.'}{literal}')){
						$('.std td').css('display', 'none');
                                 $('.std th').css('display', 'none');

                           $('h3.condition_title').css('display', 'none');
                           $('p.checkbox').css('display', 'none');
                           $('h3.carrier_title').css('display', 'none');
                           $('h3.gift_title').css('display', 'none');
                           $('#gift_div').css('display', 'none');
                           $('p.cart_navigation').css('display', 'none');
                           $('#soFr').css('display', 'block');
                           $('#soFr').attr('src',  baseDir+'modules/socolissimo/redirect.php' + serialiseInput(soInputs));
					}
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
