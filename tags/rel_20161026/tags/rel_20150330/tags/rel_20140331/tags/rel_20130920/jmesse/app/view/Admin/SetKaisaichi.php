<?php
/**
 *  Admin/SetKaisaichi.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  admin_setKaisaichi view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_AdminSetKaisaichi extends Jmesse_ViewClass
{
	/**
	 *  preprocess before forwarding.
	 *
	 *  @access public
	 */
	function preforward()
	{
		// 開催地（地域）
		$this->af->setApp('region_list', $this->backend->getManager('JmCodeM')->getRegionList());
	}
}

?>
