<?php
/**
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
 */

include_once('../../config/config.inc.php');
include_once('../../init.php');
include_once('../../modules/socolissimo/socolissimo.php');

// To have context available and translation
$socolissimo = new Socolissimo();

// Default answer values => key
$result = array(
	'answer' => true,
	'msg' => ''
);

// Check Token
/*if (Tools::getValue('token') != sha1('socolissimo'._COOKIE_KEY_.Context::getContext()->cart->id))
{
	$result['answer'] = false;
	$result['msg'] = $socolissimo->l('Invalid token');
}

// If no problem with token but no delivery available
if ($result['answer'] && !($result = $socolissimo->getDeliveryInfos(Context::getContext()->cart->id, Context::getContext()->customer->id)))
{
	$result['answer'] = false;
	$result['msg'] = $socolissimo->l('No delivery information selected');
}
*/
header('Content-type: application/json');
echo json_encode($result);
exit(0);

?>
