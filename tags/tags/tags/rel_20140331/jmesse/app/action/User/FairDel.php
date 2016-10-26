<?php
/**
 *  User/FairDel.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_fairDel Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserFairDel extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'mode' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '登録モード',    // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'mihon_no' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
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
	);
}

/**
 *  user_fairDel action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserFairDel extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_fairDel Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('userCommon')->isLoginUser()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', '');
			return 'user_login';
		}

		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'error';
		}

		return null;
	}

	/**
	 *  user_fairDel action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		// オブジェクトの取得
		$jm_fair_obj = $this->backend->getObject('JmFair', 'mihon_no', $this->af->get('mihon_no'));
		if (Ethna::isError($jm_fair_obj)) {
			$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'enError';
		}
		if (null == $jm_fair_obj || $this->af->get('mihon_no') != $jm_fair_obj->get('mihon_no')) {
			$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'error';
		}
		if ($this->session->get('user_id') != $jm_fair_obj->get('user_id')) {
			$this->backend->getLogger()->log(LOG_ERR, '他人の見本市 '.$this->session->get('user_id').' '.$jm_fair_obj->get('user_id'));
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'error';
		}

		$jm_fair_obj->set('del_flg', '1');
		$jm_fair_obj->set('del_date', date('Y/m/d H:i:s'));
		$jm_fair_obj->set('update_user_id', $this->session->get('user_id'));
		$jm_fair_obj->set('update_date', date('Y/m/d H:i:s'));

		// UPDATE
		$ret = $jm_fair_obj->update();
		if (Ethna::isError($ret)) {
			$this->backend->getLogger()->log(LOG_ERR, 'JM_FAIR更新失敗');
			$this->ae->add('error', 'システムエラーが発生しました。');
			$db->rollback();
			return 'error';
		}

// 		// JM_FAIR_TEMPにコピー
// 		$jmFairTempMgr = $this->backend->getManager('jmFairTemp');
// 		$jmFairTempMgr->copyFair($jm_fair_obj->get('mihon_no'));

		// LOGに記録
		$mgr =& $this->backend->getManager('userCommon');
		$ret = $mgr->regLog($this->session->get('user_id'), '4', '2', $this->af->get('mihon_no'));
		if (Ethna::isError($ret)) {
			$this->backend->getLogger()->log(LOG_ERR, 'JM_LOG登録失敗');
			$this->ae->add('error', 'システムエラーが発生しました。');
			$db->rollback();
			return 'error';
		}

		// COMMIT
		$db->commit();

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		// 画面遷移
		if ('d' == $this->af->get('mode')) {
			$url = $this->config->get('url').'?action_user_fairRegistFinish=true&msg=ed';
		}else{
			$url = $this->config->get('url').'?action_user_fairRegistFinish=true&msg=cd';
		}
		header('Location: '.$url);
		return null;
	}
}

?>
