<?php
/**
 *  Admin/FairCsvDownload.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_JmFair.php';

/**
 *  admin_fairCsvDownload Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairCsvDownload extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	);
}

/**
 *  admin_fairCsvDownload action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairCsvDownload extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairCsvDownload Action.
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
			$this->af->set('function', '');
			return 'admin_login';
		}
		return null;
	}

	/**
	 *  admin_fairCsvDownload action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ソート順
		$sort_cond = $this->session->get('sort_cond');
		$ary_sort = array($sort_cond['sort_1'], $sort_cond['sort_2'], $sort_cond['sort_3'], $sort_cond['sort_4'], $sort_cond['sort_5']);
		$ary_sort_cond = array($sort_cond['sort_cond_1'], $sort_cond['sort_cond_2'], $sort_cond['sort_cond_3'], $sort_cond['sort_cond_4'], $sort_cond['sort_cond_5']);

		// 検索
		$jm_fair_mgr =& $this->backend->getManager('JmFair');
		$jm_fair_list = $jm_fair_mgr->getFairListDownload($ary_sort, $ary_sort_cond);

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		// ファイル名
		$file = 'list.csv';

		// header出力
		header ("Content-Disposition: attachment; filename=$file");
		header ("Content-type: application/x-csv");

		// MOD-S 2012.01.31 ダウンロード項目、コード値変換対応
		$csvtitle = '"ユーザID","申請年月日","登録日（承認日）","見本市名（日）","見本市名（英）","見本市略称","見本市URL","見本市番号","キャッチフレーズ（日）","キャッチフレーズ（英）","PR・紹介文(日)","PR・紹介文(英)","会期開始年","会期開始月","会期開始日","会期終了年","会期終了月","会期終了日","開催頻度","業種大分類(1)","業種小分類(1)","業種大分類(2)","業種小分類(2)","業種大分類(3)","業種小分類(3)","業種大分類(4)","業種小分類(4)","業種大分類(5)","業種小分類(5)","業種大分類(6)","業種小分類(6)","出品物(日)","出品物(英)","開催地地域","開催地国地域","開催地都市","開催地その他（日）","開催地その他（英）","会場名(日)","会場名(英)","会場URL","展示会で使用する面積（Net）","交通手段(日)","交通手段(英)","入場資格","チケットの入手方法(1)","チケットの入手方法(2)","チケットの入手方法(3)","チケットの入手方法(4)","チケット入手方法集計対象","その他のチケットの入手方法(日)","その他のチケットの入手方法(英)","過去の実績年","過去の実績来場者数","過去の実績海外来場者数","過去の実績出展社数","過去の実績海外出展社数","過去の実績展示面積(㎡)","過去の実績認証機関","出展申込締切日(年)","出展申込締切日(月)","出展申込締切日(日)","主催者・問合せ先名称（日）","主催者・問合せ先名称（英）","主催者・問合せ先TEL","主催者・問合せ先FAX","主催者・問合せ先E-Mail","主催者・問合せ先住所","主催者・問合せ先担当部課","主催者・問合せ先担当者","日本国内の照会先名称（日）","日本国内の照会先名称（英）","日本国内の照会先TEL","日本国内の照会先FAX","日本国内の照会先E-Mail","日本国内の照会先住所","日本国内の照会先担当部課","日本国内の照会先先担当者","展示会に係わる画像（1）","展示会に係わる画像（2）","展示会に係わる画像（3）","言語選択情報","見本市レポート/URL","検索キーワード","JETRO出展支援","JETRO出展支援URL","ユーザ使用言語フラグ","Webページの表示/非表示","登録種別","登録カテゴリ","システム管理者備考欄","データ管理者備考欄","承認フラグ","否認コメント","メール送信フラグ","削除フラグ","削除日時","JECC認証フラグ","JECC認証年月日","JETRO出展支援フラグ","登録者ID","登録日","更新者ID","更新日"';
		echo mb_convert_encoding($csvtitle, 'CP932', 'UTF-8');
		echo "\n";
		// MOD-E 2012.01.31 ダウンロード項目、コード値変換対応

		for ($i = 0; $i < count($jm_fair_list); $i++) {
			$row = $jm_fair_list[$i];
			$j = 0;
			foreach ($row as $key => $value) {
				if (0 < $j) {
					echo ',';
				}
				echo '"'.mb_convert_encoding($value, 'CP932', 'UTF-8').'"';
				$j++;
			}
			echo "\n";
		}

		return null;
	}
}

?>
