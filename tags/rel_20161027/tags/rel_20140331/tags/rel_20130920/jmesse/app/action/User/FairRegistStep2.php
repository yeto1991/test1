<?php
/**
 *  User/FairRegistStep2.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairRegistStep1.php';

/**
 *  user_fairRegistStep2 Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserFairRegistStep2 extends Jmesse_Form_UserFairRegistStep1
{
}

/**
 *  user_fairRegistStep2 action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserFairRegistStep2 extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_fairRegistStep2 Action.
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
			return 'user_login';
		}

		// 戻った場合
		if ('1' == $this->af->get('back')) {
			return null;
		}

		// 見本市番号
		if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
			if ('' == $this->af->get('mihon_no')) {
				$this->ae->add('error', 'システムエラーが発生しました。');
				return 'error';
			}
		}

		// 入力チェック
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'user_fairRegistStep1';
		}

		// 詳細チェック
		// 見本市名
		if ('' == $this->af->get('fair_title_jp')) {
			$this->ae->add('fair_title_jp', '見本市名が入力されていません');
		}

		// 見本市略称

		// 見本市公式サイトURL
		$this->backend->getLogger()->log(LOG_DEBUG, '■fair_url : '.$this->af->get('fair_url'));
		if ('' == $this->af->get('fair_url') || 'http://' == $this->af->get('fair_url')) {
			$this->ae->add('fair_url', '見本市公式サイトURLが入力されていません');
		} else {
			if (0 !== strpos($this->af->get('fair_url'), 'http')) {
				$this->ae->add('fair_url', '見本市公式サイトURLはhttp～として下さい');
			}
		}

		// 会期
		if ('' == $this->af->get('date_from_yyyy') || '' == $this->af->get('date_from_mm') || '' == $this->af->get('date_from_dd')) {
			$this->ae->add('date_from_yyyy', '会期（開始）が入力されていません');
		} else {
			if (!checkdate($this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))) {
				$this->ae->add('date_from_yyyy', '会期（開始）が正しくありません');
			}
		}
		if ('' == $this->af->get('date_to_yyyy') || '' == $this->af->get('date_to_mm') || '' == $this->af->get('date_to_dd')) {
			$this->ae->add('date_to_yyyy', '会期（終了）が入力されていません');
		} else {
			if (!checkdate($this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('date_to_yyyy', '会期（終了）が正しくありません');
			}
		}
		if ('' != $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_mm') && '' != $this->af->get('date_from_dd')
			&& '' != $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_mm') && '' != $this->af->get('date_to_dd')) {
			if (mktime(0, 0, 0, $this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))
				> mktime(0, 0, 0, $this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('date_from_yyyy', '会期が正しくありません（開始 > 終了）');
			}
			if (time() > mktime(0, 0, 0, $this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('date_to_yyyy', '会期（終了）は未来の日付を入力して下さい');
			}
		}

		// 開催頻度
		if ('' == $this->af->get('frequency')) {
			$this->ae->add('frequency', '開催頻度が選択されていません');
		}

		// 業種
		if ('' == $this->af->get('main_industory_1') || '' == $this->af->get('sub_industory_1')) {
			$this->ae->add('main_industory_1', '業種が選択されていません');
		} else {
			$this->af->set('check_sub_industory', $this->_mekaCheckSubIndustory());
		}

		// 取扱品目
		if ('' == $this->af->get('exhibits_jp')) {
			$this->ae->add('exhibits_jp', '取扱品目が入力されていません');
		}
// 		if (300 < mb_strlen($this->af->get('exhibits_jp', 'UTF-8'))) {
// 			$this->ae->add('exhibits_jp', '取扱品目は300文字以内にして下さい');
// 		}

		// 開催地
		if ('' == $this->af->get('region')) {
			$this->ae->add('region', '開催地(地域)が選択されていません');
		}
		if ('' == $this->af->get('country')) {
			$this->ae->add('country', '開催地(国・地域)が選択されていません');
		}
		if ('' == $this->af->get('city') && '1' != $this->af->get('check_other_city')) {
			$this->ae->add('city', '開催地(都市)が入力されていません');
		}
		if ('1' == $this->af->get('check_other_city') && '' == $this->af->get('other_city_jp')) {
			$this->ae->add('other_city_jp', '開催地(都市(その他))が入力されていません');
		}
		if ('1' != $this->af->get('check_other_city') && '' != $this->af->get('other_city_jp')) {
			$this->ae->add('other_city_jp', '開催地(都市(その他))が選択されていません');
		}

		// 会場名
		if ('' == $this->af->get('venue_jp')) {
			$this->ae->add('venue_jp', '開催地（会場名）が入力されていません');
		}

		// 開催予定規模

		// 会場までの交通手段
// 		if ('' == $this->af->get('transportation_jp')) {
// 			$this->ae->add('error', '会場までの交通手段が入力されていません');
// 		}

		// 入場資格
		if ('' == $this->af->get('open_to')) {
			$this->ae->add('open_to', '入場資格が選択されていません');
		}

		// チケットの入手方法
		if ('1' != $this->af->get('admission_ticket_1')
			&& '1' != $this->af->get('admission_ticket_2')
			&& '1' != $this->af->get('admission_ticket_3')
			&& '1' != $this->af->get('admission_ticket_4')
			&& '1' != $this->af->get('admission_ticket_5')
			&& '' == $this->af->get('other_admission_ticket_jp')) {
			$this->ae->add('admission_ticket_1', 'チケットの入手方法が選択されていません');
		} elseif ('1' == $this->af->get('admission_ticket_5') && '' == $this->af->get('other_admission_ticket_jp')) {
			$this->ae->add('other_admission_ticket_jp', 'チケットの入手方法(その他)が入力されていません');
		} elseif ('1' != $this->af->get('admission_ticket_5') && '' != $this->af->get('other_admission_ticket_jp')) {
			$this->ae->add('other_admission_ticket_jp', 'チケットの入手方法(その他)が選択されていません');
		}

		// 出展申込締切日
// 		if ((null != $this->af->get('app_dead_yyyy') && '' != $this->af->get('app_dead_yyyy'))
// 			|| (null != $this->af->get('app_dead_mm') && '' != $this->af->get('app_dead_mm'))
// 			|| (null != $this->af->get('app_dead_dd') && '' != $this->af->get('app_dead_dd'))) {
// 			if (!checkdate($this->af->get('app_dead_mm'), $this->af->get('app_dead_dd'), $this->af->get('app_dead_yyyy'))) {
// 				$this->ae->add('error', '出展申込締切日が正しくありません');
// 			}
// 		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'user_fairRegistStep1';
		}
		return null;
	}

	/**
	 *  user_fairRegistStep2 action implementation.
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

 			// 画像ファイルの削除
// 			if ('' != $this->session->get('img_tmp_path')) {
// 				if ('' != $this->af->get('photos_name_1')) {
// 					$this->backend->getLogger()->log(LOG_DEBUG, '■unlink : '.$this->session->get('img_tmp_path').'/'.$this->af->get('photos_name_1'));
// 					unlink($this->session->get('img_tmp_path').'/'.$this->af->get('photos_name_1'));
// 				}
// 				if ('' != $this->af->get('photos_name_2')) {
// 					$this->backend->getLogger()->log(LOG_DEBUG, '■unlink : '.$this->session->get('img_tmp_path').'/'.$this->af->get('photos_name_2'));
// 					unlink($this->session->get('img_tmp_path').'/'.$this->af->get('photos_name_2'));
// 				}
// 				if ('' != $this->af->get('photos_name_3')) {
// 					$this->backend->getLogger()->log(LOG_DEBUG, '■unlink : '.$this->session->get('img_tmp_path').'/'.$this->af->get('photos_name_3'));
// 					unlink($this->session->get('img_tmp_path').'/'.$this->af->get('photos_name_3'));
// 				}
// 				rmdir($this->session->get('img_tmp_path'));
// 				$this->session->set('img_tmp_path', '');
// 			}
		} else	{
			if ('c' == $this->af->get('mode') || 'e'  == $this->af->get('mode')) {
				// 修正の場合
				$this->backend->getLogger()->log(LOG_DEBUG, '■修正の場合');

				// formの情報をsessionに設定
				$this->_setFormToSession();

				// sessionの情報をformに設定
				$this->_setSessionToForm();
			} else {
				// formの情報をsessionに設定
				$this->_setFormToSession();

				// sessionの情報をformに設定
				$this->_setSessionToForm();
			}
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		return 'user_fairRegistStep2';
	}

	function _setFormToSession() {
		$regist_param_1 = $this->session->get('regist_param_1');
		if (null == $regist_param_1) {
			$regist_param_1 = array();
		}
		$regist_param_1['fair_title_jp'] = $this->af->get('fair_title_jp');
		$regist_param_1['abbrev_title'] = $this->af->get('abbrev_title');
		$regist_param_1['fair_url'] = $this->af->get('fair_url');
		$regist_param_1['date_from_yyyy'] = $this->af->get('date_from_yyyy');
		$regist_param_1['date_from_mm'] = $this->af->get('date_from_mm');
		$regist_param_1['date_from_dd'] = $this->af->get('date_from_dd');
		$regist_param_1['date_to_yyyy'] = $this->af->get('date_to_yyyy');
		$regist_param_1['date_to_mm'] = $this->af->get('date_to_mm');
		$regist_param_1['date_to_dd'] = $this->af->get('date_to_dd');
		$regist_param_1['frequency'] = $this->af->get('frequency');
		$regist_param_1['main_industory_1'] = $this->af->get('main_industory_1');
		$regist_param_1['sub_industory_1'] = $this->af->get('sub_industory_1');
		$regist_param_1['main_industory_name_1'] = $this->af->get('main_industory_name_1');
		$regist_param_1['sub_industory_name_1'] = $this->af->get('sub_industory_name_1');
		$regist_param_1['main_industory_2'] = $this->af->get('main_industory_2');
		$regist_param_1['sub_industory_2'] = $this->af->get('sub_industory_2');
		$regist_param_1['main_industory_name_2'] = $this->af->get('main_industory_name_2');
		$regist_param_1['sub_industory_name_2'] = $this->af->get('sub_industory_name_2');
		$regist_param_1['main_industory_3'] = $this->af->get('main_industory_3');
		$regist_param_1['sub_industory_3'] = $this->af->get('sub_industory_3');
		$regist_param_1['main_industory_name_3'] = $this->af->get('main_industory_name_3');
		$regist_param_1['sub_industory_name_3'] = $this->af->get('sub_industory_name_3');
		$regist_param_1['main_industory_4'] = $this->af->get('main_industory_4');
		$regist_param_1['sub_industory_4'] = $this->af->get('sub_industory_4');
		$regist_param_1['main_industory_name_4'] = $this->af->get('main_industory_name_4');
		$regist_param_1['sub_industory_name_4'] = $this->af->get('sub_industory_name_4');
		$regist_param_1['main_industory_5'] = $this->af->get('main_industory_5');
		$regist_param_1['sub_industory_5'] = $this->af->get('sub_industory_5');
		$regist_param_1['main_industory_name_5'] = $this->af->get('main_industory_name_5');
		$regist_param_1['sub_industory_name_5'] = $this->af->get('sub_industory_name_5');
		$regist_param_1['main_industory_6'] = $this->af->get('main_industory_6');
		$regist_param_1['sub_industory_6'] = $this->af->get('sub_industory_6');
		$regist_param_1['main_industory_name_6'] = $this->af->get('main_industory_name_6');
		$regist_param_1['sub_industory_name_6'] = $this->af->get('sub_industory_name_6');
		$regist_param_1['check_sub_industory'] = $this->af->get('check_sub_industory');
		$regist_param_1['exhibits_jp'] = $this->af->get('exhibits_jp');
		$regist_param_1['region'] = $this->af->get('region');
		$regist_param_1['country'] = $this->af->get('country');
		$regist_param_1['city'] = $this->af->get('city');
		$regist_param_1['check_other_city'] = $this->af->get('check_other_city');
		if ('1' == $this->af->get('check_other_city')) {
			$regist_param_1['other_city_jp'] = $this->af->get('other_city_jp');
		} else {
			$regist_param_1['other_city_jp'] = '';
		}
		$regist_param_1['venue_jp'] = $this->af->get('venue_jp');
		$regist_param_1['gross_floor_area'] = $this->af->get('gross_floor_area');
// 		$regist_param_1['transportation_jp'] = $this->af->get('transportation_jp');
		$regist_param_1['open_to'] = $this->af->get('open_to');
		$regist_param_1['admission_ticket_1'] = $this->af->get('admission_ticket_1');
		$regist_param_1['admission_ticket_2'] = $this->af->get('admission_ticket_2');
		$regist_param_1['admission_ticket_3'] = $this->af->get('admission_ticket_3');
		$regist_param_1['admission_ticket_4'] = $this->af->get('admission_ticket_4');
		$regist_param_1['admission_ticket_5'] = $this->af->get('admission_ticket_5');
		if ('1' == $this->af->get('admission_ticket_5')) {
			$regist_param_1['other_admission_ticket_jp'] = $this->af->get('other_admission_ticket_jp');
		} else {
			$regist_param_1['other_admission_ticket_jp'] = '';
		}
// 		$regist_param_1['app_dead_yyyy'] = $this->af->get('app_dead_yyyy');
// 		$regist_param_1['app_dead_mm'] = $this->af->get('app_dead_mm');
// 		$regist_param_1['app_dead_dd'] = $this->af->get('app_dead_dd');
		$this->session->set('regist_param_1', $regist_param_1);
	}

	function _setSessionToForm() {
		$regist_param_2 = $this->session->get('regist_param_2');
		if (null == $regist_param_2) {
			return ;
		}
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
		$this->af->set('organizer_addr', $regist_param_2['organizer_addr']);
		$this->af->set('organizer_div', $regist_param_2['organizer_div']);
		$this->af->set('organizer_pers', $regist_param_2['organizer_pers']);
		$this->af->set('organizer_tel', $regist_param_2['organizer_tel']);
		$this->af->set('organizer_fax', $regist_param_2['organizer_fax']);
		$this->af->set('organizer_email', $regist_param_2['organizer_email']);
		$this->af->set('agency_in_japan_jp', $regist_param_2['agency_in_japan_jp']);
		$this->af->set('agency_in_japan_addr', $regist_param_2['agency_in_japan_addr']);
		$this->af->set('agency_in_japan_div', $regist_param_2['agency_in_japan_div']);
		$this->af->set('agency_in_japan_pers', $regist_param_2['agency_in_japan_pers']);
		$this->af->set('agency_in_japan_tel', $regist_param_2['agency_in_japan_tel']);
		$this->af->set('agency_in_japan_fax', $regist_param_2['agency_in_japan_fax']);
		$this->af->set('agency_in_japan_email', $regist_param_2['agency_in_japan_email']);

		$regist_param_1 = $this->session->get('regist_param_1');
		if (null == $regist_param_1) {
			return;
		}
		$this->af->set('fair_title_jp', $regist_param_1['fair_title_jp']);
	}

	function _mekaCheckSubIndustory() {
		$industory_tmp_1 = $this->af->get('main_industory_1').'_'.$this->af->get('sub_industory_1').'_'.$this->af->get('main_industory_name_1').'_'.$this->af->get('sub_industory_name_1');
		$industory_tmp_2 = $this->af->get('main_industory_2').'_'.$this->af->get('sub_industory_2').'_'.$this->af->get('main_industory_name_2').'_'.$this->af->get('sub_industory_name_2');
		$industory_tmp_3 = $this->af->get('main_industory_3').'_'.$this->af->get('sub_industory_3').'_'.$this->af->get('main_industory_name_3').'_'.$this->af->get('sub_industory_name_3');
		$industory_tmp_4 = $this->af->get('main_industory_4').'_'.$this->af->get('sub_industory_4').'_'.$this->af->get('main_industory_name_4').'_'.$this->af->get('sub_industory_name_4');
		$industory_tmp_5 = $this->af->get('main_industory_5').'_'.$this->af->get('sub_industory_5').'_'.$this->af->get('main_industory_name_5').'_'.$this->af->get('sub_industory_name_5');
		$industory_tmp_6 = $this->af->get('main_industory_6').'_'.$this->af->get('sub_industory_6').'_'.$this->af->get('main_industory_name_6').'_'.$this->af->get('sub_industory_name_6');
		return array($industory_tmp_1, $industory_tmp_2, $industory_tmp_3, $industory_tmp_4, $industory_tmp_5, $industory_tmp_6);
	}
}

?>
