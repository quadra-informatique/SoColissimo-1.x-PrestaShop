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
if (!defined('_PS_VERSION_'))
    exit;

function upgrade_module_1_9($object, $install = false)
    {
		// Adding new url for supervision
		Configuration::updateValue('SOCOLISSIMO_SUP_URL', 'http://ws.colissimo.fr/supervision-pudo-frame/supervision.jsp');
        Configuration::updateValue('SOCOLISSIMO_VERSION', '1.9');
		return true;
    }
