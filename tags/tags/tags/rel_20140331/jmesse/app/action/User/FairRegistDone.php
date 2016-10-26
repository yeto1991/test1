<?php
/**
 *  User/FairRegistDone.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairRegistStep1.php';

/**
 *  user_fairRegistDone Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserFairRegistDone extends Jmesse_Form_UserFairRegistStep1
{
}

/**
 *  user_fairRegistDone action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserFairRegistDone extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_fairRegistDone Action.
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
			return 'user_login';
		}

		// 見本市番号
		if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
			if ('' == $this->af->get('mihon_no')) {
				$this->ae->add('error', 'システムエラーが発生しました。');
			}
		}

		// SESSIONのチェック
		if (null == $this->session->get('regist_param_1')) {
			$this->ae->add('error', 'システムエラーが発生しました。');
		}
		if (null == $this->session->get('regist_param_2')) {
			$this->ae->add('error', 'システムエラーが発生しました。');
		}
		if (null == $this->session->get('regist_param_3')) {
			$this->ae->add('error', 'システムエラーが発生しました。');
		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラーが発生しました。');
			return 'error';
		}

		return null;
	}

	/**
	 *  user_fairRegistDone action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		if ('c' == $this->af->get('mode')) {
			$url = $this->config->get('url').'?action_user_fairRegistFinish=true&msg=c';
		} else {
			$url = $this->config->get('url').'?action_user_fairRegistFinish=true&msg=r';
		}

		if (Ethna_Util::isDuplicatePost()) {
			// 二重POSTの場合
			$this->backend->getLogger()->log(LOG_WARNING, '二重POST');
			header('Location: '.$url);
			return null;
		}

		// 修正登録の場合、旧日本一番号を保持する。
		if ('e' == $this->af->get('mode')) {
			$mihon_no_old = $this->af->get('mihon_no');
		}

		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		// オブジェクトの取得
		if ('c' == $this->af->get('mode')) {
			$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $this->af->get('mihon_no'));
			if (Ethna::isError($jm_fair)) {
				$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
				$this->ae->adObject('error', $jm_fair);
				$db->rollback();
				return 'error';
			}
			if (null == $jm_fair || $this->af->get('mihon_no') != $jm_fair->get('mihon_no')) {
				$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
				$this->ae->add('error', 'システムエラーが発生しました。');
				$db->rollback();
				return 'error';
			}
			if ($this->session->get('user_id') != $jm_fair->get('user_id')) {
				$this->backend->getLogger()->log(LOG_ERR, '他人の見本市'.$this->session->get('user_id').' '.$jm_fair->get('user_id'));
				$this->ae->add('error', 'システムエラーが発生しました。');
				$db->rollback();
				return 'error';
			}
		} else {
			$jm_fair =& $this->backend->getObject('JmFair');
		}

		// SESSIONからOBJECTに設定
		$br = $this->af->get('br');
		$regist_param_1 = $this->session->get('regist_param_1');
		$regist_param_2 = $this->session->get('regist_param_2');
		$regist_param_3 = $this->session->get('regist_param_3');
		$jm_fair->set('user_id', $this->session->get('user_id'));
		$jm_fair->set('fair_title_jp', $regist_param_1['fair_title_jp']);
		$jm_fair->set('abbrev_title', $regist_param_1['abbrev_title']);
		$jm_fair->set('fair_url', $regist_param_1['fair_url']);
		$jm_fair->set('date_from_yyyy', $regist_param_1['date_from_yyyy']);
		$jm_fair->set('date_from_mm', $regist_param_1['date_from_mm']);
		$jm_fair->set('date_from_dd', $regist_param_1['date_from_dd']);
		$jm_fair->set('date_to_yyyy', $regist_param_1['date_to_yyyy']);
		$jm_fair->set('date_to_mm', $regist_param_1['date_to_mm']);
		$jm_fair->set('date_to_dd', $regist_param_1['date_to_dd']);
		$jm_fair->set('frequency', $regist_param_1['frequency']);
		$jm_fair->set('main_industory_1', $regist_param_1['main_industory_1']);
		$jm_fair->set('sub_industory_1', $regist_param_1['sub_industory_1']);
		$jm_fair->set('main_industory_2', $regist_param_1['main_industory_2']);
		$jm_fair->set('sub_industory_2', $regist_param_1['sub_industory_2']);
		$jm_fair->set('main_industory_3', $regist_param_1['main_industory_3']);
		$jm_fair->set('sub_industory_3', $regist_param_1['sub_industory_3']);
		$jm_fair->set('main_industory_4', $regist_param_1['main_industory_4']);
		$jm_fair->set('sub_industory_4', $regist_param_1['sub_industory_4']);
		$jm_fair->set('main_industory_5', $regist_param_1['main_industory_5']);
		$jm_fair->set('sub_industory_5', $regist_param_1['sub_industory_5']);
		$jm_fair->set('main_industory_6', $regist_param_1['main_industory_6']);
		$jm_fair->set('sub_industory_6', $regist_param_1['sub_industory_6']);
		$jm_fair->set('exhibits_jp', str_replace($br, '<br/>', $regist_param_1['exhibits_jp']));
		$jm_fair->set('region', $regist_param_1['region']);
		$jm_fair->set('country', $regist_param_1['country']);
		$jm_fair->set('city', $regist_param_1['city']);
		$jm_fair->set('other_city_jp', $regist_param_1['other_city_jp']);
		$jm_fair->set('venue_jp', $regist_param_1['venue_jp']);
		$jm_fair->set('gross_floor_area', $regist_param_1['gross_floor_area']);
// 		$jm_fair->set('transportation_jp', $regist_param_1['transportation_jp']);
		$jm_fair->set('open_to', $regist_param_1['open_to']);
		$jm_fair->set('admission_ticket_1', $regist_param_1['admission_ticket_1']);
		$jm_fair->set('admission_ticket_2', $regist_param_1['admission_ticket_2']);
		$jm_fair->set('admission_ticket_3', $regist_param_1['admission_ticket_3']);
		$jm_fair->set('admission_ticket_4', $regist_param_1['admission_ticket_4']);
		$jm_fair->set('other_admission_ticket_jp', $regist_param_1['other_admission_ticket_jp']);
		$jm_fair->set('sum_ticket', $this->_getSumTicket($regist_param_1));
// 		$jm_fair->set('app_dead_yyyy', $regist_param_1['app_dead_yyyy']);
// 		$jm_fair->set('app_dead_mm', $regist_param_1['app_dead_mm']);
// 		$jm_fair->set('app_dead_dd', $regist_param_1['app_dead_dd']);
		$jm_fair->set('year_of_the_trade_fair', $regist_param_2['year_of_the_trade_fair']);
		$jm_fair->set('total_number_of_visitor', $regist_param_2['total_number_of_visitor']);
		$jm_fair->set('number_of_foreign_visitor', $regist_param_2['number_of_foreign_visitor']);
		$jm_fair->set('total_number_of_exhibitors', $regist_param_2['total_number_of_exhibitors']);
		$jm_fair->set('number_of_foreign_exhibitors', $regist_param_2['number_of_foreign_exhibitors']);
		$jm_fair->set('net_square_meters', $regist_param_2['net_square_meters']);
		$jm_fair->set('profile_jp', str_replace($br, '<br/>', $regist_param_2['profile_jp']));
		$jm_fair->set('detailed_information_jp', str_replace($br, '<br/>', $regist_param_2['detailed_information_jp']));
		$jm_fair->set('photos_1', $regist_param_2['photos_name_1']);
		$jm_fair->set('photos_2', $regist_param_2['photos_name_2']);
		$jm_fair->set('photos_3', $regist_param_2['photos_name_3']);
		$jm_fair->set('keyword', $regist_param_2['keyword']);
		$jm_fair->set('organizer_jp', $regist_param_2['organizer_jp']);
		$jm_fair->set('organizer_addr', $regist_param_2['organizer_addr']);
		$jm_fair->set('organizer_div', $regist_param_2['organizer_div']);
		$jm_fair->set('organizer_pers', $regist_param_2['organizer_pers']);
		$jm_fair->set('organizer_tel', $regist_param_2['organizer_tel']);
		$jm_fair->set('organizer_fax', $regist_param_2['organizer_fax']);
		$jm_fair->set('organizer_email', $regist_param_2['organizer_email']);
		$jm_fair->set('agency_in_japan_jp', $regist_param_2['agency_in_japan_jp']);
		$jm_fair->set('agency_in_japan_addr', $regist_param_2['agency_in_japan_addr']);
		$jm_fair->set('agency_in_japan_div', $regist_param_2['agency_in_japan_div']);
		$jm_fair->set('agency_in_japan_pers', $regist_param_2['agency_in_japan_pers']);
		$jm_fair->set('agency_in_japan_tel', $regist_param_2['agency_in_japan_tel']);
		$jm_fair->set('agency_in_japan_fax', $regist_param_2['agency_in_japan_fax']);
		$jm_fair->set('agency_in_japan_email', $regist_param_2['agency_in_japan_email']);
		$jm_fair->set('select_language_info', $regist_param_3['select_language_info']);
		$jm_fair->set('fair_title_en', $regist_param_3['fair_title_en']);
		$jm_fair->set('profile_en', str_replace($br, '<br/>', $regist_param_3['profile_en']));
		$jm_fair->set('detailed_information_en', str_replace($br, '<br/>', $regist_param_3['detailed_information_en']));
		$jm_fair->set('exhibits_en', str_replace($br, '<br/>', $regist_param_3['exhibits_en']));
		$jm_fair->set('other_city_en', $regist_param_3['other_city_en']);
		$jm_fair->set('venue_en', $regist_param_3['venue_en']);
// 		$jm_fair->set('transportation_en', $regist_param_3['transportation_en']);
		$jm_fair->set('other_admission_ticket_en', $regist_param_3['other_admission_ticket_en']);
		$jm_fair->set('spare_field1', $regist_param_3['spare_field1']);
		$jm_fair->set('organizer_en', $regist_param_3['organizer_en']);
		$jm_fair->set('agency_in_japan_en', $regist_param_3['agency_in_japan_en']);

		// 申請年月日
		$jm_fair->set('date_of_application', date('Y/m/d H:i:s'));
		// 承認フラグ = 未承認
		$jm_fair->set('confirm_flag', '0');
		// 否認コメント初期化
		$jm_fair->set('negate_comment', '');

		// 登録種別
		if ('e' == $this->af->get('mode')) {
			// コピー
			$jm_fair->set('regist_type', '1');
		} elseif ('c' != $this->af->get('mode')) {
			// 新規
			$jm_fair->set('regist_type', '0');
		}

		// MOD-S 2012.02.03 登録カテゴリ追加対応
		//登録カテゴリ ([0：ユーザによる登録])
		$jm_fair->set('regist_category', '0');
		// MOD-E 2012.02.03 登録カテゴリ追加対応

		// フリーワード検索用カラム作成
		$jm_fair->set('search_key', $this->_makeSearchKey($jm_fair));

		if ('c' == $this->af->get('mode')) {
			// 更新者ID
			$jm_fair->set('update_user_id', $this->session->get('user_id'));
			// 更新日
			$jm_fair->set('update_date', date('Y/m/d H:i:s'));

			// UPDATE
			$ret = $jm_fair->update();
			$ope_kbn = '3';
		} else {
			// ユーザ使用言語(日本語)
			$jm_fair->set('use_language_flag', '0');
			// Webページの表示/非表示(表示)
			$jm_fair->set('web_display_type', '1');
			// メール送信フラグ(送信する)
			$jm_fair->set('mail_send_flag', '0');
			// 削除フラグ(未削除)
			$jm_fair->set('del_flg', '0');
			// 登録日（承認日）
			$jm_fair->set('date_of_registration', date('Y/m/d H:i:s'));
			// 登録者ID
			$jm_fair->set('regist_user_id', $this->session->get('user_id'));
			// 登録日
			$jm_fair->set('regist_date', date('Y/m/d H:i:s'));

			// INSERT
			$ret = $jm_fair->add();
			$ope_kbn = '2';
		}
		if (Ethna::isError($ret)) {
			$msg = 'JM_FAIRテーブルへの登録に失敗しました。';
			$this->backend->getLogger()->log(LOG_ERR, $msg);
			$this->ae->addObject('error', $ret);
			//tmpディレクトリ強制削除
			system("rm -rf ".$this->session->get('img_tmp_path'));
			$db->rollback();
			return 'error';
		}
		$this->backend->getLogger()->log(LOG_DEBUG, '■mihon_no : '.$jm_fair->get('mihon_no'));

		//MOD-S 2012.08.13 保守：画像処理エラー対応
		//画像ファイル操作処理（各モードによって処理が異なる。モード(e:見本市コピー登録,c:見本市修正、新規登録はモード無し）
		//各処理でエラーの場合は、
		//①「システムエラー」画面へ遷移
		//②logにエラー情報を出力
		//③DB登録はRollback（採番された見本市番号は欠番となる（MySqlのオートインクリメント仕様のため）
		//④処理対象tmpフォルダの強制削除
		//[補足]copy関数は、コピー先に同名ファイルが存在する場合、上書き。

		// ディレクトリ作成
		$dir_name = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no');
		if (!is_dir($dir_name)) {
			$mkdirResult = mkdir($dir_name, 0777, true);
			if(!$mkdirResult){
				$this->backend->getLogger()->log(LOG_ERR, '[見本市新規登録またはコピー登録 システムエラー]:新見本市番号ディレクトリ作成失敗');
				$this->backend->getLogger()->log(LOG_ERR, '[対象ディレクトリ]:'.$dir_name);
				$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
				//tmpディレクトリ強制削除
				system("rm -rf ".$this->session->get('img_tmp_path'));
				$db->rollback();
				return 'error';
			}
		}

		//[見本市修正の場合]
		if ('c' == $this->af->get('mode')){
			//[処理①]対象フォルダ内の削除対象ファイルを削除
			$ary_del_photos_name = $regist_param_2['del_photos_name'];
			for ($i = 0; $i < count($ary_del_photos_name); $i++) {
				if ('' != $ary_del_photos_name[$i]) {
					$filename_del = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no').'/'.$ary_del_photos_name[$i];
					//削除対象ファイルの存在確認
					if(file_exists($filename_del)){
						//ファイル削除
						$deleteResult_as_editMode = unlink($filename_del);
						if(!$deleteResult_as_editMode){
							$this->backend->getLogger()->log(LOG_ERR, '[見本市修正 システムエラー]:削除対象ファイルの削除処理失敗');
							$this->backend->getLogger()->log(LOG_ERR, '[削除対象ファイル]:'.$filename_del);
							$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
							//tmpディレクトリ強制削除
							system("rm -rf ".$this->session->get('img_tmp_path'));
							$db->rollback();
							return 'error';
						}
// 					}else{
// 						$this->backend->getLogger()->log(LOG_ERR, '[見本市修正 システムエラー]:削除対象ファイルの存在確認失敗');
// 						$this->backend->getLogger()->log(LOG_ERR, '[存在未確認ファイル]:'.$filename_del);
// 						$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
// 						//tmpディレクトリ強制削除
// 						system("rm -rf ".$this->session->get('img_tmp_path'));
// 						$db->rollback();
// 						return 'error';
					}
				}
			}

			//[処理②]tmpディレクトリ内の新規アップロードファイル→修正対象見本市番号のディレクトリへコピー
			$ary_photos_name = array($regist_param_2['photos_name_1'], $regist_param_2['photos_name_2'], $regist_param_2['photos_name_3']);
			for ($i = 0; $i < count($ary_photos_name); $i++) {
				$photos_name = $ary_photos_name[$i];
				if ('' != $photos_name) {
					$filename_from_temp = $this->session->get('img_tmp_path').'/'.$photos_name;
					//コピー元ファイルの存在確認
					if(file_exists($filename_from_temp)){
						$filename_to_save = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no').'/'.$photos_name;
						$copyResult_as_editMode = copy($filename_from_temp, $filename_to_save);
						if(!$copyResult_as_editMode){
							//コピー失敗
							$this->backend->getLogger()->log(LOG_ERR, '[見本市修正 システムエラー]:新規アップロードファイルのコピー処理失敗');
							$this->backend->getLogger()->log(LOG_ERR, '[新規アップロードファイル]:'.$filename_from_temp);
							$this->backend->getLogger()->log(LOG_ERR, '[コピー先ファイル]:'.$filename_to_save);
							$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
							//tmpディレクトリ強制削除
							system("rm -rf ".$this->session->get('img_tmp_path'));
							$db->rollback();
							return 'error';
						}
// 					}else{
// 						$this->backend->getLogger()->log(LOG_ERR, '[見本市修正 システムエラー]:新規アップロードファイルの存在確認失敗');
// 						$this->backend->getLogger()->log(LOG_ERR, '[存在未確認ファイル]:'.$filename_from_temp);
// 						$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
// 						//tmpディレクトリ強制削除
// 						system("rm -rf ".$this->session->get('img_tmp_path'));
// 						$db->rollback();
// 						return 'error';
					}
				}
			}
		}

		//[見本市コピー登録の場合]
		if ('e' == $this->af->get('mode')){
			//[処理①]コピー元ディレクトリ内に新規アップロードファイルと同名ファイルがあればコピー
			$ary_photos_name = array($regist_param_2['photos_name_1'], $regist_param_2['photos_name_2'], $regist_param_2['photos_name_3']);
			for ($i = 0; $i < count($ary_photos_name); $i++) {
				$photos_name = $ary_photos_name[$i];
				if ('' != $photos_name) {
					$filename_from_temp = $this->config->get('img_path').$this->_getImageDir($mihon_no_old).'/'.$mihon_no_old.'/'.$photos_name;
					//コピー元ファイルの存在確認
					if(file_exists($filename_from_temp)){
						$filename_to_copy = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no').'/'.$photos_name;
						$copyResult_as_copyMode = copy($filename_from_temp, $filename_to_copy);
						if(!$copyResult_as_copyMode){
							//コピー元ファイルのコピー失敗
							$this->backend->getLogger()->log(LOG_ERR, '[見本市コピー登録 システムエラー]:コピー元ファイルのコピー処理失敗');
							$this->backend->getLogger()->log(LOG_ERR, '[コピー元ファイル]:'.$filename_from_temp);
							$this->backend->getLogger()->log(LOG_ERR, '[コピー先ファイル]:'.$filename_to_copy);
							$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
							//tmpディレクトリ強制削除
							system("rm -rf ".$this->session->get('img_tmp_path'));
							$db->rollback();
							return 'error';
						}
// 					}else{
// 						$this->backend->getLogger()->log(LOG_ERR, '[見本市コピー登録 システムエラー]:コピー元ファイルの存在確認失敗');
// 						$this->backend->getLogger()->log(LOG_ERR, '[存在未確認ファイル]:'.$filename_from_temp);
// 						$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
// 						//tmpディレクトリ強制削除
// 						system("rm -rf ".$this->session->get('img_tmp_path'));
// 						$db->rollback();
// 						return 'error';
					}
				}
			}
		}

		//[見本市新規登録 処理①、見本市コピー登録 処理②]tmp→新見本市番号ディレクトリへ全新規アップロードファイルをコピー
		//見本市新規登録、見本市コピー登録の場合（見本市修正以外の場合）
		if ('c' != $this->af->get('mode')){
			$ary_photos_name = array($regist_param_2['photos_name_1'], $regist_param_2['photos_name_2'], $regist_param_2['photos_name_3']);
			for ($i = 0; $i < count($ary_photos_name); $i++) {
				$photos_name = $ary_photos_name[$i];
				if ('' != $photos_name) {
					$filename_from_temp = $this->session->get('img_tmp_path').'/'.$photos_name;
					//コピー元ファイルの存在確認
					if(file_exists($filename_from_temp)){
						$filename_to_copy = $this->config->get('img_path').$this->_getImageDir($jm_fair->get('mihon_no')).'/'.$jm_fair->get('mihon_no').'/'.$photos_name;
						$copyResult_as_registMode = copy($filename_from_temp, $filename_to_copy);
						if(!$copyResult_as_registMode){
							//tmpディレクトリ内のファイルコピー失敗
							$this->backend->getLogger()->log(LOG_ERR, '[見本市新規登録またはコピー登録 システムエラー]:tmpディレクトリ内ファイルのコピー処理失敗');
							$this->backend->getLogger()->log(LOG_ERR, '[コピー元ファイル]:'.$filename_from_temp);
							$this->backend->getLogger()->log(LOG_ERR, '[コピー先ファイル]:'.$filename_to_copy);
							$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
							//tmpディレクトリ強制削除
							system("rm -rf ".$this->session->get('img_tmp_path'));
							$db->rollback();
							return 'error';
						}
// 					}else{
// 						$this->backend->getLogger()->log(LOG_ERR, '[見本市新規登録またはコピー登録 システムエラー]:コピーする新規アップロードファイルの存在確認失敗');
// 						$this->backend->getLogger()->log(LOG_ERR, '[存在未確認ファイル]:'.$filename_from_temp);
// 						$this->backend->getLogger()->log(LOG_ERR, '[処理モード(e:コピー登録 その他は新規登録)]:'.$this->af->get('mode'));
// 						$this->ae->add('error', 'システムエラーが発生しました。[ファイル操作に失敗]');
// 						//tmpディレクトリ強制削除
// 						system("rm -rf ".$this->session->get('img_tmp_path'));
// 						$db->rollback();
// 						return 'error';
					}
				}
			}
		}

		//最終的tmpフォルダ削除（ディレクトリ内にファイルが存在しても削除実行）※各エラーじに実行している処理と同一
		//tmpディレクトリ強制削除
		system("rm -rf ".$this->session->get('img_tmp_path'));
		// MOD-E 2012.08.13 保守：画像処理エラー対応

		// LOGに記録
		$mgr =& $this->backend->getManager('userCommon');
		$ret = $mgr->regLog($this->session->get('user_id'), $ope_kbn, '2', $jm_fair->get('mihon_no'));
		if (Ethna::isError($ret)) {
			$msg = 'JM_LOGテーブルへの登録に失敗しました。';
			$this->backend->getLogger()->log(LOG_ERR, $msg);
			$this->ae->addObject('error', $ret);
			//tmpディレクトリ強制削除
			system($this->session->get('img_tmp_path'));
			$db->rollback();
			return 'error';
		}

		// COMMIT
		$db->commit();

		// メール送信
		$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->session->get('user_id'));
		if (Ethna::isError($jm_user)) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->addObject('error', $jm_user);
			return 'error';
		}
		if (null == $jm_user || $this->session->get('user_id') != $jm_user->get('user_id')) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'error';
		}
		$ary_value = array('user_nm' => $jm_user->get('user_nm'), 'fair_title_jp' => $jm_fair->get('fair_title_jp'));
		$mail_mgr =& $this->backend->getManager('mail');
		$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信開始');
		if ('c' == $this->af->get('mode')) {
 			$mail_mgr->sendmailFairChange($jm_user->get('email'), $ary_value);
		} else {
 			$mail_mgr->sendmailFairReigst($jm_user->get('email'), $ary_value);
		}
		$this->backend->getLogger()->log(LOG_DEBUG, '■mail送信終了');

		// SESSIONの削除
		$this->session->set('regist_param_1', null);
		$this->session->set('regist_param_2', null);
		$this->session->set('regist_param_3', null);
		$this->session->set('img_tmp_path', '');
		//2013/08/25 保守課題No.013対応
		$this->session->set('email2', $this->session->get('email'));
		$this->session->set('email', '');

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		// 画面遷移
		header('Location: '.$url);
		return null;
	}

	/**
	 * 全文検索用文字列作成。
	 *
	 * @param unknown_type $jm_fair
	 */
	function _makeSearchKey($jm_fair) {
		// 検索キーワードの作成
		$br = $this->af->get('br');
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');
		$regist_param_1 = $this->session->get('regist_param_1');
		$search_key = '';

		// 申請年月日
		$search_key .= date('Y年m月d日').' ';
		// 登録日(承認日)
		$search_key .= date('Y年m月d日').' ';
		// 見本市番号
 		$search_key .= $jm_fair->get('mihon_no').' ';
		// 見本市名
		$search_key .= $jm_fair->get('fair_title_jp').' ';
		$search_key .= $jm_fair->get('fair_title_en').' ';
		// 見本市略称
		$search_key .= $jm_fair->get('abbrev_title').' ';
		// 見本市URL
		$search_key .= $jm_fair->get('fair_url').' ';
		// キャッチフレーズ
		$search_key .= str_replace($br, '', $jm_fair->get('profile_jp')).' ';
		$search_key .= str_replace($br, '', $jm_fair->get('profile_en')).' ';
		// ＰＲ・紹介文
		$search_key .= str_replace($br, '', $jm_fair->get('detailed_information_jp')).' ';
		$search_key .= str_replace($br, '', $jm_fair->get('detailed_information_en')).' ';
		// 検索キーワード
		$search_key .= $jm_fair->get('keyword').' ';
		// 会期
		$search_key .= $jm_fair->get('date_from_yyyy').'年'.$jm_fair->get('date_from_mm').'月'.$jm_fair->get('date_from_dd').'日 ';
		$search_key .= $jm_fair->get('date_to_yyyy').'年'.$jm_fair->get('date_to_mm').'月'.$jm_fair->get('date_to_dd').'日 ';
		// 開催頻度
		$code = $jm_code_m_mgr->getCode('001', $jm_fair->get('frequency'), '000', '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		// 業種
		$search_key .= $regist_param_1['main_industory_name_1'].' ';
		$search_key .= $regist_param_1['sub_industory_name_1'].' ';
		$search_key .= $regist_param_1['main_industory_name_2'].' ';
		$search_key .= $regist_param_1['sub_industory_name_2'].' ';
		$search_key .= $regist_param_1['main_industory_name_3'].' ';
		$search_key .= $regist_param_1['sub_industory_name_3'].' ';
		$search_key .= $regist_param_1['main_industory_name_4'].' ';
		$search_key .= $regist_param_1['sub_industory_name_4'].' ';
		$search_key .= $regist_param_1['main_industory_name_5'].' ';
		$search_key .= $regist_param_1['sub_industory_name_5'].' ';
		$search_key .= $regist_param_1['main_industory_name_6'].' ';
		$search_key .= $regist_param_1['sub_industory_name_6'].' ';
		// 出品物
		$search_key .= str_replace($br, '', $jm_fair->get('exhibits_jp')).' ';
		$search_key .= str_replace($br, '', $jm_fair->get('exhibits_en')).' ';
		// 開催地
		$code = $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), '000', '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$code = $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), $jm_fair->get('country'), '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$code = $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), $jm_fair->get('country'), $jm_fair->get('city'));
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$search_key .= $jm_fair->get('other_city_jp').' ';
		$search_key .= $jm_fair->get('other_city_en').' ';
		// 会場名
		$search_key .= $jm_fair->get('venue_jp').' ';
		$search_key .= $jm_fair->get('venue_en').' ';
		// 展示会で使用する面積（Ｎｅｔ）
		$search_key .= $jm_fair->get('gross_floor_area').' ';
		// 交通手段
