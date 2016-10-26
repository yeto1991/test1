<?php
/**
 *  User/EnFairRegistDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnFairRegistStep1.php';

/**
 *  user_enFairRegistDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnFairRegistDo extends Jmesse_Form_UserEnFairRegistStep1
{
}

/**
 *  user_enFairRegistDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnFairRegistDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enFairRegistDo Action.
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
			$this->af->set('function', '');
			return 'user_enLogin';
		}

		// SESSIONのチェック
		if (null == $this->session->get('regist_param_1')) {
			$this->ae->add('error', 'Please restart the registration process from the beginning.');
			return 'enError';
		}

		// 戻った場合
		if ('1' == $this->af->get('back')) {
			return null;
		}

		// 見本市番号
		if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
			if ('' == $this->af->get('mihon_no')) {
				$this->ae->add('error', 'A system error has occurred.');
			}
		}

		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
//			return 'user_enFairRegistStep2';
		}

		// 見本市名
		if ('' == $this->af->get('fair_title_en')) {
			$this->ae->add('fair_title_en', 'The fair title has not been entered.');
		}

		// 対象年

		// 総来場者数
		if ('' != $this->af->get('total_number_of_visitor')
			&& 0 < $this->af->get('total_number_of_visitor')
			&& '' != $this->af->get('number_of_foreign_visitor')
			&& 0 < $this->af->get('number_of_foreign_visitor')) {
				if ($this->af->get('total_number_of_visitor') < $this->af->get('number_of_foreign_visitor')) {
					$this->ae->add('total_number_of_visitor', 'The number you have entered for foreign visitors exceeds the total number. Please enter the correct numbers.');
				}
		}

		// 総出展者数
		if ('' != $this->af->get('total_number_of_exhibitors')
			&& 0 < $this->af->get('total_number_of_exhibitors')
			&& '' != $this->af->get('number_of_foreign_exhibitors')
			&& 0 < $this->af->get('number_of_foreign_exhibitors')) {
				if ($this->af->get('total_number_of_exhibitors') < $this->af->get('number_of_foreign_exhibitors')) {
					$this->ae->add('total_number_of_exhibitors', 'The number you have entered for foreign exhibitors exceeds the total number. Please enter the correct numbers.');
				}
		}
		// 開催規模

		// キャッチフレーズ
// 		if ('' == $this->af->get('profile_en')) {
// 			$this->ae->add('profile_en', 'The catchphrase has not been entered.');
// 		}

		// MOD-S 2012.01.23 必須チェック削除 PR・紹介文
		// PR・紹介文
// 		if ('' == $this->af->get('detailed_information_en')) {
// 			$this->ae->add('detailed_information_en', "The organizer's statement, special features. etc. has not been entered.");
// 		}
		// MOD-E 2012.01.23 必須チェック削除 PR・紹介文

		// 見本市の紹介写真
		// MOD-S 2012.02.07 ファイルアップロードサイズエラー対応
		//upload処理判定フラグ
		$upload_check_flg = '0';
		if($_FILES["photos_1"]["name"] != '' && $_FILES["photos_1"]["size"] == 0 && $_FILES["photos_1"]["error"] == 1){
			$this->ae->add('photos_1', $_FILES["photos_1"]["name"].' is file size error.');
			$upload_check_flg = '1';
		}
		if($_FILES["photos_2"]["name"] != '' && $_FILES["photos_2"]["size"] == 0 && $_FILES["photos_2"]["error"] == 1){
			$this->ae->add('photos_2', $_FILES["photos_2"]["name"].' is file size error.');
			$upload_check_flg = '1';
		}
		if($_FILES["photos_3"]["name"] != '' && $_FILES["photos_3"]["size"] == 0 && $_FILES["photos_3"]["error"] == 1){
			$this->ae->add('photos_3', $_FILES["photos_3"]["name"].' is file size error.');
			$upload_check_flg = '1';
		}
		if($upload_check_flg != '0'){
			if ($_FILES["photos_1"]["name"] == $this->af->get('photos_name_1')) {
				$this->af->set('photos_name_1','');
			} elseif ($_FILES["photos_1"]["name"] == $this->af->get('photos_name_2')) {
				$this->af->set('photos_name_2','');
			} elseif ($_FILES["photos_1"]["name"] == $this->af->get('photos_name_3')) {
				$this->af->set('photos_name_3','');
			}
			if ($_FILES["photos_2"]["name"] == $this->af->get('photos_name_1')) {
				$this->af->set('photos_name_1','');
			} elseif ($_FILES["photos_2"]["name"] == $this->af->get('photos_name_2')) {
				$this->af->set('photos_name_2','');
			} elseif ($_FILES["photos_2"]["name"] == $this->af->get('photos_name_3')) {
				$this->af->set('photos_name_3','');
			}
			if ($_FILES["photos_3"]["name"] == $this->af->get('photos_name_1')) {
				$this->af->set('photos_name_1','');
			} elseif ($_FILES["photos_3"]["name"] == $this->af->get('photos_name_2')) {
				$this->af->set('photos_name_2','');
			} elseif ($_FILES["photos_3"]["name"] == $this->af->get('photos_name_3')) {
				$this->af->set('photos_name_3','');
			}
		}
		// MOD-E 2012.02.07 ファイルアップロードサイズエラー対応

		// gifとjpgのみ
		$ary_photos = array($this->af->get('photos_1'), $this->af->get('photos_2'), $this->af->get('photos_3'));
		$ary_photos_name = array($this->af->get('photos_name_1'), $this->af->get('photos_name_2'), $this->af->get('photos_name_3'));
		for ($i = 0; $i < count($ary_photos_name); $i++) {
			$photos_name = $ary_photos_name[$i];
			$this->backend->getLogger()->log(LOG_DEBUG, '■$photos_name : '.$photos_name);
			for ($j = 0; $j < count($ary_photos); $j++) {
				$photos = $ary_photos[$j];
				if ('' != $photos_name && $photos['name'] == $photos_name) {
					if ('image/jpeg' != $photos['type'] && 'image/gif' != $photos['type'] && 'image/pjpeg' != $photos['type']) {
						$this->ae->add('photos_1', 'Photo files are limited to GIF and JPEG formats only.('.$photos['type'].')');
						break;
					}
				}
			}
		}

		// 主催者
		if ('' == $this->af->get('organizer_en')) {
			$this->ae->add('organizer_en', 'The name of the organizer has not been entered.');
		}
// 		// 主催者連絡先
// 		if ('' == $this->af->get('organizer_addr') || '' == $this->af->get('organizer_div') || '' == $this->af->get('organizer_pers')) {
// 			$this->ae->add('organizer_addr', 'The contact of the organizer has not been entered.');
// 		} else {
// 			if ('' == $this->af->get('organizer_tel') && '' == $this->af->get('organizer_fax') && '' == $this->af->get('organizer_email')) {
// 				$this->ae->add('organizer_tel', 'Please enter at least one form of contact with the organizer: telephone number, fax number or e-mail.');
// 			}
// 		}

		// MOD-S 2012.01.23 必須チェック削除 主催者問合せ住所
		// 主催者問合せ住所
// 		if ('' == $this->af->get('organizer_addr')) {
// 			$this->ae->add('organizer_addr', 'The address of the organizer has not been entered.');
// 		}
		// MOD-E 2012.01.23 必須チェック削除 主催者問合せ住所

		// 主催者問合せTEL
		if ('' == $this->af->get('organizer_tel')) {
			$this->ae->add('organizer_tel', 'The tel of the organizer has not been entered.');
		}

		// MOD-S 2012.01.23 必須チェック削除 主催者問合せEMAIL
		// 主催者問合せEMAIL
// 		if ('' == $this->af->get('organizer_email')) {
// 			$this->ae->add('organizer_email', 'The email of the organizer has not been entered.');
// 		}
		// MOD-E 2012.01.23 必須チェック削除 主催者問合せEMAIL

		if ('' != $this->af->get('organizer_email')) {
			if (!strpos($this->af->get('organizer_email'), '@')
			|| 0 === strpos($this->af->get('organizer_email'), '@')
			|| strlen($this->af->get('organizer_email')) - 1 === strpos($this->af->get('organizer_email'), '@')) {
				$this->ae->add('organizer_email', 'The e-mail of the organizer you have entered is invalid.');
			} elseif (1 != substr_count($this->af->get('organizer_email'), '@')) {
				$this->ae->add('organizer_email', 'The e-mail of the organizer you have entered is invalid.');
			}
		}

		// 日本国内の照会先
		if ('' != $this->af->get('agency_in_japan_email')) {
			if (!strpos($this->af->get('agency_in_japan_email'), '@')
			|| 0 === strpos($this->af->get('agency_in_japan_email'), '@')
			|| strlen($this->af->get('agency_in_japan_email')) - 1 === strpos($this->af->get('agency_in_japan_email'), '@')) {
				$this->ae->add('agency_in_japan_email', 'The e-mail of the representative office, person or agency in Japan you have entered is invalid.');
			}
			if (1 != substr_count($this->af->get('agency_in_japan_email'), '@')) {
				$this->ae->add('agency_in_japan_email', 'The e-mail of the representative office, person or agency in Japan you have entered is invalid.');
			}
		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'user_enFairRegistStep2';
		}

		return null;
	}

	/**
	 *  user_enFairRegistDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		if ('1' == $this->af->get('back')) {
			// 戻った場合
			$this->backend->getLogger()->log(LOG_DEBUG, '■戻った場合');

			// sessionの情報をformに設定
			$this->_setSessionToForm();
		} else {
			if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
				// 修正の場合
				$this->backend->getLogger()->log(LOG_DEBUG, '■修正の場合');

				// formの情報をsessionに設定
				$this->_setFormToSession();

				// sessionの情報をformに設定
				$this->_setSessionToForm();

				// 画像の保存
				$this->_savePhotos();
			} else {
				// formの情報をsessionに設定
				$this->_setFormToSession();

				// sessionの情報をformに設定
				$this->_setSessionToForm();

				// 画像の保存
				$this->_savePhotos();
			}
		}

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
			return 'enError';
		}

		return 'user_enFairDetail';
	}

	function _setFormToSession() {
		$regist_param_2 = $this->session->get('regist_param_2');
		if (null == $regist_param_2) {
			$regist_param_2 = array();
		}
		$regist_param_2['year_of_the_trade_fair'] = $this->af->get('year_of_the_trade_fair');
		$regist_param_2['total_number_of_visitor'] = $this->af->get('total_number_of_visitor');
		$regist_param_2['number_of_foreign_visitor'] = $this->af->get('number_of_foreign_visitor');
		$regist_param_2['total_number_of_exhibitors'] = $this->af->get('total_number_of_exhibitors');
		$regist_param_2['number_of_foreign_exhibitors'] = $this->af->get('number_of_foreign_exhibitors');
		$regist_param_2['net_square_meters'] = $this->af->get('net_square_meters');
		$regist_param_2['spare_field1'] = $this->af->get('spare_field1');
		$regist_param_2['profile_en'] = $this->af->get('profile_en');
		$regist_param_2['detailed_information_en'] = $this->af->get('detailed_information_en');
		$regist_param_2['photos_1'] = $this->af->get('photos_1');
		$regist_param_2['photos_2'] = $this->af->get('photos_2');
		$regist_param_2['photos_3'] = $this->af->get('photos_3');
		$regist_param_2['photos_name_1'] = $this->af->get('photos_name_1');
		$regist_param_2['photos_name_2'] = $this->af->get('photos_name_2');
		$regist_param_2['photos_name_3'] = $this->af->get('photos_name_3');
		$regist_param_2['del_photos_name'] = $this->af->get('del_photos_name');
		$regist_param_2['keyword'] = $this->af->get('keyword');
		$regist_param_2['organizer_en'] = $this->af->get('organizer_en');
		$regist_param_2['organizer_addr'] = $this->af->get('organizer_addr');
		$regist_param_2['organizer_div'] = $this->af->get('organizer_div');
		$regist_param_2['organizer_pers'] = $this->af->get('organizer_pers');
		$regist_param_2['organizer_tel'] = $this->af->get('organizer_tel');
		$regist_param_2['organizer_fax'] = $this->af->get('organizer_fax');
		$regist_param_2['organizer_email'] = $this->af->get('organizer_email');
		$regist_param_2['agency_in_japan_en'] = $this->af->get('agency_in_japan_en');
		$regist_param_2['agency_in_japan_addr'] = $this->af->get('agency_in_japan_addr');
		$regist_param_2['agency_in_japan_div'] = $this->af->get('agency_in_japan_div');
		$regist_param_2['agency_in_japan_pers'] = $this->af->get('agency_in_japan_pers');
		$regist_param_2['agency_in_japan_tel'] = $this->af->get('agency_in_japan_tel');
		$regist_param_2['agency_in_japan_fax'] = $this->af->get('agency_in_japan_fax');
		$regist_param_2['agency_in_japan_email'] = $this->af->get('agency_in_japan_email');
		$this->session->set('regist_param_2', $regist_param_2);

		//Step2での見本市名再指定対応
		$regist_param_1 = $this->session->get('regist_param_1');
		if (null == $regist_param_1) {
			$regist_param_1 = array();
		}
		$regist_param_1['fair_title_en'] = $this->af->get('fair_title_en');
		$this->session->set('regist_param_1', $regist_param_1);

	}

	function _setSessionToForm() {
		$regist_param_2 = $this->session->get('regist_param_2');
		if (null == $regist_param_2) {
			return;
		}
		$regist_param_1 = $this->session->get('regist_param_1');
		$this->af->set('fair_title_en', $regist_param_1['fair_title_en']);
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
		$this->af->set('exhibits_en', $regist_param_1['exhibits_en']);
		$this->af->set('region', $regist_param_1['region']);
		$this->af->set('country', $regist_param_1['country']);
		$this->af->set('city', $regist_param_1['city']);
		$this->af->set('other_city_en', $regist_param_1['other_city_en']);
		$this->af->set('check_other_city', $regist_param_1['check_other_city']);
		$this->af->set('venue_en', $regist_param_1['venue_en']);
		$this->af->set('gross_floor_area', $regist_param_1['gross_floor_area']);
//		$this->af->set('transportation_en', $regist_param_1['transportation_en']);
		$this->af->set('open_to', $regist_param_1['open_to']);
		$this->af->set('admission_ticket_1', $regist_param_1['admission_ticket_1']);
		$this->af->set('admission_ticket_2', $regist_param_1['admission_ticket_2']);
		$this->af->set('admission_ticket_3', $regist_param_1['admission_ticket_3']);
		$this->af->set('admission_ticket_4', $regist_param_1['admission_ticket_4']);
		$this->af->set('admission_ticket_5', $regist_param_1['admission_ticket_5']);
		$this->af->set('other_admission_ticket_en', $regist_param_1['other_admission_ticket_en']);
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
		$this->af->set('spare_field1', $regist_param_2['spare_field1']);
		$this->af->set('profile_en', $regist_param_2['profile_en']);
		$this->af->set('detailed_information_en', $regist_param_2['detailed_information_en']);
		$this->af->set('photos_name_1', $regist_param_2['photos_name_1']);
		$this->af->set('photos_name_2', $regist_param_2['photos_name_2']);
		$this->af->set('photos_name_3', $regist_param_2['photos_name_3']);
		$this->af->set('keyword', $regist_param_2['keyword']);
		$this->af->set('organizer_en', $regist_param_2['organizer_en']);
		$this->af->set('organizer_addr', $regist_param_2['organizer_addr']);
		$this->af->set('organizer_div', $regist_param_2['organizer_div']);
		$this->af->set('organizer_pers', $regist_param_2['organizer_pers']);
		$this->af->set('organizer_tel', $regist_param_2['organizer_tel']);
		$this->af->set('organizer_fax', $regist_param_2['organizer_fax']);
		$this->af->set('organizer_email', $regist_param_2['organizer_email']);
		$this->af->set('agency_in_japan_en', $regist_param_2['agency_in_japan_en']);
		$this->af->set('agency_in_japan_addr', $regist_param_2['agency_in_japan_addr']);
		$this->af->set('agency_in_japan_div', $regist_param_2['agency_in_japan_div']);
		$this->af->set('agency_in_japan_pers', $regist_param_2['agency_in_japan_pers']);
		$this->af->set('agency_in_japan_tel', $regist_param_2['agency_in_japan_tel']);
		$this->af->set('agency_in_japan_fax', $regist_param_2['agency_in_japan_fax']);
		$this->af->set('agency_in_japan_email', $regist_param_2['agency_in_japan_email']);

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

	function _savePhotos() {
		// 一時保存ディレクトリ
		if (null == $this->session->get('img_tmp_path') || '' == $this->session->get('img_tmp_path')) {
			$img_tmp_path = $this->config->get('img_tmp_path').$this->session->get('user_id').'_'.date(YmdHis);
			$this->backend->getLogger()->log(LOG_DEBUG, '■img_tmp_path : '.$img_tmp_path);
			mkdir($img_tmp_path, 0777, true);
			$this->session->set('img_tmp_path', $img_tmp_path);
		}

		// 削除
		$ary_del_photos_name = $this->af->get('del_photos_name');
		for ($i = 0; $i < count($ary_del_photos_name); $i++) {
			if ('' != $ary_del_photos_name[$i]) {
				$filename_del = $this->session->get('img_tmp_path').'/'.$ary_del_photos_name[$i];
				$this->backend->getLogger()->log(LOG_DEBUG, '■削除 : '.$filename_del);
				unlink($filename_del);
			}
		}

		// 保存
		$ary_photos = array($this->af->get('photos_1'), $this->af->get('photos_2'), $this->af->get('photos_3'));
		$ary_photos_name = array($this->af->get('photos_name_1'), $this->af->get('photos_name_2'), $this->af->get('photos_name_3'));
		for ($i = 0; $i < count($ary_photos_name); $i++) {
			$photos_name = $ary_photos_name[$i];
			for ($j = 0; $j < count($ary_photos); $j++) {
				$photos = $ary_photos[$j];
				if ('' != $photos_name && $photos['name'] == $photos_name) {
					$filename_save = $this->session->get('img_tmp_path').'/'.$photos_name;
					$this->backend->getLogger()->log(LOG_DEBUG, '■保存 : '.$filename_save);
					rename($photos['tmp_name'], $filename_save);
					break;
				}
			}
		}
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
