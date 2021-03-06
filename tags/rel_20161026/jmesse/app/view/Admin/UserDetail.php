<?php
/**
 *  Admin/UserDetail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  admin_userDetail view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_AdminUserDetail extends Jmesse_ViewClass
{
    /**
     *  preprocess before forwarding.
     *
     *  @access public
     */
    function preforward()
    {
    	// Fairの件数を取得
    	$this->af->setApp('fair_count', $this->backend->getManager('JmFair')->getCountAll());

    	// Fairの件数を取得(承認/未削除/Web表示する 対象)
    	$this->af->setApp('fair_count_front_fairs', $this->backend->getManager('JmFair')->getCountFrontFairs());

    }
}

?>
