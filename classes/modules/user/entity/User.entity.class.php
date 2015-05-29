<?php

/* ---------------------------------------------------------------------------
 * @Plugin Name: Mailing
 * @Plugin Id: mailing
 * @Plugin URI:
 * @Description: Mass mailing for users
 * @Author: stfalcon-studio
 * @Author URI: http://stfalcon.com
 * @LiveStreet Version: 1.0.1
 * @License: GNU GPL v2, http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 * ----------------------------------------------------------------------------
 */

class PluginMailing_ModuleUser_EntityUser extends PluginMailing_Inherit_ModuleUser_EntityUser
{

	public function getUserNoDigestHash() {
		return md5(Config::Get('module.security.hash').$this->getMail());
	}

}

?>