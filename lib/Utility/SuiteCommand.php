<?php
/**
 *
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by SalesAgility Ltd.
 * Copyright (C) 2011 - 2018 SalesAgility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for technical reasons, the Appropriate Legal Notices must
 * display the words "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 */

namespace SuiteCRM\Utility;

use Symfony\Component\Console\Command\Command;

class SuiteCommand extends Command
{
    protected $currentUser = null;
    protected $currentLanguage = null;
    protected $appListStrings = null;
    protected $appStrings = null;
    protected $sugarConfig = null;

    public function __construct()
    {
        require_once('include/entryPoint.php');
        require_once('modules/Administration/QuickRepairAndRebuild.php');

        global $sugar_config;
        global $current_user;

        $this->currentUser = $current_user;
        $this->sugarConfig = $sugar_config;

        # Setup the language
        if(empty($current_language)) {
            $this->currentLanguage = $this->sugarConfig['default_language'];
        }

        $this->appListStrings = return_app_list_strings_language($this->currentLanguage);
        $this->appStrings = return_application_language($this->currentLanguage);

        $this->currentUser->getSystemUser();

        parent::__construct();
    }

    public function __destruct()
    {
        $exit_on_cleanup = true;
        sugar_cleanup(false);

        // some jobs have annoying habit of calling sugar_cleanup(), and it can be called only once
        // but job results can be written to DB after job is finished, so we have to disconnect here again
        // just in case we couldn't call cleanup
        if(class_exists('DBManagerFactory')) {
          $db = \DBManagerFactory::getInstance();
          $db->disconnect();
        }

        if($exit_on_cleanup) exit;
    }

    /**
     * Change the sugar directory
     *
     * @param  string $dir_path The directory path to change too
     * @return void
     */
    protected function changeSugarDirectory($dir_path) {
        if (file_exists($dir_path)) {
            set_include_path(get_include_path() . PATH_SEPARATOR . $dir_path);
            chdir($dir_path);
            if (file_exists('include/entryPoint.php')) {
                echo("Repairing: " . $dir_path . "\n");
            } else {
                die("Cannot find " . $dir_path . "/include/entryPoint.php\n");
            }
        } else {
            die("Directory not found: " . $dir_path . "\n");
        }
    }
}
