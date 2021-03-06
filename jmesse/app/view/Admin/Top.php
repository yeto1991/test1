<?php
/**
 *  Admin/Top.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 47c269115c9380915eda42c4fa1c780886c064d8 $
 */

/**
 *  admin_top view implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_View_AdminTop extends Jmesse_ViewClass
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

		// アンケート回答件数を取得
		$this->backend->getLogger()->log(LOG_DEBUG, 'アンケート回答件数を取得');
		$this->af->setApp('fair_qa_result', $this->backend->getManager('JmQA')->getFairQAResult());

	}
}

?>
