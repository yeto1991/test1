<?php
/**
 *  User/UserRegist.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  user_userRegist view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_UserUserRegist extends Jmesse_ViewClass
{
	/**
	 *  preprocess before forwarding.
	 *
	 *  @access public
	 */
	function preforward()
	{
		// 外部htmlの取得
		$this->backend->getManager('Common')->setExtHtml();
	}
}

?>
