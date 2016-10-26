<?php
/**
 *  User/EnFairCopyList.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_enFairCopyList Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnFairCopyList extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		// プリント画面
		'print' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'print',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[01]+$/',            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
	);
}

/**
 *  user_enFairCopyList action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnFairCopyList extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enFairCopyList Action.
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
			return 'user_enLogin';
		}

		return null;
	}

	/**
	 *  user_enFairCopyList action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$jm_fair_mgr =& $this->backend->getManager('JmFair');

		// ユーザ情報
		$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->session->get('user_id'));
		if (Ethna::isError($jm_user)) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->addObject('error', $jm_user);
			return 'enError';
		}
		if (null == $jm_user || $this->session->get('user_id') != $jm_user->get('user_id')) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->add('error', 'A system error has occurred.');
			return 'enError';
		}
		$this->session->set('email', $jm_user->get('email'));

		// My展示会総件数の取得
		$this->af->setApp('cnt', $jm_fair_mgr->getMyFairInfoListCount($this->session->get('user_id'), 'E'));

		// My展示会情報の取得
		$this->af->setApp('fair_list', $jm_fair_mgr->getMyFairInfoList($this->session->get('user_id'), 'E'));

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}

		return 'user_enFairCopyList';
	}
}

?>