// 		$search_key .= $jm_fair->get('transportation_jp').' ';
// 		$search_key .= $jm_fair->get('transportation_en').' ';
		// 入場資格
		$code = $jm_code_m_mgr->getCode('004', $jm_fair->get('open_to'), '000', '000');
		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		// 入場方法
		if ('1' == $jm_fair->get('admission_ticket_1')) {
			$search_key .= '登録の必要なし ';
		}
		if ('1' == $jm_fair->get('admission_ticket_2')) {
			$search_key .= '公式ウェブサイトからの事前登録 ';
		}
		if ('1' == $jm_fair->get('admission_ticket_3')) {
			$search_key .= '主催者もしくは日本国内の連絡先への問い合わせ ';
		}
		if ('1' == $jm_fair->get('admission_ticket_3')) {
			$search_key .= '当日会場でチケット入手 ';
		}
		$search_key .= $jm_fair->get('other_admission_ticket_jp').' ';
		$search_key .= $jm_fair->get('other_admission_ticket_en').' ';
		// 過去の実績
		$search_key .= $jm_fair->get('year_of_the_trade_fair').' ';
		$search_key .= $jm_fair->get('total_number_of_visitor').' ';
		$search_key .= $jm_fair->get('number_of_foreign_visitor').' ';
		$search_key .= $jm_fair->get('total_number_of_exhibitors').' ';
		$search_key .= $jm_fair->get('number_of_foreign_exhibitors').' ';
		$search_key .= $jm_fair->get('net_square_meters').' ';
		$search_key .= $jm_fair->get('spare_field1').' ';
		// 出展申込締切日
