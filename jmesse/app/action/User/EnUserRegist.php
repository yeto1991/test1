<?php
/**
 *  User/EnUserRegist.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_enUserRegist Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnUserRegist extends Jmesse_ActionForm
{
    /**
     *  @access private
     *  @var    array   form definition.
     */
	var $form = array(
		'mode' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'mode',    // Display name
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
			'form_type'   => FORM_TYPE_HIDDEN,  // Form type
			'name'        => 'User Id',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'emailCheckFlg' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_HIDDEN,
			'name'        => 'emailCheckFlg',
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
			'name'        => 'email',
			'required'    => true,
			'min'         => null,
			'max'         => 255,
			'regexp'      => '/^[!-~]+$/',
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'email2' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_TEXT,
			'name'        => 'email(Confirm)',
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
			'form_type'   => FORM_TYPE_PASSWORD,
			'name'        => 'password',
			'required'    => true,
			'min'         => 4,
			'max'         => 8,
			'regexp'      => '/^[!-~]+$/',
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
		),
		'password2' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_PASSWORD,
			'name'        => 'password(Confirm)',
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
			'name'        => 'Company name',
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
			'name'        => 'Division/Dept name',
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
			'name'        => 'Your name',
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
			'name'        => 'Gender',
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
			'name'        => 'Post Code',
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
			'name'        => 'Address',
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
		'delFlg' => array(
			'type'        => VAR_TYPE_STRING,
			'form_type'   => FORM_TYPE_RADIO,
			'name'        => 'delFlg',
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
 *  user_enUserRegist action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnUserRegist extends Jmesse_ActionClass
{
    /**
     *  preprocess of user_enUserRegist Action.
     *
     *  @access public
     *  @return string    forward name(null: success.
     *                                false: in case you want to exit.)
     */
    function prepare()
    {
		return null;
    }

    /**
     *  user_enUserRegist action implementation.
     *
     *  @access public
     *  @return string  forward name.
     */
    function perform()
    {
		$this->af->set('mode', 'regist');
		return 'user_enUserRegist';
    }
}

?>
