<?php
/**
 *  Jmesse_JmFairTemp.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmFairTempManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmFairTempManager extends Ethna_AppManager
{
	/**
	* 削除済みユーザデータ削除
	*
	* @param string $user_id 登録するEメール情報を持つ削除済みユーザID
	* @return string 結果
	*/
	function deleteUserInfo($user_id) {
		$db = $this->backend->getDB();
		$sql = "delete from jm_fair_temp where user_id = ?";
		$stmt =& $db->db->prepare($sql);
		$param = array($user_id);
		$res = $db->db->execute($stmt, $param);
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, 'jm_fair_temp削除Errorが発生しました。');
			$this->backend->getActionError()->addObject('error', $res);
			return "NG";
		}
		return null;
	}

	/**
	 * JM_FAIRをJM_FAIR_TEMPにコピーする。
	 *
	 * @param unknown_type $mihon_no
	 * @return NULL|unknown
	 */
	function copyFair($mihon_no) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "insert into jm_fair_temp(user_id, date_of_application, date_of_registration, fair_title_jp, fair_title_en, abbrev_title, fair_url, mihon_no, profile_jp, profile_en, detailed_information_jp, detailed_information_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, frequency, main_industory_1, sub_industory_1, main_industory_2, sub_industory_2, main_industory_3, sub_industory_3, main_industory_4, sub_industory_4, main_industory_5, sub_industory_5, main_industory_6, sub_industory_6, exhibits_jp, exhibits_en, region, country, city, other_city_jp, other_city_en, venue_jp, venue_en, venue_url, gross_floor_area, transportation_jp, transportation_en, open_to, admission_ticket_1, admission_ticket_2, admission_ticket_3, admission_ticket_4, other_admission_ticket_jp, other_admission_ticket_en, year_of_the_trade_fair, total_number_of_visitor, number_of_foreign_visitor, total_number_of_exhibitors, number_of_foreign_exhibitors, net_square_meters, spare_field1, app_dead_yyyy, app_dead_mm, app_dead_dd, organizer_jp, organizer_en, organizer_tel, organizer_fax, organizer_email, organizer_addr, organizer_div, organizer_pers, agency_in_japan_jp, agency_in_japan_en, agency_in_japan_tel, agency_in_japan_fax, agency_in_japan_email, agency_in_japan_addr, agency_in_japan_div, agency_in_japan_pers, photos_1, photos_2, photos_3, select_language_info, report_link, venue_link, keyword, jetro_suport, jetro_suport_url, use_language_flag, web_display_type, regist_type, regist_category, note_for_system_manager, note_for_data_manager, confirm_flag, negate_comment, mail_send_flag, del_flg, del_date, search_key, jecc_flag, jecc_date, exhibit_support_flag, regist_user_id, regist_date, update_user_id, update_date)"
				."select user_id, date_of_application, date_of_registration, fair_title_jp, fair_title_en, abbrev_title, fair_url, mihon_no, profile_jp, profile_en, detailed_information_jp, detailed_information_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, frequency, main_industory_1, sub_industory_1, main_industory_2, sub_industory_2, main_industory_3, sub_industory_3, main_industory_4, sub_industory_4, main_industory_5, sub_industory_5, main_industory_6, sub_industory_6, exhibits_jp, exhibits_en, region, country, city, other_city_jp, other_city_en, venue_jp, venue_en, venue_url, gross_floor_area, transportation_jp, transportation_en, open_to, admission_ticket_1, admission_ticket_2, admission_ticket_3, admission_ticket_4, other_admission_ticket_jp, other_admission_ticket_en, year_of_the_trade_fair, total_number_of_visitor, number_of_foreign_visitor, total_number_of_exhibitors, number_of_foreign_exhibitors, net_square_meters, spare_field1, app_dead_yyyy, app_dead_mm, app_dead_dd, organizer_jp, organizer_en, organizer_tel, organizer_fax, organizer_email, organizer_addr, organizer_div, organizer_pers, agency_in_japan_jp, agency_in_japan_en, agency_in_japan_tel, agency_in_japan_fax, agency_in_japan_email, agency_in_japan_addr, agency_in_japan_div, agency_in_japan_pers, photos_1, photos_2, photos_3, select_language_info, report_link, venue_link, keyword, jetro_suport, jetro_suport_url, use_language_flag, web_display_type, regist_type, regist_category, note_for_system_manager, note_for_data_manager, confirm_flag, negate_comment, mail_send_flag, del_flg, del_date, search_key, jecc_flag, jecc_date, exhibit_support_flag, regist_user_id, regist_date, update_user_id, update_date from jm_fair where mihon_no = ?";
