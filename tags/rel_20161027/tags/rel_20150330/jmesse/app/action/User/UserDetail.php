<?php
/**
 *  User/UserDetail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_userDetail Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserUserDetail extends Jmesse_ActionForm
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
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_HIDDEN,
			'name'        => '登録モード',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'user_id' => array(
			'type'        => VAR_TYPE_INT,
			'form_type'   => FORM_TYPE_HIDDEN,
			'name'        => 'ユーザID',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'email' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'Eメール',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'password' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'パスワード',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'companyNm' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '会社名',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'divisionDeptNm' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '部署名',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'userNm' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '氏名',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'genderCd' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '性別',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'postCode' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '郵便番号',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'address' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '住所',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'tel' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'TEL',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'fax' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'FAX',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'url' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'URL',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
    );
}

/**
 *  user_userDetail action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserUserDetail extends Jmesse_ActionClass
{
	/**
	*  preprocess of user_userDetail Action.
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

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}
		return null;
	}

	/**
	*  user_userDetail action implementation.
	*
	*  @access public
	*  @return string  forward name.
	*/
	function perform()
	{
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
		//Form値設定
		$this->af->set('mode', 'change'); //編集開始遷移用
		$this->af->set('user_id', $this->session->get('user_id'));
		$this->af->set('email', $jm_user->get('email'));
		$this->af->set('password', $jm_user->get('password'));
		$this->af->set('companyNm', $jm_user->get('company_nm'));
		$this->af->set('divisionDeptNm', $jm_user->get('division_dept_nm'));
		$this->af->set('userNm', $jm_user->get('user_nm'));
		$this->af->set('genderCd', $jm_user->get('gender_cd'));
		$this->af->set('postCode', $jm_user->get('post_code'));
		$this->af->set('address', $jm_user->get('address'));
		$this->af->set('tel', $jm_user->get('tel'));
		$this->af->set('fax', $jm_user->get('fax'));
		$this->af->set('url', $jm_user->get('url'));

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		return 'user_userDetail';
	}
}

?>
