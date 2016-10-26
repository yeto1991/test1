<?php
/**
 *  Admin/SetKaisaichi.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_setKaisaichi Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminSetKaisaichi extends Jmesse_ActionForm
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
			'form_type'   => FORM_TYPE_HIDDEN,  // Form type
			'name'        => '見本市番号',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'region' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '開催地地域',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'country' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '開催地国地域',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'city' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '開催地都市',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'other_city_jp' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'その他(日)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'other_city_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'その他(英)',    // Display name
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
 *  admin_setKaisaichi action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminSetKaisaichi extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_setKaisaichi Action.
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
	 *  admin_setKaisaichi action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$regist = $this->af->get('regist');
		$mihon_no = $this->af->get('mihon_no');
		if ('1' != $regist) {
			if ('' == $mihon_no) {
				// 初期表示
				$this->af->set('region', '');
				$this->af->set('country', '');
				$this->af->set('city', '');
				$this->af->set('other_city_jp', '');
				$this->af->set('other_city_en', '');

				$this->af->setApp('fair_title_jp', '');
				$this->af->setApp('fair_title_en', '');
			} else {
				// 検索
				$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $mihon_no);
				if ($mihon_no != $jm_fair->get('mihon_no')) {
					$this->ae->add('mihon_no', '見本市情報がありません');
					return 'admin_setKaisaichi';
				}
				$this->af->set('region', $jm_fair->get('region'));
				$this->af->set('country', $jm_fair->get('country'));
				$this->af->set('city', $jm_fair->get('city'));
				$this->af->set('other_city_jp', $jm_fair->get('other_city_jp'));
				$this->af->set('other_city_en', $jm_fair->get('other_city_en'));

				$this->af->setApp('fair_title_jp', $jm_fair->get('fair_title_jp'));
				$this->af->setApp('fair_title_en', $jm_fair->get('fair_title_en'));
			}
		} else {
			// 登録
			$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $mihon_no);
			if ($mihon_no != $jm_fair->get('mihon_no')) {
				$this->ae->add('mihon_no', '見本市情報がありません');
				return 'admin_setKaisaichi';
			}

			$jm_fair->set('region', $this->af->get('region'));
			$jm_fair->set('country', $this->af->get('country'));
			$jm_fair->set('city', $this->af->get('city'));
			$jm_fair->set('other_city_jp', $this->af->get('other_city_jp'));
			$jm_fair->set('other_city_en', $this->af->get('other_city_en'));
			$jm_fair->update();

			$this->af->setApp('fair_title_jp', $jm_fair->get('fair_title_jp'));
			$this->af->setApp('fair_title_en', $jm_fair->get('fair_title_en'));
		}

		return 'admin_setKaisaichi';
	}
}

?>
