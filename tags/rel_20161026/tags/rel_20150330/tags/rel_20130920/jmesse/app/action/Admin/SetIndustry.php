<?php
/**
 *  Admin/SetIndustry.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_setIndustry Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminSetIndustry extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(

		'regist' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '登録',          // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
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

		'main_industory_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種大分類',    // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'sub_industory_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種小分類',    // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'main_industory_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種大分類(2)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'sub_industory_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種小分類(2)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'main_industory_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種大分類(3)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'sub_industory_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種小分類(3)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'main_industory_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種大分類(4)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'sub_industory_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種小分類(4)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'main_industory_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種大分類(5)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'sub_industory_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種小分類(5)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'main_industory_6' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種大分類(6)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'sub_industory_6' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種小分類(6)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
	);
}

/**
 *  admin_setIndustry action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminSetIndustry extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_setIndustry Action.
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

		return null;
	}

	/**
	 *  admin_setIndustry action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$regist = $this->af->get('regist');
		$mihon_no = $this->af->get('mihon_no');

		if ('' == $regist && '' != $mihon_no) {
			// 初期表示
			$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $mihon_no);
			if (Ethna::isError($jm_fair)) {
				$this->ae->addObject('mihon_no', $jm_fair);
				return 'admin_setIndustry';
			}
			if ($mihon_no != $jm_fair->get('mihon_no')) {
				$this->ae->add('mihon_no', '見本市情報がありません');
				return 'admin_setIndustry';
			}
			$this->af->set('main_industory_1', $jm_fair->get('main_industory_1'));
			$this->af->set('main_industory_2', $jm_fair->get('main_industory_2'));
			$this->af->set('main_industory_3', $jm_fair->get('main_industory_3'));
			$this->af->set('main_industory_4', $jm_fair->get('main_industory_4'));
			$this->af->set('main_industory_5', $jm_fair->get('main_industory_5'));
			$this->af->set('main_industory_6', $jm_fair->get('main_industory_6'));

			$this->af->set('sub_industory_1', $jm_fair->get('sub_industory_1'));
			$this->af->set('sub_industory_2', $jm_fair->get('sub_industory_2'));
			$this->af->set('sub_industory_3', $jm_fair->get('sub_industory_3'));
			$this->af->set('sub_industory_4', $jm_fair->get('sub_industory_4'));
			$this->af->set('sub_industory_5', $jm_fair->get('sub_industory_5'));
			$this->af->set('sub_industory_6', $jm_fair->get('sub_industory_6'));

			$this->af->setApp('fair_title_jp', $jm_fair->get('fair_title_jp'));
			$this->af->setApp('fair_title_en', $jm_fair->get('fair_title_en'));
		} elseif ('1' == $regist && '' != $mihon_no) {
			// 更新
			$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $mihon_no);
			if (Ethna::isError($jm_fair)) {
				$this->ae->addObject('mihon_no', $jm_fair);
				return 'admin_setIndustry';
			}
			if ($mihon_no != $jm_fair->get('mihon_no')) {
				$this->ae->add('mihon_no', '見本市情報がありません');
				return 'admin_setIndustry';
			}
			$jm_fair->set('main_industory_1', $this->_changeNullString($this->af->get('main_industory_1')));
			$jm_fair->set('main_industory_2', $this->_changeNullString($this->af->get('main_industory_2')));
			$jm_fair->set('main_industory_3', $this->_changeNullString($this->af->get('main_industory_3')));
			$jm_fair->set('main_industory_4', $this->_changeNullString($this->af->get('main_industory_4')));
			$jm_fair->set('main_industory_5', $this->_changeNullString($this->af->get('main_industory_5')));
			$jm_fair->set('main_industory_6', $this->_changeNullString($this->af->get('main_industory_6')));

			$jm_fair->set('sub_industory_1', $this->_changeNullString($this->af->get('sub_industory_1')));
			$jm_fair->set('sub_industory_2', $this->_changeNullString($this->af->get('sub_industory_2')));
			$jm_fair->set('sub_industory_3', $this->_changeNullString($this->af->get('sub_industory_3')));
			$jm_fair->set('sub_industory_4', $this->_changeNullString($this->af->get('sub_industory_4')));
			$jm_fair->set('sub_industory_5', $this->_changeNullString($this->af->get('sub_industory_5')));
			$jm_fair->set('sub_industory_6', $this->_changeNullString($this->af->get('sub_industory_6')));

			$jm_fair->update();

			$this->af->setApp('fair_title_jp', $jm_fair->get('fair_title_jp'));
			$this->af->setApp('fair_title_en', $jm_fair->get('fair_title_en'));
		}

		return 'admin_setIndustry';
	}

	function _changeNullString($str) {
		$ret = $str;
		if ('' == $str) {
			$ret = null;
		}
		return $ret;
	}
}

?>
