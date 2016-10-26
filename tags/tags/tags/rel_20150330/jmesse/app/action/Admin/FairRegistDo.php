<?php
/**
 *  Admin/FairRegistDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_JmFair.php';
require_once 'Jmesse_JmUser.php';
require_once 'FairRegist.php';

/**
 *  admin_fairRegistDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairRegistDo extends Jmesse_Form_AdminFairRegist
{
}

/**
 *  admin_fairRegistDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairRegistDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairRegistDo Action.
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

		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'admin_fairRegist';
		}

		// 入力チェック（詳細）
		$use_language_flag = $this->af->get('use_language_flag');
// 		if ('0' == $use_language_flag) {
			// 開催頻度
			if (null == $this->af->get('frequency_jp') || '' == $this->af->get('frequency_jp')) {
				$this->ae->add('error', '開催頻度が入力されていません');
			}
			// 開催地
			if (null == $this->af->get('region_jp') || '' == $this->af->get('region_jp')) {
				$this->ae->add('error', '開催地（地域）が入力されていません');
			}
			if (null == $this->af->get('country_jp') || '' == $this->af->get('country_jp')) {
				$this->ae->add('error', '開催地（国・地域）が入力されていません');
			}
			// MOD-S 2012.01.20
			if ((null == $this->af->get('city_jp') || '' == $this->af->get('city_jp'))
				&& (null == $this->af->get('othercity_jp') || '' == $this->af->get('othercity_jp'))
				&& (null == $this->af->get('othercity_en') || '' == $this->af->get('othercity_en'))
				&& (null == $this->af->get('other_city_jp') || '' == $this->af->get('other_city_jp'))
				&& (null == $this->af->get('other_city_en') || '' == $this->af->get('other_city_en'))) {
				$this->ae->add('error', '開催地（都市）が入力されていません');
			}
			if (('' != $this->af->get('othercity_jp') && '' == $this->af->get('other_city_jp'))
				|| ('' != $this->af->get('othercity_en') && '' == $this->af->get('other_city_en'))){
				$this->ae->add('error', '開催地（都市）その他が入力されていません');
			}
			if (('' == $this->af->get('othercity_jp') && '' != $this->af->get('other_city_jp'))
				|| ('' == $this->af->get('othercity_en') && '' != $this->af->get('other_city_en'))){
				$this->ae->add('error', '開催地（都市）その他がチェックされていません');
			}
			// MOD-E 2012.01.20
			// 入場資格
			if (null == $this->af->get('open_to_jp') || '' == $this->af->get('open_to_jp')) {
				$this->ae->add('error', '入場資格が入力されていません');
			}
// 			// 入場方法
// 			if ('1' == $this->af->get('admission_ticket_5_jp')
// 				&& (null == $this->af->get('other_admission_ticket_jp') || '' == $this->af->get('other_admission_ticket_jp'))) {
// 				$this->ae->addObject('error', Ethna::raiseError('入場方法が入力されていません', E_REQUIRED));
// 			}
// 		} else {
// 			// 開催頻度
// 			if (null == $this->af->get('frequency_en') || '' == $this->af->get('frequency_en')) {
// 				$this->ae->addObject('error', Ethna::raiseError('開催頻度入力されていません', E_REQUIRED));
// 			}
// 			// 開催地
// 			if (null == $this->af->get('region_en') || '' == $this->af->get('region_en')) {
// 				$this->ae->addObject('error', Ethna::raiseError('開催地（地域）が入力されていません', E_REQUIRED));
// 			}
// 			if (null == $this->af->get('country_en') || '' == $this->af->get('country_en')) {
// 				$this->ae->addObject('error', Ethna::raiseError('開催地（国・地域）が入力されていません', E_REQUIRED));
// 			}
// 			if ((null == $this->af->get('city_en') || '' == $this->af->get('city_en'))
// 				&& (null == $this->af->get('othercity_en') || '' == $this->af->get('othercity_en'))) {
// 				$this->ae->addObject('error', Ethna::raiseError('開催地（都市）が入力されていません', E_REQUIRED));
// 			}
// 			// 入場資格
// 			if (null == $this->af->get('open_to_en') || '' == $this->af->get('open_to_en')) {
// 				$this->ae->addObject('error', Ethna::raiseError('入場資格が入力されていません', E_REQUIRED));
// 			}
// 			// 入場方法
// 			if ('1' == $this->af->get('admission_ticket_5_en')
// 				&& (null == $this->af->get('other_admission_ticket_en') || '' == $this->af->get('other_admission_ticket_en'))) {
// 				$this->ae->addObject('error', Ethna::raiseError('入場方法が入力されていません', E_REQUIRED));
// 			}
// 		}
		// Eメール
		$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
		if (Ethna::isError($user)) {
			$this->ae->addObject('error', $user);
			return 'admin_error';
		}
		if (null == $user || null == $user->get('user_id')) {
			$this->ae->add('error', 'Eメールのユーザは未登録です');
		}
// 		// 主催者・問合せ先
// 		if ((null == $this->af->get('organizer_tel') || '' == $this->af->get('organizer_tel'))
// 			&& (null == $this->af->get('organizer_fax') || '' == $this->af->get('organizer_fax'))
// 			&& (null == $this->af->get('organizer_email') || '' == $this->af->get('organizer_email'))) {
// 			$this->ae->add('error', '主催者・問合せ先が入力されていません');
// 		}

		// MOD-S 2012.01.23 必須チェック削除 主催者・問合せ先住所
		// 主催者・問合せ先住所
// 		if (null == $this->af->get('organizer_addr') || '' == $this->af->get('organizer_addr')) {
// 			$this->ae->add('error', '主催者・問合せ先住所が入力されていません');
// 		}
		// MOD-E 2012.01.23 必須チェック削除 主催者・問合せ先住所

		// 主催者・問合せ先TEL
		if (null == $this->af->get('organizer_tel') || '' == $this->af->get('organizer_tel')) {
			$this->ae->add('error', '主催者・問合せ先TELが入力されていません');
		}

		// MOD-S 2012.01.23 必須チェック削除 主催者・問合せ先E-Mail
		// 主催者・問合せ先E-Mail
// 		if (null == $this->af->get('organizer_email') || '' == $this->af->get('organizer_email')) {
// 			$this->ae->add('error', '主催者・問合せ先E-Mailが入力されていません');
// 		}
		// MOD-E 2012.01.23 必須チェック削除 主催者・問合せ先E-Mail

		// 日付
		// 申請年月日
		if (!checkdate($this->af->get('date_of_application_m'), $this->af->get('date_of_application_d'), $this->af->get('date_of_application_y'))) {
			$this->ae->add('error', '申請年月日が正しくありません');
		}
		// 登録日(承認日)
		if (!checkdate($this->af->get('date_of_registration_m'), $this->af->get('date_of_registration_d'), $this->af->get('date_of_registration_y'))) {
			$this->ae->add('error', '登録日(承認日)が正しくありません');
		}
		// ADD-S 2012.01.31 未来日付はエラー
		if (strtotime(date('Y-m-d')) < strtotime($this->af->get('date_of_registration_y').'-'.$this->af->get('date_of_registration_m').'-'.$this->af->get('date_of_registration_d'))) {
			$this->ae->add('error', '登録日(承認日)が未来です');
		}
		// ADD-E 2012.01.31 未来日付はエラー
		// MOD-S 2013.01.22 JECC認証対応
		// JECC認証年月日(認証時のみ)
		if ('1' == $this->af->get('jecc_flag') || '2' == $this->af->get('jecc_flag')) {
			if (!checkdate($this->af->get('jecc_date_m'), $this->af->get('jecc_date_d'), $this->af->get('jecc_date_y'))) {
				$this->ae->add('error', 'JECC認証年月日が正しくありません');
			}
		}
		// MOD-E 2013.01.22 JECC認証対応
		// 会期
		// MOD-S 2012.02.15 会期未定登録対応
		$this->af->set('success', '1');
		if (!checkdate($this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))) {
			//年月日チェック後、日付が「00」であればエラーを返さない。
			if($this->af->get('date_from_dd') == '00'){
				//会期未定値が含まれる場合
				$this->af->set('success', '2');
			}else{
				$this->ae->add('error', '会期が正しくありません');
			}
		}
		if (!checkdate($this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
			//年月日チェック後、日付が「00」であればエラーを返さない。
			if($this->af->get('date_to_dd') == '00'){
				//会期未定値が含まれる場合
				$this->af->set('success', '2');
			}else{
				$this->ae->add('error', '会期が正しくありません');
			}
		}
		if($this->af->get('success') != '2'){
			if (mktime(0, 0, 0, $this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))
			> mktime(0, 0, 0, $this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('error', '会期が正しくありません（開始 > 終了）');
			}

		}
		// MOD-E 2012.02.15 会期未定登録対応

		// URLチェック
		// 見本市URL
		if (null != $this->af->get('fair_url') && '' != $this->af->get('fair_url')) {
			if (0 !== strpos($this->af->get('fair_url'), 'http')) {
				$this->ae->add('error', '見本市URLはhttp～として下さい');
			}
		}
		// 見本市レポート／URL
		if (null != $this->af->get('report_link') && '' != $this->af->get('report_link')) {
			if (0 !== strpos($this->af->get('report_link'), 'http')) {
				$this->ae->add('error', '見本市レポート／URLはhttp～として下さい');
			}
		}
		// MOD-S 2013.01.22 JETRO出展支援対応
		// JETRO出展支援URL(有の場合)
		if ("1" == $this->af->get('exhibit_support_flag')) {
			if (null != $this->af->get('jetro_suport_url') && '' != $this->af->get('jetro_suport_url')) {
				if (0 !== strpos($this->af->get('jetro_suport_url'), 'http')) {
					$this->ae->add('error', 'JETRO出展支援URLはhttp～として下さい');
				}
			}
		}
		// MOD-E 2013.01.22 JETRO出展支援対応

		// 世界の展示会場／URL
// 		if (null != $this->af->get('venue_link') && '' != $this->af->get('venue_link')) {
// 			if (0 !== strpos($this->af->get('venue_link'), 'http')) {
// 				$this->ae->add('error', '世界の展示会場／URLはhttp～として下さい');
// 			}
// 		}
		// 会場URL
		if (null != $this->af->get('venue_url') && '' != $this->af->get('venue_url')) {
			if (0 !== strpos($this->af->get('venue_url'), 'http')) {
				$this->ae->add('error', '会場URLはhttp～として下さい');
			}
		}

		// Eメールチェック
		// 主催者・問合せ先 E-Mail
		if (null != $this->af->get('organizer_email') && '' != $this->af->get('organizer_email')) {
			if (!strpos($this->af->get('organizer_email'), '@')
				|| 0 === strpos($this->af->get('organizer_email'), '@')
				|| strlen($this->af->get('organizer_email')) - 1 === strpos($this->af->get('organizer_email'), '@')) {
				$this->ae->add('error', '主催者・問合せ先E-Mailが不正です');
			}
		}
		// 主催者・問合せ先 E-Mail
		if (null != $this->af->get('agency_in_japan_email') && '' != $this->af->get('agency_in_japan_email')) {
			if (!strpos($this->af->get('agency_in_japan_email'), '@')
				|| 0 === strpos($this->af->get('agency_in_japan_email'), '@')
				|| strlen($this->af->get('agency_in_japan_email')) - 1 === strpos($this->af->get('agency_in_japan_email'), '@')) {
				$this->ae->add('error', '日本国内の連絡先E-Mailが不正です');
			}
		}

		// MOD-S 2012.02.07 主催者(英)Step3へ移動対応
		$select_language_info = $this->af->get('select_language_info');
		// 日本語
		if ('0' == $select_language_info) {
			// 見本市名
			if ('' == $this->af->get('fair_title_jp')) {
				$this->ae->add('error', '見本市名(日)が入力されていません');
			}
			// 出品物
			if ('' == $this->af->get('exhibits_jp')) {
				$this->ae->add('error', '出品物(日)が入力されていません');
			}
			// 会場名
			if ('' == $this->af->get('venue_jp')) {
				$this->ae->add('error', '会場名(日)が入力されていません');
			}
			// 主催者・問合せ先名称（日）
			if ('' == $this->af->get('organizer_jp')) {
				$this->ae->add('error', '主催者・問合せ先名称(日)が入力されていません');
			}
// 			キャッチフレーズ
// 			if ('' == $this->af->get('profile_jp')) {
// 				$this->ae->add('error', 'キャッチフレーズ(日)が入力されていません');
// 			}
// 			MOD-S 2012.01.23 必須チェック削除 ＰＲ・紹介文
// 			ＰＲ・紹介文
// 			if ('' == $this->af->get('detailed_information_jp')) {
// 				$this->ae->add('error', 'ＰＲ・紹介文(日)が入力されていません');
// 			}
// 			MOD-E 2012.01.23 必須チェック削除 ＰＲ・紹介文
		}
		// 英語
		if ('1' == $select_language_info) {
			// 見本市名
			if ('' == $this->af->get('fair_title_en')) {
				$this->ae->add('error', '見本市名(英)が入力されていません');
			}
			// 出品物
			if ('' == $this->af->get('exhibits_en')) {
				$this->ae->add('error', '出品物(英)が入力されていません');
			}
			// 会場名
			if ('' == $this->af->get('venue_en')) {
				$this->ae->add('error', '会場名(英)が入力されていません');
			}
			// 主催者・問合せ先名称（英）
			if ('' == $this->af->get('organizer_en')) {
				$this->ae->add('error', '主催者・問合せ先名称(英)が入力されていません');
			}
// 			キャッチフレーズ
// 			if ('' == $this->af->get('profile_en')) {
// 				$this->ae->add('error', 'キャッチフレーズ(英)が入力されていません');
// 			}
// 			MOD-S 2012.01.23 必須チェック削除 ＰＲ・紹介文
// 			ＰＲ・紹介文
// 			if ('' == $this->af->get('detailed_information_en')) {
// 				$this->ae->add('error', 'ＰＲ・紹介文(英)が入力されていません');
// 			}
// 			MOD-E 2012.01.23 必須チェック削除 ＰＲ・紹介文
		}
		// 日英両方
		if ('2' == $select_language_info) {
			// 見本市名
			if ('' == $this->af->get('fair_title_jp')) {
				$this->ae->add('error', '見本市名(日)が入力されていません');
			}
			// 出品物
			if ('' == $this->af->get('exhibits_jp')) {
				$this->ae->add('error', '出品物(日)が入力されていません');
			}
			// 会場名
			if ('' == $this->af->get('venue_jp')) {
				$this->ae->add('error', '会場名(日)が入力されていません');
			}
			// 主催者・問合せ先名称（日）
			if ('' == $this->af->get('organizer_jp')) {
				$this->ae->add('error', '主催者・問合せ先名称(日)が入力されていません');
			}
			// 見本市名
			if ('' == $this->af->get('fair_title_en')) {
				$this->ae->add('error', '見本市名(英)が入力されていません');
			}
			// 出品物
			if ('' == $this->af->get('exhibits_en')) {
				$this->ae->add('error', '出品物(英)が入力されていません');
			}
			// 会場名
			if ('' == $this->af->get('venue_en')) {
				$this->ae->add('error', '会場名(英)が入力されていません');
			}
			// 主催者・問合せ先名称（英）
			if ('' == $this->af->get('organizer_en')) {
				$this->ae->add('error', '主催者・問合せ先名称(英)が入力されていません');
			}
		}
		// MOD-E 2012.02.07 主催者(英)Step3へ移動対応

		// チケット入手方法
		if ('' == $this->af->get('admission_ticket_1_jp') && '' == $this->af->get('admission_ticket_2_jp') && '' == $this->af->get('admission_ticket_3_jp') && '' == $this->af->get('admission_ticket_4_jp') && '' == $this->af->get('admission_ticket_5_jp') && '' == $this->af->get('admission_ticket_5_en')) {
			$this->ae->add('error', '入場方法が入力されていません');
		}
		if ('' != $this->af->get('admission_ticket_5_jp') && '' == $this->af->get('other_admission_ticket_jp')) {
			$this->ae->add('error', '入場方法(その他)が入力されていません');
		}
		if ('' == $this->af->get('admission_ticket_5_jp') && '' != $this->af->get('other_admission_ticket_jp')) {
			$this->ae->add('error', '入場方法(その他)が入力されていません');
		}
		if ('' != $this->af->get('admission_ticket_5_en') && '' == $this->af->get('other_admission_ticket_en')) {
			$this->ae->add('error', '入場方法(Other)が入力されていません');
		}
		if ('' == $this->af->get('admission_ticket_5_en') && '' != $this->af->get('other_admission_ticket_en')) {
			$this->ae->add('error', '入場方法(Other)が入力されていません');
		}
		// 見本市の紹介写真
		// MOD-S 2012.02.07 ファイルアップロードサイズエラー対応
		//upload処理判定フラグ
		$upload_check_flg = '0';
		if($_FILES["photos_1"]["name"] != '' && $_FILES["photos_1"]["size"] == 0 && $_FILES["photos_1"]["error"] == 1){
			$this->ae->add('photos_1', $_FILES["photos_1"]["name"].' ファイルサイズエラーです。');
			$upload_check_flg = '1';
		}
		if($_FILES["photos_2"]["name"] != '' && $_FILES["photos_2"]["size"] == 0 && $_FILES["photos_2"]["error"] == 1){
			$this->ae->add('photos_2', $_FILES["photos_2"]["name"].' ファイルサイズエラーです。');
			$upload_check_flg = '1';
		}
		if($_FILES["photos_3"]["name"] != '' && $_FILES["photos_3"]["size"] == 0 && $_FILES["photos_3"]["error"] == 1){
			$this->ae->add('photos_3', $_FILES["photos_3"]["name"].' ファイルサイズエラーです。');
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
			if($this->af->get('photos_name_1') != ''){
				$photos_name_list = array($this->af->get('photos_name_1'));
				if($this->af->get('photos_name_2') != ''){
					array_push($photos_name_list, $this->af->get('photos_name_2'));
					if($this->af->get('photos_name_3') != ''){
						array_push($photos_name_list, $this->af->get('photos_name_3'));
					}
				} else {
					if($this->af->get('photos_name_3') != ''){
						array_push($photos_name_list, $this->af->get('photos_name_3'));
					}
				}
			} else {
				if($this->af->get('photos_name_2') != ''){
					$photos_name_list = array($this->af->get('photos_name_2'));
					if($this->af->get('photos_name_3') != ''){
						array_push($photos_name_list, $this->af->get('photos_name_3'));
					}
				} else {
					if($this->af->get('photos_name_3') != ''){
						$photos_name_list = array($this->af->get('photos_name_3'));
					}
				}
			}
			//画像リストを表示用に値設定
			$this->af->setApp('photos', $photos_name_list);
		}
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
						$this->ae->add('photos_name_1', '見本市の紹介写真はgif、jpeg形式のみにして下さい('.$photos['type'].')');
						break;
					}
				}
			}
		}
		// MOD-E 2012.02.07 ファイルアップロードサイズエラー対応

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'admin_fairRegist';
		}

		return null;
	}

	/**
	 *  admin_fairRegistDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		if (Ethna_Util::isDuplicatePost()) {
			// 二重POSTの場合
			$this->backend->getLogger()->log(LOG_WARNING, '二重POST');
			header('Location: '.$this->config->get('url').'?action_admin_fairChange=true');
			return null;
		}

		// コピー登録の場合、旧見本市番号を保持する。
		$mihon_no_old = $this->af->get('mihon_no');

		// JM_FAIRオブジェクトの取得
		$jm_fair =& $this->backend->getObject('JmFair');

		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		// TEXTAREAの改行コード
		$br = $this->af->get('br');

		// Webページの表示/非表示
		$jm_fair->set('web_display_type', $this->af->get('web_display_type'));

		// 承認フラグ
		$jm_fair->set('confirm_flag', $this->af->get('confirm_flag'));
		$jm_fair->set('negate_comment', $this->af->get('negate_comment'));

		// メール送信フラグ
		$jm_fair->set('mail_send_flag', $this->af->get('mail_send_flag'));

		// ユーザ使用言語フラグ
		$jm_fair->set('use_language_flag', $this->af->get('use_language_flag'));
		$use_language_flag = $this->af->get('use_language_flag');

		// ユーザID
		$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
		$user_id = $user->get('user_id');
		$jm_fair->set('user_id', $user_id);

		// 申請年月日
		$date_of_application = $this->af->get('date_of_application_y').'/'.$this->af->get('date_of_application_m').'/'.$this->af->get('date_of_application_d');
		$jm_fair->set('date_of_application', $date_of_application);

		// 登録日(承認日)
		$date_of_registration = $this->af->get('date_of_registration_y').'/'.$this->af->get('date_of_registration_m').'/'.$this->af->get('date_of_registration_d');
		$jm_fair->set('date_of_registration', $date_of_registration);

		// 言語選択情報
		$jm_fair->set('select_language_info', $this->af->get('select_language_info'));

		// 見本市番号
//		$jm_fair->set('mihon_no', $this->af->get('mihon_no'));

		// 見本市名
		$jm_fair->set('fair_title_jp', $this->af->get('fair_title_jp'));
		$jm_fair->set('fair_title_en', $this->af->get('fair_title_en'));

		// 見本市略称
		$jm_fair->set('abbrev_title', $this->af->get('abbrev_title'));

		// 見本市URL
		$jm_fair->set('fair_url', $this->af->get('fair_url'));

		// キャッチフレーズ
		$jm_fair->set('profile_jp', str_replace($br, '<br/>', $this->af->get('profile_jp')));
		$jm_fair->set('profile_en', str_replace($br, '<br/>', $this->af->get('profile_en')));

		// ＰＲ・紹介文
		$jm_fair->set('detailed_information_jp', str_replace($br, '<br/>', $this->af->get('detailed_information_jp')));
		$jm_fair->set('detailed_information_en', str_replace($br, '<br/>', $this->af->get('detailed_information_en')));

		// 検索キーワード
		$jm_fair->set('keyword', $this->af->get('keyword'));

		// 会期
		// MOD-S 2012.01.25 '0'埋め
		$jm_fair->set('date_from_yyyy', $this->af->get('date_from_yyyy'));
		$jm_fair->set('date_from_mm', $this->_zeroFill($this->af->get('date_from_mm'), 2));
		$jm_fair->set('date_from_dd', $this->_zeroFill($this->af->get('date_from_dd'), 2));
		$jm_fair->set('date_to_yyyy', $this->af->get('date_to_yyyy'));
		$jm_fair->set('date_to_mm', $this->_zeroFill($this->af->get('date_to_mm'), 2));
		$jm_fair->set('date_to_dd', $this->_zeroFill($this->af->get('date_to_dd'), 2));

// 		$jm_fair->set('date_from_yyyy', $this->af->get('date_from_yyyy'));
// 		$jm_fair->set('date_from_mm', $this->af->get('date_from_mm'));
// 		$jm_fair->set('date_from_dd', $this->af->get('date_from_dd'));
// 		$jm_fair->set('date_to_yyyy', $this->af->get('date_to_yyyy'));
// 		$jm_fair->set('date_to_mm', $this->af->get('date_to_mm'));
// 		$jm_fair->set('date_to_dd', $this->af->get('date_to_dd'));
		// MOD-E 2012.01.25 '0'埋め

		// 開催頻度
// 		if ('0' == $use_language_flag) {
			$jm_fair->set('frequency', $this->af->get('frequency_jp'));
// 		} else {
// 			$jm_fair->set('frequency', $this->af->get('frequency_en'));
// 		}

		// 業種
		$jm_fair->set('main_industory_1', $this->af->get('main_industory_1'));
		$jm_fair->set('sub_industory_1', $this->af->get('sub_industory_1'));
		$jm_fair->set('main_industory_2', $this->af->get('main_industory_2'));
		$jm_fair->set('sub_industory_2', $this->af->get('sub_industory_2'));
		$jm_fair->set('main_industory_3', $this->af->get('main_industory_3'));
		$jm_fair->set('sub_industory_3', $this->af->get('sub_industory_3'));
		$jm_fair->set('main_industory_4', $this->af->get('main_industory_4'));
		$jm_fair->set('sub_industory_4', $this->af->get('sub_industory_4'));
		$jm_fair->set('main_industory_5', $this->af->get('main_industory_5'));
		$jm_fair->set('sub_industory_5', $this->af->get('sub_industory_5'));
		$jm_fair->set('main_industory_6', $this->af->get('main_industory_6'));
		$jm_fair->set('sub_industory_6', $this->af->get('sub_industory_6'));

		// 出品物
		$jm_fair->set('exhibits_jp', str_replace($br, '<br/>', $this->af->get('exhibits_jp')));
		$jm_fair->set('exhibits_en', str_replace($br, '<br/>', $this->af->get('exhibits_en')));

		// 開催地
// 		if ('0' == $use_language_flag) {
			$jm_fair->set('region', $this->af->get('region_jp'));
			$jm_fair->set('country', $this->af->get('country_jp'));
			$jm_fair->set('city', $this->af->get('city_jp'));
			$jm_fair->set('other_city_jp', $this->af->get('other_city_jp'));
// 		} else {
// 			$jm_fair->set('region', $this->af->get('region_en'));
// 			$jm_fair->set('country', $this->af->get('country_en'));
// 			$jm_fair->set('city', $this->af->get('city_en'));
			$jm_fair->set('other_city_en', $this->af->get('other_city_en'));
// 		}

		// 会場名
		$jm_fair->set('venue_jp', $this->af->get('venue_jp'));
		$jm_fair->set('venue_en', $this->af->get('venue_en'));

		// 会場URL
		$jm_fair->set('venue_url', $this->af->get('venue_url'));

		// 開催予定規模
		$jm_fair->set('gross_floor_area', $this->af->get('gross_floor_area'));

		// 入場資格
// 		if ('0' == $use_language_flag) {
			$jm_fair->set('open_to', $this->af->get('open_to_jp'));
// 		} else {
// 			$jm_fair->set('open_to', $this->af->get('open_to_en'));
// 		}

		// 入場方法
// 		if ('0' == $use_language_flag) {
			$jm_fair->set('admission_ticket_1', $this->af->get('admission_ticket_1_jp'));
			$jm_fair->set('admission_ticket_2', $this->af->get('admission_ticket_2_jp'));
			$jm_fair->set('admission_ticket_3', $this->af->get('admission_ticket_3_jp'));
			$jm_fair->set('admission_ticket_4', $this->af->get('admission_ticket_4_jp'));
			$jm_fair->set('other_admission_ticket_jp', $this->af->get('other_admission_ticket_jp'));
			$jm_fair->set('sum_ticket', $this->_getSumTicket());
// 		} else {
// 			$jm_fair->set('admission_ticket_1', $this->af->get('admission_ticket_1_en'));
// 			$jm_fair->set('admission_ticket_2', $this->af->get('admission_ticket_2_en'));
// 			$jm_fair->set('admission_ticket_3', $this->af->get('admission_ticket_3_en'));
// 			$jm_fair->set('admission_ticket_4', $this->af->get('admission_ticket_4_en'));
			$jm_fair->set('other_admission_ticket_en', $this->af->get('other_admission_ticket_en'));
// 		}

		// 過去の実績
		$jm_fair->set('year_of_the_trade_fair', $this->af->get('year_of_the_trade_fair'));
		$jm_fair->set('total_number_of_visitor', $this->af->get('total_number_of_visitor'));
		$jm_fair->set('number_of_foreign_visitor', $this->af->get('number_of_foreign_visitor'));
		$jm_fair->set('total_number_of_exhibitors', $this->af->get('total_number_of_exhibitors'));
		$jm_fair->set('number_of_foreign_exhibitors', $this->af->get('number_of_foreign_exhibitors'));
		$jm_fair->set('net_square_meters', $this->af->get('net_square_meters'));
		$jm_fair->set('spare_field1', $this->af->get('spare_field1'));

		// 主催者・問合せ先
		$jm_fair->set('organizer_jp', $this->af->get('organizer_jp'));
		$jm_fair->set('organizer_en', $this->af->get('organizer_en'));
		$jm_fair->set('organizer_addr', $this->af->get('organizer_addr'));
		$jm_fair->set('organizer_div', $this->af->get('organizer_div'));
		$jm_fair->set('organizer_pers', $this->af->get('organizer_pers'));
		$jm_fair->set('organizer_tel', $this->af->get('organizer_tel'));
		$jm_fair->set('organizer_fax', $this->af->get('organizer_fax'));
		$jm_fair->set('organizer_email', $this->af->get('organizer_email'));

		// 日本国内の連絡先
		$jm_fair->set('agency_in_japan_jp', $this->af->get('agency_in_japan_jp'));
		$jm_fair->set('agency_in_japan_en', $this->af->get('agency_in_japan_en'));
		$jm_fair->set('agency_in_japan_addr', $this->af->get('agency_in_japan_addr'));
		$jm_fair->set('agency_in_japan_div', $this->af->get('agency_in_japan_div'));
		$jm_fair->set('agency_in_japan_pers', $this->af->get('agency_in_japan_pers'));
		$jm_fair->set('agency_in_japan_tel', $this->af->get('agency_in_japan_tel'));
		$jm_fair->set('agency_in_japan_fax', $this->af->get('agency_in_japan_fax'));
		$jm_fair->set('agency_in_japan_email', $this->af->get('agency_in_japan_email'));

		// 見本市レポート／URL
		$jm_fair->set('report_link', $this->af->get('report_link'));

		// 世界の展示会場／URL
// 		$jm_fair->set('venue_link', $this->af->get('venue_link'));

		// 展示会に係わる画像(3点)
		$jm_fair->set('photos_1', $this->af->get('photos_name_1'));
		$jm_fair->set('photos_2', $this->af->get('photos_name_2'));
		$jm_fair->set('photos_3', $this->af->get('photos_name_3'));

		// システム管理者備考欄
		$jm_fair->set('note_for_system_manager', $this->af->get('note_for_system_manager'));

		// データ管理者備考欄:
		$jm_fair->set('note_for_data_manager', $this->af->get('note_for_data_manager'));

		// 削除フラグ
		$jm_fair->set('del_flg', $this->af->get('del_flg'));
		if ('1' == $this->af->get('del_flg')) {
			$jm_fair->set('del_date', date('Y/m/d H:i:s'));
		}

		// 登録情報
		$jm_fair->set('regist_user_id', $this->session->get('user_id'));
		$jm_fair->set('regist_date', date('Y/m/d H:i:s'));

		// 入力項目なし
// 		$jm_fair->set('jetro_suport', '');
// 		$jm_fair->set('jetro_suport_url', '');
		if ('copy' == $this->af->get('mode')) {
			$jm_fair->set('regist_type', '1');
		}else{
			$jm_fair->set('regist_type', '0');
		}
		// MOD-S 2012.02.03 登録カテゴリ追加対応
		$jm_fair->set('regist_category', $this->af->get('regist_category'));
		// MOD-E 2012.02.03 登録カテゴリ追加対応

		// MOD-S 2013.01.16 JECC認証対応
		$jm_fair->set('jecc_flag', $this->af->get('jecc_flag'));
		// JECC認証年月日
		if ('1' == $this->af->get('jecc_flag') || '2' == $this->af->get('jecc_flag')) {
			$jecc_date = $this->af->get('jecc_date_y').'/'.$this->af->get('jecc_date_m').'/'.$this->af->get('jecc_date_d');
			$jm_fair->set('jecc_date', $jecc_date);
		}else{
			$jm_fair->set('jecc_date', null);
		}
		// MOD-E 2013.01.16 JECC認証対応

		// MOD-S 2013.01.22 JETRO出展支援対応
		$jm_fair->set('exhibit_support_flag', $this->af->get('exhibit_support_flag'));
		if ('1' == $this->af->get('exhibit_support_flag')) {
			$jm_fair->set('jetro_suport_url', $this->af->get('jetro_suport_url'));
		}else{
			$jm_fair->set('jetro_suport_url', '');
		}
		// MOD-E 2013.01.22 JETRO出展支援対応

// 		$jm_fair->set('update_user_id', '');
// 		$jm_fair->set('update_date', '');

		// 検索キーワードの作成
		$search_key = '';
		// 申請年月日
		$search_key .= $this->af->get('date_of_application_y').'年'.$this->af->get('date_of_application_m').'月'.$this->af->get('date_of_application_d').'日 ';
		// 登録日(承認日)
		$search_key .= $this->af->get('date_of_registration_y').'年'.$this->af->get('date_of_registration_m').'月'.$this->af->get('date_of_registration_d').'日 ';
		// 見本市番号
		$search_key .= $this->af->get('mihon_no').' ';
		// 見本市名
		$search_key .= $this->af->get('fair_title_jp').' ';
		$search_key .= $this->af->get('fair_title_en').' ';
		// 見本市略称
		$search_key .= $this->af->get('abbrev_title').' ';
		// 見本市URL
		$search_key .= $this->af->get('fair_url').' ';
		// キャッチフレーズ
		$search_key .= str_replace($br, '', $this->af->get('profile_jp')).' ';
		$search_key .= str_replace($br, '', $this->af->get('profile_en')).' ';
		// ＰＲ・紹介文
		$search_key .= str_replace($br, '', $this->af->get('detailed_information_jp')).' ';
		$search_key .= str_replace($br, '', $this->af->get('detailed_information_en')).' ';
		// 検索キーワード
		$search_key .= $this->af->get('keyword').' ';
		// 会期
		$search_key .= $this->af->get('date_from_yyyy').'年'.$this->af->get('date_from_mm').'月'.$this->af->get('date_from_dd').'日 ';
		$search_key .= $this->af->get('date_to_yyyy').'年'.$this->af->get('date_to_mm').'月'.$this->af->get('date_to_dd').'日 ';
		// 開催頻度
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');
		$code = $jm_code_m_mgr->getCode('001', $this->af->get('frequency_jp'), '000', '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		// 業種
		$main_list = $jm_code_m_mgr->getMainIndustoryList();
		$sub_list = $jm_code_m_mgr->getSubIndustoryList($this->af->get('main_industory_1'));
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_1'), '0').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_1'), '0').' ';
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_1'), '1').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_1'), '1').' ';
		$sub_list = $jm_code_m_mgr->getSubIndustoryList($this->af->get('main_industory_2'));
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_2'), '0').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_2'), '0').' ';
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_2'), '1').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_2'), '1').' ';
		$sub_list = $jm_code_m_mgr->getSubIndustoryList($this->af->get('main_industory_3'));
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_3'), '0').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_3'), '0').' ';
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_3'), '1').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_3'), '1').' ';
		$sub_list = $jm_code_m_mgr->getSubIndustoryList($this->af->get('main_industory_4'));
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_4'), '0').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_4'), '0').' ';
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_4'), '1').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_4'), '1').' ';
		$sub_list = $jm_code_m_mgr->getSubIndustoryList($this->af->get('main_industory_5'));
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_5'), '0').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_5'), '0').' ';
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_5'), '1').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_5'), '1').' ';
		$sub_list = $jm_code_m_mgr->getSubIndustoryList($this->af->get('main_industory_6'));
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_6'), '0').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_6'), '0').' ';
		$search_key .= $this->_getMainIndustory($main_list, $this->af->get('main_industory_6'), '1').' ';
		$search_key .= $this->_getSubIndustory($sub_list, $this->af->get('sub_industory_6'), '1').' ';
		// 出品物
		$search_key .= str_replace($br, '', $this->af->get('exhibits_jp')).' ';
		$search_key .= str_replace($br, '', $this->af->get('exhibits_en')).' ';
		// 開催地
		$code = $jm_code_m_mgr->getCode('003', $this->af->get('region_jp'), '000', '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$code = $jm_code_m_mgr->getCode('003', $this->af->get('region_jp'), $this->af->get('country_jp'), '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$code = $jm_code_m_mgr->getCode('003', $this->af->get('region_jp'), $this->af->get('country_jp'), $this->af->get('city_jp'));
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$search_key .= $this->af->get('other_city_jp').' ';
		$search_key .= $this->af->get('other_city_en').' ';
		// 会場名
		$search_key .= $this->af->get('venue_jp').' ';
		$search_key .= $this->af->get('venue_en').' ';
		// 会場URL
		$search_key .= $this->af->get('venue_url').' ';
		// 開催予定規模
		$search_key .= $this->af->get('gross_floor_area').' ';
		// 入場資格
		$code = $jm_code_m_mgr->getCode('004', $this->af->get('open_to'), '000', '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		// 入場方法
		if ('1' == $this->af->get('admission_ticket_1')) {
			$search_key .= '登録の必要なし ';
		}
		if ('1' == $this->af->get('admission_ticket_2')) {
			$search_key .= '公式ウェブサイトからの事前登録 ';
		}
		if ('1' == $this->af->get('admission_ticket_3')) {
			$search_key .= '主催者もしくは日本国内の連絡先への問い合わせ ';
		}
		if ('1' == $this->af->get('admission_ticket_3')) {
			$search_key .= '当日会場でチケット入手 ';
		}
		$search_key .= $this->af->get('other_admission_ticket_jp').' ';
		$search_key .= $this->af->get('other_admission_ticket_en').' ';
		// 過去の実績
		$search_key .= $this->af->get('year_of_the_trade_fair').' ';
		$search_key .= $this->af->get('total_number_of_visitor').' ';
		$search_key .= $this->af->get('number_of_foreign_visitor').' ';
		$search_key .= $this->af->get('total_number_of_exhibitors').' ';
		$search_key .= $this->af->get('number_of_foreign_exhibitors').' ';
		$search_key .= $this->af->get('net_square_meters').' ';
		$search_key .= $this->af->get('spare_field1').' ';
		// 主催者・問合せ先
		$search_key .= $this->af->get('organizer_jp').' ';
		$search_key .= $this->af->get('organizer_en').' ';
		$search_key .= $this->af->get('organizer_tel').' ';
		$search_key .= $this->af->get('organizer_fax').' ';
		$search_key .= $this->af->get('organizer_email').' ';
		$search_key .= $this->af->get('organizer_addr').' ';
		$search_key .= $this->af->get('organizer_div').' ';
		$search_key .= $this->af->get('organizer_pers').' ';
		// 日本国内の連絡先
		$search_key .= $this->af->get('agency_in_japan_jp').' ';
		$search_key .= $this->af->get('agency_in_japan_en').' ';
		$search_key .= $this->af->get('agency_in_japan_tel').' ';
		$search_key .= $this->af->get('agency_in_japan_fax').' ';
		$search_key .= $this->af->get('agency_in_japan_email').' ';
		$search_key .= $this->af->get('agency_in_japan_addr').' ';
		$search_key .= $this->af->get('agency_in_japan_div').' ';
		$search_key .= $this->af->get('agency_in_japan_pers').' ';
		// 見本市レポート／URL
		$search_key .= $this->af->get('report_link').' ';
		// 世界の展示会場／URL
// 		$search_key .= $this->af->get('venue_link').' ';
		// 展示会に係わる画像(3点)
		$search_key .= $this->af->get('photos_name_1').' ';
		$search_key .= $this->af->get('photos_name_2').' ';
		$search_key .= $this->af->get('photos_name_3').' ';
		// システム管理者備考欄
		$search_key .= $this->af->get('note_for_system_manager').' ';
		// データ管理者備考欄
		$search_key .= $this->af->get('note_for_data_manager').' ';
		// 削除
		if ('1' == $this->af->get('del_flg')) {
			$search_key .= '削除 ';
		}
		// MOD-S 2013.01.16 JECC認証対応
		if ('2' == $this->af->get('jecc_flag')) {
			$search_key .= '新認証 ';
		}
		if ('1' == $this->af->get('jecc_flag')) {
			$search_key .= '旧認証 ';
		}
		if ('0' == $this->af->get('jecc_flag')) {
			$search_key .= '未認証 ';
		}
		// JECC認証年月日
		$search_key .= $this->af->get('jecc_date_y').'年'.$this->af->get('jecc_date_m').'月'.$this->af->get('jecc_date_d').'日 ';
		// MOD-E 2013.01.16 JECC認証対応

		// MOD-S 2013.01.22 JETRO出展支援対応
		if ('1' == $this->af->get('exhibit_support_flag')) {
		$search_key .= '有 ';
				}
		if ('0' == $this->af->get('exhibit_support_flag')) {
		$search_key .= '無 ';
		}
		$search_key .= $this->af->get('jetro_suport_url').' ';
		// MOD-E 2013.01.22 JETRO出展支援対応

		$jm_fair->set('search_key', $search_key);



		// INSERT
		$ret = $jm_fair->add();
		if (Ethna::isError($ret)) {
			$this->ae->addObject('error', $ret);
			$db->rollback();
			return 'admin_error';
		}

		// 画像ファイルの保存
		$photos_list = array();
		$idx = 0;

		//MOD-S 2012.08.13 保守：画像処理エラー対応
		// ディレクトリ作成
		$dir_name = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no');
		if (!is_dir($dir_name)) {
			$mkdirResult = mkdir($dir_name, 0777, true);
			if(!$mkdirResult){
				$this->backend->getLogger()->log(LOG_ERR, '[見本市新規登録またはコピー登録 システムエラー]:新見本市番号ディレクトリ作成失敗');
				$this->backend->getLogger()->log(LOG_ERR, '[対象ディレクトリ]:'.$dir_name);
				$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
				$db->rollback();
				return 'admin_error';
			}
		}

		// 画像のコピー
		if ('copy' == $this->af->get('mode')) {
			// コピー登録の場合、旧から新へ画像をコピー
			for ($i = 1; $i <= 3; $i++) {
				$name_list = $this->af->get('photos_name_'.$i);
				if (null != $name_list && '' != $name_list) {
					$filename_old = $this->config->get('img_path').$this->_getImageDir($mihon_no_old).'/'.$mihon_no_old.'/'.$name_list;
					//コピー元ファイルの存在確認
					if(file_exists($filename_old)){
						$filename_new = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no').'/'.$name_list;
						$copyResult = copy($filename_old, $filename_new);
						if(!$copyResult){
							//コピー元ファイルのコピー失敗
							$this->backend->getLogger()->log(LOG_ERR, '[見本市コピー登録 システムエラー]:コピー元ファイルのコピー処理失敗');
							$this->backend->getLogger()->log(LOG_ERR, '[コピー元ファイル]:'.$filename_old);
							$this->backend->getLogger()->log(LOG_ERR, '[コピー先ファイル]:'.$filename_new);
							$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
							$db->rollback();
							return 'admin_error';
						}
// 					}else{
// 						$this->backend->getLogger()->log(LOG_ERR, '[見本市コピー登録 システムエラー]:コピー元ファイルの存在確認失敗');
// 						$this->backend->getLogger()->log(LOG_ERR, '[存在未確認ファイル]:'.$filename_from_temp);
// 						$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
// 						//tmpディレクトリ強制削除
// 						system("rm -rf ".$this->session->get('img_tmp_path'));
// 						$db->rollback();
// 						return 'admin_error';
					}
				}
			}
			// ユーザにより削除されたものを削除
			$del_photos_name = $this->af->get('del_photos_name');
			for ($i = 0; $i < count($del_photos_name); $i++) {
				if (null != $del_photos_name[$i] && '' != $del_photos_name[$i]) {
					$filename_del = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no').'/'.$del_photos_name[$i];
					//削除対象ファイルの存在確認
					if(file_exists($filename_del)){
						$deleteResult = unlink($filename_del);
						if(!$deleteResult){
							$this->backend->getLogger()->log(LOG_ERR, '[見本市新規登録またはコピー登録 システムエラー]:削除対象ファイルの削除処理失敗');
							$this->backend->getLogger()->log(LOG_ERR, '[削除対象ファイル]:'.$filename_del);
							$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
							$db->rollback();
							return 'admin_error';
						}
// 					}else{
// 						$this->backend->getLogger()->log(LOG_ERR, '[見本市修正 システムエラー]:新規アップロードファイルの存在確認失敗');
// 						$this->backend->getLogger()->log(LOG_ERR, '[存在未確認ファイル]:'.$filename_from_temp);
// 						$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
// 						//tmpディレクトリ強制削除
// 						system("rm -rf ".$this->session->get('img_tmp_path'));
// 						$db->rollback();
// 						return 'admin_error';
					}
				}
			}
		}

		// 画像の保存
		for ($i = 1; $i <= 3; $i++) {
			$name_list = $this->af->get('photos_name_'.$i);
			for ($j = 1; $j <=3; $j++) {
				$file = $this->af->get('photos_'.$j);
				if (null != $file && '' != $name_list && $name_list == $file['name']) {
					$filename_save = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no').'/'.$file['name'];
					$copyResult = copy($file['tmp_name'], $filename_save);
					if(!$copyResult){
						//新規ファイルコピー失敗
						$this->backend->getLogger()->log(LOG_ERR, '[見本市新規登録またはコピー登録 システムエラー]:ファイルのコピー処理失敗');
						$this->backend->getLogger()->log(LOG_ERR, '[コピー元ファイル]:'.$file['tmp_name']);
						$this->backend->getLogger()->log(LOG_ERR, '[コピー先ファイル]:'.$filename_save);
						$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
						$db->rollback();
						return 'admin_error';
					}
					$photos_list[$idx++] = $name_list;
					break;
				}
			}
		}
		//MOD-E 2012.08.13 保守：画像処理エラー対応

		// JM_FAIR_TEMPにコピー
		$jmFairTempMgr = $this->backend->getManager('jmFairTemp');
		$jmFairTempMgr->copyFair($jm_fair->get('mihon_no'));

		// コミット
		$db->commit();

		// MOD-S 2012.06.15 【問合せ管理票20120612-001】メール送信機能改修
		if($this->af->get('mail_send_flag') == '0'){ //メール送信フラグメール「0:送信する」の場合
			if($this->af->get('del_flg') == '0'){ //削除フラグ「0:未削除」の場合
				if($this->af->get('confirm_flag') == '0'){ //承認フラグ「0:承認待ち」
					//承認待ちメール送信
					if($use_language_flag == '0'){
						if ('copy' == $this->af->get('mode')) { //コピー登録時のみ（新規登録時は承認待ちメールは送信しない。）
							//ユーザ使用言語「0：日本語」
							$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
							if (Ethna::isError($user)) {
								$this->ae->addObject('error', $user);
								return 'admin_error';
							}
							if (null == $user || null == $user->get('user_id')) {
								$this->ae->add('error', 'Eメールのユーザは未登録です');
							}
							$ary_value = array('user_nm' => $user->get('user_nm'), 'fair_title_jp' => $jm_fair->get('fair_title_jp'));
							$mail_mgr =& $this->backend->getManager('mail');
							$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信開始');
							$mail_mgr->sendmailFairReigst(strtolower($this->af->get('email')), $ary_value);
							$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信終了');
						}
					} else {
						//ユーザ使用言語「1：英語」
						$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
						if (Ethna::isError($user)) {
							$this->ae->addObject('error', $user);
							return 'admin_error';
						}
						if (null == $user || null == $user->get('user_id')) {
							$this->ae->add('error', 'Eメールのユーザは未登録です');
						}
						$ary_value = array('user_nm' => $user->get('user_nm'), 'fair_title_en' => $jm_fair->get('fair_title_en'));
						$mail_mgr =& $this->backend->getManager('mail');
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信開始');
						$mail_mgr->sendmailEnFairReigst(strtolower($this->af->get('email')), $ary_value);
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信終了');
					}
				} elseif ($this->af->get('confirm_flag') == '1'){ //承認フラグ「1:承認」
					//承認メール送信
					if($use_language_flag == '0'){
						//ユーザ使用言語「0：日本語」
						$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
						if (Ethna::isError($user)) {
							$this->ae->addObject('error', $user);
							return 'admin_error';
						}
						if (null == $user || null == $user->get('user_id')) {
							$this->ae->add('error', 'Eメールのユーザは未登録です');
						}
						$ary_value = array('user_nm' => $user->get('user_nm'), 'fair_title_jp' => $jm_fair->get('fair_title_jp'));
						$mail_mgr =& $this->backend->getManager('mail');
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信開始');
						$mail_mgr->sendmailFairApproved(strtolower($this->af->get('email')), $ary_value);
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信終了');
					} else {
						//ユーザ使用言語「1：英語」
						$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
						if (Ethna::isError($user)) {
							$this->ae->addObject('error', $user);
							return 'admin_error';
						}
						if (null == $user || null == $user->get('user_id')) {
							$this->ae->add('error', 'Eメールのユーザは未登録です');
						}
						$ary_value = array('user_nm' => $user->get('user_nm'), 'fair_title_en' => $jm_fair->get('fair_title_en'));
						$mail_mgr =& $this->backend->getManager('mail');
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信開始');
						$mail_mgr->sendmailEnFairApproved(strtolower($this->af->get('email')), $ary_value);
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信終了');
					}
				} elseif ($this->af->get('confirm_flag') == '2'){ //承認フラグ「2:否認」
					//否認メール送信
					if($use_language_flag == '0'){
						//ユーザ使用言語「0：日本語」
						$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
						if (Ethna::isError($user)) {
							$this->ae->addObject('error', $user);
							return 'admin_error';
						}
						if (null == $user || null == $user->get('user_id')) {
							$this->ae->add('error', 'Eメールのユーザは未登録です');
						}
						$ary_value = array('user_nm' => $user->get('user_nm'), 'fair_title_jp' => $jm_fair->get('fair_title_jp'), 'rejection_comment' => $jm_fair->get('negate_comment'));
						$mail_mgr =& $this->backend->getManager('mail');
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信開始');
						$mail_mgr->sendmailFairRejection(strtolower($this->af->get('email')), $ary_value);
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信終了');
					} else {
						//ユーザ使用言語「1：英語」
						$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
						if (Ethna::isError($user)) {
							$this->ae->addObject('error', $user);
							return 'admin_error';
						}
						if (null == $user || null == $user->get('user_id')) {
							$this->ae->add('error', 'Eメールのユーザは未登録です');
						}
						$ary_value = array('user_nm' => $user->get('user_nm'), 'fair_title_en' => $jm_fair->get('fair_title_en'), 'rejection_comment' => $jm_fair->get('negate_comment'));
						$mail_mgr =& $this->backend->getManager('mail');
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信開始');
						$mail_mgr->sendmailEnFairRejection(strtolower($this->af->get('email')), $ary_value);
						$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信終了');
					}
				}
			}
		}
		// MOD-E 2012.06.15 【問合せ管理票20120612-001】メール送信機能改修

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		// 変更画面へ遷移
		// MOD-S 2012.02.15 会期未定登録対応
		header('Location: '.$this->config->get('url').'?action_admin_fairChange=true&mihon_no='.$jm_fair->get('mihon_no').'&mode=change&success='.$this->af->get('success'));
		// MOD-E 2012.02.15 会期未定登録対応
		return null;
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

	/**
	 * チケット入手方法の集計先を取得。
	 *
	 * @return string
	 */
	function _getSumTicket() {
		if ('1' == $this->af->get('admission_ticket_1_jp')) {
			return '1';
		} elseif ('1' == $this->af->get('admission_ticket_2_jp')) {
			return '2';
		} elseif ('1' == $this->af->get('admission_ticket_3_jp')) {
			return '3';
		} elseif ('1' == $this->af->get('admission_ticket_4_jp')) {
			return '4';
		} elseif ('' != $this->af->get('other_admission_ticket_jp')) {
			return '5';
		} else {
			return '0';
		}
	}

	/**
	 * 見本市画像を保存するディレクトリ名を作成する。
	 * 一つのフォルダに10000件保存する。
	 * 0スタート。
	 *
	 * @param int $mihon_no 見本市番号
	 * @return string
	 */
	function _getImageDir($mihon_no) {
		return (string) ((int) ($mihon_no / $this->config->get('photos_dir_max')));
	}

	// ADD-S 2012.01.25
	/**
	 * '0'埋め。
	 *
	 * @param string $str 対象文字列
	 * @param int $col 全体カラムすう
	 * @return string '0'埋めされた文字列
	 */
	function _zeroFill($str, $col) {
		$ret = $str;
		while ($col > strlen($ret)) {
			$ret = '0'.$ret;
		}
		return $ret;
	}
	// ADD-E 2012.01.25

}

?>
