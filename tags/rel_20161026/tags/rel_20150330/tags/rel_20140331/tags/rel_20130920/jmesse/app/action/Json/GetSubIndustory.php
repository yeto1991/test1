<?php
/**
 *  Json/GetSubIndustory.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_JmCodeM.php';

/**
 *  json_getSubIndustory Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_JsonGetSubIndustory extends Jmesse_ActionForm
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
		'use_language_flag' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'ユーザ使用言語フラグ', // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',            // String by Regexp
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
 *  json_getSubIndustory action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_JsonGetSubIndustory extends Jmesse_ActionClass
{
	/**
	 *  preprocess of json_getSubIndustory Action.
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
	 *  json_getSubIndustory action implementation.
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

		$kbn_2 = $this->af->get('kbn_2');
		$this->backend->getLogger()->log(LOG_DEBUG, 'kbn_2 = '.$kbn_2);
		$use_language_flag = $this->af->get('use_language_flag');
		$this->backend->getLogger()->log(LOG_DEBUG, 'use_language_flag = '.$use_language_flag);
		if ('1' == $this->af->get('search')) {
			$msg = 'すべて';
		} else {
			$msg = '...';
		}
		if (0 < strlen($kbn_2) && 0 < strlen($use_language_flag)) {
			$jmCodeMMgr = $this->backend->getManager('jmCodeM');
			$list = $jmCodeMMgr->getSubIndustoryList($kbn_2);
			$this->backend->getLogger()->log(LOG_DEBUG, 'list = '.count($list));

			if (null != $list) {
				$json = '[{"text":"'.$msg.'","value":""}';
				if ("0" == $use_language_flag) {
					for ($i = 0; $i < count($list); $i++) {
						$json .= ',{"text":"'.$list[$i]['discription_jp'].'","value":"'.$list[$i]['kbn_3'].'"}';
					}
				} else {
					for ($i = 0; $i < count($list); $i++) {
						$json .= ',{"text":"'.$list[$i]['discription_en'].'","value":"'.$list[$i]['kbn_3'].'"}';
					}
				}
				$json .= ']';
			} else {
				$this->backend->getLogger()->log(LOG_WARNING, '検索件数[0]');
				$json = '[{"text":"'.$msg.'","value":""}]';
			}
		} else {
			$this->backend->getLogger()->log(LOG_WARNING, '入力項目空');
			$json = '[{"text":"'.$msg.'","value":""}]';
		}

		$this->backend->getLogger()->log(LOG_DEBUG, 'json = '.$json);
		echo $json;
		return null;
	}
}

?>
