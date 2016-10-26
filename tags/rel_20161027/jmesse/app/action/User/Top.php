<?php
/**
 *  User/Top.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_top Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserTop extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	/*
	 *  TODO: Write form definition which this action uses.
	*  @see http://ethna.jp/ethna-document-dev_guide-form.html
	*
	*  Example(You can omit all elements except for "type" one) :
	*
	*  'sample' => array(
	*      // Form definition
	*      'type'        => VAR_TYPE_INT,    // Input type
	*      'form_type'   => FORM_TYPE_TEXT,  // Form type
	*      'name'        => 'Sample',        // Display name
	*
	*      //  Validator (executes Validator by written order.)
	*      'required'    => true,            // Required Option(true/false)
	*      'min'         => null,            // Minimum value
	*      'max'         => null,            // Maximum value
	*      'regexp'      => null,            // String by Regexp
	*      'mbregexp'    => null,            // Multibype string by Regexp
	*      'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
	*
	*      //  Filter
	*      'filter'      => 'sample',        // Optional Input filter to convert input
	*      'custom'      => null,            // Optional method name which
	*                                        // is defined in this(parent) class.
	*  ),
	*/
	);

	/**
	 *  Form input value convert filter : sample
	 *
	 *  @access protected
	 *  @param  mixed   $value  Form Input Value
	 *  @return mixed           Converted result.
	 */
	/*
	 function _filter_sample($value)
	{
	//  convert to upper case.
	return strtoupper($value);
	}
	*/
}

/**
 *  user_top action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserTop extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_top Action.
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

		return null;
	}

	/**
	 *  user_top action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		return 'user_top';
	}
}

?>
