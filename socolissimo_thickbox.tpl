{*
*  1997-2012 QUADRA INFORMATIQUE
*
*  @author QUADRA INFORMATIQUE <ecommerce@quadra-informatique.fr>
*  @copyright 1997-2012 QUADRA INFORMATIQUE
*  @version  Release: $Revision: 1.0 $
*  @license  http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  
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
var soToken = "{$token}";
var baseDir = '{$content_dir}';
    {foreach from=$inputs item=input key=name name=myLoop}
        soInputs.{$name} = "{$input|strip_tags|addslashes}";
    {/foreach}

    {literal}

        $(document).ready(function()
        {
          
                     $('[name=processCarrier]').click( function() {
              if (($('#id_carrier' + soCarrierId).is(':checked')) || ($('.delivery_option_radio:checked').val() == soCarrierId+','))
                {
                    if (acceptCGV('{/literal}{l s='Please accept the terms of service before the next step.'}{literal}')){
						$('#soFr').attr('src',  baseDir+'modules/socolissimo/redirect.php' + serialiseInput(soInputs));
						 $('tr').css('display', 'none');
						$('h3').css('display', 'none');
						$('p').css('display', 'none');
						$('#soFr').css('display', 'block');
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
