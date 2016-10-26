<?php
/**
 *  User/EnFairRegistStep1.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  user_enFairRegistStep1 view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_UserEnFairRegistStep1 extends Jmesse_ViewClass
{
	/**
	 *  preprocess before forwarding.
	 *
	 *  @access public
	 */
	function preforward()
	{
		// 10年後までの西暦リスト
		$now = (int) date('Y');
		$year_list = array();
		for ($i = 0; $i < 10; $i++) {
			$year_list[$i] = $now + $i;
		}
		$this->af->setApp('year_list', $year_list);

		// 開催頻度
		$this->af->setApp('frequency_list', $this->backend->getManager('JmCodeM')->getFrequencyList());

		// 開催地（地域）
		$this->af->setApp('region_list', $this->backend->getManager('JmCodeM')->getRegionList());

		// 入場資格
		$this->af->setApp('open_to_list', $this->backend->getManager('JmCodeM')->getOpenToList());

		// 業種（大分類）
		$this->af->setApp('main_industory', $this->backend->getManager('JmCodeM')->getMainIndustoryList());

		// 業種（大分類_小分類）
		$this->af->setApp('main_sub_industory_list', $this->backend->getManager('JmCodeM')->getEnMainSubIndustory());

		// 外部htmlの取得
		$this->backend->getManager('Common')->setEnExtHtml();
	}
}

?>
