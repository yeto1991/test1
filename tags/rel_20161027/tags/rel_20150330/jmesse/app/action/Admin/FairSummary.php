<?php
/**
 *  Admin/FairSummary.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairSearch.php';

/**
 *  admin_fairSummary Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairSummary extends Jmesse_Form_AdminFairSearch
{
}

/**
 *  admin_fairSummary action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairSummary extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairSummary Action.
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
			$this->af->set('function', $this->config->get('url').'?action_admin_fairSearch=true');
			return 'admin_login';
		}

		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'admin_fairSearch';
		}

		// 日付の整合性
		// 申請年月日
		if ((null != $this->af->get('date_of_application_y_from') && '' != $this->af->get('date_of_application_y_from'))
			|| (null != $this->af->get('date_of_application_m_from') && '' != $this->af->get('date_of_application_m_from'))
			|| (null != $this->af->get('date_of_application_d_from') && '' != $this->af->get('date_of_application_d_from'))) {
			if (!checkdate($this->af->get('date_of_application_m_from'), $this->af->get('date_of_application_d_from'), $this->af->get('date_of_application_y_from'))) {
				$this->ae->add('error', '申請年月日が正しくありません（開始）');
			}
		}
		if ((null != $this->af->get('date_of_application_y_to') && '' != $this->af->get('date_of_application_y_to')
			|| (null != $this->af->get('date_of_application_m_to') && '' != $this->af->get('date_of_application_m_to'))
			|| (null != $this->af->get('date_of_application_d_to') && '' != $this->af->get('date_of_application_d_to')))) {
			if (!checkdate($this->af->get('date_of_application_m_to'), $this->af->get('date_of_application_d_to'), $this->af->get('date_of_application_y_to'))) {
				$this->ae->add('error', '申請年月日が正しくありません（終了）');
			}
		}
		if (((null != $this->af->get('date_of_application_y_from') && '' != $this->af->get('date_of_application_y_from'))
			|| (null != $this->af->get('date_of_application_m_from') && '' != $this->af->get('date_of_application_m_from'))
			|| (null != $this->af->get('date_of_application_d_from') && '' != $this->af->get('date_of_application_d_from')))
			&& ((null != $this->af->get('date_of_application_y_to') && '' != $this->af->get('date_of_application_y_to'))
			|| (null != $this->af->get('date_of_application_m_to') && '' != $this->af->get('date_of_application_m_to'))
			|| (null != $this->af->get('date_of_application_d_to') && '' != $this->af->get('date_of_application_d_to')))) {
			if (mktime(0, 0, 0, $this->af->get('date_of_application_m_from'), $this->af->get('date_of_application_d_from'), $this->af->get('date_of_application_y_from'))
				> mktime(0, 0, 0, $this->af->get('date_of_application_m_to'), $this->af->get('date_of_application_d_to'), $this->af->get('date_of_application_y_to'))) {
				$this->ae->add('error', '申請年月日が正しくありません（開始 > 終了）');
			}
		}
		// 登録日(承認日)
		if ((null != $this->af->get('date_of_registration_y_from') && '' != $this->af->get('date_of_registration_y_from'))
			|| (null != $this->af->get('date_of_registration_m_from') && '' != $this->af->get('date_of_registration_m_from'))
			|| (null != $this->af->get('date_of_registration_d_from') && '' != $this->af->get('date_of_registration_d_from'))) {
			if (!checkdate($this->af->get('date_of_registration_m_from'), $this->af->get('date_of_registration_d_from'), $this->af->get('date_of_registration_y_from'))) {
				$this->ae->add('error', '登録日(承認日)が正しくありません');
			}
		}
		if ((null != $this->af->get('date_of_registration_y_to') && '' != $this->af->get('date_of_registration_y_to'))
			|| (null != $this->af->get('date_of_registration_m_to') && '' != $this->af->get('date_of_registration_m_to'))
			|| (null != $this->af->get('date_of_registration_d_to') && '' != $this->af->get('date_of_registration_d_to'))) {
			if (!checkdate($this->af->get('date_of_registration_m_to'), $this->af->get('date_of_registration_d_to'), $this->af->get('date_of_registration_y_to'))) {
				$this->ae->add('error', '登録日(承認日)が正しくありません');
			}
		}
		if (((null != $this->af->get('date_of_registration_y_from') && '' != $this->af->get('date_of_registration_y_from'))
			|| (null != $this->af->get('date_of_registration_m_from') && '' != $this->af->get('date_of_registration_m_from'))
			|| (null != $this->af->get('date_of_registration_d_from') && '' != $this->af->get('date_of_registration_d_from')))
			&& ((null != $this->af->get('date_of_registration_y_to') && '' != $this->af->get('date_of_registration_y_to'))
			|| (null != $this->af->get('date_of_registration_m_to') && '' != $this->af->get('date_of_registration_m_to'))
			|| (null != $this->af->get('date_of_registration_d_to') && '' != $this->af->get('date_of_registration_d_to')))) {
			if (mktime(0, 0, 0, $this->af->get('date_of_registration_m_from'), $this->af->get('date_of_registration_d_from'), $this->af->get('date_of_registration_y_from'))
				> mktime(0, 0, 0, $this->af->get('date_of_registration_m_to'), $this->af->get('date_of_registration_d_to'), $this->af->get('date_of_registration_y_to'))) {
				$this->ae->add('error', '登録日(承認日)が正しくありません（開始 > 終了）');
			}
		}
		// 会期
		if ((null != $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_yyyy'))
			|| (null != $this->af->get('date_from_mm') && '' != $this->af->get('date_from_mm'))
			|| (null != $this->af->get('date_from_dd') && '' != $this->af->get('date_from_dd'))) {
			if (!checkdate($this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))) {
				$this->ae->add('error', '会期（開始）が正しくありません');
			}
		}
		if ((null != $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_yyyy'))
			|| (null != $this->af->get('date_to_mm') && '' != $this->af->get('date_to_mm'))
			|| (null != $this->af->get('date_to_dd') && '' != $this->af->get('date_to_dd'))) {
			if (!checkdate($this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('error', '会期（終了）が正しくありません');
			}
		}
		if (((null != $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_yyyy'))
			|| (null != $this->af->get('date_from_mm') && '' != $this->af->get('date_from_mm'))
			|| (null != $this->af->get('date_from_dd') && '' != $this->af->get('date_from_dd')))
			&& ((null != $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_yyyy'))
			|| (null != $this->af->get('date_to_mm') && '' != $this->af->get('date_to_mm'))
			|| (null != $this->af->get('date_to_dd') && '' != $this->af->get('date_to_dd')))) {
			if (mktime(0, 0, 0, $this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))
				> mktime(0, 0, 0, $this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('error', '会期が正しくありません（開始 > 終了）');
			}
		}
		// JECC認証年月日
		if ((null != $this->af->get('jecc_date_y_from') && '' != $this->af->get('jecc_date_y_from'))
		|| (null != $this->af->get('jecc_date_m_from') && '' != $this->af->get('jecc_date_m_from'))
		|| (null != $this->af->get('jecc_date_d_from') && '' != $this->af->get('jecc_date_d_from'))) {
			if (!checkdate($this->af->get('jecc_date_m_from'), $this->af->get('jecc_date_d_from'), $this->af->get('jecc_date_y_from'))) {
				$this->ae->add('error', 'JECC認証年月日が正しくありません（開始）');
			}
		}
		if ((null != $this->af->get('jecc_date_y_to') && '' != $this->af->get('jecc_date_y_to')
		|| (null != $this->af->get('jecc_date_m_to') && '' != $this->af->get('jecc_date_m_to'))
		|| (null != $this->af->get('jecc_date_d_to') && '' != $this->af->get('jecc_date_d_to')))) {
			if (!checkdate($this->af->get('jecc_date_m_to'), $this->af->get('jecc_date_d_to'), $this->af->get('jecc_date_y_to'))) {
				$this->ae->add('error', 'JECC認証年月日が正しくありません（終了）');
			}
		}
		if (((null != $this->af->get('jecc_date_y_from') && '' != $this->af->get('jecc_date_y_from'))
		|| (null != $this->af->get('jecc_date_m_from') && '' != $this->af->get('jecc_date_m_from'))
		|| (null != $this->af->get('jecc_date_d_from') && '' != $this->af->get('jecc_date_d_from')))
		&& ((null != $this->af->get('jecc_date_y_to') && '' != $this->af->get('jecc_date_y_to'))
		|| (null != $this->af->get('jecc_date_m_to') && '' != $this->af->get('jecc_date_m_to'))
		|| (null != $this->af->get('jecc_date_d_to') && '' != $this->af->get('jecc_date_d_to')))) {
			if (mktime(0, 0, 0, $this->af->get('jecc_date_m_from'), $this->af->get('jecc_date_d_from'), $this->af->get('jecc_date_y_from'))
			> mktime(0, 0, 0, $this->af->get('jecc_date_m_to'), $this->af->get('jecc_date_d_to'), $this->af->get('jecc_date_y_to'))) {
				$this->ae->add('error', 'JECC認証年月日が正しくありません（開始 > 終了）');
			}
		}
		// 数値の大小
		// 見本市番号
		if (null != $this->af->get('mihon_no_from') && '' != $this->af->get('mihon_no_from')
			&& null != $this->af->get('mihon_no_to') && '' != $this->af->get('mihon_no_to')) {
			if ($this->af->get('mihon_no_from') > $this->af->get('mihon_no_to')) {
				$this->ae->add('error', '見本市番号が正しくありません（開始 > 終了）');
			}
		}

		// 開催予定規模
		if (null != $this->af->get('gross_floor_area_from') && '' != $this->af->get('gross_floor_area_from')
			&& null != $this->af->get('gross_floor_area_to') && '' != $this->af->get('gross_floor_area_to')) {
			if ($this->af->get('gross_floor_area_from') > $this->af->get('gross_floor_area_to')) {
				$this->ae->add('error', '開催予定規模が正しくありません（開始 > 終了）');
			}
		}

		// 過去の実績(入場者数)
		if (null != $this->af->get('total_number_of_visitor_from') && '' != $this->af->get('total_number_of_visitor_from')
			&& null != $this->af->get('total_number_of_visitor_to') && '' != $this->af->get('total_number_of_visitor_to')) {
			if ($this->af->get('total_number_of_visitor_from') > $this->af->get('total_number_of_visitor_to')) {
				$this->ae->add('error', '過去の実績(入場者数)が正しくありません（開始 > 終了）');
			}
		}

		// 過去の実績(入場者数(うち海外から))
		if (null != $this->af->get('number_of_foreign_visitor_from') && '' != $this->af->get('number_of_foreign_visitor_from')
			&& null != $this->af->get('number_of_foreign_visitor_to') && '' != $this->af->get('number_of_foreign_visitor_to')) {
			if ($this->af->get('number_of_foreign_visitor_from') > $this->af->get('number_of_foreign_visitor_to')) {
				$this->ae->add('error', '過去の実績(入場者数(うち海外から))が正しくありません（開始 > 終了）');
			}
		}

		// 過去の実績(出展社数)
		if (null != $this->af->get('total_number_of_exhibitors_from') && '' != $this->af->get('total_number_of_exhibitors_from')
			&& null != $this->af->get('total_number_of_exhibitors_to') && '' != $this->af->get('total_number_of_exhibitors_to')) {
			if ($this->af->get('total_number_of_exhibitors_from') > $this->af->get('total_number_of_exhibitors_to')) {
				$this->ae->add('error', '過去の実績(出展社数)が正しくありません（開始 > 終了）');
			}
		}

		// 過去の実績(出展社数(うち海外から))
		if (null != $this->af->get('number_of_foreign_exhibitors_from') && '' != $this->af->get('number_of_foreign_exhibitors_from')
			&& null != $this->af->get('number_of_foreign_exhibitors_to') && '' != $this->af->get('number_of_foreign_exhibitors_to')) {
			if ($this->af->get('number_of_foreign_exhibitors_from') > $this->af->get('number_of_foreign_exhibitors_to')) {
				$this->ae->add('error', '過去の実績(出展社数(うち海外から))が正しくありません（開始 > 終了）');
			}
		}

		// 集計期間項目
		if ((null != $this->af->get('summary_value_from_yyyy') && '' != $this->af->get('summary_value_from_yyyy'))
			|| (null != $this->af->get('summary_value_from_mm') && '' != $this->af->get('summary_value_from_mm'))
			|| (null != $this->af->get('summary_value_from_dd') && '' != $this->af->get('summary_value_from_dd'))) {
			if (!checkdate($this->af->get('summary_value_from_mm'), $this->af->get('summary_value_from_dd'), $this->af->get('summary_value_from_yyyy'))) {
				$this->ae->add('error', '集計期間項目（開始）が正しくありません');
			}
		}
		if ((null != $this->af->get('summary_value_to_yyyy') && '' != $this->af->get('summary_value_to_yyyy'))
			|| (null != $this->af->get('summary_value_to_mm') && '' != $this->af->get('summary_value_to_mm'))
			|| (null != $this->af->get('summary_value_to_dd') && '' != $this->af->get('summary_value_to_dd'))) {
			if (!checkdate($this->af->get('summary_value_to_mm'), $this->af->get('summary_value_to_dd'), $this->af->get('summary_value_to_yyyy'))) {
				$this->ae->add('error', '集計期間項目（終了）が正しくありません');
			}
		}
		if (((null != $this->af->get('summary_value_from_yyyy') && '' != $this->af->get('summary_value_from_yyyy'))
			|| (null != $this->af->get('summary_value_from_mm') && '' != $this->af->get('summary_value_from_mm'))
			|| (null != $this->af->get('summary_value_from_dd') && '' != $this->af->get('summary_value_from_dd')))
			&& ((null != $this->af->get('summary_value_to_yyyy') && '' != $this->af->get('summary_value_to_yyyy'))
			|| (null != $this->af->get('summary_value_to_mm') && '' != $this->af->get('summary_value_to_mm'))
			|| (null != $this->af->get('summary_value_to_dd') && '' != $this->af->get('summary_value_to_dd')))) {
			if (mktime(0, 0, 0, $this->af->get('summary_value_from_mm'), $this->af->get('summary_value_from_dd'), $this->af->get('summary_value_from_yyyy'))
			> mktime(0, 0, 0, $this->af->get('summary_value_to_mm'), $this->af->get('summary_value_to_dd'), $this->af->get('summary_value_to_yyyy'))) {
				$this->ae->add('error', '集計期間項目が正しくありません（開始 > 終了）');
			}
		}

		// ページングの場合、チェックスルー
		if (null == $this->session->get('search_cond') || '' == $this->af->get('page')) {
			//集計キー未選択の場合 集計画面に行かせない。
			if((null == $this->af->get('summary_key1') || '' == $this->af->get('summary_key1'))
				&& (null == $this->af->get('summary_key2') || '' == $this->af->get('summary_key2'))
				&& (null == $this->af->get('summary_key3') || '' == $this->af->get('summary_key3'))
				&& (null == $this->af->get('summary_key4') || '' == $this->af->get('summary_key4'))
				&& (null == $this->af->get('summary_key5') || '' == $this->af->get('summary_key5'))
				&& (null == $this->af->get('summary_value') || '' == $this->af->get('summary_value'))){
				$this->ae->add('error', '集計対象項目を設定してください。');
			}

			// 重複チェック
			$ary_summary_key = array($this->af->get('summary_key1'), $this->af->get('summary_key2'), $this->af->get('summary_key3'), $this->af->get('summary_key4'), $this->af->get('summary_key5'));
			$ary_res = array_count_values($ary_summary_key);
			foreach ($ary_summary_key as $summary_key) {
				if ('' != $summary_key) {
					$cnt = $ary_res[$summary_key];
					if (1 < $cnt) {
						$this->ae->add('error', '集計対象項目が重複しています。');
						break;
					}
				}
			}
		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'admin_fairSearch';
		}

		return null;
	}

	/**
	 * ソート方向
	 *
	 * 0:asc
	 * 1:desc
	 */
	var $sort_cond_name = array(
		'昇順',
		'降順'
	);
	var $sort_cond = array(
		'asc',
		'desc'
	);

	/**
	 * ソート項目
	 *
	 * '0' :ユーザID
	 * '1' :Webページの表示／非表示
	 * '2' :承認フラグ
	 * '3' :否認コメント
	 * '4' :メール送信フラグ
	 * '5' :ユーザ使用言語フラグ
	 * '6' :Eメール
	 * '7' :申請年月日
	 * '8' :登録日(承認日)
	 * '9' :言語選択情報
	 * '10':見本市番号
	 * '11':見本市名(日)
	 * '12':見本市名(英)
	 * '13':見本市略称
	 * '14':見本市URL
	 * '15':キャッチフレーズ(日)
	 * '16':キャッチフレーズ(英)
	 * '17':ＰＲ・紹介文(日)
	 * '18':ＰＲ・紹介文(英)
	 * '19':会期開始年
	 * '20':会期開始月
	 * '21':会期開始日
	 * '22':会期終了年
	 * '23':会期終了月
	 * '24':会期終了日
	 * '25':開催頻度
	 * '26':業種大分類
	 * '27':業種小分類
	 * '28':出品物(日)
	 * '29':出品物(英)
	 * '30':開催地地域
	 * '31':開催地国地域
	 * '32':開催地都市
	 * '33':開催地その他(日)
	 * '34':開催地その他(英)
	 * '35':会場名(日)
	 * '36':会場名(英)
	 * '37':開催予定規模
	 * '38':入場資格
	 * '39':入場方法
	 * '40':入場方法その他(日)
	 * '41':入場方法Others(英)
	 * '42':過去の実績年実績
	 * '43':過去の実績来場者数
	 * '44':過去の実績海外来場者数
	 * '45':過去の実績出展社数
	 * '46':過去の実績海外出展社数
	 * '47':過去の実績開催規模
	 * '48':過去の実績認証機関
	 * '49':主催者・問合せ先名称(日)
	 * '50':主催者・問合せ先名称(英)
	 * '51':主催者・問合せ先TEL
	 * '52':主催者・問合せ先FAX
	 * '53':主催者・問合せ先Email
	 * '54':主催者・問合せ先住所
	 * '55':主催者・問合せ先担当部課
	 * '56':主催者・問合せ先担当者
	 * '57':日本国内の連絡先名称(日)
	 * '58':日本国内の連絡先名称(英)
	 * '59':日本国内の連絡先TEL
	 * '60':日本国内の連絡先FAX
	 * '61':日本国内の連絡先Email
	 * '62':日本国内の連絡先住所
	 * '63':日本国内の連絡先担当部課
	 * '64':日本国内の連絡先担当者
	 * '65':見本市レポートURL
	 * '66':展示会に係わる画像名称1
	 * '67':展示会に係わる画像名称2
	 * '68':展示会に係わる画像名称3
	 * '69':システム管理者備考欄
	 * '70':データ管理者備考欄
	 * '71':登録カテゴリ
	 * '72':削除フラグ
	 * '73':JECC認証フラグ
	 * '74':JECC認証年月日
	 * '75':JETRO出展支援URL
	 * '76':JETRO出展支援フラグ
	 * '77':登録者ID
	 * '78':更新者ID
	 * '79':削除日時
	 * '80':登録日
	 * '81':更新日
	 *
	 */
	var $sort_column_name = array(
		'ユーザID',
		'Webページの表示／非表示',
		'承認フラグ',
		'否認コメント',
		'メール送信フラグ',
		'ユーザ使用言語フラグ',
		'Eメール',
		'申請年月日',
		'登録日(承認日)',
		'言語選択情報',
		'見本市番号',
		'見本市名(日)',
		'見本市名(英)',
		'見本市略称',
		'見本市URL',
		'キャッチフレーズ(日)',
		'キャッチフレーズ(英)',
		'ＰＲ・紹介文(日)',
		'ＰＲ・紹介文(英)',
		'会期開始年',
		'会期開始月',
		'会期開始日',
		'会期終了年',
		'会期終了月',
		'会期終了日',
		'開催頻度',
		'業種大分類',
		'業種小分類',
		'出品物(日)',
		'出品物(英)',
		'開催地地域',
		'開催地国地域',
		'開催地都市',
		'開催地その他(日)',
		'開催地その他(英)',
		'会場名(日)',
		'会場名(英)',
		'開催予定規模',
		'入場資格',
		'入場方法',
		'入場方法その他(日)',
		'入場方法Others(英)',
		'過去の実績年実績',
		'過去の実績来場者数',
		'過去の実績海外来場者数',
		'過去の実績出展社数',
		'過去の実績海外出展社数',
		'過去の実績開催規模',
		'過去の実績認証機関',
		'主催者・問合せ先名称(日)',
		'主催者・問合せ先名称(英)',
		'主催者・問合せ先TEL',
		'主催者・問合せ先FAX',
		'主催者・問合せ先Email',
		'主催者・問合せ先住所',
		'主催者・問合せ先担当部課',
		'主催者・問合せ先担当者',
		'日本国内の連絡先名称(日)',
		'日本国内の連絡先名称(英)',
		'日本国内の連絡先TEL',
		'日本国内の連絡先FAX',
		'日本国内の連絡先Email',
		'日本国内の連絡先住所',
		'日本国内の連絡先担当部課',
		'日本国内の連絡先担当者',
		'見本市レポートURL',
		'展示会に係わる画像名称1',
		'展示会に係わる画像名称2',
		'展示会に係わる画像名称3',
		'システム管理者備考欄',
		'データ管理者備考欄',
		'登録カテゴリ',
		'削除フラグ',
		'JECC認証フラグ',
		'JECC認証年月日',
		'JETRO出展支援URL',
		'JETRO出展支援フラグ',
		'登録者ID',
		'更新者ID',
		'削除日時',
		'登録日',
		'更新日'
	);

	var $sort_column = array(
		'jf.user_id',
		'jf.web_display_type',
		'jf.confirm_flag',
		'jf.negate_comment',
		'jf.mail_send_flag',
		'jf.use_language_flag',
		'ju.email',
		'jf.date_of_application',
		'jf.date_of_registration',
		'jf.select_language_info',
		'jf.mihon_no',
		'jf.fair_title_jp',
		'jf.fair_title_en',
		'jf.abbrev_title',
		'jf.fair_url',
		'jf.profile_jp',
		'jf.profile_en',
		'jf.detailed_information_jp',
		'jf.detailed_information_en',
		'jf.date_from_yyyy',
		'jf.date_from_mm',
		'jf.date_from_dd',
		'jf.date_to_yyyy',
		'jf.date_to_mm',
		'jf.date_to_dd',
		'jf.frequency',
		'jf.main_industory_1',
		'concat(jf.main_industory_1, jf.sub_industory_1)',
		'jf.exhibits_jp',
		'jf.exhibits_en',
		'jf.region',
		'concat(jf.region, jf.country)',
		'concat(jf.region, jf.country, jf.city)',
		'jf.other_city_jp',
		'jf.other_city_en',
		'jf.venue_jp',
		'jf.venue_en',
		'jf.gross_floor_area',
		'jf.open_to',
		'jf.sum_ticket',
		'jf.other_admission_ticket_jp',
		'jf.other_admission_ticket_en',
		'jf.year_of_the_trade_fair',
		'jf.total_number_of_visitor',
		'jf.number_of_foreign_visitor',
		'jf.total_number_of_exhibitors',
		'jf.number_of_foreign_exhibitors',
		'jf.net_square_meters',
		'jf.spare_field1',
		'jf.organizer_jp',
		'jf.organizer_en',
		'jf.organizer_tel',
		'jf.organizer_fax',
		'jf.organizer_email',
		'jf.organizer_addr',
		'jf.organizer_div',
		'jf.organizer_pers',
		'jf.agency_in_japan_jp',
		'jf.agency_in_japan_en',
		'jf.agency_in_japan_tel',
		'jf.agency_in_japan_fax',
		'jf.agency_in_japan_email',
		'jf.agency_in_japan_addr',
		'jf.agency_in_japan_div',
		'jf.agency_in_japan_pers',
		'jf.report_link',
		'jf.photos_1',
		'jf.photos_2',
		'jf.photos_3',
		'jf.note_for_system_manager',
		'jf.note_for_data_manager',
		'jf.regist_category',
		'jf.del_flg',
		'jf.jecc_flag',
		'jf.jecc_date',
		'jf.jetro_suport_url',
		'jf.exhibit_support_flag',
		'jf.regist_user_id',
		'jf.update_user_id',
		'jf.del_date',
		'jf.regist_date',
		'jf.update_date'
	);

	/**
	 * jm_code_mに名称が登録してあるコードはSQLで取得。
	 *
	 * @var string => string
	 */
	var $param_name_jp = array(
		'jf.frequency' => 'fq.discription_jp frequency_name',
		'jf.main_industory_1' => 'mi.discription_jp main_industory_name',
		'concat(jf.main_industory_1, jf.sub_industory_1)' => 'si.discription_jp sub_industory_name',
		'jf.region' => 'rg.discription_jp region_name',
		'concat(jf.region, jf.country)' => 'co.discription_jp country_name',
		'concat(jf.region, jf.country, jf.city)' => 'ct.discription_jp city_name',
		'jf.open_to' => 'ot.discription_jp open_to_name',
	);

	/**
	 * jm_code_mに名称が登録してないコードは配列で変換。
	 *
	 * @var string => string
	 */
	var $web_display_type_name = array(
		'0' => '表示しない',
		'1' => '表示する'
	);
	var $confirm_flag_name = array(
		'0' => '承認待ち',
		'1' => '承認',
		'2' => '否認'
	);
	var $mail_send_flag_name = array(
		'0' => '送信する',
		'1' => '送信しない'
	);
	var $use_language_flag_name = array(
		'0' => '日本語',
		'1' => '英語'
	);
	var $select_language_info_name = array(
		'0' => '日本語',
		'1' => '英語',
		'2' => '日本語・英語両方'
	);
	var $sum_ticket_name = array(
		'1' => '登録の必要なし',
		'2' => '公式ウェブサイトからの事前登録',
		'3' => '主催者もしくは日本国内の連絡先への問い合わせ',
		'4' => '当日会場でチケット入手',
		'5' => 'その他'
	);
	var $regist_category_name = array(
		'0' => 'ユーザによる登録（新規/コピー登録）',
		'1' => '運営委託先/管理者による登録',
		'2' => '新規発掘登録',
		'9' => 'その他'
	);
	var $del_flg_name = array(
		'0' => '未削除',
		'1' => '削除済'
	);

	var $jecc_flag_name = array(
		'0' => '未認証',
		'1' => '旧認証',
		'2' => '新認証'
	);

	var $exhibit_support_flag_name = array(
			'0' => '無',
			'1' => '有'
	);

	/**
	 *  admin_fairSummary action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ページングの場合、formの取り込みは行わない
		if (null == $this->session->get('search_cond') || '' == $this->af->get('page')) {
			$this->_setFormToSession();
		}
		$search_cond = $this->session->get('search_cond');

		// select句の作成
		$ary_summary_key = array($search_cond['summary_key1'], $search_cond['summary_key2'], $search_cond['summary_key3'], $search_cond['summary_key4'], $search_cond['summary_key5']);
		$sql_select = $this->_makeSelect($ary_summary_key);

		// group by句の作成
		$sql_gourp_by = $this->_makeGroupBy($ary_summary_key);

		// order by句の作成
		$ary_summary_key_sort_cond = array($search_cond['summary_key1_sort_cond'], $search_cond['summary_key2_sort_cond'], $search_cond['summary_key3_sort_cond'], $search_cond['summary_key4_sort_cond'], $search_cond['summary_key5_sort_cond']);
		$sql_order_by = $this->_makeOrderBy($ary_summary_key, $ary_summary_key_sort_cond);

		// マネージャの取得
		$jm_fair_mgr =& $this->backend->getManager('JmFair');
		// 総件数の取得
		$jm_fair_cnt = $jm_fair_mgr->getFairSummarySearchCnt($sql_select, $sql_gourp_by);

		if (0 < $jm_fair_cnt) {

// 			//集計列の画面項目名設定
// 			$syukei_retu = array();
// 			if($this->af->get('summary_key1') != '' || $this->af->get('summary_key1') != null){
// 				array_push($syukei_retu, $this->sort_column[$this->af->get('summary_key1')]);
// 			}
// 			if($this->af->get('summary_key2') != '' || $this->af->get('summary_key2') != null){
// 				array_push($syukei_retu, $this->sort_column[$this->af->get('summary_key2')]);
// 			}
// 			if($this->af->get('summary_key3') != '' || $this->af->get('summary_key3') != null){
// 				array_push($syukei_retu, $this->sort_column[$this->af->get('summary_key3')]);
// 			}
// 			if($this->af->get('summary_key4') != '' || $this->af->get('summary_key4') != null){
// 				array_push($syukei_retu, $this->sort_column[$this->af->get('summary_key4')]);
// 			}
// 			if($this->af->get('summary_key5') != '' || $this->af->get('summary_key5') != null){
// 				array_push($syukei_retu, $this->sort_column[$this->af->get('summary_key5')]);
// 			}
// 			if($this->af->get('summary_value') != '' || $this->af->get('summary_value') != null){
// 				array_push($syukei_retu, $this->sort_column[$this->af->get('summary_value')]);
// 			}
// 			$this->af->setApp('syukei_retu', $syukei_retu);

			// ページ設定
			$limit = 100;
			$max_page = floor($jm_fair_cnt / $limit);
			if (0 < $jm_fair_cnt % $limit) {
				$max_page += 1;
			}
			if ('' == $this->af->get('page')) {
				$page = 1;
			} elseif ($max_page < $this->af->get('page')) {
				$page = $max_page;
			} else {
				$page = $this->af->get('page');
			}
			$offset = $limit * ($page - 1);

// 			//(Groupbyかつ)OrderBy設定
// 			$sort_cond = $this->session->get('sort_cond');
// 			$ary_sort = array($sort_cond['summary_key1'], $sort_cond['summary_key2'], $sort_cond['summary_key3'], $sort_cond['summary_key4'], $sort_cond['summary_key5'], $sort_cond['summary_value']);
// 			$ary_sort_cond = array($sort_cond['summary_key1_sort_cond'], $sort_cond['summary_key2_sort_cond'], $sort_cond['summary_key3_sort_cond'], $sort_cond['summary_key4_sort_cond'], $sort_cond['summary_key5_sort_cond'], $sort_cond['summary_value_sort_cond']);

			// 見本市リストの取得
			$jm_fair_summary_list = $jm_fair_mgr->getFairSummarySearch($sql_select, $sql_gourp_by, $sql_order_by, $offset, $limit);

			// コードを取得
			$sql_select_code = $this->_makeSelectCode($ary_summary_key);
			if ('' != $sql_select_code) {
				$code_list = $jm_fair_mgr->getFairSummarySearch($sql_select_code, $sql_gourp_by, $sql_order_by, $offset, $limit);

				// コードのリストをセッションに設定
				// 一覧表示の検索条件とする。
				$this->session->set('code_list', $code_list);
			}

			// コードの置き換え
			$disp_list = array();
			foreach ($jm_fair_summary_list as $idx => $row) {
				$i = 0;
				$disp_list[$idx] = array();
				foreach ($row as $key => $value) {
					$disp[$idx] = array();
					if ('web_display_type' == $key) {
						$disp_list[$idx][$i++] = $this->web_display_type_name[$value];
					} elseif ('confirm_flag' == $key) {
						$disp_list[$idx][$i++] = $this->confirm_flag_name[$value];
					} elseif ('mail_send_flag' == $key) {
						$disp_list[$idx][$i++] = $this->mail_send_flag_name[$value];
					} elseif ('use_language_flag' == $key) {
						$disp_list[$idx][$i++] = $this->use_language_flag_name[$value];
					} elseif ('select_language_info' == $key) {
						$disp_list[$idx][$i++] = $this->select_language_info_name[$value];
					} elseif ('sum_ticket' == $key) {
						$disp_list[$idx][$i++] = $this->sum_ticket_name[$value];
					} elseif ('regist_category' == $key) {
						$disp_list[$idx][$i++] = $this->regist_category_name[$value];
					} elseif ('del_flg' == $key) {
						$disp_list[$idx][$i++] = $this->del_flg_name[$value];
					} elseif ('jecc_flag' == $key) {
						$disp_list[$idx][$i++] = $this->jecc_flag_name[$value];
					} elseif ('exhibit_support_flag' == $key) {
						$disp_list[$idx][$i++] = $this->exhibit_support_flag_name[$value];
					} else {
						$disp_list[$idx][$i++] = $value;
					}
				}
// 				echo '<pre>';
// 				var_dump($row);
// 				echo '</pre><br/><br/>';
// 				$jm_fair_summary_list[$idx] = $disp;
			}
// 			echo '<pre>';
// 			print_r($disp_list);
// 			echo '</pre><br/><br/>';

			// カラム名の置き換え
			$disp_column = array();
			$i = 0;
			foreach ($ary_summary_key as $column) {
				if ('' != $column) {
					$disp_column[$i++] = $this->sort_column_name[$column];
				}
			}
			array_push($disp_column, '件数');
// 			echo '<pre>';
// 			print_r($disp_column);
// 			echo '</pre><br/><br/>';

			// カラム名
			$this->af->setApp('jm_fair_summary_column', $disp_column);

			// 「件数」カラムindex
			$this->af->setApp('count_column', count($disp_column) - 1);

			// 集計リスト
			$this->af->setApp('jm_fair_summary_list', $disp_list);

			// 全件数
			$this->af->setApp('total', $jm_fair_cnt);

			// 表示開始
			$this->af->setApp('begin', $offset + 1);

			// 表示件数
			if ($jm_fair_cnt > ($page * $limit)) {
				$this->af->setApp('limit', $limit);
			} else {
				$this->af->setApp('limit', $jm_fair_cnt - (($page - 1) * $limit));
			}

			// ページ
			$this->af->setApp('page', $page);
			$this->af->setApp('page_next', $page + 1);
			$this->af->setApp('page_prev', $page - 1);

			// 検索タイプ
			$this->af->setApp('type', $this->af->get('type'));

			// 最初・最後？
			if (1 == $page) {
				$this->af->setApp('first_page', '1');
			}
			if ($max_page == $page) {
				$this->af->setApp('last_page', '1');
			}
		} else {
			// 見本市リスト
			$this->af->setApp('$jm_fair_summary_list', null);
			// 全件数
			$this->af->setApp('total', 0);
			// 表示開始
			$this->af->setApp('begin', 0);
			// 表示件数
			$this->af->setApp('limit', 0);
			// ページ
			$this->af->setApp('page', 1);
			$this->af->setApp('page_next', $page + 1);
			$this->af->setApp('page_prev', $page - 1);
			// 検索タイプ
			$this->af->setApp('type', $this->af->get('type'));
			// 最初・最後？
			$this->af->setApp('first_page', '1');
			$this->af->setApp('last_page', '1');
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		return 'admin_fairSummary';
	}

	function _setFormToSession() {
		// 検索・集計条件をセッションに保存
		$search_cond = array();
		$search_cond['phrases'] = $this->af->get('phrases');
		$search_cond['phrase_connection'] = $this->af->get('phrase_connection');
		$search_cond['connection'] = $this->af->get('connection');
		$search_cond['relation'] = $this->af->get('relation');
		$search_cond['web_display_type'] = $this->af->get('web_display_type');
		$search_cond['confirm_flag'] = $this->af->get('confirm_flag');
		$search_cond['negate_comment'] = $this->af->get('negate_comment');
		$search_cond['negate_comment_cond'] = $this->af->get('negate_comment_cond');
		$search_cond['mail_send_flag'] = $this->af->get('mail_send_flag');
		$search_cond['use_language_flag'] = $this->af->get('use_language_flag');
		$search_cond['email'] = $this->af->get('email');
		$search_cond['email_cond'] = $this->af->get('email_cond');
		$search_cond['date_of_application_y_from'] = $this->af->get('date_of_application_y_from');
		$search_cond['date_of_application_m_from'] = $this->af->get('date_of_application_m_from');
		$search_cond['date_of_application_d_from'] = $this->af->get('date_of_application_d_from');
		$search_cond['date_of_application_y_to'] = $this->af->get('date_of_application_y_to');
		$search_cond['date_of_application_m_to'] = $this->af->get('date_of_application_m_to');
		$search_cond['date_of_application_d_to'] = $this->af->get('date_of_application_d_to');
		$search_cond['date_of_registration_y_from'] = $this->af->get('date_of_registration_y_from');
		$search_cond['date_of_registration_m_from'] = $this->af->get('date_of_registration_m_from');
		$search_cond['date_of_registration_d_from'] = $this->af->get('date_of_registration_d_from');
		$search_cond['date_of_registration_y_to'] = $this->af->get('date_of_registration_y_to');
		$search_cond['date_of_registration_m_to'] = $this->af->get('date_of_registration_m_to');
		$search_cond['date_of_registration_d_to'] = $this->af->get('date_of_registration_d_to');
		$search_cond['select_language_info'] = $this->af->get('select_language_info');
		$search_cond['mihon_no_from'] = $this->af->get('mihon_no_from');
		$search_cond['mihon_no_to'] = $this->af->get('mihon_no_to');
		$search_cond['mihon_no_cond'] = $this->af->get('mihon_no_cond');
		$search_cond['fair_title_jp'] = $this->af->get('fair_title_jp');
		$search_cond['fair_title_jp_cond'] = $this->af->get('fair_title_jp_cond');
		$search_cond['fair_title_en'] = $this->af->get('fair_title_en');
		$search_cond['fair_title_en_cond'] = $this->af->get('fair_title_en_cond');
		$search_cond['abbrev_title'] = $this->af->get('abbrev_title');
		$search_cond['abbrev_title_cond'] = $this->af->get('abbrev_title_cond');
		$search_cond['fair_url'] = $this->af->get('fair_url');
		$search_cond['fair_url_cond'] = $this->af->get('fair_url_cond');
		$search_cond['profile_jp'] = $this->af->get('profile_jp');
		$search_cond['profile_jp_cond'] = $this->af->get('profile_jp_cond');
		$search_cond['profile_en'] = $this->af->get('profile_en');
		$search_cond['profile_en_cond'] = $this->af->get('profile_en_cond');
		$search_cond['detailed_information_jp'] = $this->af->get('detailed_information_jp');
		$search_cond['detailed_information_jp_cond'] = $this->af->get('detailed_information_jp_cond');
		$search_cond['detailed_information_en'] = $this->af->get('detailed_information_en');
		$search_cond['detailed_information_en_cond'] = $this->af->get('detailed_information_en_cond');
		$search_cond['date_from_yyyy'] = $this->af->get('date_from_yyyy');
		$search_cond['date_from_mm'] = $this->af->get('date_from_mm');
		$search_cond['date_from_dd'] = $this->af->get('date_from_dd');
		$search_cond['date_to_yyyy'] = $this->af->get('date_to_yyyy');
		$search_cond['date_to_mm'] = $this->af->get('date_to_mm');
		$search_cond['date_to_dd'] = $this->af->get('date_to_dd');
		$search_cond['frequency'] = $this->af->get('frequency');
		$search_cond['main_industory'] = $this->af->get('main_industory');
		$search_cond['sub_industory'] = $this->af->get('sub_industory');
		$search_cond['main_industory_name'] = $this->af->get('main_industory_name');
		$search_cond['sub_industory_name'] = $this->af->get('sub_industory_name');
		$search_cond['exhibits_jp'] = $this->af->get('exhibits_jp');
		$search_cond['exhibits_jp_cond'] = $this->af->get('exhibits_jp_cond');
		$search_cond['exhibits_en'] = $this->af->get('exhibits_en');
		$search_cond['exhibits_en_cond'] = $this->af->get('exhibits_en_cond');
		$search_cond['region'] = $this->af->get('region');
		$search_cond['country'] = $this->af->get('country');
		$search_cond['city'] = $this->af->get('city');
		$search_cond['city_name'] = $this->af->get('city_name');
		$search_cond['other_city_jp'] = $this->af->get('other_city_jp');
		$search_cond['other_city_jp_cond'] = $this->af->get('other_city_jp_cond');
		$search_cond['other_city_en'] = $this->af->get('other_city_en');
		$search_cond['other_city_en_cond'] = $this->af->get('other_city_en_cond');
		$search_cond['venue_jp'] = $this->af->get('venue_jp');
		$search_cond['venue_jp_cond'] = $this->af->get('venue_jp_cond');
		$search_cond['venue_en'] = $this->af->get('venue_en');
		$search_cond['venue_en_cond'] = $this->af->get('venue_en_cond');
		$search_cond['gross_floor_area_from'] = $this->af->get('gross_floor_area_from');
		$search_cond['gross_floor_area_to'] = $this->af->get('gross_floor_area_to');
		$search_cond['gross_floor_area_cond'] = $this->af->get('gross_floor_area_cond');
		$search_cond['open_to'] = $this->af->get('open_to');
		$search_cond['admission_ticket_1'] = $this->af->get('admission_ticket_1');
		$search_cond['admission_ticket_2'] = $this->af->get('admission_ticket_2');
		$search_cond['admission_ticket_3'] = $this->af->get('admission_ticket_3');
		$search_cond['admission_ticket_4'] = $this->af->get('admission_ticket_4');
		$search_cond['admission_ticket_5'] = $this->af->get('admission_ticket_5');
		$search_cond['other_admission_ticket_jp'] = $this->af->get('other_admission_ticket_jp');
		$search_cond['other_admission_ticket_jp_cond'] = $this->af->get('other_admission_ticket_jp_cond');
		$search_cond['other_admission_ticket_en'] = $this->af->get('other_admission_ticket_en');
		$search_cond['other_admission_ticket_en_cond'] = $this->af->get('other_admission_ticket_en_cond');
		$search_cond['year_of_the_trade_fair'] = $this->af->get('year_of_the_trade_fair');
		$search_cond['year_of_the_trade_fair_cond'] = $this->af->get('year_of_the_trade_fair_cond');
		$search_cond['total_number_of_visitor_from'] = $this->af->get('total_number_of_visitor_from');
		$search_cond['total_number_of_visitor_to'] = $this->af->get('total_number_of_visitor_to');
		$search_cond['total_number_of_visitor_cond'] = $this->af->get('total_number_of_visitor_cond');
		$search_cond['number_of_foreign_visitor_from'] = $this->af->get('number_of_foreign_visitor_from');
		$search_cond['number_of_foreign_visitor_to'] = $this->af->get('number_of_foreign_visitor_to');
		$search_cond['number_of_foreign_visitor_cond'] = $this->af->get('number_of_foreign_visitor_cond');
		$search_cond['total_number_of_exhibitors_from'] = $this->af->get('total_number_of_exhibitors_from');
		$search_cond['total_number_of_exhibitors_to'] = $this->af->get('total_number_of_exhibitors_to');
		$search_cond['total_number_of_exhibitors_cond'] = $this->af->get('total_number_of_exhibitors_cond');
		$search_cond['number_of_foreign_exhibitors_from'] = $this->af->get('number_of_foreign_exhibitors_from');
		$search_cond['number_of_foreign_exhibitors_to'] = $this->af->get('number_of_foreign_exhibitors_to');
		$search_cond['number_of_foreign_exhibitors_cond'] = $this->af->get('number_of_foreign_exhibitors_cond');
		$search_cond['net_square_meters'] = $this->af->get('net_square_meters');
		$search_cond['net_square_meters_cond'] = $this->af->get('net_square_meters_cond');
		$search_cond['spare_field1'] = $this->af->get('spare_field1');
		$search_cond['spare_field1_cond'] = $this->af->get('spare_field1_cond');
		$search_cond['organizer_jp'] = $this->af->get('organizer_jp');
		$search_cond['organizer_jp_cond'] = $this->af->get('organizer_jp_cond');
		$search_cond['organizer_en'] = $this->af->get('organizer_en');
		$search_cond['organizer_en_cond'] = $this->af->get('organizer_en_cond');
		$search_cond['organizer_tel'] = $this->af->get('organizer_tel');
		$search_cond['organizer_tel_cond'] = $this->af->get('organizer_tel_cond');
		$search_cond['organizer_fax'] = $this->af->get('organizer_fax');
		$search_cond['organizer_fax_cond'] = $this->af->get('organizer_fax_cond');
		$search_cond['organizer_email'] = $this->af->get('organizer_email');
		$search_cond['organizer_email_cond'] = $this->af->get('organizer_email_cond');
		$search_cond['agency_in_japan_jp'] = $this->af->get('agency_in_japan_jp');
		$search_cond['agency_in_japan_jp_cond'] = $this->af->get('agency_in_japan_jp_cond');
		$search_cond['agency_in_japan_en'] = $this->af->get('agency_in_japan_en');
		$search_cond['agency_in_japan_en_cond'] = $this->af->get('agency_in_japan_en_cond');
		$search_cond['agency_in_japan_tel'] = $this->af->get('agency_in_japan_tel');
		$search_cond['agency_in_japan_tel_cond'] = $this->af->get('agency_in_japan_tel_cond');
		$search_cond['agency_in_japan_fax'] = $this->af->get('agency_in_japan_fax');
		$search_cond['agency_in_japan_fax_cond'] = $this->af->get('agency_in_japan_fax_cond');
		$search_cond['agency_in_japan_email'] = $this->af->get('agency_in_japan_email');
		$search_cond['agency_in_japan_email_cond'] = $this->af->get('agency_in_japan_email_cond');
		$search_cond['report_link'] = $this->af->get('report_link');
		$search_cond['report_link_cond'] = $this->af->get('report_link_cond');
// 		$search_cond['venue_link'] = $this->af->get('venue_link');
// 		$search_cond['venue_link_cond'] = $this->af->get('venue_link_cond');
		$search_cond['photos'] = $this->af->get('photos');
		$search_cond['photos_cond'] = $this->af->get('photos_cond');
		$search_cond['note_for_system_manager'] = $this->af->get('note_for_system_manager');
		$search_cond['note_for_system_manager_cond'] = $this->af->get('note_for_system_manager_cond');
		$search_cond['note_for_data_manager'] = $this->af->get('note_for_data_manager');
		$search_cond['note_for_data_manager_cond'] = $this->af->get('note_for_data_manager_cond');
		$search_cond['regist_category'] = $this->af->get('regist_category');
		$search_cond['del_flg'] = $this->af->get('del_flg');
		$search_cond['jecc_flag'] = $this->af->get('jecc_flag');
		$search_cond['jecc_date_y_from'] = $this->af->get('jecc_date_y_from');
		$search_cond['jecc_date_m_from'] = $this->af->get('jecc_date_m_from');
		$search_cond['jecc_date_d_from'] = $this->af->get('jecc_date_d_from');
		$search_cond['jecc_date_y_to'] = $this->af->get('jecc_date_y_to');
		$search_cond['jecc_date_m_to'] = $this->af->get('jecc_date_m_to');
		$search_cond['jecc_date_d_to'] = $this->af->get('jecc_date_d_to');
		$search_cond['jetro_suport_url'] = $this->af->get('jetro_suport_url');
		$search_cond['jetro_suport_url_cond'] = $this->af->get('jetro_suport_url_cond');
		$search_cond['exhibit_support_flag'] = $this->af->get('exhibit_support_flag');
		$search_cond['summary_key1'] = $this->af->get('summary_key1');
		$search_cond['summary_key1_sort_cond'] = $this->af->get('summary_key1_sort_cond');
		$search_cond['summary_key2'] = $this->af->get('summary_key2');
		$search_cond['summary_key2_sort_cond'] = $this->af->get('summary_key2_sort_cond');
		$search_cond['summary_key3'] = $this->af->get('summary_key3');
		$search_cond['summary_key3_sort_cond'] = $this->af->get('summary_key3_sort_cond');
		$search_cond['summary_key4'] = $this->af->get('summary_key4');
		$search_cond['summary_key4_sort_cond'] = $this->af->get('summary_key4_sort_cond');
		$search_cond['summary_key5'] = $this->af->get('summary_key5');
		$search_cond['summary_key5_sort_cond'] = $this->af->get('summary_key5_sort_cond');
		$search_cond['summary_value'] = $this->af->get('summary_value');
		$search_cond['summary_value_from_yyyy'] = $this->af->get('summary_value_from_yyyy');
		$search_cond['summary_value_from_mm'] = $this->af->get('summary_value_from_mm');
		$search_cond['summary_value_from_dd'] = $this->af->get('summary_value_from_dd');
		$search_cond['summary_value_to_yyyy'] = $this->af->get('summary_value_to_yyyy');
		$search_cond['summary_value_to_mm'] = $this->af->get('summary_value_to_mm');
		$search_cond['summary_value_to_dd'] = $this->af->get('summary_value_to_dd');
		$search_cond['summary_value_hani_cond'] = $this->af->get('summary_value_hani_cond');
		$search_cond['summary_value_sort_cond'] = $this->af->get('summary_value_sort_cond');
		$this->session->set('search_cond', $search_cond);
// 		// 集計ソート条件
// 		$sort_cond = array();
// 		$sort_cond['summary_key1'] = $this->af->get('summary_key1');
// 		$sort_cond['summary_key1_sort_cond'] = $this->af->get('summary_key1_sort_cond');
// 		$sort_cond['summary_key2'] = $this->af->get('summary_key2');
// 		$sort_cond['summary_key2_sort_cond'] = $this->af->get('summary_key2_sort_cond');
// 		$sort_cond['summary_key3'] = $this->af->get('summary_key3');
// 		$sort_cond['summary_key3_sort_cond'] = $this->af->get('summary_key3_sort_cond');
// 		$sort_cond['summary_key4'] = $this->af->get('summary_key4');
// 		$sort_cond['summary_key4_sort_cond'] = $this->af->get('summary_key4_sort_cond');
// 		$sort_cond['summary_key5'] = $this->af->get('summary_key5');
// 		$sort_cond['summary_key5_sort_cond'] = $this->af->get('summary_key5_sort_cond');
// 		$sort_cond['summary_value'] = $this->af->get('summary_value');
// 		$sort_cond['summary_value_sort_cond'] = $this->af->get('summary_value_sort_cond');
// 		$this->session->set('sort_cond', $sort_cond);
	}


	function _makeSelect($ary_summary_key) {
		$sql = '';

		foreach ($ary_summary_key as $summary_key) {
			if ('' != $summary_key) {
				if ('' != $sql) {
					$sql .= ', ';
				}
				$this->backend->getLogger()->log(LOG_DEBUG, '■summary_key : '.$summary_key);
				if ('' == $this->param_name_jp[$this->sort_column[$summary_key]]) {
					$sql .= $this->sort_column[$summary_key];
				} else {
					$sql .= $this->param_name_jp[$this->sort_column[$summary_key]];
				}
			}
		}

		if ('' != $sql) {
			$sql .= ', ';
		}
		$sql .= 'count(*) cnt ';

		$this->backend->getLogger()->log(LOG_DEBUG, '■select : '.$sql);

		return $sql;
	}

	function _makeSelectCode($ary_summary_key) {
		$sql = '';

		foreach ($ary_summary_key as $summary_key) {
			if ('' != $summary_key) {
				if ('' != $sql) {
					$sql .= ', ';
				}
				$sql .= $this->sort_column[$summary_key];
			}
		}

		$this->backend->getLogger()->log(LOG_DEBUG, '■select(code) : '.$sql);

		return $sql;
	}

	function _makeGroupBy($ary_summary_key) {
		$sql = '';

		foreach ($ary_summary_key as $summary_key) {
			if ('' != $summary_key) {
				if ('' != $sql) {
					$sql .= ', ';
				}
				$sql .= $this->sort_column[$summary_key];
			}
		}

		$this->backend->getLogger()->log(LOG_DEBUG, '■group by : '.$sql);

		return $sql;
	}

	function _makeOrderBy($ary_summary_key, $ary_summary_key_sort_cond) {
		$sql = '';

		for ($i = 0; $i < count ($ary_summary_key); $i++) {
			if ('' != $ary_summary_key[$i]) {
				if ('' != $sql) {
					$sql .= ', ';
				}
				$sql .=$this->sort_column[$ary_summary_key[$i]].' '.$this->sort_cond[$ary_summary_key_sort_cond[$i]];
			}
		}

		$this->backend->getLogger()->log(LOG_DEBUG, '■order by : '.$sql);

		return $sql;
	}
}

?>
