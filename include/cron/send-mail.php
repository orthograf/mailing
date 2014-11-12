#!/usr/bin/env php
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
define('SYS_HACKER_CONSOLE', false);

defined('ALTO_DIR') || define('ALTO_DIR', dirname(realpath((dirname(__FILE__)) . "/../../../../")));
set_include_path(get_include_path() . PATH_SEPARATOR . ALTO_DIR);
chdir(ALTO_DIR);

require_once(ALTO_DIR . '/engine/loader.php');
require_once(ALTO_DIR . '/engine/classes/abstract/Cron.class.php');

class SendMailingNotifies extends Cron
{

    protected $sProcessName = 'SendMailingNotifies';

    /**
     * Выбираем пул заданий и рассылаем по ним e-mail
     */
    public function Client()
    {
        // Выбираем из очереди
        $aMails = $this->oEngine->PluginMailing_ModuleMailing_GetMailsFromQueue();

        if (empty($aMails)) {
            echo PHP_EOL . "No mailings are found.";
            return false;
        }

        $sendCount = 0;
        foreach ($aMails as $oMail) {
            $sendCount += (int) $this->oEngine->PluginMailing_ModuleMailing_SendMail($oMail);
        }

        echo PHP_EOL . "- {$sendCount} of " . count($aMails) . " messages sended successful." . PHP_EOL ;
    }

}

$sLockFilePath = Config::Get('sys.cache.dir') . 'mailing.lock';
/**
 * Создаем объект крон-процесса,
 * передавая параметром путь к лок-файлу
 */
$app = new SendMailingNotifies($sLockFilePath);
print $app->Exec();
?>