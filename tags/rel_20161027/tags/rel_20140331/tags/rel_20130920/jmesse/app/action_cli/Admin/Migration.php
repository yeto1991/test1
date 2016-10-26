<?php
/**
 *  Admin/Migration.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  admin_migration Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_AdminMigration extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	);
}

/**
 *  admin_migration action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_AdminMigration extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_migration Action.
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
	 *  admin_migration action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ユーザは一時的にコメントアウト
// 		// ユーザ情報の移行
// 		echo "[START]  JM_USER >>>>>\n";
// 		// トランザクションの開始
// 		$this->_begin();
// 		$ary_user = @file("MQData_User.txt");
// 		foreach ($ary_user as $row) {
// 			// 改行コードの削除
// 			$row = str_replace("\r", "", $row);
// 			$row = str_replace("\n", "", $row);

// 			// jm_userへinsert
// 			$jm_user =& $this->_setJmUser($row);

// 			if (null != $jm_user) {
// 				// tmp_user_idへinsert
// 				$this->_setUserId($row, $jm_user);
// 			}
// 		}
// 		// トランザクション終了
// 		$this->_end();
// 		echo "[FINISH] JM_USER <<<<<\n";

		// 見本市情報の移行
		echo "[START]  JM_FAIR >>>>>\n";
		// トランザクションの開始
		$this->_begin();
		$ary_fair = @file("MQData_Fair.txt");
		foreach ($ary_fair as $row) {
			// 改行コードの削除
			$row = str_replace("\r", "", $row);
			$row = str_replace("\n", "", $row);

			// jm_fairへinsert
			$jm_fair =& $this->_setJmFair($row);

			// 画像は一時的にコメント
// 			if (null != $jm_fair) {
// 				// 画像ファイルの移動
// 				$this->_setPhotos($jm_fair);

// 				// 「キーワード検索対象」設定
// 				// 別のバッチで行う。
// 			}
		}
		// トランザクション終了
		$this->_end();
		echo "[FINISH] JM_FAIR <<<<<\n";

		// エラー出力
		echo "[START] System Error >>>>>\n";
		foreach ($this->ae->getErrorList() as $key => $value) {
			echo $value['object']->getMessage()."\n";
// 			echo mb_convert_encoding($value['object']->getMessage(), 'SJIS', 'UTF-8')."\n";
		}
		echo "[FINISH] System Error <<<<<\n";

		return null;
	}

	/**
	 * 画像を保存フォルダに移動する。
	 *
	 * @param Jmesse_JmFairManager $jm_fair JM_FAIRオブジェクト
	 */
	function _setPhotos($jm_fair) {
		$mihon_no = $jm_fair->get('mihon_no');
		$tmp_dir = '../www/'.$this->config->get('img_path').'work/';

		// ディレクトリ作成
		$dir_name = '../www/'.$this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no');
		mkdir($dir_name, 0777, true);

		$photos_1 = $jm_fair->get('photos_1');
		$photos_2 = $jm_fair->get('photos_2');
		$photos_3 = $jm_fair->get('photos_3');

		if ('' != $photos_1) {
			if (file_exists($tmp_dir.$photos_1)) {
				rename($tmp_dir.$photos_1, $dir_name.'/'.$photos_1);
			} else {
				echo "image file not exist [".$photos_1."]\n";
				$jm_fair->set('photos_1', '');
			}
		}
		if ('' != $photos_2) {
			if (file_exists($tmp_dir.$photos_2)) {
				rename($tmp_dir.$photos_2, $dir_name.'/'.$photos_2);
			} else {
				echo "image file not exist [".$photos_2."]\n";
				$jm_fair->set('photos_2', '');
			}
		}
		if ('' != $photos_3) {
			if (file_exists($tmp_dir.$photos_3)) {
				rename($tmp_dir.$photos_3, $dir_name.'/'.$photos_3);
			} else {
				echo "image file not exist [".$photos_3."]\n";
				$jm_fair->set('photos_3', '');
			}
		}
	}

	/**
	 * 見本市画像を保存するディレクトリ名を作成する。
	 * 一つのフォルダに10000件保存する。
	 * 0スタート。
	 *
	 * @param int $mihon_no 見本市番号
	 * @return string ディレクトリ名
	 */
	function _getImageDir($mihon_no) {
		return (string) ((int) ($mihon_no / $this->config->get('photos_dir_max')));
	}

	/**
	 * JM_USERに登録する。
	 *
	 * @param array $row ユーザ情報
	 */
	function _setJmUser($row) {
		$ary_col = explode("\t", $row);

		// 必須チェック
		// ユーザID
		if ('' == $ary_col[4]) {
			echo "not set user_id [".$row."]\n";
			return null;
		}
		// パスワード
		if ('' == $ary_col[5]) {
			// パスワード無しは一時的に下記を設定。
			$ary_col[5] = 'temp0000';
// 			echo "not set password [".$row."]\n";
// 			return null;
		}
		// メール
		if ('' == $ary_col[10]) {
			echo "not set email [".$row."]\n";
			return null;
		}
		// メールアドレスチェック
		if (!$this->_checkEmai($ary_col[10])) {
			echo "incorrect email [".$row."]\n";
			return null;
		}
		// 削除フラグ
		if ('2' == $ary_col[16] || '3' == $ary_col[16]) {
			echo "user deleted [".$row."]\n";
			return null;
		}

		$jm_user =& $this->backend->getObject('JmUser');

// 		$jm_user->set('user_id', $ary_col[]);
		$jm_user->set('password', $ary_col[5]);
		$jm_user->set('company_nm', $ary_col[6]);
		$jm_user->set('division_dept_nm', $ary_col[7]);
		$jm_user->set('user_nm', $ary_col[8]);
		$jm_user->set('gender_cd', $this->_getGenderCd($ary_col[9]));
		$jm_user->set('email', strtolower($ary_col[10]));
		$jm_user->set('post_code', $ary_col[11]);
		$jm_user->set('address', $ary_col[12]);
		$jm_user->set('tel', $ary_col[13]);
		$jm_user->set('fax', $ary_col[14]);
		$jm_user->set('url', $ary_col[15]);
		$jm_user->set('use_language_cd', $ary_col[17]);
		$jm_user->set('regist_result_notice_cd', '0');
		$jm_user->set('auth_gen', '1');
		$jm_user->set('auth_user', '0');
		$jm_user->set('auth_fair', '0');
		$jm_user->set('idpass_notice_cd', '2');
		$jm_user->set('del_flg', '0');
// 		$jm_user->set('del_date', $ary_col[]);
		$jm_user->set('regist_user_id', '0');
		$jm_user->set('regist_date', $ary_col[1]);
		if ('' != $ary_col[2]) {
			$jm_user->set('update_user_id', "0");
			$jm_user->set('update_date', $ary_col[2]);
		}

		$res = $jm_user->add();
		if (Ethna::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, 'jm_userの登録に失敗しました。['.$row.']');
			$this->ae->addObject('insert error.', $res);
			echo "fail to insert into jm_user [".$row."]\n";
			return null;
		}

		return $jm_user;
	}

	/**
	 * 性別を変換する。
	 *
	 * @param string $gender_cd 旧姓別
	 * @return string 性別コード
	 */
	function _getGenderCd($gender_cd) {
		if ('' == $gender_cd) {
			return '';
		}
		$ret = '';
		if ('MS.' == $gender_cd) {
			$ret = '1';
		} elseif ('MR.' == $gender_cd) {
			$ret = '0';
		}
		return $ret;
	}

	/**
	 * Eメールをチェックする。
	 *
	 * @param string $email
	 * @return boolean true:OK,false:NG
	 */
	function _checkEmai($email) {
		$ret = true;
		if('@' == substr($email, 0, 1) || '@' == substr($email, -1)){
			$ret = false;
		}
		if(1 != substr_count($email, '@')) {
			$ret = false;
		}
		return $ret;
	}

	/**
	 * JM_FAIRに登録する。
	 *
	 * @param array $row 見本市情報
	 */
	function _setJmFair($row) {
		$ary_col = explode("\t", $row);
		$jm_fair =& $this->backend->getObject('JmFair');

		// 必須チェック
		// ユーザID
		if ('' == $ary_col[13]) {
			$user =& $this->backend->getObject('TmpUserId');
			$user->set('user_id', 0);
			$user->set('use_language_cd', '0');
// 			echo "not set user_id [".$row."]\n";
// 			return null;
		} else {
			$user =& $this->_getUserId($ary_col[13]);
			if (null == $user) {
				$user =& $this->backend->getObject('TmpUserId');
				$user->set('user_id', 0);
				$user->set('use_language_cd', '0');
// 				echo "not found user_id [".$row."]\n";
// 				return null;
			}
		}

		$jm_fair->set('user_id', $user->get('user_id'));

		// 申請年月日 > 更新日 > 登録日
		if ('' != $ary_col[14]) {
			$jm_fair->set('date_of_application', $ary_col[14]);
		} else {
			if ('' != $ary_col[2]) {
				$jm_fair->set('date_of_application', $ary_col[2]);
			} else {
				$jm_fair->set('date_of_application', $ary_col[1]);
			}
		}
		// 登録日（承認日） > 登録日
		if ('' != $ary_col[15]) {
			$jm_fair->set('date_of_registration', $ary_col[15]);
		} else {
			$jm_fair->set('date_of_registration', $ary_col[1]);
		}

		$jm_fair->set('fair_title_jp', $ary_col[11]);
		$jm_fair->set('fair_title_en', str_replace('、', ',', $ary_col[17]));
		$jm_fair->set('abbrev_title', $ary_col[18]);
		$jm_fair->set('fair_url', $ary_col[19]);
// 		$jm_fair->set('mihon_no', $ary_col[]);

		$jm_fair->set('profile_jp', str_replace('<br>', '<br/>', $ary_col[20]));
		$jm_fair->set('profile_en', str_replace('、', ',', str_replace('<br>', '<br/>', $ary_col[21])));

		$jm_fair->set('detailed_information_jp', str_replace('<br>', '<br/>', $ary_col[22]));
		$jm_fair->set('detailed_information_en', str_replace('、', ',', str_replace('<br>', '<br/>', $ary_col[23])));

		$jm_fair->set('date_from_yyyy', substr($ary_col[24], 0, 4));
		$jm_fair->set('date_from_mm', substr($ary_col[24], 4, 2));
		if (1 == strlen($ary_col[25])) {
			$jm_fair->set('date_from_dd', '0'.$ary_col[25]);
		} elseif (2 == strlen($ary_col[25])) {
			$jm_fair->set('date_from_dd', $ary_col[25]);
		}

		$jm_fair->set('date_to_yyyy', substr($ary_col[26], 0, 4));
		$jm_fair->set('date_to_mm', substr($ary_col[26], 4, 2));
		if (1 == strlen($ary_col[27])) {
			$jm_fair->set('date_to_dd', '0'.$ary_col[27]);
		} elseif (2 == strlen($ary_col[27])) {
			$jm_fair->set('date_to_dd', $ary_col[27]);
		}
		$jm_fair->set('frequency', $this->_getFrequencyCode($ary_col[28], $ary_col[29]));

		$ary_industory = $this->_getIndustory($ary_col, $row);
		$n = 1;
		foreach ($ary_industory as $industory_list) {
			if (6 == strlen($industory_list)) {
				$jm_fair->set('main_industory_'.$n, substr($industory_list, 0, 3));
				$jm_fair->set('sub_industory_'.$n, substr($industory_list, 3, 3));
				$n++;
			}
		}
// 		$jm_fair->set('main_industory_1', $ary_col[]);
// 		$jm_fair->set('sub_industory_1', $ary_col[]);
// 		$jm_fair->set('main_industory_2', $ary_col[]);
// 		$jm_fair->set('sub_industory_2', $ary_col[]);
// 		$jm_fair->set('main_industory_3', $ary_col[]);
// 		$jm_fair->set('sub_industory_3', $ary_col[]);
// 		$jm_fair->set('main_industory_4', $ary_col[]);
// 		$jm_fair->set('sub_industory_4', $ary_col[]);
// 		$jm_fair->set('main_industory_5', $ary_col[]);
// 		$jm_fair->set('sub_industory_5', $ary_col[]);
// 		$jm_fair->set('main_industory_6', $ary_col[]);
// 		$jm_fair->set('sub_industory_6', $ary_col[]);

		$jm_fair->set('exhibits_jp', str_replace('<br>', '<br/>', $ary_col[54]));
		$jm_fair->set('exhibits_en', str_replace('、', ',', str_replace('<br>', '<br/>', $ary_col[55])));

		$region = $this->_getRegionCode($ary_col[56], $row);
		$jm_fair->set('region', $region);
		$country = $this->_getCountryCode($region, $ary_col[58], $row);
		$jm_fair->set('country', $country);
		$city = $this->_getCityCode($region, $country, $ary_col[60], $row);
		$jm_fair->set('city', $city);

		// 都市、その他都市のチェック
		if ('' == $ary_col[60] && '' == $ary_col[62] && '' == $ary_col[63]) {
			echo "city is blank [".$row."]\n";
		}

		$jm_fair->set('other_city_jp', $ary_col[62]);
		$jm_fair->set('other_city_en', $ary_col[63]);

		$jm_fair->set('venue_jp', $ary_col[64]);
		$jm_fair->set('venue_en', $ary_col[65]);

		$jm_fair->set('venue_url', '');

		$jm_fair->set('gross_floor_area', $ary_col[127]);

		$jm_fair->set('transportation_jp', '');
		$jm_fair->set('transportation_en', '');

		$jm_fair->set('open_to', $this->_getOpenTo($ary_col[68], $ary_col[69]));

		$jm_fair->set('admission_ticket_1', '' == $ary_col[70] ? '0' : '1');
		$jm_fair->set('admission_ticket_2', '' == $ary_col[71] ? '0' : '1');
		$jm_fair->set('admission_ticket_3', '' == $ary_col[72] ? '0' : '1');
		$jm_fair->set('admission_ticket_4', '' == $ary_col[73] ? '0' : '1');
 		$jm_fair->set('sum_ticket', $this->_getSumTicket($ary_col));
		$jm_fair->set('other_admission_ticket_jp', $ary_col[74]);
		$jm_fair->set('other_admission_ticket_en', $ary_col[81]);

		$jm_fair->set('year_of_the_trade_fair', $ary_col[82]);
		$jm_fair->set('total_number_of_visitor', $ary_col[83]);
		$jm_fair->set('number_of_foreign_visitor', $ary_col[84]);
		$jm_fair->set('total_number_of_exhibitors', $ary_col[85]);
		$jm_fair->set('number_of_foreign_exhibitors', $ary_col[86]);
		$jm_fair->set('net_square_meters', $ary_col[87]);
		$jm_fair->set('spare_field1', '');

		$jm_fair->set('app_dead_yyyy', '');
		$jm_fair->set('app_dead_mm', '');
		$jm_fair->set('app_dead_dd', '');

		$jm_fair->set('organizer_jp', $ary_col[89]);
		$jm_fair->set('organizer_en', $ary_col[90]);
		$jm_fair->set('organizer_tel', $ary_col[91]);
		$jm_fair->set('organizer_fax', $ary_col[92]);
		$jm_fair->set('organizer_email', $ary_col[93]);
		$jm_fair->set('organizer_addr', $ary_col[120]);
		$jm_fair->set('organizer_div', $ary_col[121]);
		$jm_fair->set('organizer_pers', $ary_col[122]);

		$jm_fair->set('agency_in_japan_jp', $ary_col[94]);
		$jm_fair->set('agency_in_japan_en', $ary_col[95]);
		$jm_fair->set('agency_in_japan_tel', $ary_col[96]);
		$jm_fair->set('agency_in_japan_fax', $ary_col[97]);
		$jm_fair->set('agency_in_japan_email', $ary_col[98]);
		$jm_fair->set('agency_in_japan_addr', $ary_col[123]);
		$jm_fair->set('agency_in_japan_div', $ary_col[124]);
		$jm_fair->set('agency_in_japan_pers', $ary_col[125]);

		$jm_fair->set('photos_1', $ary_col[3]);
		$jm_fair->set('photos_2', $ary_col[4]);
		$jm_fair->set('photos_3', $ary_col[5]);

		$jm_fair->set('select_language_info', '2');

		$jm_fair->set('report_link', $ary_col[99]);
		$jm_fair->set('venue_link', $ary_col[100]);

		$jm_fair->set('keyword', '');

		$jm_fair->set('jetro_suport', '');
		$jm_fair->set('jetro_suport_url', '');

		$jm_fair->set('use_language_flag', $user->get('use_language_cd'));

		$jm_fair->set('web_display_type', '1');
		$jm_fair->set('regist_type', '0');

		$jm_fair->set('regist_category', $this->_getRegistCategory($ary_col[12]));

		$jm_fair->set('note_for_system_manager', $ary_col[102]);
		$jm_fair->set('note_for_data_manager', $ary_col[103]);

		$jm_fair->set('confirm_flag', $this->_getConfirmFlag($ary_col[104]));
		$jm_fair->set('negate_comment', $ary_col[107]);

		$jm_fair->set('mail_send_flag', '0');

		$jm_fair->set('del_flg', '0');
// 		$jm_fair->set('del_date', $ary_col[]);

// 		$jm_fair->set('search_key', $ary_col[]);

		$jm_fair->set('regist_user_id', $user->get('user_id'));
		$jm_fair->set('regist_date', $ary_col[1]);
		if ('' != $ary_col[2]) {
			$jm_fair->set('update_user_id', $user->get('user_id'));
			$jm_fair->set('update_date', $ary_col[2]);
		}

		// 「文書番号」追加
		$jm_fair->set('doc_no', $ary_col[0]);

		$res = $jm_fair->add();
		if (Ethna::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, 'jm_fairの登録に失敗しました。['.$row.']');
			$this->ae->addObject('insert error.', $res);
			echo "fail to insert into jm_fair [".$row."]\n";
		}

		return $jm_fair;
	}

	/**
	 * 登録カテゴリを取得する。
	 *
	 * @param int $mihon_no 旧見本市番号
	 * @return string 登録カテゴリ
	 */
	function _getRegistCategory($mihon_no) {
		$ret = '';
		if (50000 <= $mihon_no && 59999 >= $mihon_no) {
			$ret = '0';
		} elseif ((20000 <= $mihon_no && 29999 >= $mihon_no) || (40000 <= $mihon_no && 49999 >= $mihon_no) || (60000 <= $mihon_no && 69999 >= $mihon_no)) {
			$ret = '1';
		} elseif (70000 <= $mihon_no && 79999 >= $mihon_no) {
			$ret = '2';
		} else {
			$ret = '9';
		}
		return $ret;
	}

	/**
	 * 承認フラグを取得。
	 *
	 * @param string $confirm_flag 承認フラグ（旧）
	 * @return string 承認フラグ
	 */
	function _getConfirmFlag($confirm_flag) {
		if ('' == $confirm_flag) {
			return '';
		}
		$ret = '';
		if ('0' == $confirm_flag) {
			$ret = '1';
		} elseif ('1' == $confirm_flag) {
			$ret = '0';
		} elseif ('2' == $confirm_flag) {
			$ret = '2';
		}
		return $ret;
	}

	/**
	 * チケット入手方法の集計先を取得。
	 *
	 * @param array $ary_col JM_FAIR配列
	 * @return string チケット入手方法の集計先
	 */
	function _getSumTicket($ary_col) {
		$ret = '0';
		if ('' != $ary_col[70]) {
			$ret = '1';
		} elseif ('' != $ary_col[71]) {
			$ret = '2';
		} elseif ('' != $ary_col[72]) {
			$ret = '3';
		} elseif ('' != $ary_col[73]) {
			$ret = '4';
		} elseif ('' != $ary_col[74] || '' != $ary_col[81]) {
			$ret = '5';
		} else {
			$ret = '0';
		}
		return $ret;
	}

	/**
	 * 入場資格のコード値を取得。
	 *
	 * @param string $open_to_jp 入場資格（日）
	 * @param string $open_to_en 入場資格（英）
	 */
	function _getOpenTo($open_to_jp, $open_to_en) {
		if ('' != $open_to_jp) {
			$open_to = $open_to_jp;
		} elseif ('' != $open_to_en) {
			$open_to = $open_to_en;
		} else {
			return '';
		}
		$ret = '';
		if ('一般' == $open_to || 'General public' == $open_to) {
			$ret = '001';
		} elseif ('ビジネス関係者＆一般' == $open_to ||  'Trade & general public' == $open_to
			|| '業者＆一般' == $open_to || 'Trade Visitors & Public' == $open_to) {
			$ret = '002';
		} elseif ('ビジネス関係者のみ' == $open_to || 'Trade only' == $open_to
			|| '業者専用' == $open_to || 'Trade Visitors' == $open_to) {
			$ret = '003';
		}
		return $ret;
	}

	/**
	 * 都市コードを取得。
	 *
	 * @param string $kbn_2 地域コード
	 * @param string $kbn_3 国・地域コード
	 * @param string $city 都市名
	 * @param string $row 入力文字列
	 * @return string 都市コード
	 */
	function _getCityCode($kbn_2, $kbn_3, $city, $row) {
		if ('' == $kbn_2 || '' == $kbn_3 || '' == $city) {
			return '';
		}
		$jm_code_m =& $this->backend->getManager('JmCodeM');
		$kbn_4 = $jm_code_m->getCityCode($kbn_2, $kbn_3, $city);
		if (null == $kbn_4) {
			echo "city code is not found [".$kbn_2.$kbn_3.$city."][".$row."]\n";
			return '';
		}
		return $kbn_4;

	}

	/**
	 * 国・地域コードを取得。
	 *
	 * @param string $kbn_2 地域コード
	 * @param string $country 国・地域名
	 * @param string $row 入力文字列
	 * @return string 国・地域コード
	 */
	function _getCountryCode($kbn_2, $country, $row) {
		if ('' == $kbn_2 || '' == $country) {
			echo "country is blank [".$row."]\n";
			return '';
		}
		$jm_code_m =& $this->backend->getManager('JmCodeM');
		$kbn_3 = $jm_code_m->getCountryCode($kbn_2, $country);
		if (null == $kbn_3) {
			echo "country code is not found [".$kbn_2.$country."][".$row."]\n";
			return '';
		}
		return $kbn_3;
	}

	/**
	 * 地域コードを取得。
	 *
	 * @param string $region 地域名
	 * @param string $row 入力文字列
	 * @return string 地域のコード値
	 */
	function _getRegionCode($region, $row) {
		if ('' == $region) {
			echo "reagion is blank [".$row."]\n";
			return '';
		}
		$jm_code_m =& $this->backend->getManager('JmCodeM');
		$kbn_2 = $jm_code_m->getRegionCode($region);
		if (null == $kbn_2) {
			echo "region code is not found [".$region."][".$row."]\n";
			return '';
		}
		return $kbn_2;
	}

	/**
	 * 業種のコード値を取得。
	 *
	 * @param array $ary_col 見本市配列
	 * @param string $row 入力文字列
	 * @return array 業種配列<大分類.小分類>
	 */
	function _getIndustory($ary_col, $row) {
		// 全て空文字の場合エラー
		if (
			'' == $ary_col[30] &&
			'' == $ary_col[31] &&
			'' == $ary_col[32] &&
			'' == $ary_col[33] &&
			'' == $ary_col[34] &&
			'' == $ary_col[35] &&

			'' == $ary_col[42] &&
			'' == $ary_col[43] &&
			'' == $ary_col[44] &&
			'' == $ary_col[45] &&
			'' == $ary_col[46] &&
			'' == $ary_col[47]
		) {
			echo "industry all blank [".$row."]\n";
		}

		// コードに変換
		$main_industory_1 = $this->_getMainIndustoryCode($ary_col[30], $row);
		$main_industory_2 = $this->_getMainIndustoryCode($ary_col[31], $row);
		$main_industory_3 = $this->_getMainIndustoryCode($ary_col[32], $row);
		$main_industory_4 = $this->_getMainIndustoryCode($ary_col[33], $row);
		$main_industory_5 = $this->_getMainIndustoryCode($ary_col[34], $row);
		$main_industory_6 = $this->_getMainIndustoryCode($ary_col[35], $row);
		$sub_industory_1 = $this->_getSubIndustoryCode($main_industory_1, $ary_col[42], $row);
		$sub_industory_2 = $this->_getSubIndustoryCode($main_industory_2, $ary_col[43], $row);
		$sub_industory_3 = $this->_getSubIndustoryCode($main_industory_3, $ary_col[44], $row);
		$sub_industory_4 = $this->_getSubIndustoryCode($main_industory_4, $ary_col[45], $row);
		$sub_industory_5 = $this->_getSubIndustoryCode($main_industory_5, $ary_col[46], $row);
		$sub_industory_6 = $this->_getSubIndustoryCode($main_industory_6, $ary_col[47], $row);

// 		// 前回バグ
// 		if (
// 			('' != $main_industory_2 && $main_industory_1 != $main_industory_2) ||
// 			('' != $main_industory_3 && $main_industory_1 != $main_industory_3) ||
// 			('' != $main_industory_4 && $main_industory_1 != $main_industory_4) ||
// 			('' != $main_industory_5 && $main_industory_1 != $main_industory_5) ||
// 			('' != $main_industory_6 && $main_industory_1 != $main_industory_6))
// 		{
// 			echo "industry bug [".$row."]\n";
// 		}

		// 大小連結し配列に
		$ary_industory_tmp = array();
		if ('' != $main_industory_1.$sub_industory_1) {
			array_push($ary_industory_tmp, $main_industory_1.$sub_industory_1);
		}
		if ('' != $main_industory_2.$sub_industory_2) {
			array_push($ary_industory_tmp, $main_industory_2.$sub_industory_2);
		}
		if ('' != $main_industory_3.$sub_industory_3) {
			array_push($ary_industory_tmp, $main_industory_3.$sub_industory_3);
		}
		if ('' != $main_industory_4.$sub_industory_4) {
			array_push($ary_industory_tmp, $main_industory_4.$sub_industory_4);
		}
		if ('' != $main_industory_5.$sub_industory_5) {
			array_push($ary_industory_tmp, $main_industory_5.$sub_industory_5);
		}
		if ('' != $main_industory_6.$sub_industory_6) {
			array_push($ary_industory_tmp, $main_industory_6.$sub_industory_6);
		}

		// 重複削除
		$ary_industory = array_unique($ary_industory_tmp);

		return $ary_industory;
	}

	/**
	 * 業種（小分類）のコード値を取得する。
	 *
	 * @param string $main_industory 業種（大分類）のコード値
	 * @param string $sub_industory_name 業種（小分類）名
	 * @param string $row 入力文字列
	 * @return string|unknown 業種（小分類）のコード値
	 */
	function _getSubIndustoryCode($main_industory, $sub_industory_name, $row) {
		if ('' == $main_industory || '' == $sub_industory_name) {
			return '';
		}
		$jm_code_m =& $this->backend->getManager('JmCodeM');
		$kbn_3 = $jm_code_m->getSubIndustoryCode($main_industory, $sub_industory_name);
		if (null == $kbn_3) {
			echo "sub industry code is not found [".$main_industory.$sub_industory_name."][".$row."]\n";
			return '';
		}
		return $kbn_3;
	}

	/**
	 * 業種（大分類）のコード値を取得する。
	 *
	 * @param string $main_industory_name 業種（大分類）名
	 * @param string $row 入力文字列
	 * @return string 業種（大分類）のコード値
	 */
	function _getMainIndustoryCode($main_industory_name, $row) {
		if ('' == $main_industory_name) {
			return '';
		}
		$jm_code_m =& $this->backend->getManager('JmCodeM');
		$kbn_2 = $jm_code_m->getMainIndustoryCode($main_industory_name);
		if (null == $kbn_2) {
			echo "main industry code is not found [".$main_industory_name."][".$row."]\n";
			return '';
		}
		return $kbn_2;
	}

	/**
	 * 開催頻度のコード値を取得。
	 *
	 * @param string $frequency_jp 開催頻度（日）
	 * @param string $frequency_en 開催頻度（英）
	 * @return string 開催頻度（コード）
	 */
	function _getFrequencyCode($frequency_jp, $frequency_en) {
		$ret = '009';
		if ('' != $frequency_jp) {
			$frequency = $frequency_jp;
		} elseif ('' != $frequency_en) {
			$frequency = $frequency_en;
		} else {
			return '009';
		}

		if ('毎年' == $frequency || 'Annual' == $frequency) {
			$ret = '001';
		} elseif ('1年に2回' == $frequency || 'Twice a year' == $frequency) {
			$ret = '002';
		} elseif ('1年に3回以上' == $frequency || 'Three times or more a year' == $frequency) {
			$ret = '003';
		} elseif ('2年に1回' == $frequency || 'Once in 2 years' == $frequency) {
			$ret = '004';
		} elseif ('3年に1回' == $frequency || 'Once in 3 years' == $frequency) {
			$ret = '005';
		} elseif ('4年に1回' == $frequency || 'Once in 4 years' == $frequency) {
			$ret = '006';
		} elseif ('5年に1回' == $frequency || 'Once in 5 years' == $frequency) {
			$ret = '007';
		} elseif ('不定期' == $frequency || 'Irregular' == $frequency) {
			$ret = '008';
		} else {
			$ret = '009';
		}

		return $ret;
	}

	/**
	 * 新ユーザIDをTMP_USER_IDから取得する。
	 *
	 * @param string $old_user_id TMP_USER_IDオブジェクト
	 */
	function _getUserId($old_user_id) {
		$tmp_user_id =& $this->backend->getObject('TmpUserId', 'old_user_id', $old_user_id);
		if (null == $tmp_user_id || null == $tmp_user_id->get('user_id') || $old_user_id != $tmp_user_id->get('old_user_id')) {
			echo "not found user : ".$old_user_id."\n";
			return null;
		}

		return $tmp_user_id;
	}

	/**
	 * 新旧ユーザIDをTMP_USER_IDに登録する。
	 *
	 * @param unknown_type $row
	 * @param unknown_type $jm_user
	 */
	function _setUserId($row, $jm_user) {
		$ary_col = explode("\t", $row);

		$old_user_id = $ary_col[4];
		$user_id = $jm_user->get('user_id');
		$use_language_cd = $jm_user->get('use_language_cd');

		$tmp_user_id =& $this->backend->getObject('TmpUserId');

		$tmp_user_id->set('old_user_id', $old_user_id);
		$tmp_user_id->set('user_id', $user_id);
		$tmp_user_id->set('use_language_cd', $use_language_cd);

		$res = $tmp_user_id->add();
		if (Ethna::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, 'tmp_user_idの登録に失敗しました。['.$row.']');
			$this->ae->addObject('insert error.', $res);
			echo "fail to insert into tmp_user_id [".$row."]\n";
			return null;
		}
	}

	/**
	 * トランザクションの開始。
	 *
	 */
	function _begin() {
		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();
	}

	/**
	 * トランザクションの終了。
	 *
	 */
	function _end() {
		$db = $this->backend->getDB();
// 		if (0 < $this->ae->count()) {
// 			$db->rollback();
// 		} else {
// 			$db->commit();
// 		}
		$db->commit();
	}
}

?>
