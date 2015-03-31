<?php
/**
 *  Admin/ErrMail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_errMail Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminErrMail extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'date_from_yyyy' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '期間(開始年)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 4,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_from_mm' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '期間(開始月)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_from_dd' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '期間(開始日)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_to_yyyy' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '期間(終了年)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 4,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_to_mm' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '期間(終了月)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_to_dd' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '期間(終了日)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'email' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'メールアドレス', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'address' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => 'アドレス不正',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'server' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => 'メールサーバ不正', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'other' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => 'その他',        // Display name
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
 *  admin_errMail action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminErrMail extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_errMail Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('adminCommon')->isLoginError()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'admin_login';
		}

		return null;
	}

	/**
	 *  admin_errMail action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		return 'admin_errMail';
	}
}

?>
