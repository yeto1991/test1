<?php
/**
 *  User/EnFairDetail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnFairRegistStep1.php';

/**
 *  user_enFairDetail Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnFairDetail extends Jmesse_Form_UserEnFairRegistStep1
{
}

/**
 *  user_enFairDetail action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnFairDetail extends Jmesse_ActionClass
{
	/**
	*  preprocess of user_enFairDetail Action.
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
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'user_enLogin';
		}

		// 登録モード
		if ('d' != $this->af->get('mode') && 'p' != $this->af->get('mode')) {
			$this->backend->getLogger()->log(LOG_ERR, '登録モードなし');
			$this->ae->add('error', 'A system error has occurred.');
			return 'enError';
		}

		// 見本市番号
		if ('' == $this->af->get('mihon_no')) {
			$this->backend->getLogger()->log(LOG_ERR, '見本市番号なし');
			$this->ae->add('error', 'A system error has occurred.');
			return 'enError';
		}

		return null;
	}

	/**
	*  user_enFairDetail action implementation.
	*
	*  @access public
	*  @return string  forward name.
	*/
	function perform()
	{
		$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $this->af->get('mihon_no'));
		if (Ethna::isError($jm_fair)) {
			$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
			$this->ae->addObject('error', $jm_fair);
			return 'enError';
		}
		if (null == $jm_fair || $this->af->get('mihon_no') != $jm_fair->get('mihon_no')) {
			$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
			$this->ae->add('error', 'A system error has occurred.');
			return 'enError';
		}
		if ($this->session->get('user_id') != $jm_fair->get('user_id')) {
			$this->backend->getLogger()->log(LOG_ERR, '他人の見本市 '.$this->session->get('user_id').' '.$jm_fair_obj->get('user_id'));
			$this->ae->add('error', 'A system error has occurred.');
			return 'enError';
		}

		//Form値設定
		$this->af->set('user_id', $this->session->get('user_id'));
		$this->af->set('fair_title_en', $jm_fair->get('fair_title_en'));
		$this->af->set('abbrev_title', $jm_fair->get('abbrev_title'));
		$this->af->set('fair_url', $jm_fair->get('fair_url'));
		$this->af->set('date_from_yyyy', $jm_fair->get('date_from_yyyy'));
		$this->af->set('date_from_mm', $jm_fair->get('date_from_mm'));
		$this->af->set('date_from_dd', $jm_fair->get('date_from_dd'));
		$this->af->set('date_to_yyyy', $jm_fair->get('date_to_yyyy'));
		$this->af->set('date_to_mm', $jm_fair->get('date_to_mm'));
		$this->af->set('date_to_dd', $jm_fair->get('date_to_dd'));
		$this->af->set('frequency', $jm_fair->get('frequency'));
		$this->af->set('main_industory_1', $jm_fair->get('main_industory_1'));
		$this->af->set('sub_industory_1', $jm_fair->get('sub_industory_1'));
		$this->af->set('main_industory_name_1', $jm_fair->get('main_industory_name_1'));
		$this->af->set('sub_industory_name_1', $jm_fair->get('sub_industory_name_1'));
		$this->af->set('main_industory_2', $jm_fair->get('main_industory_2'));
		$this->af->set('sub_industory_2', $jm_fair->get('sub_industory_2'));
		$this->af->set('main_industory_name_2', $jm_fair->get('main_industory_name_2'));
		$this->af->set('sub_industory_name_2', $jm_fair->get('sub_industory_name_2'));
		$this->af->set('main_industory_3', $jm_fair->get('main_industory_3'));
		$this->af->set('sub_industory_3', $jm_fair->get('sub_industory_3'));
		$this->af->set('main_industory_name_3', $jm_fair->get('main_industory_name_3'));
		$this->af->set('sub_industory_name_3', $jm_fair->get('sub_industory_name_3'));
		$this->af->set('main_industory_4', $jm_fair->get('main_industory_4'));
		$this->af->set('sub_industory_4', $jm_fair->get('sub_industory_4'));
		$this->af->set('main_industory_name_4', $jm_fair->get('main_industory_name_4'));
		$this->af->set('sub_industory_name_4', $jm_fair->get('sub_industory_name_4'));
		$this->af->set('main_industory_5', $jm_fair->get('main_industory_5'));
		$this->af->set('sub_industory_5', $jm_fair->get('sub_industory_5'));
		$this->af->set('main_industory_name_5', $jm_fair->get('main_industory_name_5'));
		$this->af->set('sub_industory_name_5', $jm_fair->get('sub_industory_name_5'));
		$this->af->set('main_industory_6', $jm_fair->get('main_industory_6'));
		$this->af->set('sub_industory_6', $jm_fair->get('sub_industory_6'));
		$this->af->set('main_industory_name_6', $jm_fair->get('main_industory_name_6'));
		$this->af->set('sub_industory_name_6', $jm_fair->get('sub_industory_name_6'));
		$this->af->set('exhibits_en', $jm_fair->get('exhibits_en'));
		$this->af->set('region', $jm_fair->get('region'));
		$this->af->set('country', $jm_fair->get('country'));
		$this->af->set('city', $jm_fair->get('city'));
		$this->af->set('other_city_en', $jm_fair->get('other_city_en'));
		$this->af->set('check_other_city_en', $jm_fair->get('check_other_city_en'));
		$this->af->set('venue_en', $jm_fair->get('venue_en'));
		$this->af->set('gross_floor_area', $jm_fair->get('gross_floor_area'));
		$this->af->set('open_to', $jm_fair->get('open_to'));
		$this->af->set('admission_ticket_1', $jm_fair->get('admission_ticket_1'));
		$this->af->set('admission_ticket_2', $jm_fair->get('admission_ticket_2'));
		$this->af->set('admission_ticket_3', $jm_fair->get('admission_ticket_3'));
		$this->af->set('admission_ticket_4', $jm_fair->get('admission_ticket_4'));
		if ('' != $jm_fair->get('other_admission_ticket_en')) {
			$this->af->set('admission_ticket_5', '1');
		}
