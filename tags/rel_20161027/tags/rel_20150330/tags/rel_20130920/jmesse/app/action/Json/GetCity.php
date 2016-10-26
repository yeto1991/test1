<?php
/**
 *  Json/GetCity.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  json_getCity Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_JsonGetCity extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'kbn_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '区分2',         // Display name
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
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '区分3',         // Display name
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
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'ユーザ使用言語フラグ', // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'search' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '検索画面用',    // Display name
			'required'    => false,           // Required Option(true/false)
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
 *  json_getCity action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_JsonGetCity extends Jmesse_ActionClass
{
	/**
	 *  preprocess of json_getCity Action.
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
	 *  json_getCity action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			echo '';
			return null;
		}

		$region = $this->af->get('kbn_2');
		$country = $this->af->get('kbn_3');
		$use_language_flag = $this->af->get('use_language_flag');
		$search = $this->af->get('search');

		if ('1' == $search) {
			$jm_code_m_mgr = $this->backend->getManager('jmCodeM');
			$list = $jm_code_m_mgr->getCityList($region, $country);
			if ('0' == $use_language_flag) {
				$json_list = array(array('text' => 'すべて', 'value' => ''));
			} elseif ('1' == $use_language_flag) {
				$json_list = array(array('text' => 'ALL', 'value' => ''));
			}
			foreach ($list as $row) {
				if ('0' == $use_language_flag) {
					$json_row = array('text' => $row['discription_jp'], 'value' => $row['kbn_4']);
				} elseif ('1' == $use_language_flag) {
					$json_row = array('text' => $row['discription_en'], 'value' => $row['kbn_4']);
				}
				array_push($json_list, $json_row);
			}
			$json = json_encode($json_list);
		} else {
			if ('' != $region && '' != $country && '' != $use_language_flag) {
				$jm_code_m_mgr = $this->backend->getManager('jmCodeM');
				$list = $jm_code_m_mgr->getCityList($region, $country);
				if (null != $list) {
					$json = '[{"text":"...","value":""}';
					if ('0' == $use_language_flag) {
						for ($i = 0; $i < count($list); $i++) {
							$json .= ',{"text":"'.$list[$i]['discription_jp'].'","value":"'.$list[$i]['kbn_4'].'"}';
						}
					} elseif ('1' == $use_language_flag) {
						for ($i = 0; $i < count($list); $i++) {
							$json .= ',{"text":"'.$list[$i]['discription_en'].'","value":"'.$list[$i]['kbn_4'].'"}';
						}
					}
					$json .= ']';
				} else {
					$this->backend->getLogger()->log(LOG_WARNING, '検索件数[0]');
					$json = '[{"text":"...","value":""}]';
				}
			}
		}

		$this->backend->getLogger()->log(LOG_DEBUG, 'json = '.$json);
		echo $json;
		return null;
	}
}

?>
