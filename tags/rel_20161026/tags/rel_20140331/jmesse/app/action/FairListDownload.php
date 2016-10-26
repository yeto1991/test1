<?php
/**
 *  FairListDownload.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairList.php';

/**
 *  fairListDownload Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_FairListDownload extends Jmesse_Form_FairList
{
}

/**
 *  fairListDownload action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_FairListDownload extends Jmesse_ActionClass
{
	/**
	 *  preprocess of fairListDownload Action.
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
	 *  fairListDownload action implementation.
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
		$lang = 'J';
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
			return 'error';
		}

		// MOD-S 2012.01.31 ダウンロード項目、コード値変換対応
		// CSV出力
		// ファイル名
		$file = 'list.csv';

		// header出力
		header ("Content-Disposition: attachment; filename=$file");
		header ("Content-type: application/x-csv");

		$csvtitle = '"申請年月日","登録日（承認日）","見本市名（日）","見本市名（英）","見本市略称","見本市URL","見本市番号","キャッチフレーズ（日）","キャッチフレーズ（英）","PR・紹介文(日)","PR・紹介文(英)","会期開始年","会期開始月","会期開始日","会期終了年","会期終了月","会期終了日","開催頻度","業種大分類(1)","業種小分類(1)","業種大分類(2)","業種小分類(2)","業種大分類(3)","業種小分類(3)","業種大分類(4)","業種小分類(4)","業種大分類(5)","業種小分類(5)","業種大分類(6)","業種小分類(6)","出品物(日)","出品物(英)","開催地地域","開催地国地域","開催地都市","開催地その他（日）","開催地その他（英）","会場名(日)","会場名(英)","会場URL","展示会で使用する面積（Net）","入場資格","入場方法(1)","入場方法(2)","入場方法(3)","入場方法(4)","その他の入場方法(日)","その他の入場方法(英)","過去の実績年","過去の実績来場者数","過去の実績海外来場者数","過去の実績出展社数","過去の実績海外出展社数","過去の実績展示面積(㎡)","過去の実績認証機関","主催者・問合せ先名称（日）","主催者・問合せ先名称（英）","主催者・問合せ先TEL","主催者・問合せ先FAX","主催者・問合せ先E-Mail","主催者・問合せ先住所","主催者・問合せ先担当部課","主催者・問合せ先担当者","日本国内の連絡先名称（日）","日本国内の連絡先名称（英）","日本国内の連絡先TEL","日本国内の連絡先FAX","日本国内の連絡先E-Mail","日本国内の連絡先住所","日本国内の連絡先担当部課","日本国内の連絡先先担当者","展示会に係わる画像（1）","展示会に係わる画像（2）","展示会に係わる画像（3）","検索キーワード","登録日","更新日"';
		echo mb_convert_encoding($csvtitle, 'CP932', 'UTF-8');
		echo "\n";
		foreach ($jm_fair_list as $row) {
			$j = 0;
			foreach ($row as $value) {
				if (0 < $j) {
					echo ',';
				}
				echo '"'.mb_convert_encoding(str_replace('<br/>', '', $value), 'CP932', 'UTF-8').'"';
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
