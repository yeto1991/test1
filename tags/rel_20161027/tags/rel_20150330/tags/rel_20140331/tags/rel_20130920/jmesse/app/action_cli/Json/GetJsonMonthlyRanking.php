<?php
/**
 *  Json/GetJsonMonthlyRanking.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  json_getJsonMonthlyRanking Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_JsonGetJsonMonthlyRanking extends Jmesse_ActionForm
{
}

/**
 *  json_getJsonMonthlyRanking action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_JsonGetJsonMonthlyRanking extends Jmesse_ActionClass
{
	/**
	 *  preprocess of json_getJsonMonthlyRanking Action.
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
	 *  json_getJsonMonthlyRanking action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$file_name_list = array(
			$this->config->get('r1_jp'),
			$this->config->get('r2_jp'),
			$this->config->get('r3_jp'),
			$this->config->get('r4_jp'),
			$this->config->get('r5_jp'),
			$this->config->get('r6_jp'),
			$this->config->get('r1_en'),
			$this->config->get('r2_en'),
			$this->config->get('r3_en'),
			$this->config->get('r4_en'),
			$this->config->get('r5_en'),
			$this->config->get('r6_en'),
			$this->config->get('r1_jp_top3'),
			$this->config->get('r4_en_top3')
		);

		$jm_ranking = $this->backend->getManager('JmRanking');

		for ($i = 0; $i < count($file_name_list); $i++) {
			$list = $jm_ranking->getJsonRanking($i);
			if (null != $list) {
				$list_out = array();
				foreach ($list as $row) {
					$row_out = array();
					$row_out['name'] = $row['name'];
					$row_out['start'] = $row['start'];
					$row_out['end'] = $row['end'];
					if ('0' == $row['venue_kbn']) {
						$row_out['venue'] = $row['site'];
					} else {
						$row_out['venue'] = $row['city'].'/'.$row['country'].'/'.$row['area'];
					}
					if ('0' == $row['site_kbn']) {
						$row_out['url'] = 'tradefair/'.$this->_makeDetailUrl($row['abbrev_title'], $row['fair_title_en'], $row['mihon_no']);
					} else {
						$row_out['url'] = 'tradefair_en/'.$this->_makeDetailUrl($row['abbrev_title'], $row['fair_title_en'], $row['mihon_no']);
					}
					array_push($list_out, $row_out);
				}
				$filename = $this->config->get('jsonfile_path').$file_name_list[$i];
				file_put_contents($filename, json_encode($list_out));
				$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);
			}
		}

		return null;
	}

	/**
	 * フレンドリーURLの表示作成。
	 *
	 * @param array $list 見本市検索結果リスト
	 * @return array 見本市検索結果リスト
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
