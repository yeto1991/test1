<?php
/**
 *  Admin/FairCheckList.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairSearch.php';

/**
 *  admin_fairCheckList Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairCheckList extends Jmesse_Form_AdminFairSearch
{
}

/**
 *  admin_fairCheckList action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairCheckList extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairCheckList Action.
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

		// 会期
		if(!($this->af->get('kaiki_mitei' == '1'))){
			//会期未定以外の場合
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

// 		// 検索画面からの遷移かどうか（type=a）
// 		if('a' != $this->af->get('type')){
// 			$this->ae->add('error', '遷移元が検索画面ではない。遷移元画面不正');
// 			return 'admin_fairSearch';
// 		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'admin_fairSearch';
		}

		return null;
	}

	/**
	* ソート方向
	*
	*  0:asc
	*  1:desc
	*/
	var $sort_cond = array('昇順', '降順');

	/**
	 * ソート項目
	 *
	 * 0:見本市番号
	 * 1:見本市名
	 * 2:見本市略称
	 * 3:会期
	 * 4:開催地
	 * 5:Eメール
	 * 6:申請年月日
	 * 7:登録日(承認日)
	 * 8:否認コメント
	 */
	var $sort_column = array(
			'見本市番号',
			'見本市名',
			'見本市略称',
			'会期',
			"開催地",
			'Eメール',
			'申請年月日',
			'登録日(承認日)',
			'否認コメント'
	);

	/**
	 *  admin_fairCheckList action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ソートの変更
		if ('1' == $this->af->get('sort')) {
			// ソートの変更
			$sort_cond = array();
			$sort_cond['sort_1'] = $this->af->get('sort_1');
			$sort_cond['sort_2'] = $this->af->get('sort_2');
			$sort_cond['sort_3'] = $this->af->get('sort_3');
			$sort_cond['sort_4'] = $this->af->get('sort_4');
			$sort_cond['sort_5'] = $this->af->get('sort_5');
			$sort_cond['sort_cond_1'] = $this->af->get('sort_cond_1');
			$sort_cond['sort_cond_2'] = $this->af->get('sort_cond_2');
			$sort_cond['sort_cond_3'] = $this->af->get('sort_cond_3');
			$sort_cond['sort_cond_4'] = $this->af->get('sort_cond_4');
			$sort_cond['sort_cond_5'] = $this->af->get('sort_cond_5');
			$this->session->set('sort_cond', $sort_cond);
		}

		//検索画面からの遷移(type=a)
		if ('a' == $this->af->get('type')) {
			if (null == $this->session->get('search_cond')) {
				// 検索条件をセッションに保存
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
				$search_cond['kaiki_mitei'] = $this->af->get('kaiki_mitei');
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
// 				$search_cond['venue_link'] = $this->af->get('venue_link');
// 				$search_cond['venue_link_cond'] = $this->af->get('venue_link_cond');
//				$search_cond['photos'] = $this->af->get('photos');
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
				$this->session->set('search_cond', $search_cond);
			}

		} else {
			$this->ae->add('error', 'typeの指定が不正です。');
			return 'admin_error';
		}

		// マネージャの取得
		$jm_fair_mgr =& $this->backend->getManager('JmFair');

		// 総件数の取得
		$jm_fair_cnt = $jm_fair_mgr->getFairCheckListSearchCnt();
		$this->backend->getLogger()->log(LOG_DEBUG, 'TOTAL : '.$jm_fair_cnt);
		if (0 < $jm_fair_cnt) {
			//1件以上の場合
			$sort_cond = $this->session->get('sort_cond');
			$ary_sort = array($sort_cond['sort_1'], $sort_cond['sort_2'], $sort_cond['sort_3'], $sort_cond['sort_4'], $sort_cond['sort_5']);
			$ary_sort_cond = array($sort_cond['sort_cond_1'], $sort_cond['sort_cond_2'], $sort_cond['sort_cond_3'], $sort_cond['sort_cond_4'], $sort_cond['sort_cond_5']);

			// 見本市リストの取得
			$jm_fair_check_list = $jm_fair_mgr->getFairCheckListSearch($ary_sort, $ary_sort_cond);

			// 見本市リスト
			$this->af->setApp('jm_fair_check_list', $jm_fair_check_list);
			// 全件数
			$this->af->setApp('total', $jm_fair_cnt);
			// 検索タイプ
			$this->af->setApp('type', $this->af->get('type'));
			// 現在のソート順
			if ('' == $sort_cond['sort_1']) {
				$this->af->setApp('sort_1', '見本市名(日)');
			} else {
				$this->af->setApp('sort_1', $this->sort_column[$sort_cond['sort_1']]);
			}
			if ('' == $sort_cond['sort_cond_1']) {
				$this->af->setApp('sort_cond_1', '昇順');
			} else {
				$this->af->setApp('sort_cond_1', $this->sort_cond[$sort_cond['sort_cond_1']]);
			}

			if ('' == $sort_cond['sort_2']) {
				$this->af->setApp('sort_2', '');
			} else {
				$this->af->setApp('sort_2', $this->sort_column[$sort_cond['sort_2']]);
			}
			if ('' == $sort_cond['sort_cond_2']) {
				$this->af->setApp('sort_cond_2', '');
			} else {
				$this->af->setApp('sort_cond_2', $this->sort_cond[$sort_cond['sort_cond_2']]);
			}

			if ('' == $sort_cond['sort_3']) {
				$this->af->setApp('sort_3', '');
			} else {
				$this->af->setApp('sort_3', $this->sort_column[$sort_cond['sort_3']]);
			}
			if ('' == $sort_cond['sort_cond_3']) {
				$this->af->setApp('sort_cond_3', '');
			} else {
				$this->af->setApp('sort_cond_3', $this->sort_cond[$sort_cond['sort_cond_3']]);
			}

			if ('' == $sort_cond['sort_4']) {
				$this->af->setApp('sort_4', '');
			} else {
				$this->af->setApp('sort_4', $this->sort_column[$sort_cond['sort_4']]);
			}
			if ('' == $sort_cond['sort_cond_4']) {
				$this->af->setApp('sort_cond_4', '');
			} else {
				$this->af->setApp('sort_cond_4', $this->sort_cond[$sort_cond['sort_cond_4']]);
			}

			if ('' == $sort_cond['sort_5']) {
				$this->af->setApp('sort_5', '');
			} else {
				$this->af->setApp('sort_5', $this->sort_column[$sort_cond['sort_5']]);
			}
			if ('' == $sort_cond['sort_cond_5']) {
				$this->af->setApp('sort_cond_5', '');
			} else {
				$this->af->setApp('sort_cond_5', $this->sort_cond[$sort_cond['sort_cond_5']]);
			}
		} else {
			// 見本市リスト
			$this->af->setApp('jm_fair_list', null);
			// 全件数
			$this->af->setApp('total', 0);
			// 検索タイプ
			$this->af->setApp('type', $this->af->get('type'));
		}

		//表示モード指定(遷移先画面制御に利用)
		$this->af->setApp('display_mode', 'fairchecklist');

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

 		return 'admin_fairCheckList';
	}

	function _getDuplicationColumn($column) {
		$ret = '';
		if ('' == $this->duplication_column[$column]) {
			$ret = $column;
		} else {
			$ret = $this->duplication_column[$column];
		}
		return $ret;
	}

	var $duplication_column = array(
		'del_date' => 'jf.del_date',
		'del_flg' => 'jf.del_flg',
		'regist_date' => 'jf.regist_date',
		'regist_user_id' => 'jf.regist_user_id',
		'update_date' => 'jf.update_date',
		'update_user_id' => 'jf.update_user_id',
		'user_id' => 'jf.user_id'
	);

	var $int_column = array(
	);
}

?>