// 		$search_key .= $jm_fair->get('app_dead_yyyy').'年'.$jm_fair->get('app_dead_mm').'月'.$jm_fair->get('app_dead_dd').'日 ';
		// 主催者・問合せ先
		$search_key .= $jm_fair->get('organizer_jp').' ';
		$search_key .= $jm_fair->get('organizer_en').' ';
		$search_key .= $jm_fair->get('organizer_addr').' ';
		$search_key .= $jm_fair->get('organizer_div').' ';
		$search_key .= $jm_fair->get('organizer_pers').' ';
		$search_key .= $jm_fair->get('organizer_tel').' ';
		$search_key .= $jm_fair->get('organizer_fax').' ';
		$search_key .= $jm_fair->get('organizer_email').' ';
		// 日本国内の連絡先
		$search_key .= $jm_fair->get('agency_in_japan_jp').' ';
		$search_key .= $jm_fair->get('agency_in_japan_en').' ';
		$search_key .= $jm_fair->get('agency_in_japan_addr').' ';
		$search_key .= $jm_fair->get('agency_in_japan_div').' ';
		$search_key .= $jm_fair->get('agency_in_japan_pers').' ';
		$search_key .= $jm_fair->get('agency_in_japan_tel').' ';
		$search_key .= $jm_fair->get('agency_in_japan_fax').' ';
		$search_key .= $jm_fair->get('agency_in_japan_email').' ';
		// 展示会に係わる画像(3点)
		$search_key .= $jm_fair->get('photos_1').' ';
		$search_key .= $jm_fair->get('photos_2').' ';
		$search_key .= $jm_fair->get('photos_3').' ';

		return $search_key;
	}

	/**
	 * チケット入手方法の集計先を取得。
	 *
	 * @return string
	 */
	function _getSumTicket($regist_param_1) {
		$ret = '0';
		if ('1' == $regist_param_1['admission_ticket_1']) {
			$ret = '1';
		} elseif ('1' == $regist_param_1['admission_ticket_2']) {
			$ret = '2';
		} elseif ('1' == $regist_param_1['admission_ticket_3']) {
			$ret = '3';
		} elseif ('1' == $regist_param_1['admission_ticket_4']) {
			$ret = '4';
		} elseif ('' != $regist_param_1['other_admission_ticket_jp']) {
			$ret = '5';
		}
		$this->backend->getLogger()->log(LOG_DEBUG, '■sum_ticket : '.$ret);
		return $ret;
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
}

?>
