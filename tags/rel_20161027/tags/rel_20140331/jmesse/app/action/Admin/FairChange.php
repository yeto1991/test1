<?php
/**
 *  Admin/FairChange.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_JmFair.php';
require_once 'Jmesse_JmUser.php';
require_once 'Jmesse_JmCodeM.php';
require_once 'FairRegist.php';

/**
 *  admin_fairChange Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairChange extends Jmesse_Form_AdminFairRegist
{
}

/**
 *  admin_fairChange action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairChange extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairChange Action.
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
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'admin_login';
		}

		// 見本市番号は必須
		if (null == $this->af->get('mihon_no') || '' == $this->af->get('mihon_no')) {
			$this->ae->add('error', '見本市番号が入力されていません');
			return 'admin_error';
		}

		// 登録モードも必須
		if (null == $this->af->get('mode') || '' == $this->af->get('mode')) {
			$this->ae->add('error', '登録モードが入力されていません');
			return 'admin_error';
		}

		return null;
	}

	/**
	 *  admin_fairChange action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// JM_FAIRオブジェクトの取得
		$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $this->af->get('mihon_no'));
		if (Ethna::isError($jm_fair)) {
			$this->ae->addObject('error', $jm_fair);
			return 'admin_error';
		}
		if (null == $jm_fair || $this->af->get('mihon_no') != $jm_fair->get('mihon_no')) {
			$this->ae->add('error', '指定された見本市番号は未登録です');
			return 'admin_error';
		}

		// TEXTAREAの改行コード
		$br = "\n";
// 		$br = $this->af->get('br');

		// 見本市番号
		$this->af->set('mihon_no', $jm_fair->get('mihon_no'));

		// Webページの表示／非表示
		$this->af->set('web_display_type', $jm_fair->get('web_display_type'));

		// 承認フラグ
		$this->af->set('confirm_flag', $jm_fair->get('confirm_flag'));
		$this->af->set('negate_comment', $jm_fair->get('negate_comment'));

		// メール送信フラグ
		$this->af->set('mail_send_flag', $jm_fair->get('mail_send_flag'));

		// ユーザ使用言語フラグ
		$this->af->set('use_language_flag', $jm_fair->get('use_language_flag'));
		$use_language_flag = $jm_fair->get('use_language_flag');

		// Eメール
		// JM_USERオブジェクトを取得
		$jm_user =& $this->backend->getObject('JmUser', 'user_id', $jm_fair->get('user_id'));
		if (Ethna::isError($jm_user)) {
			$this->ae->addObject('error', $jm_user);
// 			return 'admin_error';
		}
		if (null == $jm_user || $jm_fair->get('user_id') != $jm_user->get('user_id')) {
			$this->ae->add('error', 'ユーザが未登録です。');
// 			return 'admin_error';
		}
		$this->af->set('email', $jm_user->get('email'));

		// 申請年月日
		$this->af->set('date_of_application_y', substr($jm_fair->get('date_of_application'), 0, 4));
		$this->af->set('date_of_application_m', substr($jm_fair->get('date_of_application'), 5, 2));
		$this->af->set('date_of_application_d', substr($jm_fair->get('date_of_application'), 8, 2));

		// 登録日(承認日)
		$this->af->set('date_of_registration_y', substr($jm_fair->get('date_of_registration'), 0, 4));
		$this->af->set('date_of_registration_m', substr($jm_fair->get('date_of_registration'), 5, 2));
		$this->af->set('date_of_registration_d', substr($jm_fair->get('date_of_registration'), 8, 2));

		// 言語選択情報
		$this->af->set('select_language_info', $jm_fair->get('select_language_info'));

		// 見本市名
		$this->af->set('fair_title_jp', $jm_fair->get('fair_title_jp'));
		$this->af->set('fair_title_en', $jm_fair->get('fair_title_en'));

		// 見本市略称
		$this->af->set('abbrev_title', $jm_fair->get('abbrev_title'));

		// 見本市URL
		$this->af->set('fair_url', $jm_fair->get('fair_url'));

		// キャッチフレーズ
		$this->af->set('profile_jp', str_replace('<br/>', $br, $jm_fair->get('profile_jp')));
		$this->af->set('profile_en', str_replace('<br/>', $br, $jm_fair->get('profile_en')));

		// ＰＲ・紹介文
		$this->af->set('detailed_information_jp', str_replace('<br/>', $br, $jm_fair->get('detailed_information_jp')));
		$this->af->set('detailed_information_en', str_replace('<br/>', $br, $jm_fair->get('detailed_information_en')));

		// 検索キーワード
		$this->af->set('keyword', $jm_fair->get('keyword'));

		// 会期
		$this->af->set('date_from_yyyy', $jm_fair->get('date_from_yyyy'));
		$this->af->set('date_from_mm', $jm_fair->get('date_from_mm'));
		$this->af->set('date_from_dd', $jm_fair->get('date_from_dd'));
		$this->af->set('date_to_yyyy', $jm_fair->get('date_to_yyyy'));
		$this->af->set('date_to_mm', $jm_fair->get('date_to_mm'));
		$this->af->set('date_to_dd', $jm_fair->get('date_to_dd'));

		// 開催頻度
//		if ('0' == $use_language_flag) {
			$this->af->set('frequency_jp', $jm_fair->get('frequency'));
// 		} else {
// 			$this->af->set('frequency_en', $jm_fair->get('frequency'));
// 		}

		// 業種
		$this->af->set('main_industory_1', $jm_fair->get('main_industory_1'));
		$this->af->set('sub_industory_1', $jm_fair->get('sub_industory_1'));
		$this->af->set('main_industory_2', $jm_fair->get('main_industory_2'));
		$this->af->set('sub_industory_2', $jm_fair->get('sub_industory_2'));
		$this->af->set('main_industory_3', $jm_fair->get('main_industory_3'));
		$this->af->set('sub_industory_3', $jm_fair->get('sub_industory_3'));
		$this->af->set('main_industory_4', $jm_fair->get('main_industory_4'));
		$this->af->set('sub_industory_4', $jm_fair->get('sub_industory_4'));
		$this->af->set('main_industory_5', $jm_fair->get('main_industory_5'));
		$this->af->set('sub_industory_5', $jm_fair->get('sub_industory_5'));
		$this->af->set('main_industory_6', $jm_fair->get('main_industory_6'));
		$this->af->set('sub_industory_6', $jm_fair->get('sub_industory_6'));

		// 出品物
		$this->af->set('exhibits_jp', str_replace('<br/>', $br, $jm_fair->get('exhibits_jp')));
		$this->af->set('exhibits_en', str_replace('<br/>', $br, $jm_fair->get('exhibits_en')));

		// 開催地
//		if ('0' == $use_language_flag) {
			$this->af->set('region_jp', $jm_fair->get('region'));
			$this->af->set('country_jp', $jm_fair->get('country'));
			$this->af->set('city_jp', $jm_fair->get('city'));
			$this->af->set('other_city_jp', $jm_fair->get('other_city_jp'));
			if (null != $jm_fair->get('other_city_jp') && '' != $jm_fair->get('other_city_jp')) {
				$this->af->set('othercity_jp', '1');
			}
// 		} else {
// 			$this->af->set('region_en', $jm_fair->get('region'));
// 			$this->af->set('country_en', $jm_fair->get('country'));
// 			$this->af->set('city_en', $jm_fair->get('city'));
			$this->af->set('other_city_en', $jm_fair->get('other_city_en'));
			if (null != $jm_fair->get('other_city_en') && '' != $jm_fair->get('other_city_en')) {
				$this->af->set('othercity_en', '1');
			}
// 		}

		// 会場名
		$this->af->set('venue_jp', $jm_fair->get('venue_jp'));
		$this->af->set('venue_en', $jm_fair->get('venue_en'));

		// 会場URL
		$this->af->set('venue_url', $jm_fair->get('venue_url'));

		// 開催予定規模
		$this->af->set('gross_floor_area', $jm_fair->get('gross_floor_area'));

		// 入場資格
// 		if ('0' == $use_language_flag) {
			$this->af->set('open_to_jp', $jm_fair->get('open_to'));
// 		} else {
// 			$this->af->set('open_to_en', $jm_fair->get('open_to'));
// 		}

		// 入場方法
// 		if ('0' == $use_language_flag) {
			$this->af->set('admission_ticket_1_jp', $jm_fair->get('admission_ticket_1'));
			$this->af->set('admission_ticket_2_jp', $jm_fair->get('admission_ticket_2'));
			$this->af->set('admission_ticket_3_jp', $jm_fair->get('admission_ticket_3'));
			$this->af->set('admission_ticket_4_jp', $jm_fair->get('admission_ticket_4'));
			if (null != $jm_fair->get('other_admission_ticket_jp') && '' != $jm_fair->get('other_admission_ticket_jp')) {
				$this->af->set('admission_ticket_5_jp', '1');
			}
			$this->af->set('other_admission_ticket_jp', $jm_fair->get('other_admission_ticket_jp'));
// 		} else {
// 			$this->af->set('admission_ticket_1_en', $jm_fair->get('admission_ticket_1'));
// 			$this->af->set('admission_ticket_2_en', $jm_fair->get('admission_ticket_2'));
// 			$this->af->set('admission_ticket_3_en', $jm_fair->get('admission_ticket_3'));
// 			$this->af->set('admission_ticket_4_en', $jm_fair->get('admission_ticket_4'));
 			if (null != $jm_fair->get('other_admission_ticket_en') && '' != $jm_fair->get('other_admission_ticket_en')) {
 				$this->af->set('admission_ticket_5_en', '1');
 			}
			$this->af->set('other_admission_ticket_en', $jm_fair->get('other_admission_ticket_en'));
// 		}

		// 過去の実績
		$this->af->set('year_of_the_trade_fair', $jm_fair->get('year_of_the_trade_fair'));
		$this->af->set('total_number_of_visitor', $jm_fair->get('total_number_of_visitor'));
		$this->af->set('number_of_foreign_visitor', $jm_fair->get('number_of_foreign_visitor'));
		$this->af->set('total_number_of_exhibitors', $jm_fair->get('total_number_of_exhibitors'));
		$this->af->set('number_of_foreign_exhibitors', $jm_fair->get('number_of_foreign_exhibitors'));
		$this->af->set('net_square_meters', $jm_fair->get('net_square_meters'));
		$this->af->set('spare_field1', $jm_fair->get('spare_field1'));

		// 主催者・問合せ先
		$this->af->set('organizer_jp', $jm_fair->get('organizer_jp'));
		$this->af->set('organizer_en', $jm_fair->get('organizer_en'));
		$this->af->set('organizer_addr', $jm_fair->get('organizer_addr'));
		$this->af->set('organizer_div', $jm_fair->get('organizer_div'));
		$this->af->set('organizer_pers', $jm_fair->get('organizer_pers'));
		$this->af->set('organizer_tel', $jm_fair->get('organizer_tel'));
		$this->af->set('organizer_fax', $jm_fair->get('organizer_fax'));
		$this->af->set('organizer_email', $jm_fair->get('organizer_email'));

		// 日本国内の連絡先
		$this->af->set('agency_in_japan_jp', $jm_fair->get('agency_in_japan_jp'));
		$this->af->set('agency_in_japan_en', $jm_fair->get('agency_in_japan_en'));
		$this->af->set('agency_in_japan_tel', $jm_fair->get('agency_in_japan_tel'));
		$this->af->set('agency_in_japan_fax', $jm_fair->get('agency_in_japan_fax'));
		$this->af->set('agency_in_japan_email', $jm_fair->get('agency_in_japan_email'));
		$this->af->set('agency_in_japan_addr', $jm_fair->get('agency_in_japan_addr'));
		$this->af->set('agency_in_japan_div', $jm_fair->get('agency_in_japan_div'));
		$this->af->set('agency_in_japan_pers', $jm_fair->get('agency_in_japan_pers'));

		// 見本市レポート／URL
		$this->af->set('report_link', $jm_fair->get('report_link'));

		// 世界の展示会場／URL
// 		$this->af->set('venue_link', $jm_fair->get('venue_link'));

		// 展示会に係わる画像(3点)
		$photo_list = array();
		$i = 0;
		if (null != $jm_fair->get('photos_1') && '' != $jm_fair->get('photos_1')) {
			$photo_list[$i++] = $jm_fair->get('photos_1');
		}
		if (null != $jm_fair->get('photos_2') && '' != $jm_fair->get('photos_2')) {
			$photo_list[$i++] = $jm_fair->get('photos_2');
		}
		if (null != $jm_fair->get('photos_3') && '' != $jm_fair->get('photos_3')) {
			$photo_list[$i++] = $jm_fair->get('photos_3');
		}
		$this->af->setApp('photos', $photo_list);

		// システム管理者備考欄
		$this->af->set('note_for_system_manager', $jm_fair->get('note_for_system_manager'));

		// データ管理者備考欄
		$this->af->set('note_for_data_manager', $jm_fair->get('note_for_data_manager'));

		// 削除
		$this->af->set('del_flg', $jm_fair->get('del_flg'));
		// MOD-S 2012.02.03 登録カテゴリ追加対応
		$this->af->set('regist_category', $jm_fair->get('regist_category'));
		// MOD-E 2012.02.03 登録カテゴリ追加対応
		// MOD-S 2013.01.16 JECC認証対応
		$this->af->set('jecc_flag', $jm_fair->get('jecc_flag'));
		// JECC認証年月日
		if('1' == $jm_fair->get('jecc_flag')){
			$this->af->set('jecc_date_y', substr($jm_fair->get('jecc_date'), 0, 4));
			$this->af->set('jecc_date_m', substr($jm_fair->get('jecc_date'), 5, 2));
			$this->af->set('jecc_date_d', substr($jm_fair->get('jecc_date'), 8, 2));
		}else{
			$this->af->set('jecc_date_y', null);
			$this->af->set('jecc_date_m', null);
			$this->af->set('jecc_date_d', null);
		}
		// MOD-E 2013.01.16 JECC認証対応
		// MOD-S 2013.01.22 JETRO出展支援対応
		$this->af->set('jetro_suport_url', $jm_fair->get('jetro_suport_url'));
		$this->af->set('exhibit_support_flag', $jm_fair->get('exhibit_support_flag'));
		// MOD-E 2013.01.22 JETRO出展支援対応

		// 表示項目なし
// 		$this->af->set('venue_url', $jm_fair->get('venue_url'));
// 		$this->af->set('jetro_suport', $jm_fair->get('jetro_suport'));
// 		$this->af->set('regist_type', $jm_fair->get('regist_type'));
// 		$this->af->set('del_date', $jm_fair->get('del_date'));
// 		$this->af->set('regist_user_id', $jm_fair->get('regist_user_id'));
// 		$this->af->set('regist_date', $jm_fair->get('regist_date'));
// 		$this->af->set('update_user_id', $jm_fair->get('update_user_id'));
// 		$this->af->set('update_date', $jm_fair->get('update_date'));

		// 業種（表示用）
		// JM_CODE_Mマネージャを取得
		$jm_code_m_mgr = $this->backend->getManager('jmCodeM');
		$main_list = $jm_code_m_mgr->getMainIndustoryList();

		$this->af->set('main_industory_name_1', $this->_getMainIndustory($main_list, $jm_fair->get('main_industory_1'), '0'));
		$sub_list = $jm_code_m_mgr->getSubIndustoryList($jm_fair->get('main_industory_1'));
		$this->af->set('sub_industory_name_1', $this->_getSubIndustory($sub_list, $jm_fair->get('sub_industory_1'), '0'));

		if (null != $jm_fair->get('main_industory_2') && '' != $jm_fair->get('main_industory_2')) {
			$this->af->set('main_industory_name_2', $this->_getMainIndustory($main_list, $jm_fair->get('main_industory_2'), '0'));
			$sub_list = $jm_code_m_mgr->getSubIndustoryList($jm_fair->get('main_industory_2'));
			$this->af->set('sub_industory_name_2', $this->_getSubIndustory($sub_list, $jm_fair->get('sub_industory_2'), '0'));
		}

		if (null != $jm_fair->get('main_industory_3') && '' != $jm_fair->get('main_industory_3')) {
			$this->af->set('main_industory_name_3', $this->_getMainIndustory($main_list, $jm_fair->get('main_industory_3'), '0'));
			$sub_list = $jm_code_m_mgr->getSubIndustoryList($jm_fair->get('main_industory_3'));
			$this->af->set('sub_industory_name_3', $this->_getSubIndustory($sub_list, $jm_fair->get('sub_industory_3'), '0'));
		}

		if (null != $jm_fair->get('main_industory_4') && '' != $jm_fair->get('main_industory_4')) {
			$this->af->set('main_industory_name_4', $this->_getMainIndustory($main_list, $jm_fair->get('main_industory_4'), '0'));
			$sub_list = $jm_code_m_mgr->getSubIndustoryList($jm_fair->get('main_industory_4'));
			$this->af->set('sub_industory_name_4', $this->_getSubIndustory($sub_list, $jm_fair->get('sub_industory_4'), '0'));
		}

		if (null != $jm_fair->get('main_industory_5') && '' != $jm_fair->get('main_industory_5')) {
			$this->af->set('main_industory_name_5', $this->_getMainIndustory($main_list, $jm_fair->get('main_industory_5'), '0'));
			$sub_list = $jm_code_m_mgr->getSubIndustoryList($jm_fair->get('main_industory_5'));
			$this->af->set('sub_industory_name_5', $this->_getSubIndustory($sub_list, $jm_fair->get('sub_industory_5'), '0'));
		}

		if (null != $jm_fair->get('main_industory_6') && '' != $jm_fair->get('main_industory_6')) {
			$this->af->set('main_industory_name_6', $this->_getMainIndustory($main_list, $jm_fair->get('main_industory_6'), '0'));
			$sub_list = $jm_code_m_mgr->getSubIndustoryList($jm_fair->get('main_industory_6'));
			$this->af->set('sub_industory_name_6', $this->_getSubIndustory($sub_list, $jm_fair->get('sub_industory_6'), '0'));
		}

		// 都市名
		$city_name = $jm_code_m_mgr->getCityName($jm_fair->get('region'),$jm_fair->get('country'),$jm_fair->get('city'));
		// MOD-S 2012.01.20
		if (DB::isError($city_name)) {
			$this->ae->addObject('error', $city_name);
// 			return 'admin_error';
		}
		if (null == $city_name) {
			$this->af->set('city_name_jp', '');
		} else {
			$this->af->set('city_name_jp', $city_name['discription_jp']);
		}
// 			$this->ae->add('error', '都市名が取得できません。');
// 			return 'admin_error';
// 		}
// 		if ('0' == $use_language_flag) {
// 			$this->af->set('city_name_jp', $city_name['discription_jp']);
// 		} else {
//			$this->af->set('city_name_en', $city_name['discription_en']);
// 		}
		// MOD-E 2012.01.20

		// 成功？
		$this->af->setApp('success', $this->af->get('success'));

		// ログに登録
		$mgr = $this->backend->getManager('adminCommon');
		$ret = $mgr->regLog($this->session->get('user_id'), '1', '2', $jm_fair->get('mihon_no'));
		if (Ethna::isError($ret)) {
			$this->ae->addObject('error', $ret);
// 			return 'admin_error';
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
// 			return 'admin_error';
		}

		return 'admin_fairRegist';
	}

	/**
	 *
	 * Enter description here ...
	 * @param unknown_type $main_industory_list
	 * @param unknown_type $kbn_2
	 * @param unknown_type $use_language_flag
	 */
	function _getMainIndustory($main_industory_list, $kbn_2, $use_language_flag) {
		$ret = '';
		for ($i = 0; $i < count($main_industory_list); $i++) {
			if ($kbn_2 == $main_industory_list[$i]['kbn_2']) {
				if ('0' == $use_language_flag) {
					$ret = $main_industory_list[$i]['discription_jp'];
				} else {
					$ret = $main_industory_list[$i]['discription_en'];
				}
			}
		}
		return $ret;
	}

	/**
	 *
	 * Enter description here ...
	 * @param unknown_type $sub_industory_list
	 * @param unknown_type $kbn_3
	 * @param unknown_type $use_language_flag
	 * @return string
	 */
	function _getSubIndustory($sub_industory_list, $kbn_3, $use_language_flag) {
		$ret = '';
		for ($i = 0; $i < count($sub_industory_list); $i++) {
			if ($kbn_3 == $sub_industory_list[$i]['kbn_3']) {
				if ('0' == $use_language_flag) {
					$ret = $sub_industory_list[$i]['discription_jp'];
				} else {
					$ret = $sub_industory_list[$i]['discription_en'];
				}
			}
		}
		return $ret;
	}

// 	/**
// 	 * INT型の項目が0の場合''空文字を返す。
// 	 *
// 	 * @param int $param 対象パラメータ
// 	 * @return string 対象パラメータが0の場合は''、0以外の場合は対象パラメータ
// 	 */
// 	function _isZero($param) {
// 		$ret = $param;
// 		if ("0" == $param) {
// 			$ret = '';
// 		}
// 		return $ret;
// 	}

}

?>
