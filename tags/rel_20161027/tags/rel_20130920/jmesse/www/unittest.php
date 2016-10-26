<?php
error_reporting(E_ALL);
require_once dirname(__FILE__) . '/../app/Jmesse_Controller.php';

Jmesse_Controller::main('Jmesse_Controller', array(
    '__ethna_unittest__',
    )
);
?>
