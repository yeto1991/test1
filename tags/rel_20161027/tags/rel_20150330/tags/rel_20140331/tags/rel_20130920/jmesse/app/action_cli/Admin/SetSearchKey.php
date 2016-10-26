<?php
/**
 *  Admin/SetSearchKey.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  admin_setSearchKey Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_AdminSetSearchKey extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	);
}

/**
 *  admin_setSearchKey action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_AdminSetSearchKey extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_setSearchKey Action.
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
	 *  admin_setSearchKey action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		echo "トランザクション開始\n";
		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		// すべての見本市番号を取得
		$jm_fair_mgr =& $this->backend->getManager('JmFair');
		$ary_mihon_no = $jm_fair_mgr->getMihonNoList();

		$cnt = count($ary_mihon_no);
		echo "見本市全".$cnt."件\n";

		// ループ
		$i = 0;
		foreach ($ary_mihon_no as $row) {
			$mihon_no = $row['mihon_no'];
			echo "見本市番号：".$mihon_no."\n";
			$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $mihon_no);
			$use_language_flag = $jm_fair->get('use_language_flag');
			if ('0' == $use_language_flag) {
				// フリーワード検索用カラム作成
				$jm_fair->set('search_key', $this->_makeSearchKeyJp($jm_fair));
			} elseif ('1' == $use_language_flag) {
				// フリーワード検索用カラム作成
				$jm_fair->set('search_key', $this->_makeSearchKeyEn($jm_fair));
			} else {
				echo "エラー：ユーザ使用言語が未設定（".$use_language_flag."）";
				continue;
			}
			// UPDATE
			$ret = $jm_fair->update();
			if (Ethna::isError($ret)) {
				echo "UPDATE失敗\n";
				$db->rollback();
				return null;
			}
			if (0 == ++$i%1000) {
				$db->commit();
				$db->db->autocommit(false);
				$db->begin();
			}
		}

		// COMMIT
		$db->commit();
		echo "コミット\n";

		return null;
	}

	/**
	 * 全文検索用文字列作成（日本語ページ）。
	 *
	 * @param unknown_type $jm_fair
	 */
	function _makeSearchKeyJp($jm_fair) {
		// 検索キーワードの作成
		$br = $this->af->get('br');
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');
		$regist_param_1 = $this->session->get('regist_param_1');
		$search_key = '';

		// 申請年月日
		$search_key .= date('Y年m月d日', strtotime($jm_fair->get('date_of_application'))).' ';
// 		$search_key .= date('Y年m月d日').' ';
		// 登録日(承認日)
		$search_key .= date('Y年m月d日', strtotime($jm_fair->get('date_of_registration'))).' ';
// 		$search_key .= date('Y年m月d日').' ';
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
		// チケットの入手方法
		if ('1' == $jm_fair->get('admission_ticket_1')) {
			$search_key .= '登録の必要なし ';
		}
		if ('1' == $jm_fair->get('admission_ticket_2')) {
			$search_key .= 'WEBからの事前登録 ';
		}
		if ('1' == $jm_fair->get('admission_ticket_3')) {
			$search_key .= '主催者・日本の照会先へ問い合わせ ';
		}
		if ('1' == $jm_fair->get('admission_ticket_3')) {
			$search_key .= '当日会場で入手 ';
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
		// 日本国内の照会先
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
	 * 全文検索用文字列作成（英語ページ）。
	 *
	 * @param unknown_type $jm_fair
	 */
	function _makeSearchKeyEn($jm_fair) {
		// 検索キーワードの作成
		$br = $this->af->get('br');
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');
		$regist_param_1 = $this->session->get('regist_param_1');
		$search_key = '';

		// 申請年月日
		$search_key .= date('Y/m/d', strtotime($jm_fair->get('date_of_application'))).' ';
// 		$search_key .= date('Y/m/d').' ';
		// 登録日(承認日)
		$search_key .= date('Y/m/d', strtotime($jm_fair->get('date_of_registration'))).' ';
// 		$search_key .= date('Y/m/d').' ';
		// 見本市番号
		$search_key .= $jm_fair->get('mihon_no').' ';
		// 見本市名
		// 		$search_key .= $jm_fair->get('fair_title_jp').' ';
		$search_key .= $jm_fair->get('fair_title_en').' ';
		// 見本市略称
		$search_key .= $jm_fair->get('abbrev_title').' ';
		// 見本市URL
		$search_key .= $jm_fair->get('fair_url').' ';
		// キャッチフレーズ
		$search_key .= str_replace($br, '', $jm_fair->get('profile_en')).' ';
		// ＰＲ・紹介文
		// 		$search_key .= str_replace($br, '', $jm_fair->get('detailed_information_jp')).' ';
		$search_key .= str_replace($br, '', $jm_fair->get('detailed_information_en')).' ';
		// 検索キーワード
		$search_key .= $jm_fair->get('keyword').' ';
		// 会期
		$search_key .= $jm_fair->get('date_from_yyyy').'/'.$jm_fair->get('date_from_mm').'/'.$jm_fair->get('date_from_dd').' ';
		$search_key .= $jm_fair->get('date_to_yyyy').'/'.$jm_fair->get('date_to_mm').'/'.$jm_fair->get('date_to_dd').' ';
		// 開催頻度
		$code = $jm_code_m_mgr->getCode('001', $jm_fair->get('frequency'), '000', '000');
		// 		$search_key .= $code['discription_jp'].' ';
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
		// 		$search_key .= str_replace($br, '', $jm_fair->get('exhibits_jp')).' ';
		$search_key .= str_replace($br, '', $jm_fair->get('exhibits_en')).' ';
		// 開催地
		$code = $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), '000', '000');
		// 		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$code = $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), $jm_fair->get('country'), '000');
		// 		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		$code = $jm_code_m_mgr->getCode('003', $jm_fair->get('region'), $jm_fair->get('country'), $jm_fair->get('city'));
		// 		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		// 		$search_key .= $jm_fair->get('other_city_jp').' ';
		$search_key .= $jm_fair->get('other_city_en').' ';
		// 会場名
		// 		$search_key .= $jm_fair->get('venue_jp').' ';
		$search_key .= $jm_fair->get('venue_en').' ';
		// 展示会で使用する面積（Ｎｅｔ）
		$search_key .= $jm_fair->get('gross_floor_area').' ';
		// 交通手段
		// 		$search_key .= $jm_fair->get('transportation_jp').' ';
		// 		$search_key .= $jm_fair->get('transportation_en').' ';
		// 入場資格
		$code = $jm_code_m_mgr->getCode('004', $jm_fair->get('open_to'), '000', '000');
		// 		$search_key .= $code['discription_jp'].' ';
		$search_key .= $code['discription_en'].' ';
		// チケットの入手方法
		if ('1' == $jm_fair->get('admission_ticket_1')) {
			$search_key .= 'Free';
		}
		if ('1' == $jm_fair->get('admission_ticket_2')) {
			$search_key .= 'Apply/register online';
		}
		if ('1' == $jm_fair->get('admission_ticket_3')) {
			$search_key .= 'Contact organizer/agency in Japan';
		}
		if ('1' == $jm_fair->get('admission_ticket_3')) {
			$search_key .= 'Available at event';
		}
		// 		$search_key .= $jm_fair->get('other_admission_ticket_jp').' ';
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
		// 		$search_key .= $jm_fair->get('organizer_jp').' ';
		$search_key .= $jm_fair->get('organizer_en').' ';
		$search_key .= $jm_fair->get('organizer_addr').' ';
		$search_key .= $jm_fair->get('organizer_div').' ';
		$search_key .= $jm_fair->get('organizer_pers').' ';
		$search_key .= $jm_fair->get('organizer_tel').' ';
		$search_key .= $jm_fair->get('organizer_fax').' ';
		$search_key .= $jm_fair->get('organizer_email').' ';
		// 日本国内の照会先
		// 		$search_key .= $jm_fair->get('agency_in_japan_jp').' ';
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

	function _dateformat($str) {

	}
}

?>