// 		$this->af->set('admission_ticket_5', $jm_fair->get('admission_ticket_5'));
		$this->af->set('other_admission_ticket_en', $jm_fair->get('other_admission_ticket_en'));
		$this->af->set('app_dead_yyyy', $jm_fair->get('app_dead_yyyy'));
		$this->af->set('app_dead_mm', $jm_fair->get('app_dead_mm'));
		$this->af->set('app_dead_dd', $jm_fair->get('app_dead_dd'));
		$this->af->set('year_of_the_trade_fair', $jm_fair->get('year_of_the_trade_fair'));
		$this->af->set('total_number_of_visitor', $jm_fair->get('total_number_of_visitor'));
		$this->af->set('number_of_foreign_visitor',$jm_fair->get('number_of_foreign_visitor'));
		$this->af->set('total_number_of_exhibitors', $jm_fair->get('total_number_of_exhibitors'));
		$this->af->set('number_of_foreign_exhibitors', $jm_fair->get('number_of_foreign_exhibitors'));
		$this->af->set('net_square_meters', $jm_fair->get('net_square_meters'));
		$this->af->set('spare_field1', $jm_fair->get('spare_field1'));
		$this->af->set('profile_en', $jm_fair->get('profile_en'));
		$this->af->set('detailed_information_en', $jm_fair->get('detailed_information_en'));
		$this->af->set('photos_name_1', $jm_fair->get('photos_1'));
		$this->af->set('photos_name_2', $jm_fair->get('photos_2'));
		$this->af->set('photos_name_3', $jm_fair->get('photos_3'));
		$this->af->set('keyword', $jm_fair->get('keyword'));
		$this->af->set('organizer_en', $jm_fair->get('organizer_en'));
		$this->af->set('organizer_addr', $jm_fair->get('organizer_addr'));
		$this->af->set('organizer_div', $jm_fair->get('organizer_div'));
		$this->af->set('organizer_pers', $jm_fair->get('organizer_pers'));
		$this->af->set('organizer_tel', $jm_fair->get('organizer_tel'));
		$this->af->set('organizer_fax', $jm_fair->get('organizer_fax'));
		$this->af->set('organizer_email', $jm_fair->get('organizer_email'));
		$this->af->set('agency_in_japan_en', $jm_fair->get('agency_in_japan_en'));
		$this->af->set('agency_in_japan_addr', $jm_fair->get('agency_in_japan_addr'));
		$this->af->set('agency_in_japan_div', $jm_fair->get('agency_in_japan_div'));
		$this->af->set('agency_in_japan_pers', $jm_fair->get('agency_in_japan_pers'));
		$this->af->set('agency_in_japan_tel', $jm_fair->get('agency_in_japan_tel'));
		$this->af->set('agency_in_japan_fax', $jm_fair->get('agency_in_japan_fax'));
		$this->af->set('agency_in_japan_email', $jm_fair->get('agency_in_japan_email'));
		$this->af->set('select_language_info', $jm_fair->get('select_language_info'));
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');

		// 業種
		$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_1'), '000', '000');
		$this->af->set('main_industory_name_1', $code['discription_en']);
		$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_1'), $jm_fair->get('sub_industory_1'), '000');
		$this->af->set('sub_industory_name_1', $code['discription_en']);
		if ('' != $jm_fair->get('main_industory_2')) {
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_2'), '000', '000');
			$this->af->set('main_industory_name_2', $code['discription_en']);
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_2'), $jm_fair->get('sub_industory_2'), '000');
			$this->af->set('sub_industory_name_2', $code['discription_en']);
		}
		if ('' != $jm_fair->get('main_industory_3')) {
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_3'), '000', '000');
			$this->af->set('main_industory_name_3', $code['discription_en']);
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_3'), $jm_fair->get('sub_industory_3'), '000');
			$this->af->set('sub_industory_name_3', $code['discription_en']);
		}
		if ('' != $jm_fair->get('main_industory_4')) {
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_4'), '000', '000');
			$this->af->set('main_industory_name_4', $code['discription_en']);
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_4'), $jm_fair->get('sub_industory_4'), '000');
			$this->af->set('sub_industory_name_4', $code['discription_en']);
		}
		if ('' != $jm_fair->get('main_industory_5')) {
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_5'), '000', '000');
			$this->af->set('main_industory_name_5', $code['discription_en']);
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_5'), $jm_fair->get('sub_industory_5'), '000');
			$this->af->set('sub_industory_name_5', $code['discription_en']);
		}
		if ('' != $jm_fair->get('main_industory_6')) {
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_6'), '000', '000');
			$this->af->set('main_industory_name_6', $code['discription_en']);
			$code = $jm_code_m_mgr->getCode('002', $jm_fair->get('main_industory_6'), $jm_fair->get('sub_industory_6'), '000');
			$this->af->set('sub_industory_name_6', $code['discription_en']);
		}

		// 開催頻度
		$this->af->setApp('frequency_name', $jm_code_m_mgr->getCode('001', $jm_fair->get('frequency'), '000', '000'));

		// 開催地
		$this->af->setApp('region_name', $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), '000', '000'));
		$this->af->setApp('country_name', $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), $jm_fair->get('country'), '000'));
		if ('' != $jm_fair->get('city')) {
			$this->af->setApp('city_name', $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), $jm_fair->get('country'), $jm_fair->get('city')));
		} else {
			$this->af->setApp('city_name', '');
		}

		// 入場資格
		$this->af->setApp('open_to_name', $jm_code_m_mgr->getCode('004', $jm_fair->get('open_to'), '000', '000'));

		// 表示用Eメールの取得
		if (null == $this->session->get('email') || '' == $this->session->get('email')) {
			$user_obj = $this->backend->getObject('JmUser', 'user_id', $this->session->get('user_id'));
			if (Ethna::isError($user_obj)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->addObject('error', $user_obj);
				return 'enError';
			}
			if (null == $user_obj || $this->session->get('user_id') != $user_obj->get('user_id')) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->add('error', 'A system error has occurred.');
				return 'enError';
			}
			$this->session->set('email', $user_obj->get('email'));
		}

		//MOD-S 2013.04.25 登録（対象）画像の実画像表示
		//画面表示対象ファイルパスを配列で保持
		$ary_photos_name = array($jm_fair->get('photos_1'), $jm_fair->get('photos_2'), $jm_fair->get('photos_3'));
		$abc = 0;
		for ($i = 0; $i < count($ary_photos_name); $i++) {
			$photos_name = $ary_photos_name[$i];
			if ('' != $photos_name) {
				if(5 > mb_strlen($this->af->get('mihon_no'))){
					//見本市番号が5桁以上ではない場合（1～9999）
					$mihon_no_first_value = 0; //0フォルダ
				}else{
					$mihon_no_first_value = substr($this->af->get('mihon_no'),0,1); //見本市番号万からの桁数字フォルダ
				}
				$displayPhotosNo[$abc] = $abc+1;
				$displayPhotosName[$abc] = $photos_name;
				$displayPhotosPath[$abc] = $this->config->get('img_path').$mihon_no_first_value.'/'.$this->af->get('mihon_no').'/'.$photos_name;
				$abc++;
			}
		}
		$this->session->set('display_photos_no', $displayPhotosNo);
		$this->session->set('display_photos_name', $displayPhotosName);
		$this->session->set('display_photos_path', $displayPhotosPath);
		//MOD-E 2013.04.25 登録（対象）画像の実画像表示

		// ログテーブル登録
		if ('d' == $this->af->get('mode') || 'p' == $this->af->get('mode')) {
			$mgr = $this->backend->getManager('userCommon');
			$ret = $mgr->regLog($this->session->get('user_id'), '1' , '2', $this->af->get('mihon_no'));
			if (Ethna::isError($ret)) {
				$this->ae->addObject('error', $ret);
				$db->rollback();
				return 'enError';
			}
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}

		return 'user_enFairDetail';
	}

	/**
	* INT型の項目がnullの場合''空文字を返す。
	*
	* @param int $param 対象パラメータ
	* @return string 対象パラメータがnullの場合は''、null以外の場合はそのまま。
	*/
	function _isZero($param) {
		$ret = $param;
		if (null == $param) {
//		if ("0" == $param) {
			$ret = '';
		}
		return $ret;
	}

}

?>
