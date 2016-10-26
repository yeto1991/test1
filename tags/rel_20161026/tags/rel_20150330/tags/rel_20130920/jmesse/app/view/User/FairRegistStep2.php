<?php
/**
 *  User/FairRegistStep2.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  user_fairRegistStep2 view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_UserFairRegistStep2 extends Jmesse_ViewClass
{
	/**
	 *  preprocess before forwarding.
	 *
	 *  @access public
	 */
	function preforward()
	{
		// 10年前までの西暦リスト
		$now = (int) date('Y');
		$year_list = array();
		for ($i = -10; $i <= 0; $i++) {
			$year_list[$i + 10] = $now + $i;
		}
		$this->af->setApp('year_list', $year_list);

		// 外部htmlの取得
		$this->backend->getManager('Common')->setExtHtml();
	}
}

?>
