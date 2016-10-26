<?php
/**
 *  Admin/FairRegistDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  admin_fairRegistDo view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_AdminFairRegistDo extends Jmesse_ViewClass
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
	}
}

?>