// 		$sql = 'insert into jm_fair_temp(user_id, date_of_application, date_of_registration, fair_title_jp, fair_title_en, abbrev_title, fair_url, mihon_no, profile_jp, profile_en, detailed_information_jp, detailed_information_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, frequency, main_industory_1, sub_industory_1, main_industory_2, sub_industory_2, main_industory_3, sub_industory_3, main_industory_4, sub_industory_4, main_industory_5, sub_industory_5, main_industory_6, sub_industory_6, exhibits_jp, exhibits_en, region, country, city, other_city_jp, other_city_en, venue_jp, venue_en, venue_url, gross_floor_area, transportation_jp, transportation_en, open_to, admission_ticket_1, admission_ticket_2, admission_ticket_3, admission_ticket_4, other_admission_ticket_jp, other_admission_ticket_en, year_of_the_trade_fair, total_number_of_visitor, number_of_foreign_visitor, total_number_of_exhibitors, number_of_foreign_exhibitors, net_square_meters, spare_field1, app_dead_yyyy, app_dead_mm, app_dead_dd, organizer_jp, organizer_en, organizer_tel, organizer_fax, organizer_email, organizer_addr, organizer_div, organizer_pers, agency_in_japan_jp, agency_in_japan_en, agency_in_japan_tel, agency_in_japan_fax, agency_in_japan_email, agency_in_japan_addr, agency_in_japan_div, agency_in_japan_pers, photos_1, photos_2, photos_3, select_language_info, report_link, venue_link, keyword, jetro_suport, jetro_suport_url, use_language_flag, web_display_type, regist_type, note_for_system_manager, note_for_data_manager, confirm_flag, negate_comment, mail_send_flag, del_flg, del_date, search_key, regist_user_id, regist_date, update_user_id, update_date)'
// 				.'select user_id, date_of_application, date_of_registration, fair_title_jp, fair_title_en, abbrev_title, fair_url, mihon_no, profile_jp, profile_en, detailed_information_jp, detailed_information_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, frequency, main_industory_1, sub_industory_1, main_industory_2, sub_industory_2, main_industory_3, sub_industory_3, main_industory_4, sub_industory_4, main_industory_5, sub_industory_5, main_industory_6, sub_industory_6, exhibits_jp, exhibits_en, region, country, city, other_city_jp, other_city_en, venue_jp, venue_en, venue_url, gross_floor_area, transportation_jp, transportation_en, open_to, admission_ticket_1, admission_ticket_2, admission_ticket_3, admission_ticket_4, other_admission_ticket_jp, other_admission_ticket_en, year_of_the_trade_fair, total_number_of_visitor, number_of_foreign_visitor, total_number_of_exhibitors, number_of_foreign_exhibitors, net_square_meters, spare_field1, app_dead_yyyy, app_dead_mm, app_dead_dd, organizer_jp, organizer_en, organizer_tel, organizer_fax, organizer_email, organizer_addr, organizer_div, organizer_pers, agency_in_japan_jp, agency_in_japan_en, agency_in_japan_tel, agency_in_japan_fax, agency_in_japan_email, agency_in_japan_addr, agency_in_japan_div, agency_in_japan_pers, photos_1, photos_2, photos_3, select_language_info, report_link, venue_link, keyword, jetro_suport, jetro_suport_url, use_language_flag, web_display_type, regist_type, note_for_system_manager, note_for_data_manager, confirm_flag, negate_comment, mail_send_flag, del_flg, del_date, search_key, regist_user_id, regist_date, update_user_id, update_date from jm_fair where mihon_no = ?';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($mihon_no);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

		// 結果の判定
		if (null == $res) {
			$this->backend->getLogger()->log(LOG_ERR, 'コピーに失敗しました。');
			return null;
		}
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, 'InsertでErrorが発生しました。');
			$this->backend->getActionError()->addObject('error', $res);
			return null;
		}
		if (1 != $res) {
			$this->backend->getLogger()->log(LOG_ERR, 'InsertでErrorが発生しました。');
			return null;
		}
	}

	function getJmFairTemp($mihon_no, $seq_num) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select user_id, date_of_application, date_of_registration, fair_title_jp, fair_title_en, abbrev_title, fair_url, mihon_no, seq_num, profile_jp, profile_en, detailed_information_jp, detailed_information_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, frequency, main_industory_1, sub_industory_1, main_industory_2, sub_industory_2, main_industory_3, sub_industory_3, main_industory_4, sub_industory_4, main_industory_5, sub_industory_5, main_industory_6, sub_industory_6, exhibits_jp, exhibits_en, region, country, city, other_city_jp, other_city_en, venue_jp, venue_en, venue_url, gross_floor_area, transportation_jp, transportation_en, open_to, admission_ticket_1, admission_ticket_2, admission_ticket_3, admission_ticket_4, other_admission_ticket_jp, other_admission_ticket_en, year_of_the_trade_fair, total_number_of_visitor, number_of_foreign_visitor, total_number_of_exhibitors, number_of_foreign_exhibitors, net_square_meters, spare_field1, app_dead_yyyy, app_dead_mm, app_dead_dd, organizer_jp, organizer_en, organizer_tel, organizer_fax, organizer_email, organizer_addr, organizer_div, organizer_pers, agency_in_japan_jp, agency_in_japan_en, agency_in_japan_tel, agency_in_japan_fax, agency_in_japan_email, agency_in_japan_addr, agency_in_japan_div, agency_in_japan_pers, photos_1, photos_2, photos_3, select_language_info, report_link, venue_link, keyword, jetro_suport, jetro_suport_url, use_language_flag, web_display_type, regist_type, regist_category, note_for_system_manager, note_for_data_manager, confirm_flag, negate_comment, mail_send_flag, del_flg, del_date, search_key, jecc_flag, jecc_date, exhibit_support_flag, regist_user_id, regist_date, update_user_id, update_date from jm_fair_temp where mihon_no = ? and seq_num = ?';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($mihon_no, $seq_num);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

		// 結果の判定
		if (null == $res) {
			$this->backend->getLogger()->log(LOG_ERR, '検索結果が取得できません。');
			return null;
		}
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, '検索Errorが発生しました。');
			$this->backend->getActionError()->addObject('error', $res);
			return null;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		$row_array = $res->fetchRow(DB_FETCHMODE_ASSOC);
		$obj = $this->backend->getObject('jmFairTemp');
		foreach ($row_array as $key => $value) {
			$obj->set($key, $value);
		}

		return $obj;
	}

	function getJmFairTempList($mihon_no) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select jft.mihon_no mihon_no, jft.seq_num seq_num, jft.confirm_flag confirm_flag, jft.negate_comment negate_comment, jft.del_flg del_flg, jft.del_date del_date, jft.regist_user_id regist_user_id, jft.regist_date regist_date, jft.update_user_id update_user_id, jft.update_date update_date, ju_1.email regist_user_email, ju_2.email update_user_email from jm_fair_temp jft left outer join jm_user ju_1 on jft.regist_user_id = ju_1.user_id left outer join jm_user ju_2 on jft.update_user_id = ju_2.user_id where mihon_no = ? order by seq_num desc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($mihon_no);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

		// 結果の判定
		if (null == $res) {
			$this->backend->getLogger()->log(LOG_ERR, '検索結果が取得できません。');
			return null;
		}
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, '検索Errorが発生しました。');
			$this->backend->getActionError()->addObject('error', $res);
			return null;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		// リスト化
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}
}

/**
 *  Jmesse_JmFairTemp
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmFairTemp extends Ethna_AppObject
{
	/**
	 *  @var    array   テーブル定義
	 */
	var $table_def = array(
		'jm_fair_temp' => array(
			'primary' => true,
		),
	);

	/**
	 *  property display name getter.
	 *
	 *  @access public
	 */
	function getName($key)
	{
		return $this->get($key);
	}
}

?>
