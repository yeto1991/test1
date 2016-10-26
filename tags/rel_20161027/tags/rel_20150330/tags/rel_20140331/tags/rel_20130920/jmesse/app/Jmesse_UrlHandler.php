<?php
/**
 *  Jmesse_UrlHandler.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: d2812bcbcc45da7cd045c443d9162739de76e4ba $
 */

/**
 *  URLHandler class.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_UrlHandler extends Ethna_UrlHandler
{
    /** @var    array   Action Mapping */
    var $action_map = array(
        /*
        'user'  => array(
            'user_login' => array(
                'path'          => 'login',
                'path_regexp'   => false,
                'path_ext'      => false,
                'option'        => array(),
            ),
        ),
         */
    );

    /**
     *  get Jmesse_UrlHandler class instance.
     *
     *  @access public
     */
    function &getInstance($class_name = null)
    {
        $instance =& parent::getInstance(__CLASS__);
        return $instance;
    }

    // {{{ normalize gateway request method.
    /**
     *  normalize request(via user defined gateway)
     *
     *  @access private
     */
    /*
    function _normalizeRequest_User($http_vars)
    {
        return $http_vars;
    }
     */
    // }}}

    // {{{ generate gateway path method.
    /**
     *  generate path(via user defined gateway)
     *
     *  @access private
     */
    /*
    function _getPath_User($action, $param)
    {
        return array("/user", array());
    }
     */
    // }}}

    // {{{ filter 
    // }}}
}

// vim: foldmethod=marker tabstop=4 shiftwidth=4 autoindent
?>
