<?php
/**
 *  User/EnReissuePassword.php
 *
 *  @author     m.sasaki
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_enReissuePassword Form implementation.
 *
 *  @author     m.sasaki
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnReissuePassword extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'email' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Email',       // Display name
			'required'    => true,
			'min'         => null,
			'max'         => 255,
			'regexp'      => '/^[!-~]+$/',
			'mbregexp'    => null,
			'mbregexp_encoding' => 'UTF-8',
			'filter'      => null,
			'custom'      => null,
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
	);
}

/**
 *  user_enReissuePassword action implementation.
 *
 *  @author     m.sasaki
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnReissuePassword extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enReissuePassword Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
// 		// "https"判定
// 		if ('on' != $_SERVER['HTTPS']) {
// 			header('Location: https://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']);
// 		}

		return null;
	}

	/**
	 *  user_enReissuePassword action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		return 'user_enReissuePassword';
	}
}

?>
