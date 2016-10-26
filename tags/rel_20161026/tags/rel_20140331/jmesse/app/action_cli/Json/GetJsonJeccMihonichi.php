<?php
/**
 *  Json/GetJsonJeccMihonichi.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  json_getJsonJeccMihonichi Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_JsonGetJsonJeccMihonichi extends Jmesse_ActionForm
{
}

/**
 *  json_getJsonJeccMihonichi action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_JsonGetJsonJeccMihonichi extends Jmesse_ActionClass
{
	/**
	 *  preprocess of json_getJsonJeccMihonichi Action.
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
	 *  json_getJsonJeccMihonichi action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// DB検索
		$jm_fair_mgr = $this->backend->getManager('JmFair');

		//日本語用
		$jm_fair_jecc_mihonichi_list = $jm_fair_mgr->getJsonJeccMihonichiJP();
		if (null != $jm_fair_jecc_mihonichi_list) {
			// 移し替え
			$list_out = array();
			foreach ($jm_fair_jecc_mihonichi_list as $row) {
				$row_out = array();
				$row_out['name'] = $row['name'];
				$row_out['start'] = $row['start'];
				$row_out['end'] = $row['end'];
				$row_out['country'] = $row['country'];
				$row_out['city'] = $row['city'];
				$row_out['url'] = 'tradefair/'.$this->_makeDetailUrl($row['abbrev_title'], $row['fair_title_en'], $row['mihon_no']);
				array_push($list_out, $row_out);
			}
			// JSON化
			$jm_fair_jecc_mihonchi_json = json_encode($list_out);
			// FILE出力
			$filename = $this->config->get('jsonfile_path').$this->config->get('jecc_jp');
			file_put_contents($filename, $jm_fair_jecc_mihonchi_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);
		}
		//英語用
		$jm_fair_jecc_mihonichi_list = $jm_fair_mgr->getJsonJeccMihonichiEN();
		if (null != $jm_fair_jecc_mihonichi_list) {
			// 移し替え
			$list_out = array();
			foreach ($jm_fair_jecc_mihonichi_list as $row) {
				$row_out = array();
				$row_out['name'] = $row['name'];
				$row_out['start'] = $row['start'];
				$row_out['end'] = $row['end'];
				$row_out['country'] = $row['country'];
				$row_out['city'] = $row['city'];
				$row_out['url'] = 'tradefair_en/'.$this->_makeDetailUrl($row['abbrev_title'], $row['name'], $row['mihon_no']);
				array_push($list_out, $row_out);
			}
			// JSON化
			$jm_fair_jecc_mihonchi_json = json_encode($list_out);
			// FILE出力
			$filename = $this->config->get('jsonfile_path').$this->config->get('jecc_en');
			file_put_contents($filename, $jm_fair_jecc_mihonchi_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);
		}
		return null;
	}

	/**
	 * TradeFair文字列作成。
	 *
	 * @param string $abbrev_title 見本市略称
	 * @param string $fair_title_en 見本市名（英）
	 * @param string $mihon_no 見本市番号
	 * @return string TradeFair文字列
	 */
	function _makeDetailUrl($abbrev_title, $fair_title_en, $mihon_no) {
		$url = '';
		if ('' != $abbrev_title) {
			$ary_abbrev_title = explode(' ', ereg_replace("[^a-zA-Z0-9 ]", '', $abbrev_title));
			$url = $ary_abbrev_title[0];
			if (2 <= count($ary_abbrev_title)) {
				if ('' != $ary_abbrev_title[1]) {
					$url .= $ary_abbrev_title[1];
				}
			}
			$url .= '_'.$mihon_no;
		} elseif ('' != $fair_title_en) {
			$ary_fair_title_en = explode(' ', ereg_replace("[^a-zA-Z0-9 ]", '', $fair_title_en));
			$url = $ary_fair_title_en[0];
			if (2 <= count($ary_fair_title_en)) {
				if ('' != $ary_fair_title_en[1]) {
					$url .= $ary_fair_title_en[1];
				}
			}
			$url .= '_'.$mihon_no;
		} else {
			$url = $mihon_no;
		}
		return $url;
	}

}

?>
