<?php
/**
 *  {$action_name}.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 28a0f27e7023679a58dc20e546b4463ee5b9f7c7 $
 */
chdir(dirname(__FILE__));
require_once '{$dir_app}/Jmesse_Controller.php';

ini_set('max_execution_time', 0);

Jmesse_Controller::main_CLI('Jmesse_Controller', '{$action_name}');
?>
