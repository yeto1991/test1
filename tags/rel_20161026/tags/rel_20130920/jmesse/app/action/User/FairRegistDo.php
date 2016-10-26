<?php
/**
 *  User/FairRegistDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairRegistStep1.php';

/**
 *  user_fairRegistDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserFairRegistDo extends Jmesse_Form_UserFairRegistStep1
{
}

/**
 *  user_fairRegistDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserFairRegistDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_fairRegistDo Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('userCommon')->isLoginUser()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('');
			return 'user_login';
		}

		// 見本市番号
		if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
			if ('' == $this->af->get('mihon_no')) {
				$this->ae->add('error', '見本市番号がありません');
			}
		}

		// SESSIONのチェック
		if (null == $this->session->get('regist_param_1')) {
			$this->ae->add('error', '最初からやり直して下さい');
			return 'error';
		}
		if (null == $this->session->get('regist_param_2')) {
			$this->ae->add('error', '最初からやり直して下さい');
			return 'error';
		}

		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
//			return 'user_fairRegistStep3';
		}

		// 見本市名
		if ('' == $this->af->get('fair_title_jp')) {
			$this->ae->add('fair_title_jp', '見本市名が入力されていません');
		}

		$this->backend->getLogger()->log(LOG_DEBUG, '■select_language_info : '.$this->af->get('select_language_info'));

		// 海外への紹介を希望しますか
		if ('' == $this->af->get('select_language_info')) {
			$this->ae->add('error', '海外への紹介を希望しますかが選択されていません');
		}

		if ('2' == $this->af->get('select_language_info')) {
			// 海外への紹介を希望する。

			// Fair Title
			if ('' == $this->af->get('fair_title_en')) {
				$this->ae->add('fair_title_en', 'Fair Title が入力されていません');
			}

			// Teaser Copy
// 			if ('' == $this->af->get('profile_en')) {
// 				$this->ae->add('profile_en', 'Teaser Copy が入力されていません');
// 			}
// 			if (500 < mb_strlen($this->af->get('profile_en'))) {
// 				$this->ae->add('error', 'Teaser Copy は500文字以内にして下さい');
// 			}
			// MOD-S 2012.01.23 必須チェック削除 PR・紹介文
			// Organizer's statement,special features. etc.
// 			if ('' == $this->af->get('detailed_information_en')) {
// 				$this->ae->add('detailed_information_en', "Organizer's statement,special features. etc. が入力されていません");
// 			}
			// MOD-E 2012.01.23 必須チェック削除 PR・紹介文
// 			if ('' != $this->af->get('detailed_information_en')) {
// 				if (1000 < mb_strlen($this->af->get('detailed_information_en'))) {
// 					$this->ae->add('error', "Organizer's statement,special features. etc. は1000文字以内にして下さい");
// 				}
// 			}

			// Exhibits
			if ('' == $this->af->get('exhibits_en')) {
				$this->ae->add('exhibits_en', 'Exhibits が入力されていません');
			}
// 			if (300 < mb_strlen($this->af->get('exhibits_en'))) {
// 				$this->ae->add('error', 'Exhibits は300文字以内にして下さい');
// 			}

			// City (other)
			$regist_param_1 = $this->session->get('regist_param_1');
			if ('1' != $regist_param_1['check_other_city'] && '' != $this->af->get('other_city_en')) {
				$this->ae->add('other_city_en', 'City (other)は「開催都市」でその他にチェックされていません');
			}
			if ('1' == $regist_param_1['check_other_city'] && '' == $this->af->get('other_city_en')) {
				$this->ae->add('other_city_en', 'City (other)は「開催都市」でその他にチェックされています');
			}

			// Venue
			if ('' == $this->af->get('venue_en')) {
				$this->ae->add('venue_en', 'Venue が入力されていません');
			}

			// Transportation
// 			if ('' == $this->af->get('transportation_en')) {
// 				$this->ae->add('error', 'Transportation が入力されていません');
// 			}

			// Admission ticket(other)
			if ('1' != $regist_param_1['admission_ticket_5'] && '' != $this->af->get('other_admission_ticket_en')) {
				$this->ae->add('other_admission_ticket_en', 'Admission ticket(other)は「チケットの入手方法」でその他にチェックされていません');
			}
			if ('1' == $regist_param_1['admission_ticket_5'] && '' == $this->af->get('other_admission_ticket_en')) {
				$this->ae->add('other_admission_ticket_en', 'Admission ticket(other)は「チケットの入手方法」でその他にチェックされています');
			}

			// MOD-S 2012.02.07 主催者(英)Step3へ移動対応
			// Show Management
			if ('' == $this->af->get('organizer_en')) {
				$this->ae->add('organizer_en', 'Name of the organizer/主催者名称 が入力されていません');
			}
			// MOD-E 2012.02.07 主催者(英)Step3へ移動対応
		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'user_fairRegistStep3';
		}

		return null;
	}

	/**
	 *  user_fairRegistDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// formの情報をsessionに設定
		$this->_setFormToSession();

		// 表示項目をSESSIONからAPPに設定
		$this->_setSessionToForm();

		// 詳細画面ボタン設定
		$this->af->setApp('type', 'r');

		// 重複チェック
		if ('c' != $this->af->get('mode')) {
			$duplication_list = $this->_duplicationCheck();
			$this->af->setApp('duplication_list', $duplication_list);
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		return 'user_fairDetail';
	}

	function _setFormToSession() {
		$regist_param_3 = $this->session->get('regist_param_3');
		if (null == $regist_param_3) {
			$regist_param_3 = array();
		}
		$regist_param_3['select_language_info'] = $this->af->get('select_language_info');
		$regist_param_3['fair_title_en'] = $this->af->get('fair_title_en');
		$regist_param_3['profile_en'] = $this->af->get('profile_en');
		$regist_param_3['detailed_information_en'] = $this->af->get('detailed_information_en');
		$regist_param_3['exhibits_en'] = $this->af->get('exhibits_en');
		$regist_param_3['other_city_en'] = $this->af->get('other_city_en');
		$regist_param_3['venue_en'] = $this->af->get('venue_en');
// 		$regist_param_3['transportation_en'] = $this->af->get('transportation_en');
		$regist_param_3['other_admission_ticket_en'] = $this->af->get('other_admission_ticket_en');
		// MOD-S 2012.02.07 主催者(英)Step3へ移動対応
		$regist_param_3['organizer_en'] = $this->af->get('organizer_en');
		$regist_param_3['agency_in_japan_en'] = $this->af->get('agency_in_japan_en');
		// MOD-E 2012.02.07 主催者(英)Step3へ移動対応
		$regist_param_3['spare_field1'] = $this->af->get('spare_field1');
		$this->session->set('regist_param_3', $regist_param_3);

		$regist_param_1 = $this->session->get('regist_param_1');
		if (null == $regist_param_1) {
			$regist_param_1 = array();
		}
		$regist_param_1['fair_title_jp'] = $this->af->get('fair_title_jp');
		$this->session->set('regist_param_1', $regist_param_1);
	}

	function _setSessionToForm() {
		$regist_param_1 = $this->session->get('regist_param_1');
		$this->af->set('fair_title_jp', $regist_param_1['fair_title_jp']);
		$this->af->set('abbrev_title', $regist_param_1['abbrev_title']);
		$this->af->set('fair_url', $regist_param_1['fair_url']);
		$this->af->set('date_from_yyyy', $regist_param_1['date_from_yyyy']);
		$this->af->set('date_from_mm', $regist_param_1['date_from_mm']);
		$this->af->set('date_from_dd', $regist_param_1['date_from_dd']);
		$this->af->set('date_to_yyyy', $regist_param_1['date_to_yyyy']);
		$this->af->set('date_to_mm', $regist_param_1['date_to_mm']);
		$this->af->set('date_to_dd', $regist_param_1['date_to_dd']);
		$this->af->set('frequency', $regist_param_1['frequency']);
		$this->af->set('main_industory_1', $regist_param_1['main_industory_1']);
		$this->af->set('sub_industory_1', $regist_param_1['sub_industory_1']);
		$this->af->set('main_industory_name_1', $regist_param_1['main_industory_name_1']);
		$this->af->set('sub_industory_name_1', $regist_param_1['sub_industory_name_1']);
		$this->af->set('main_industory_2', $regist_param_1['main_industory_2']);
		$this->af->set('sub_industory_2', $regist_param_1['sub_industory_2']);
		$this->af->set('main_industory_name_2', $regist_param_1['main_industory_name_2']);
		$this->af->set('sub_industory_name_2', $regist_param_1['sub_industory_name_2']);
		$this->af->set('main_industory_3', $regist_param_1['main_industory_3']);
		$this->af->set('sub_industory_3', $regist_param_1['sub_industory_3']);
		$this->af->set('main_industory_name_3', $regist_param_1['main_industory_name_3']);
		$this->af->set('sub_industory_name_3', $regist_param_1['sub_industory_name_3']);
		$this->af->set('main_industory_4', $regist_param_1['main_industory_4']);
		$this->af->set('sub_industory_4', $regist_param_1['sub_industory_4']);
		$this->af->set('main_industory_name_4', $regist_param_1['main_industory_name_4']);
		$this->af->set('sub_industory_name_4', $regist_param_1['sub_industory_name_4']);
		$this->af->set('main_industory_5', $regist_param_1['main_industory_5']);
		$this->af->set('sub_industory_5', $regist_param_1['sub_industory_5']);
		$this->af->set('main_industory_name_5', $regist_param_1['main_industory_name_5']);
		$this->af->set('sub_industory_name_5', $regist_param_1['sub_industory_name_5']);
		$this->af->set('main_industory_6', $regist_param_1['main_industory_6']);
		$this->af->set('sub_industory_6', $regist_param_1['sub_industory_6']);
		$this->af->set('main_industory_name_6', $regist_param_1['main_industory_name_6']);
		$this->af->set('sub_industory_name_6', $regist_param_1['sub_industory_name_6']);
		$this->af->set('check_sub_industory', $regist_param_1['check_sub_industory']);
		$this->af->set('exhibits_jp', $regist_param_1['exhibits_jp']);
		$this->af->set('region', $regist_param_1['region']);
		$this->af->set('country', $regist_param_1['country']);
		$this->af->set('city', $regist_param_1['city']);
		$this->af->set('other_city_jp', $regist_param_1['other_city_jp']);
		$this->af->set('check_other_city', $regist_param_1['check_other_city']);
		$this->af->set('venue_jp', $regist_param_1['venue_jp']);
		$this->af->set('gross_floor_area', $regist_param_1['gross_floor_area']);
//		$this->af->set('transportation_jp', $regist_param_1['transportation_jp']);
		$this->af->set('open_to', $regist_param_1['open_to']);
		$this->af->set('admission_ticket_1', $regist_param_1['admission_ticket_1']);
		$this->af->set('admission_ticket_2', $regist_param_1['admission_ticket_2']);
		$this->af->set('admission_ticket_3', $regist_param_1['admission_ticket_3']);
		$this->af->set('admission_ticket_4', $regist_param_1['admission_ticket_4']);
		$this->af->set('admission_ticket_5', $regist_param_1['admission_ticket_5']);
		$this->af->set('other_admission_ticket_jp', $regist_param_1['other_admission_ticket_jp']);
// 		$this->af->set('app_dead_yyyy', $regist_param_1['app_dead_yyyy']);
// 		$this->af->set('app_dead_mm', $regist_param_1['app_dead_mm']);
// 		$this->af->set('app_dead_dd', $regist_param_1['app_dead_dd']);

		$regist_param_2 = $this->session->get('regist_param_2');
		$this->af->set('year_of_the_trade_fair', $regist_param_2['year_of_the_trade_fair']);
		$this->af->set('total_number_of_visitor', $regist_param_2['total_number_of_visitor']);
		$this->af->set('number_of_foreign_visitor', $regist_param_2['number_of_foreign_visitor']);
		$this->af->set('total_number_of_exhibitors', $regist_param_2['total_number_of_exhibitors']);
		$this->af->set('number_of_foreign_exhibitors', $regist_param_2['number_of_foreign_exhibitors']);
		$this->af->set('net_square_meters', $regist_param_2['net_square_meters']);
		$this->af->set('profile_jp', $regist_param_2['profile_jp']);
		$this->af->set('detailed_information_jp', $regist_param_2['detailed_information_jp']);
		$this->af->set('photos_name_1', $regist_param_2['photos_name_1']);
		$this->af->set('photos_name_2', $regist_param_2['photos_name_2']);
		$this->af->set('photos_name_3', $regist_param_2['photos_name_3']);
		$this->af->set('keyword', $regist_param_2['keyword']);
		$this->af->set('organizer_jp', $regist_param_2['organizer_jp']);
// 		$this->af->set('organizer_en', $regist_param_2['organizer_en']);
		$this->af->set('organizer_addr', $regist_param_2['organizer_addr']);
		$this->af->set('organizer_div', $regist_param_2['organizer_div']);
		$this->af->set('organizer_pers', $regist_param_2['organizer_pers']);
		$this->af->set('organizer_tel', $regist_param_2['organizer_tel']);
		$this->af->set('organizer_fax', $regist_param_2['organizer_fax']);
		$this->af->set('organizer_email', $regist_param_2['organizer_email']);
		$this->af->set('agency_in_japan_jp', $regist_param_2['agency_in_japan_jp']);
// 		$this->af->set('agency_in_japan_en', $regist_param_2['agency_in_japan_en']);
		$this->af->set('agency_in_japan_addr', $regist_param_2['agency_in_japan_addr']);
		$this->af->set('agency_in_japan_div', $regist_param_2['agency_in_japan_div']);
		$this->af->set('agency_in_japan_pers', $regist_param_2['agency_in_japan_pers']);
		$this->af->set('agency_in_japan_tel', $regist_param_2['agency_in_japan_tel']);
		$this->af->set('agency_in_japan_fax', $regist_param_2['agency_in_japan_fax']);
		$this->af->set('agency_in_japan_email', $regist_param_2['agency_in_japan_email']);

		$regist_param_3 = $this->session->get('regist_param_3');
		$this->af->set('select_language_info', $regist_param_3['select_language_info']);
		$this->af->set('fair_title_en', $regist_param_3['fair_title_en']);
		$this->af->set('profile_en', $regist_param_3['profile_en']);
		$this->af->set('detailed_information_en', $regist_param_3['detailed_information_en']);
		$this->af->set('exhibits_en', $regist_param_3['exhibits_en']);
		$this->af->set('other_city_en', $regist_param_3['other_city_en']);
		$this->af->set('venue_en', $regist_param_3['venue_en']);
//		$this->af->set('transportation_en', $regist_param_3['transportation_en']);
		$this->af->set('other_admission_ticket_en', $regist_param_3['other_admission_ticket_en']);
		$this->af->set('spare_field1', $regist_param_3['spare_field1']);
		$this->af->set('organizer_en', $regist_param_3['organizer_en']);
		$this->af->set('agency_in_japan_en', $regist_param_3['agency_in_japan_en']);

		// コード名
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');

		// 開催頻度
		$this->backend->getLogger()->log(LOG_DEBUG, '■frequency : '.$this->af->get('frequency'));
		$this->af->setApp('frequency_name', $jm_code_m_mgr->getCode('001', $this->af->get('frequency'), '000', '000'));

		// 開催地
		$this->af->setApp('region_name', $jm_code_m_mgr->getCode('003', $this->af->get('region'), '000', '000'));
		$this->af->setApp('country_name', $jm_code_m_mgr->getCode('003', $this->af->get('region'), $this->af->get('country'), '000'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■city : '.$this->af->get('city'));
		if ('' != $this->af->get('city')) {
			$this->af->setApp('city_name', $jm_code_m_mgr->getCode('003', $this->af->get('region'), $this->af->get('country'), $this->af->get('city')));
		} else {
			$this->af->setApp('city_name', '');
		}

		// 入場資格
		$this->af->setApp('open_to_name', $jm_code_m_mgr->getCode('004', $this->af->get('open_to'), '000', '000'));

		//MOD-S 2013.04.25 登録（対象）画像の実画像表示
		//画面表示対象ファイルパスを配列で保持
		$ary_photos_name = array($regist_param_2['photos_name_1'], $regist_param_2['photos_name_2'], $regist_param_2['photos_name_3']);
		$abc = 0;
		for ($i = 0; $i < count($ary_photos_name); $i++) {
			$photos_name = $ary_photos_name[$i];
			if ('' != $photos_name) {
				$filename_from_temp = $this->session->get('img_tmp_path').'/'.$photos_name;
				//コピー元ファイルの存在確認
				if(file_exists($filename_from_temp)){
					$displayPhotosNo[$abc] = $abc+1;
					$displayPhotosName[$abc] = $photos_name;
					$displayPhotosPath[$abc] = $filename_from_temp;
					$abc++;
				}else{
					if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
						//元画像の場合
						if(5 > mb_strlen($this->af->get('mihon_no'))){
							//見本市番号が5桁以上ではない場合（1～9999）
							$mihon_no_first_value = 0; //0フォルダ
						}else{
							$mihon_no_first_value = substr($this->af->get('mihon_no'),0,1); //見本市番号先頭桁数フォルダ
						}
					}
					$displayPhotosNo[$abc] = $abc+1;
					$displayPhotosName[$abc] = $photos_name;
					$displayPhotosPath[$abc] = $this->config->get('img_path').$mihon_no_first_value.'/'.$this->af->get('mihon_no').'/'.$photos_name;
					$abc++;
				}
			}
		}
		$this->session->set('display_photos_no', $displayPhotosNo);
		$this->session->set('display_photos_name', $displayPhotosName);
		$this->session->set('display_photos_path', $displayPhotosPath);
		//MOD-E 2013.04.25 登録（対象）画像の実画像表示

	}

	function _duplicationCheck() {
		// 入力情報の連結
		$regist_param_1 = $this->session->get('regist_param_1');
		$date_from = $regist_param_1['date_from_yyyy'].$regist_param_1['date_from_mm'].$regist_param_1['date_from_dd'];
		$date_to = $regist_param_1['date_to_yyyy'].$regist_param_1['date_to_mm'].$regist_param_1['date_to_dd'];
		$venue = $regist_param_1['region'].$regist_param_1['country'].$regist_param_1['city'];
		$industory_1 = $regist_param_1['main_industory_1'].$regist_param_1['sub_industory_1'];
		$industory_2 = $regist_param_1['main_industory_2'].$regist_param_1['sub_industory_2'];
		$industory_3 = $regist_param_1['main_industory_3'].$regist_param_1['sub_industory_3'];
		$industory_4 = $regist_param_1['main_industory_4'].$regist_param_1['sub_industory_4'];
		$industory_5 = $regist_param_1['main_industory_5'].$regist_param_1['sub_industory_5'];
		$industory_6 = $regist_param_1['main_industory_6'].$regist_param_1['sub_industory_6'];
		$ary_industory_mine = array($industory_1, $industory_2, $industory_3, $industory_4, $industory_5, $industory_6);
		sort($ary_industory_mine);
		$industory_mine = implode('', $ary_industory_mine);
		$this->backend->getLogger()->log(LOG_DEBUG, '■industory_mine : '.$industory_mine);

		$jm_fair_mgr =& $this->backend->getManager('JmFair');
		$list = $jm_fair_mgr->getFairDateVenue($date_from, $date_to, $venue);

		$duplication_list = array();
		foreach ($list as $row) {
			$ary_industory = array($row['industory_1'], $row['industory_2'], $row['industory_3'], $row['industory_4'], $row['industory_5'], $row['industory_6']);
			sort($ary_industory);
			$industory = implode('', $ary_industory);
			$this->backend->getLogger()->log(LOG_DEBUG, '■industory : '.$industory);
			if ($industory_mine == $industory) {
				array_push($duplication_list, $row);
				if (10 <= count($duplication_list)) {
					break;
				}
			}
		}

		return $duplication_list;
	}

}

?>
