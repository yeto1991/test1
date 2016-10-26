<?php
/**
 *  EnFairListDownload.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnFairList.php';

/**
 *  enFairListDownload Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_EnFairListDownload extends Jmesse_Form_EnFairList
{
}

/**
 *  enFairListDownload action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_EnFairListDownload extends Jmesse_ActionClass
{
	/**
	 *  preprocess of enFairListDownload Action.
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
	 *  enFairListDownload action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ソート順
		$sort = $this->_setSort();

		// 検索結果（リスト）部
		// マネージャの取得
		$jm_fair_mgr =& $this->backend->getManager('JmFair');

		// 検索実行
		$lang = 'E';
		if ('1' == $this->af->get('all')) {
			$jm_fair_list = $jm_fair_mgr->getFairListAllCsv($sort, $lang);
		} else {
			if ('1' == $this->af->get('detail')) {
				$jm_fair_list = $jm_fair_mgr->getFairListSearchDetailCsv($sort, $lang);
			} else {
				$jm_fair_list = $jm_fair_mgr->getFairListCsv($sort, $lang);
			}
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}

		// CSV出力
		// ファイル名
		$file = 'list.csv';

		// header出力
		header ("Content-Disposition: attachment; filename=$file");
		header ("Content-type: application/x-csv");

		// MOD-S 2012.01.31 ダウンロード項目、コード値変換対応
		$csvtitle = '"DATE_OF_APPLICATION","DATE_OF_REGISTRATION","FAIR_TITLE_EN","FAIR_TITLE_ABBREVIATION","FAIR_URL","FAIR_NO","CATCHPHRASE","PR","DATE_FROM_YYYY","DATE_FROM_MM","DATE_FROM_DD","DATE_TO_YYYY","DATE_TO_MM","DATE_TO_DD","FREQUENCY","MAIN_INDUSTORY_1","SUB_INDUSTORY_1","MAIN_INDUSTORY_2","SUB_INDUSTORY_2","MAIN_INDUSTORY_3","SUB_INDUSTORY_3","MAIN_INDUSTORY_4","SUB_INDUSTORY_4","MAIN_INDUSTORY_5","SUB_INDUSTORY_5","MAIN_INDUSTORY_6","SUB_INDUSTORY_6","EXHIBITS","REGION","COUNTRY","CITY","OTHER_CITY_EN","VENUE_EN","VENUE_URL","NET SQUARE METERS","ELIGIBILITY","METHOD_OF_OBTAINING_TICKETS(FREE)","METHOD_OF_OBTAINING_TICKETS(APPLY/REGISTER ONLINE)","METHOD_OF_OBTAINING_TICKETS(CONTACT ORGANIZER/AGENCY IN JAPAN)","METHOD_OF_OBTAINING_TICKETS(TICKETS AVAILABLE AT EVENT)","METHOD_OF_OBTAINING_TICKETS(OTHERS)","YEAR_OF_THE_LAST_TRADE_FAIR","TOTAL_NUMBER_OF_VISITOR","NUMBER_OF_FOREIGN_VISITOR","TOTAL_NUMBER_OF_EXHIBITORS","NUMBER_OF_FOREIGN_EXHIBITORS","NET_SQUARE_METERS_OF_THE_LAST_TRADE_FAIR","DATA VERIFIED BY","ORGANIZER","ORGANIZER_TEL","ORGANIZER_FAX","ORGANIZER_EMAIL","ORGANIZER_ADDR","ORGANIZER_DIV","ORGANIZER_PERS","AGENCY_IN_JAPAN","AGENCY_IN_JAPAN_TEL","AGENCY_IN_JAPAN_FAX","AGENCY_IN_JAPAN_EMAIL","AGENCY_IN_JAPAN_ADDR","AGENCY_IN_JAPAN_DIV","AGENCY_IN_JAPAN_PERS","PHOTOS_1","PHOTOS_2","PHOTOS_3","KEYWORD","REGIST_DATE","UPDATE_DATE"';
		echo mb_convert_encoding($csvtitle, 'CP932', 'UTF-8');
		echo "\n";
		foreach ($jm_fair_list as $row) {
			$j = 0;
			foreach ($row as $value) {
				if (0 < $j) {
					echo ',';
				}
				echo '"'.mb_convert_encoding(str_replace('<br/>', ' ', $value), 'CP932', 'UTF-8').'"';
				$j++;
			}
			echo "\n";
		}
		// MOD-E 2012.01.31 ダウンロード項目、コード値変換対応
		return null;
	}

	/**
	* ソート設定・取得。
	*
	* @return int ソート番号
	*/
	function _setSort() {
		$search_cond = $this->session->get('search_cond');
		if (null != $this->af->get('sort') && '' != $this->af->get('sort') && 0 != $this->af->get('sort')) {
			$search_cond['sort'] =  $this->af->get('sort');
		}
		if (null == $search_cond['sort'] || '' == $search_cond['sort'] || 0 == $search_cond['sort']) {
			$search_cond['sort'] =  0;
		}
		$this->session->set('search_cond', $search_cond);
		return $search_cond['sort'];
	}


}

?>
