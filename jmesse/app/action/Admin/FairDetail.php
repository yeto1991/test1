<?php
/**
 *  Admin/FairDetail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_AdminCommonManager.php';

/**
 *  admin_fairDetail Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairDetail extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'mihon_no' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '見本市番号',    // Display name
			'required'    => true,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'seq_num' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '見本市番号枝番', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
	);
}

/**
 *  admin_fairDetail action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairDetail extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairDetail Action.
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
			return 'admin_Login';
		}

		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'error';
		}

		return null;
	}

	/**
	 *  admin_fairDetail action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$jm_fair_tmp_mgr =& $this->backend->getManager('jmFairTemp');
		if (null != $this->af->get('seq_num') && 0 < $this->af->get('seq_num')) {
			// JM_FAIR_TEMPより取得
			$jm_fair = $jm_fair_tmp_mgr->getJmFairTemp($this->af->get('mihon_no'), $this->af->get('seq_num'));
		} else {
			// JM_FAIRより取得
			$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $this->af->get('mihon_no'));
		}
		if (Ethna::isError($jm_fair)) {
			$this->ae->addObject('error', $jm_fair);
			return 'error';
		}
		if (null == $jm_fair || null == $jm_fair->get('mihon_no') || '' == $jm_fair->get('mihon_no')) {
			$this->ae->addObject('error', Ethna::raiseError('指定された見本市番号は物理削除されました', E_FAIL_TO_GET_OBJECT_JM_FAIR));
			return 'error';
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
			return 'error';
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

		// 会期
		$this->af->set('date_from_yyyy', $jm_fair->get('date_from_yyyy'));
		$this->af->set('date_from_mm', $jm_fair->get('date_from_mm'));
		$this->af->set('date_from_dd', $jm_fair->get('date_from_dd'));
		$this->af->set('date_to_yyyy', $jm_fair->get('date_to_yyyy'));
		$this->af->set('date_to_mm', $jm_fair->get('date_to_mm'));
		$this->af->set('date_to_dd', $jm_fair->get('date_to_dd'));

		// 開催頻度
		$this->af->set('frequency_jp', $jm_fair->get('frequency'));

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
		$this->af->set('region_jp', $jm_fair->get('region'));
		$this->af->set('country_jp', $jm_fair->get('country'));
		$this->af->set('city_jp', $jm_fair->get('city'));
		$this->af->set('other_city_jp', $jm_fair->get('other_city_jp'));
		if (null != $jm_fair->get('other_city_jp') && '' != $jm_fair->get('other_city_jp')) {
			$this->af->set('othercity_jp', '1');
		}
		$this->af->set('other_city_en', $jm_fair->get('other_city_en'));
		if (null != $jm_fair->get('other_city_en') && '' != $jm_fair->get('other_city_en')) {
			$this->af->set('othercity_en', '1');
		}

		// 会場名
		$this->af->set('venue_jp', $jm_fair->get('venue_jp'));
		$this->af->set('venue_en', $jm_fair->get('venue_en'));

		// 開催予定規模
		$this->af->set('gross_floor_area', $this->_isZero($jm_fair->get('gross_floor_area')));

		// 入場資格
		$this->af->set('open_to_jp', $jm_fair->get('open_to'));

		// チケットの入手方法
		$this->af->set('admission_ticket_1_jp', $jm_fair->get('admission_ticket_1'));
		$this->af->set('admission_ticket_2_jp', $jm_fair->get('admission_ticket_2'));
		$this->af->set('admission_ticket_3_jp', $jm_fair->get('admission_ticket_3'));
		$this->af->set('admission_ticket_4_jp', $jm_fair->get('admission_ticket_4'));
		if (null != $jm_fair->get('other_admission_ticket_jp') && '' != $jm_fair->get('other_admission_ticket_jp')) {
			$this->af->set('admission_ticket_5_jp', '1');
		}
		$this->af->set('other_admission_ticket_jp', $jm_fair->get('other_admission_ticket_jp'));
		if (null != $jm_fair->get('other_admission_ticket_en') && '' != $jm_fair->get('other_admission_ticket_en')) {
			$this->af->set('admission_ticket_5_en', '1');
		}
		$this->af->set('other_admission_ticket_en', $jm_fair->get('other_admission_ticket_en'));

		// 過去の実績
		$this->af->set('year_of_the_trade_fair', $jm_fair->get('year_of_the_trade_fair'));
		$this->af->set('total_number_of_visitor', $this->_isZero($jm_fair->get('total_number_of_visitor')));
		$this->af->set('number_of_foreign_visitor', $this->_isZero($jm_fair->get('number_of_foreign_visitor')));
		$this->af->set('total_number_of_exhibitors', $this->_isZero($jm_fair->get('total_number_of_exhibitors')));
		$this->af->set('number_of_foreign_exhibitors', $this->_isZero($jm_fair->get('number_of_foreign_exhibitors')));
		$this->af->set('net_square_meters', $this->_isZero($jm_fair->get('net_square_meters')));
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

		// 日本国内の照会先
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
		$this->af->set('venue_link', $jm_fair->get('venue_link'));

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

		// 表示項目なし
// 		$this->af->set('venue_url', $jm_fair->get('venue_url'));
// 		$this->af->set('keyword', $jm_fair->get('keyword'));
// 		$this->af->set('jetro_suport', $jm_fair->get('jetro_suport'));
// 		$this->af->set('jetro_suport_url', $jm_fair->get('jetro_suport_url'));
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
		if (DB::isError($city_name)) {
			$this->ae->addObject('error', $city_name);
			return 'error';
		}
		$this->af->set('city_name_jp', $city_name['discription_jp']);
		$this->af->set('city_name_en', $city_name['discription_en']);

		// 履歴リスト（$appに設定）
		$jm_fair_temp_list = $jm_fair_tmp_mgr->getJmFairTempList($this->af->get('mihon_no'));
		$this->af->setApp('jm_fair_temp_list', $jm_fair_temp_list);
		$this->af->setApp('seq_num_st', $jm_fair_temp_list[0]['seq_num']);
		$this->af->setApp('seq_num_ed', $jm_fair_temp_list[count($jm_fair_temp_list) - 1]['seq_num']);

		// 次の文書・前の文書の設定
		$sort_cond = $this->session->get('sort_cond');
		$ary_sort = array($sort_cond['sort_1'], $sort_cond['sort_2'], $sort_cond['sort_3'], $sort_cond['sort_4'], $sort_cond['sort_5']);
		$ary_sort_cond = array($sort_cond['sort_cond_1'], $sort_cond['sort_cond_2'], $sort_cond['sort_cond_3'], $sort_cond['sort_cond_4'], $sort_cond['sort_cond_5']);
		$jm_fair_mgr =& $this->backend->getManager('jmFair');
		$mihon_no_list = $jm_fair_mgr->getFairListDetailPaging($ary_sort, $ary_sort_cond);
		for ($i = 0; $i < count($mihon_no_list); $i++) {
			if ($this->af->get('mihon_no') == $mihon_no_list[$i]['mihon_no']) {
				if (0 == $i) {
					$this->af->setApp('mihon_no_prev', '');
				} else {
					$this->af->setApp('mihon_no_prev', $mihon_no_list[$i - 1]['mihon_no']);
				}
				if (count($mihon_no_list) - 1 == $i ) {
					$this->af->setApp('mihon_no_next', '');
				} else {
					$this->af->setApp('mihon_no_next', $mihon_no_list[$i + 1]['mihon_no']);
				}
			}
		}
// 		if (null == $this->af->get('seq_num') || '' == $this->af->get('seq_num')) {
// 			$this->af->setApp('seq_num_prev', $jm_fair_temp_list[1]['seq_num']);
// 			$this->af->setApp('seq_num_next', '');
// 		} else {
// 			for ($i = 0; $i < count($jm_fair_temp_list); $i++) {
// 				if ($this->af->get('seq_num') == $jm_fair_temp_list[$i]['seq_num']) {
// 					if ($i < count($jm_fair_temp_list)) {
// 						$this->af->setApp('seq_num_prev', $jm_fair_temp_list[$i + 1]['seq_num']);
// 					} else {
// 						$this->af->setApp('seq_num_prev', '');
// 					}
// 					if ($i > 0) {
// 						$this->af->setApp('seq_num_next', $jm_fair_temp_list[$i - 1]['seq_num']);
// 					} else {
// 						$this->af->setApp('seq_num_next', '');
// 					}
// 				}
// 			}
// 		}

		// ログに登録
		$mgr = $this->backend->getManager('adminCommon');
		$ret = $mgr->regLog($this->session->get('user_id'), '1', '2', $jm_fair->get('mihon_no'));
		if (Ethna::isError($ret)) {
			$this->ae->addObject('error', $ret);
			return 'error';
		}

		return 'admin_fairDetail';
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
	 * INT型の項目が0の場合''空文字を返す。
	 *
	 * @param int $param 対象パラメータ
	 * @return string 対象パラメータが0の場合は''、0以外の場合は対象パラメータ
	 */
	function _isZero($param) {
		$ret = $param;
		if ("0" == $param) {
			$ret = '';
		}
		return $ret;
	}

}

?>
