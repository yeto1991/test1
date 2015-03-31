<?php
/**
 *  Json/ViewJson.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  json_viewJson Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_JsonViewJson extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'f' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'JSONファイル名', // Display name
			'required'    => true,            // Required Option(true/false)
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
 *  json_viewJson action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_JsonViewJson extends Jmesse_ActionClass
{
	/**
	 *  preprocess of json_viewJson Action.
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
	 *  json_viewJson action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{

		$f = $this->af->get('f');

		if (null != $f && '' != $f) {
			$filename = $this->config->get($f);
			if (null != $filename && '' != $filename) {
				$full_path = $this->config->get('jsonfile_path').$filename;
				$this->backend->getLogger()->log(LOG_DEBUG, '■full_path : '.$full_path);
				$json = @file_get_contents($full_path);
				$list = array();
				if ('i2_jp' == $f || 'i2_en' == $f) {
					foreach (json_decode($json, true) as $json_row_1) {
						foreach($json_row_1 as $json_row) {
							$row = array();
							foreach($json_row as $json_col => $json_value) {
								$col = array();
								$col['col'] = $json_col;
								$col['value'] = $json_value;
								array_push($row, $col);
							}
							array_push($list, $row);
						}
					}
				} else {
					foreach (json_decode($json, true) as $json_row) {
						$row = array();
						foreach($json_row as $json_col => $json_value) {
							$col = array();
							$col['col'] = $json_col;
							$col['value'] = $json_value;
							array_push($row, $col);
						}
						array_push($list, $row);
					}
				}
				$this->af->setApp('list', $list);
				$this->af->setApp('mode', 'list');
			} else {
				$this->af->setApp('mode', 'menu');
			}
		} else {
			$this->af->setApp('mode', 'menu');
		}

		return 'json_viewJson';

// 		echo '<pre>';
// 		var_dump(json_decode($json, true));
// 		echo '</pre>';
// 		return null;
	}
}

?>
