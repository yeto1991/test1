<?php
/**
 *  Admin/UserChange.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_userChange Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminUserChange extends Jmesse_ActionForm
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
			'required'    => true,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'user_id' => array(
			'type'        => VAR_TYPE_INT, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'ユーザID',    // Display name
			'required'    => true,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'success' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '成功',          // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'email' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'Eメール',
			'required'    => true,
			'min'         => null,
			'max'         => 255,
			'regexp'      => '/^[!-~]+$/',
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'password' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'パスワード',
			'required'    => true,
			'min'         => 4,
			'max'         => 8,
			'regexp'      => '/^[!-~]+$/',
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'companyNm' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '会社名',
			'required'    => true,
			'min'         => null,
			'max'         => 500,
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
			'max'         => 255,
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
			'required'    => true,
			'min'         => null,
			'max'         => 100,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'genderCd' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_RADIO,
			'name'        => '性別',
			'required'    => true,
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
			'max'         => 20,
			'regexp'      => '/^[!-~]+$/',
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'address' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => '住所',
			'required'    => true,
			'min'         => null,
			'max'         => 255,
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
			'required'    => true,
			'min'         => null,
			'max'         => 100,
			'regexp'      => '/^[!-~]+$/',
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
			'max'         => 100,
			'regexp'      => '/^[!-~]+$/',
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
			'max'         => 255,
			'regexp'      => '/^http[!-~]+$/',
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'useLanguageCd' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_RADIO,
			'name'        => 'ユーザ使用言語',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'registResultNoticeCd' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_RADIO,
			'name'        => '登録結果通知',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'authGen' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_CHECKBOX,
			'name'        => '一般権限',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'authUser' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_CHECKBOX,
			'name'        => 'ユーザ管理権限',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'authFair' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_CHECKBOX,
			'name'        => '展示会管理権限',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'idpassNoticeCd' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_RADIO,
			'name'        => 'ID・パスワード通知メール',
			'required'    => false,
			'min'         => null,
			'max'         => null,
			'regexp'      => null,
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'delFlg' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_RADIO,
			'name'        => '削除フラグ',
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
 *  admin_userChange action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminUserChange extends Jmesse_ActionClass
{
	/**
	*  preprocess of admin_userChange Action.
	*
	*  @access public
	*  @return string    forward name(null: success.
	*                                false: in case you want to exit.)
	*/
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('adminCommon')->isLoginUser()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'admin_login';
		}

		// ユーザIDは必須
		if (null == $this->af->get('user_id') || '' == $this->af->get('user_id')) {
			$this->ae->add('error', 'ユーザIDが入力されていません');
			return 'admin_error';
		}

		// 登録モードも必須
		if (null == $this->af->get('mode') || '' == $this->af->get('mode')) {
			$this->ae->add('error', '登録モードが入力されていません');
			return 'admin_error';
		}

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}
		return null;
	}

	/**
	*  admin_userChange action implementation.
	*
	*  @access public
	*  @return string  forward name.
	*/
	function perform()
	{
		$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->af->get('user_id'));
		if (Ethna::isError($jm_user)) {
			$this->ae->addObject('error', $jm_user);
			return 'admin_error';
		}
		//Form値設定
		$this->af->set('user_id', $jm_user->get('user_id'));
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
		$this->af->set('useLanguageCd', $jm_user->get('use_language_cd'));
		$this->af->set('registResultNoticeCd', $jm_user->get('regist_result_notice_cd'));
		$this->af->set('authGen', $jm_user->get('auth_gen'));
		$this->af->set('authUser', $jm_user->get('auth_user'));
		$this->af->set('authFair', $jm_user->get('auth_fair'));
		$this->af->set('idpassNoticeCd', $jm_user->get('idpass_notice_cd'));
		$this->af->set('delFlg', $jm_user->get('del_flg'));

		// 成功用
		$this->af->setApp('success', $this->af->get('success'));
		return 'admin_userRegist';
	}
}

?>
