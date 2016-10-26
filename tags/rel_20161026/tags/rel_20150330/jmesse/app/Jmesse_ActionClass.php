<?php
// vim: foldmethod=marker
/**
 *  Jmesse_ActionClass.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 3aa349087f33809302b69c667df26f4a6f815904 $
 */

// {{{ Jmesse_ActionClass
/**
 *  action execution class
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @access     public
 */
class Jmesse_ActionClass extends Ethna_ActionClass
{
    /**
     *  authenticate before executing action.
     *
     *  @access public
     *  @return string  Forward name.
     *                  (null if no errors. false if we have something wrong.)
     */
    function authenticate()
    {
        return parent::authenticate();
    }

    /**
     *  Preparation for executing action. (Form input check, etc.)
     *
     *  @access public
     *  @return string  Forward name.
     *                  (null if no errors. false if we have something wrong.)
     */
    function prepare()
    {
        return parent::prepare();
    }

    /**
     *  execute action.
     *
     *  @access public
     *  @return string  Forward name.
     *                  (we does not forward if returns null.)
     */
    function perform()
    {
        return parent::perform();
    }
}
// }}}

?>
