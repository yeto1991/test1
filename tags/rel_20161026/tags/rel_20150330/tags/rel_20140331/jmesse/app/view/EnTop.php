<?php
/**
 *  EnTop.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  enTop view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_EnTop extends Jmesse_ViewClass
{
	/**
	 *  preprocess before forwarding.
	 *
	 *  @access public
	 */
	function preforward()
	{
// 		// 業種（大分類）集計値
// 		$this->af->setApp('main_industory_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListMainIndustory());

// 		// 開催地（地域）集計値
// 		$this->af->setApp('region_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListRegion());

		// 10年前から10年後までの西暦リスト
		$now = (int) date('Y');
		$year_list = array();
		for ($i = 0; $i < 20; $i++) {
			$year_list[$i] = $now + $i -10;
		}
		$this->af->setApp('year_list', $year_list);

		// 開催地（地域）
		$this->af->setApp('region_list', $this->backend->getManager('JmCodeM')->getRegionList());

		// 業種（大分類_小分類）
		$this->af->setApp('main_sub_industory_list', $this->backend->getManager('JmCodeM')->getEnMainSubIndustory());

	}
}

?>
