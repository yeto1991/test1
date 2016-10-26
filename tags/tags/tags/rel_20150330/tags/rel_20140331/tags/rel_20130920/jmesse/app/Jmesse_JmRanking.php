<?php
/**
 *  Jmesse_JmRanking.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmRankingManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmRankingManager extends Ethna_AppManager
{
	/**
	 * アクセス数をカウントアップする。
	 *
	 * @param int $mihon_no 見本市番号
	 * @param string $venue_kbn '0':国内、'1':国外。
	 */
	function countUp($mihon_no, $venue_kbn) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// トランザクション開始
		$db->db->autocommit(false);
		$db->begin();

		// 現在の年月
		$ranking_yyyymm = date('Ym');

		// SQL
		$sql = 'select count(*) cnt from jm_ranking where mihon_no = ? and ranking_yyyymm = ? and venue_kbn = ?';

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array((int)$mihon_no, $ranking_yyyymm, $venue_kbn);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

		// 結果の判定
		if (null == $res) {
			$this->backend->getLogger()->log(LOG_ERR, '検索結果が取得できません。');
			$db->rollback();
			return null;
		}
		if (DB::isError($res)) {
			$msg = '検索Errorが発生しました。';
			$this->backend->getLogger()->log(LOG_ERR, $msg);
			$this->backend->getActionError()->addObject('error', $res);
			$db->rollback();
			return null;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			$db->rollback();
			return null;
		}

		// リスト化
		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		if (0 == $row['cnt']) {
			// insert
			$jm_ranking =& $this->backend->getObject('JmRanking');
			$jm_ranking->set('mihon_no', $mihon_no);
			$jm_ranking->set('ranking_yyyymm', $ranking_yyyymm);
			$jm_ranking->set('venue_kbn', $venue_kbn);
			$jm_ranking->set('access_cnt', 1);
			$res_ins = $jm_ranking->add();
			if (Ethna::isError($res_ins)) {
				$msg = '登録Errorが発生しました。';
				$this->backend->getLogger()->log(LOG_ERR, $msg);
				$this->ae->add('error', $msg);
				$db->rollback();
				return null;
			}
		} elseif (1 == $row['cnt']) {
			// update
			$sql_up = "update jm_ranking set access_cnt = access_cnt + 1 where mihon_no = ? and ranking_yyyymm = ? and venue_kbn = ?";

			// Prepare Statement化
			$stmt_up =& $db->db->prepare($sql_up);

			// SQLを実行
			$res_up = $db->db->execute($stmt_up, $param);
			if (DB::isError($res_up)) {
				$msg = '更新Errorが発生しました。';
				$this->backend->getLogger()->log(LOG_ERR, $msg);
				$this->ae->add('error', $msg);
				$db->rollback();
				return null;
			}
		} else {
			$db->rollback();
			return null;
		}

		// コミット
		$db->commit();
	}

	/**
	 * 月間ランキング情報作成SQL。
	 */
	var $json_ranking_sql = array(
		//日本語サイト 国内
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_jp name, concat(jf.date_from_yyyy, '年', jf.date_from_mm, '月', jf.date_from_dd, '日') start, concat(jf.date_to_yyyy, '年', jf.date_to_mm, '月', jf.date_to_dd, '日') end, ar.discription_jp area, co.discription_jp country, case when '' = jf.city then jf.other_city_jp else ci.discription_jp end city, jf.venue_jp site, jr.venue_kbn, '0' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 1 month), '%Y%m') and venue_kbn = '0') jr inner join (select mihon_no, abbrev_title, fair_title_jp, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_jp, venue_jp from jm_fair where select_language_info in ('0', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_jp from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_jp from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_jp from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_jp name, concat(jf.date_from_yyyy, '年', jf.date_from_mm, '月', jf.date_from_dd, '日') start, concat(jf.date_to_yyyy, '年', jf.date_to_mm, '月', jf.date_to_dd, '日') end, ar.discription_jp area, co.discription_jp country, case when '' = jf.city then jf.other_city_jp else ci.discription_jp end city, jf.venue_jp site, jr.venue_kbn, '0' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 2 month), '%Y%m') and venue_kbn = '0') jr inner join (select mihon_no, abbrev_title, fair_title_jp, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_jp, venue_jp from jm_fair where select_language_info in ('0', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_jp from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_jp from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_jp from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_jp name, concat(jf.date_from_yyyy, '年', jf.date_from_mm, '月', jf.date_from_dd, '日') start, concat(jf.date_to_yyyy, '年', jf.date_to_mm, '月', jf.date_to_dd, '日') end, ar.discription_jp area, co.discription_jp country, case when '' = jf.city then jf.other_city_jp else ci.discription_jp end city, jf.venue_jp site, jr.venue_kbn, '0' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 3 month), '%Y%m') and venue_kbn = '0') jr inner join (select mihon_no, abbrev_title, fair_title_jp, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_jp, venue_jp from jm_fair where select_language_info in ('0', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_jp from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_jp from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_jp from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		//日本語サイト 海外
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_jp name, concat(jf.date_from_yyyy, '年', jf.date_from_mm, '月', jf.date_from_dd, '日') start, concat(jf.date_to_yyyy, '年', jf.date_to_mm, '月', jf.date_to_dd, '日') end, ar.discription_jp area, co.discription_jp country, case when '' = jf.city then jf.other_city_jp else ci.discription_jp end city, jf.venue_jp site, jr.venue_kbn, '0' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 1 month), '%Y%m') and venue_kbn = '1') jr inner join (select mihon_no, abbrev_title, fair_title_en, fair_title_jp, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_jp, venue_jp from jm_fair where select_language_info in ('0', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_jp from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_jp from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_jp from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_jp name, concat(jf.date_from_yyyy, '年', jf.date_from_mm, '月', jf.date_from_dd, '日') start, concat(jf.date_to_yyyy, '年', jf.date_to_mm, '月', jf.date_to_dd, '日') end, ar.discription_jp area, co.discription_jp country, case when '' = jf.city then jf.other_city_jp else ci.discription_jp end city, jf.venue_jp site, jr.venue_kbn, '0' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 2 month), '%Y%m') and venue_kbn = '1') jr inner join (select mihon_no, abbrev_title, fair_title_en, fair_title_jp, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_jp, venue_jp from jm_fair where select_language_info in ('0', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_jp from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_jp from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_jp from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_jp name, concat(jf.date_from_yyyy, '年', jf.date_from_mm, '月', jf.date_from_dd, '日') start, concat(jf.date_to_yyyy, '年', jf.date_to_mm, '月', jf.date_to_dd, '日') end, ar.discription_jp area, co.discription_jp country, case when '' = jf.city then jf.other_city_jp else ci.discription_jp end city, jf.venue_jp site, jr.venue_kbn, '0' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 3 month), '%Y%m') and venue_kbn = '1') jr inner join (select mihon_no, abbrev_title, fair_title_en, fair_title_jp, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_jp, venue_jp from jm_fair where select_language_info in ('0', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_jp from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_jp from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_jp from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		//英語サイト 国内
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_en name, date_format(concat(jf.date_from_yyyy, '/', jf.date_from_mm, '/', jf.date_from_dd), '%b. %e, %Y') start, date_format(concat(jf.date_to_yyyy, '/', jf.date_to_mm, '/', jf.date_to_dd), '%b. %e, %Y') end, ar.discription_en area, co.discription_en country, case when '' = jf.city then jf.other_city_en else ci.discription_en end city, jf.venue_en site, jr.venue_kbn, '1' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 1 month), '%Y%m') and venue_kbn = '0') jr inner join (select mihon_no, abbrev_title, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_en, venue_en from jm_fair where select_language_info in ('1', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_en from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_en from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_en from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_en name, date_format(concat(jf.date_from_yyyy, '/', jf.date_from_mm, '/', jf.date_from_dd), '%b. %e, %Y') start, date_format(concat(jf.date_to_yyyy, '/', jf.date_to_mm, '/', jf.date_to_dd), '%b. %e, %Y') end, ar.discription_en area, co.discription_en country, case when '' = jf.city then jf.other_city_en else ci.discription_en end city, jf.venue_en site, jr.venue_kbn, '1' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 2 month), '%Y%m') and venue_kbn = '0') jr inner join (select mihon_no, abbrev_title, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_en, venue_en from jm_fair where select_language_info in ('1', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_en from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_en from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_en from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_en name, date_format(concat(jf.date_from_yyyy, '/', jf.date_from_mm, '/', jf.date_from_dd), '%b. %e, %Y') start, date_format(concat(jf.date_to_yyyy, '/', jf.date_to_mm, '/', jf.date_to_dd), '%b. %e, %Y') end, ar.discription_en area, co.discription_en country, case when '' = jf.city then jf.other_city_en else ci.discription_en end city, jf.venue_en site, jr.venue_kbn, '1' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 3 month), '%Y%m') and venue_kbn = '0') jr inner join (select mihon_no, abbrev_title, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_en, venue_en from jm_fair where select_language_info in ('1', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_en from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_en from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_en from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		//英語サイト 海外
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_en name, date_format(concat(jf.date_from_yyyy, '/', jf.date_from_mm, '/', jf.date_from_dd), '%b. %e, %Y') start, date_format(concat(jf.date_to_yyyy, '/', jf.date_to_mm, '/', jf.date_to_dd), '%b. %e, %Y') end, ar.discription_en area, co.discription_en country, case when '' = jf.city then jf.other_city_en else ci.discription_en end city, jf.venue_en site, jr.venue_kbn, '1' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 1 month), '%Y%m') and venue_kbn = '1') jr inner join (select mihon_no, abbrev_title, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_en, venue_en from jm_fair where select_language_info in ('1', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_en from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_en from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_en from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_en name, date_format(concat(jf.date_from_yyyy, '/', jf.date_from_mm, '/', jf.date_from_dd), '%b. %e, %Y') start, date_format(concat(jf.date_to_yyyy, '/', jf.date_to_mm, '/', jf.date_to_dd), '%b. %e, %Y') end, ar.discription_en area, co.discription_en country, case when '' = jf.city then jf.other_city_en else ci.discription_en end city, jf.venue_en site, jr.venue_kbn, '1' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 2 month), '%Y%m') and venue_kbn = '1') jr inner join (select mihon_no, abbrev_title, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_en, venue_en from jm_fair where select_language_info in ('1', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_en from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_en from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_en from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_en name, date_format(concat(jf.date_from_yyyy, '/', jf.date_from_mm, '/', jf.date_from_dd), '%b. %e, %Y') start, date_format(concat(jf.date_to_yyyy, '/', jf.date_to_mm, '/', jf.date_to_dd), '%b. %e, %Y') end, ar.discription_en area, co.discription_en country, case when '' = jf.city then jf.other_city_en else ci.discription_en end city, jf.venue_en site, jr.venue_kbn, '1' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 3 month), '%Y%m') and venue_kbn = '1') jr inner join (select mihon_no, abbrev_title, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_en, venue_en from jm_fair where select_language_info in ('1', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_en from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_en from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_en from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 10",
		//日本語サイト 国内TOP3
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_jp name, concat(jf.date_from_yyyy, '年', jf.date_from_mm, '月', jf.date_from_dd, '日') start, concat(jf.date_to_yyyy, '年', jf.date_to_mm, '月', jf.date_to_dd, '日') end, ar.discription_jp area, co.discription_jp country, case when '' = jf.city then jf.other_city_jp else ci.discription_jp end city, jf.venue_jp site, jr.venue_kbn, '0' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 1 month), '%Y%m') and venue_kbn = '0') jr inner join (select mihon_no, abbrev_title, fair_title_jp, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_jp, venue_jp from jm_fair where select_language_info in ('0', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_jp from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_jp from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_jp from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 3",
		//英語サイト 海外TOP3
		"select jf.mihon_no mihon_no, jf.abbrev_title abbrev_title, jf.fair_title_en fair_title_en, jf.fair_title_en name, date_format(concat(jf.date_from_yyyy, '/', jf.date_from_mm, '/', jf.date_from_dd), '%b. %e, %Y') start, date_format(concat(jf.date_to_yyyy, '/', jf.date_to_mm, '/', jf.date_to_dd), '%b. %e, %Y') end, ar.discription_en area, co.discription_en country, case when '' = jf.city then jf.other_city_en else ci.discription_en end city, jf.venue_en site, jr.venue_kbn, '1' site_kbn from (select mihon_no, ranking_yyyymm, venue_kbn, access_cnt from jm_ranking where ranking_yyyymm = date_format(date_add(now(), interval - 1 month), '%Y%m') and venue_kbn = '1') jr inner join (select mihon_no, abbrev_title, fair_title_en, date_from_yyyy, date_from_mm, date_from_dd, date_to_yyyy, date_to_mm, date_to_dd, region, country, city, other_city_en, venue_en from jm_fair where select_language_info in ('1', '2') and web_display_type = '1' and del_flg = '0' and confirm_flag = '1') jf on jr.mihon_no = jf.mihon_no left outer join (select kbn_2, discription_en from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') ar on jf.region = ar.kbn_2 left outer join (select kbn_2, kbn_3, discription_en from jm_code_m where kbn_1 = '003' and kbn_4 = '000') co on jf.region = co.kbn_2 and jf.country = co.kbn_3 left outer join (select kbn_2, kbn_3, kbn_4, discription_en from jm_code_m where kbn_1 = '003') ci on jf.region = ci.kbn_2 and jf.country = ci.kbn_3 and jf.city = ci.kbn_4 order by jr.access_cnt desc, jr.mihon_no desc limit 0, 3",
	);

	/**
	 * 月間ランキング情報取得。
	 *
	 * @param unknown_type $i
	 */
	function getJsonRanking($i) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = $this->json_ranking_sql[$i];

		if ('' == $sql) {
			$msg = '引数エラー';
			$this->backend->getLogger()->log(LOG_ERR, $msg);
			$this->backend->getActionError()->add('error', $msg);
			return null;
		}

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// SQLを実行
		$res = $db->db->query($sql);

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
		$list = array();
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}
}

/**
 *  Jmesse_JmRanking
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmRanking extends Ethna_AppObject
{
	/**
	 *  @var    array   テーブル定義
	 */
	var $table_def = array(
		'jm_ranking' => array(
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
