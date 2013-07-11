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

function upgrade_module_1_7($object, $install = false)
    {

    // add column cecountry in table socolissimo_delivery_info, checking exitence first (1.7 update)
    $query = ' SELECT * FROM INFORMATION_SCHEMA.COLUMNS
						WHERE COLUMN_NAME= "cecountry"
						AND TABLE_NAME=  "' . _DB_PREFIX_ . 'socolissimo_delivery_info"
                            AND TABLE_SCHEMA = "' . _DB_NAME_ . '"';

    $result = Db::getInstance()->ExecuteS($query);
    // adding column
    if (!$result)
        {
        $query = 'ALTER TABLE ' . _DB_PREFIX_ . 'socolissimo_delivery_info add  `cecountry` varchar(10) NOT NULL AFTER `prtown`';
        if (Db::getInstance()->Execute($query))
            $query = 'UPDATE ' . _DB_PREFIX_ . 'socolissimo_delivery_info SET `cecountry` = "FR" where `cecountry` =""'; // updating value
        if (Db::getInstance()->Execute($query))
            Configuration::updateValue('SOCOLISSIMO_VERSION', '1.7');
        }
    else
        Configuration::updateValue('SOCOLISSIMO_VERSION', '1.7');

    return true;
    }
