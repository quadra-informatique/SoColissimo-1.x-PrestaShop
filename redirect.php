<?php
/**
 * ---------------------------------------------------------------------------------
 * 
 * 1997-2012 Quadra Informatique
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
 * @copyright 1997-2012 Quadra Informatique
 * @version Release: $Revision: 1.0 $
 * @license http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 *
 * ---------------------------------------------------------------------------------
*/

require_once('../../config/config.inc.php');
require_once(_PS_ROOT_DIR_.'/init.php');
require_once(dirname(__FILE__).'/classes/SCFields.php');

$so = new SCfields('API');

$fields = $so->getFields();

// Build back the fields list for SoColissimo, gift infos are send using the JS
$inputs = array();
foreach($_GET as $key => $value)
	if (in_array($key, $fields))
		$inputs[$key] = Tools::getValue($key);

$param_plus = array(
	// Get the data set before
	Tools::getValue('trParamPlus'),
	Tools::getValue('gift'),
	Tools::getValue('gift_message')
);

$inputs['trParamPlus'] = implode('|', $param_plus);
// Add signature to get the gift and gift message in the trParamPlus
$inputs['signature'] = $so->generateKey($inputs);

if (Tools::isSubmit('first_call'))
	$onload_script = 'document.getElementById(\'socoForm\').submit();';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
	<head>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=iso-8859-1" />
	</head>
	<body onload="<?php echo $onload_script; ?>">
		<form id="socoForm" name="form" action="<?php echo Configuration::get('SOCOLISSIMO_URL'); ?>" method="POST">
			<?php
				foreach($inputs as $key => $val)
					echo '<input type="hidden" name="'.$key.'" value="'.$val.'"/>';
			?>
		</form>
	</body>
</html>
