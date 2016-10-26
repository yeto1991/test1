<?php
/**
 *  User/FairList.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_fairList Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserFairList extends Jmesse_ActionForm
{
	/**
	*  @access private
	*  @var    array   form definition.
	*/
	var $form = array(
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
		'mode' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '登録モード',    // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'check_mihon_no' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => 'チェックされた見本市番号', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'mihon_no' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '見本市番号',    // Display name
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
 *  user_fairList action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserFairList extends Jmesse_ActionClass
{
	/**
	*  preprocess of user_fairList Action.
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
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'user_login';
		}

		// バリデーション
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'error';
		}

		return null;
	}

	/**
	*  user_fairList action implementation.
	*
	*  @access public
	*  @return string  forward name.
	*/
	function perform()
	{
		// ユーザ情報
		$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->session->get('user_id'));
		if (Ethna::isError($jm_user)) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->addObject('error', $jm_user);
			return 'error';
		}
		if (null == $jm_user || $this->session->get('user_id') != $jm_user->get('user_id')) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'error';
		}
		$this->session->set('email', $jm_user->get('email'));

		$jm_fair_mgr =& $this->backend->getManager('JmFair');
		// My展示会総件数の取得
		$this->af->setApp('my_fair_info_list_count', $jm_fair_mgr->getMyFairInfoListCount($this->session->get('user_id'), 'J'));
		// My展示会情報の取得
		$this->af->setApp('my_fair_info_list', $jm_fair_mgr->getMyFairInfoList($this->session->get('user_id'), 'J'));

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		return 'user_fairList';
	}
}

?>
