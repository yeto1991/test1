<?php
/**
 *  Admin/SelectCity.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_selectCity Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminSelectCity extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'kbn_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '地域',          // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'kbn_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '国・地域',      // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'use_language_flag' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'ユーザ使用言語フラグ',            // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
	);

}

/**
 *  admin_selectCity action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminSelectCity extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_selectCity Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('adminCommon')->isLoginFair()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'admin_login';
		}

		// バリデーション
		if ($this->af->validate() > 0) {
			return 'admin_error';
		}

		return null;
	}

	/**
	 *  admin_selectCity action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{

		$this->af->setApp('city', $this->backend->getManager('JmCodeM')->getCityList($this->af->get('kbn_2'), $this->af->get('kbn_3')));
		$this->af->setApp('use_language_flag', $this->af->get('use_language_flag'));

		return 'admin_selectCity';
	}
}

?>
