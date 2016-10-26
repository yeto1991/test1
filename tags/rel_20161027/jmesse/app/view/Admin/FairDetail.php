<?php
/**
 *  Admin/FairDetail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  admin_fairDetail view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_AdminFairDetail extends Jmesse_ViewClass
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

		// 開催頻度
		$this->af->setApp('frequency', $this->backend->getManager('JmCodeM')->getFrequencyList());

		// 業種（大分類）
		$this->af->setApp('main_industory', $this->backend->getManager('JmCodeM')->getMainIndustoryList());

		// 開催地（地域）
		$this->af->setApp('region', $this->backend->getManager('JmCodeM')->getRegionList());

		// 開催地（国・地域）
		if (null != $this->af->get('region_jp') && '' != $this->af->get('region_jp')) {
			$this->af->setApp('country', $this->backend->getManager('JmCodeM')->getCountryList($this->af->get('region_jp')));
		}

		// 入場資格
		$this->af->setApp('open_to', $this->backend->getManager('JmCodeM')->getOpenToList());

	}
}

?>
