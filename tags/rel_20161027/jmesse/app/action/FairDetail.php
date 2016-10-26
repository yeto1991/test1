<?php
/**
 *  FairDetail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  fairDetail Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_FairDetail extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'mihon_no' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '見本市番号',    // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'print' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'プリント用表示', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
	);
}

/**
 *  fairDetail action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_FairDetail extends Jmesse_ActionClass
{
	/**
	 *  preprocess of fairDetail Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'error';
		}

		$this->backend->getLogger()->log(LOG_DEBUG, '■mihon_no : '.$this->af->get('mihon_no'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■print : '.$this->af->get('print'));

		return null;
	}

	/**
	 *  fairDetail action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$jm_fair_obj =& $this->backend->getManager('JmFair');
		$lang = 'J';
		$fair_detail = $jm_fair_obj->getFairDetail($this->af->get('mihon_no'), $lang);
		if (null == $fair_detail) {
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'error';
		}

		$this->af->setApp('fair_detail', $fair_detail);

		// MOD-S 2013.11.27 保守課題No.38対応
		// 開催終了？
// 		$date_to = $fair_detail['date_to_yyyy'].$fair_detail['date_to_mm'].$fair_detail['date_to_dd'];
// 		$date_now = date('Ymd');
// 		$this->backend->getLogger()->log(LOG_DEBUG, '■date_to  : '.$date_to);
// 		$this->backend->getLogger()->log(LOG_DEBUG, '■date_now : '.$date_now);
// 		if ($date_to < $date_now) {
// 			$is_end = '1';
// 		} else {
// 			$is_end = '0';
// 		}
// 		$this->af->setApp('is_end', $is_end);
		// MOD-E 2013.11.27 保守課題No.38対応

		// 画像保存フォルダ
		$this->af->setApp('photos_dir', $this->_getImageDir($this->af->get('mihon_no')));

		// 月間ランキング情報に登録
		if ('009' == $fair_detail['region'] && '002' == $fair_detail['country']) {
			// 国内
			$venue_kbn = '0';
		} else {
			// 海外
			$venue_kbn = '1';
		}
		$jm_ranking_mgr =& $this->backend->getManager('JmRanking');
		$jm_ranking_mgr->countUp($this->af->get('mihon_no'), $venue_kbn);

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		// お役立ち機能
		$jm_fair_qa_obj =& $this->backend->getManager('JmQA');
		$fair_qa = $jm_fair_qa_obj->getFairQA();
		$this->af->setApp('fair_qa', $fair_qa);


		return 'fairDetail';
	}

	/**
	 * 見本市画像を保存するディレクトリ名を作成する。
	 * 一つのフォルダに10000件保存する。
	 * 0スタート。
	 *
	 * @param int $mihon_no 見本市番号
	 * @return string
	 */
	function _getImageDir($mihon_no) {
		return (string) ((int) ($mihon_no / $this->config->get('photos_dir_max')));
	}

}

?>
