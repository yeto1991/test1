<?php
/**
 *  Jmesse_JmFairCnt.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmFairCntManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmFairCntManager extends Ethna_AppManager
{
	/**
	* JSONファイル(industory_jp_venue0.json、industory_jp_venue1.json)作成用
	*
	* @return array 取得データ
	*/
	function getJsonIndustoryJP() {
// 	function getJsonIndustoryJP($venue_kbn_value) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm_1.discription_jp industory, jf.fair_cnt count, concat('?action_fairList=true&type=i1&i_2=', jcm_1.kbn_2) url from (select kbn_2, sum(fair_cnt) fair_cnt from jm_fair_cnt where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000' and site_kbn = '0' group by kbn_2) jf inner join (select kbn_2, discription_jp, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num";
// 		$sql = "select jcm_1.kbn_2 id, jcm_1.discription_jp industory, jf.fair_cnt count from (select kbn_2, sum(fair_cnt) fair_cnt from jm_fair_cnt where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000' group by kbn_2) jf left outer join (select kbn_2, discription_jp, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// SQLを実行
		$res = $db->db->query($sql);

// 		$sql =  " select ";
// 		$sql .= " jcm_1.discription_jp industory, jf.fair_cnt count ";
// 		$sql .= " from jm_fair_cnt jf ";
// 		$sql .= " left outer join ( select kbn_2, discription_jp, discription_en, disp_num from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by disp_num) jcm_1 on jf.kbn_2 = jcm_1.kbn_2 "; //(?-1)kbn_1 = '002' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000'
// 		$sql .= " where jf.kbn_1 = ? and jf.kbn_3 = ? and jf.kbn_4 = ? and jf.venue_kbn = ? "; //(?-1)kbn_1 = '002' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000' (?-4)venue_kbn = (国内or海外)

// 		// Prepare Statement化
// 		$stmt =& $db->db->prepare($sql);
// 		// 検索条件をArray化
// 		$param = array('002','000','000','002','000','000',$venue_kbn_value);
// 		// SQLを実行
// 		$res = $db->db->execute($stmt, $param);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	* JSONファイル(industory_en_venue0.json、industory_en_venue1.json)作成用
	*
	* @return array 取得データ
	*/
	function getJsonIndustoryEN() {
// 	function getJsonIndustoryEN($venue_kbn_value) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm_1.discription_en industory, jf.fair_cnt count, concat('?action_enFairList=true&type=i1&i_2=', jcm_1.kbn_2) url from (select kbn_2, sum(fair_cnt) fair_cnt from jm_fair_cnt where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000' and site_kbn = '1' group by kbn_2) jf inner join (select kbn_2, discription_en, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num";
// 		$sql = "select jcm_1.kbn_2 id, jcm_1.discription_en industory, jf.fair_cnt count from (select kbn_2, sum(fair_cnt) fair_cnt from jm_fair_cnt where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000' group by kbn_2) jf left outer join (select kbn_2, discription_en, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// SQLを実行
		$res = $db->db->query($sql);

// 		$sql =  " select ";
// 		$sql .= " jcm_1.discription_en industory, jf.fair_cnt count ";
// 		$sql .= " from jm_fair_cnt jf ";
// 		$sql .= " left outer join ( select kbn_2, discription_jp, discription_en, disp_num from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by disp_num) jcm_1 on jf.kbn_2 = jcm_1.kbn_2 "; //(?-1)kbn_1 = '002' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000'
// 		$sql .= " where jf.kbn_1 = ? and jf.kbn_3 = ? and jf.kbn_4 = ? and jf.venue_kbn = ? "; //(?-1)kbn_1 = '002' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000' (?-4)venue_kbn = (国内or海外)

// 		// Prepare Statement化
// 		$stmt =& $db->db->prepare($sql);
// 		// 検索条件をArray化
// 		$param = array('002','000','000','002','000','000',$venue_kbn_value);
// 		// SQLを実行
// 		$res = $db->db->execute($stmt, $param);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	* JSONファイル(region_jp.json)作成用
	*
	* @return array 取得データ
	*/
	function getJsonRegionJP() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm_1.discription_jp region, jf.fair_cnt count, concat('?action_fairList=true&type=v1&v_2=', jcm_1.kbn_2) url from (select kbn_2, fair_cnt from jm_fair_cnt where kbn_1 = '003' and kbn_2 <> '001' and kbn_3 = '000' and kbn_4 = '000' and site_kbn = '0') jf inner join (select kbn_2, discription_jp, disp_num from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num asc";
// 		$sql = "select jcm_1.kbn_2 id, jcm_1.discription_jp region, jf.fair_cnt count from (select kbn_2, fair_cnt from jm_fair_cnt where kbn_1 = '003' and kbn_2 <> '001' and kbn_3 = '000' and kbn_4 = '000') jf left outer join (select kbn_2, discription_jp, disp_num from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// SQLを実行
		$res = $db->db->query($sql);

// 		$sql =  " select ";
// 		$sql .= " jcm_1.discription_jp region, jf.fair_cnt count ";
// 		$sql .= " from jm_fair_cnt jf ";
// 		$sql .= " left outer join ( select kbn_2, discription_jp, discription_en, disp_num from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by disp_num) jcm_1 on jf.kbn_2 = jcm_1.kbn_2 "; //(?-1)kbn_1 = '003' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000'
// 		$sql .= " where jf.kbn_1 = ? and jf.kbn_2 <> ? and jf.kbn_3 = ? and jf.kbn_4 = ? "; //(?-1)kbn_1 = '003' (?-2)kbn_2 <> '001' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000'

// 		// Prepare Statement化
// 		$stmt =& $db->db->prepare($sql);
// 		// 検索条件をArray化
// 		$param = array('003','000','000','003','001','000','000');
// 		// SQLを実行
// 		$res = $db->db->execute($stmt, $param);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	* JSONファイル(region_en.json)作成用
	*
	* @return array 取得データ
	*/
	function getJsonRegionEN() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm_1.discription_en region, jf.fair_cnt count, concat('?action_enFairList=true&type=v1&v_2=', jcm_1.kbn_2) url from (select kbn_2, fair_cnt from jm_fair_cnt where kbn_1 = '003' and kbn_2 <> '001' and kbn_3 = '000' and kbn_4 = '000' and site_kbn = '1') jf inner join (select kbn_2, discription_en, disp_num from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num";
// 		$sql = "select jcm_1.kbn_2 id, jcm_1.discription_en region, jf.fair_cnt count from (select kbn_2, fair_cnt from jm_fair_cnt where kbn_1 = '003' and kbn_2 <> '001' and kbn_3 = '000' and kbn_4 = '000') jf left outer join (select kbn_2, discription_en, disp_num from jm_code_m where kbn_1 = '003' and kbn_3 = '000' and kbn_4 = '000') jcm_1 on jf.kbn_2 = jcm_1.kbn_2 order by jcm_1.disp_num";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// SQLを実行
		$res = $db->db->query($sql);

// 		$sql =  " select ";
// 		$sql .= " jcm_1.discription_en region, jf.fair_cnt count ";
// 		$sql .= " from jm_fair_cnt jf ";
// 		$sql .= " left outer join ( select kbn_2, discription_jp, discription_en, disp_num from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by disp_num) jcm_1 on jf.kbn_2 = jcm_1.kbn_2 "; //(?-1)kbn_1 = '003' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000'
// 		$sql .= " where jf.kbn_1 = ? and jf.kbn_2 <> ? and jf.kbn_3 = ? and jf.kbn_4 = ? "; //(?-1)kbn_1 = '003' (?-2)kbn_2 <> '001' (?-2) kbn_3 = '000' (?-3) kbn_4 = '000'

// 		// Prepare Statement化
// 		$stmt =& $db->db->prepare($sql);
// 		// 検索条件をArray化
// 		$param = array('003','000','000','003','001','000','000');
// 		// SQLを実行
// 		$res = $db->db->execute($stmt, $param);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	 * 業種（大分類）の集計値リストを取得する。
	 *
	 * @return array 集計値リスト
	 */
	function getFairCntListMainIndustory($site_kbn) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select kbn_1, kbn_2, kbn_3, kbn_4, fair_cnt from jm_fair_cnt where site_kbn = ?) jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '002' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";
// 		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join jm_fair_cnt jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '002' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);
// 		$res = $db->db->query($sql);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	 * 業種（小分類）の集計リストを取得する。
	 *
	 * @param string $kbn_2 区分2
	 * @return array 集計値リスト
	 */
	function getFairCntListSubIndustory($kbn_2, $site_kbn) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select kbn_1, kbn_2, kbn_3, kbn_4, fair_cnt from jm_fair_cnt where site_kbn = ?) jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '002' and jcm.kbn_2 = ? and jcm.kbn_3 <> '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";
// 		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join jm_fair_cnt jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '002' and jcm.kbn_2 = ? and jcm.kbn_3 <> '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn, $kbn_2);
// 		$param = array($kbn_2);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	 * 地域の集計値リストを取得する。
	 *
	 * @return array 集計値リスト
	 */
	function getFairCntListRegion() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join jm_fair_cnt jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 <> '001' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	 * 国・地域の集計リストを取得する。
	 *
	 * @param string $kbn_2 区分2
	 * @return array 集計値リスト
	 */
	function getFairCntListCountry($kbn_2, $site_kbn) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select kbn_1, kbn_2, kbn_3, kbn_4, fair_cnt from jm_fair_cnt where site_kbn = ?) jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 = ? and jcm.kbn_3 not in ('000', '001') and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";
// 		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join jm_fair_cnt jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 = ? and jcm.kbn_3 not in ('000', '001') and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn, $kbn_2);
// 		$param = array($kbn_2);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	 * 都市の集計値リストを取得する。
	 *
	 * @param string $kbn_2 区分2
	 * @param string $kbn_3 区分3
	 * @return array 集計値リスト
	 */
	function getFairCntListCity($kbn_2, $kbn_3, $site_kbn) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select kbn_1, kbn_2, kbn_3, kbn_4, fair_cnt from jm_fair_cnt where site_kbn = ?) jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 = ? and jcm.kbn_3 = ? and jcm.kbn_4 <> '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";
// 		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join jm_fair_cnt jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 = ? and jcm.kbn_3 = ? and jcm.kbn_4 <> '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by jcm.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn, $kbn_2, $kbn_3);
// 		$param = array($kbn_2, $kbn_3);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	 * 産業別リスト時に表示する国・地域。
	 *
	 * @return array 集計値リスト
	 */
	function getFairCntListCountryDisp($site_kbn) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, concat(jcm.kbn_2, '_', jcm.kbn_3) region_country, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from (select * from jm_code_m where kbn_1 = '003') jcm left outer join (select * from jm_fair_cnt where kbn_1 = '003' and site_kbn = ?) jfc on jcm.kbn_2 = jfc.kbn_2 and jcm.kbn_3 = jfc.kbn_3 and jcm.kbn_4 = jfc.kbn_4 where jcm.kbn_2 <> '001' and jcm.kbn_3 not in ('000', '001') and jcm.kbn_4 = '000' and jcm.disp_cd = '1' group by jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num order by jcm.kbn_2 asc, jcm.disp_num asc";
// 		$sql = "select jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, concat(jcm.kbn_2, '_', jcm.kbn_3) region_country, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from (select * from jm_code_m where kbn_1 = '003') jcm left outer join (select * from jm_fair_cnt where kbn_1 = '003') jfc on jcm.kbn_2 = jfc.kbn_2 and jcm.kbn_3 = jfc.kbn_3 and jcm.kbn_4 = jfc.kbn_4 where jcm.kbn_2 <> '001' and jcm.kbn_3 not in ('000', '001') and jcm.kbn_4 = '000' and jcm.disp_cd = '1' group by jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num order by jcm.kbn_2 asc, jcm.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);
// 		$res = $db->db->query($sql);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	 * 産業別リスト時に隠す国・地域。
	 *
	 * @return array 集計値リスト
	 */
	function getFairCntListCountryClose() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, concat(jcm.kbn_2, '_', jcm.kbn_3) region_country, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from (select * from jm_code_m where kbn_1 = '003') jcm left outer join (select * from jm_fair_cnt where kbn_1 = '003' and site_kbn = ?) jfc on jcm.kbn_2 = jfc.kbn_2 and jcm.kbn_3 = jfc.kbn_3 and jcm.kbn_4 = jfc.kbn_4 where jcm.kbn_2 <> '001' and jcm.kbn_3 not in ('000', '001') and jcm.kbn_4 = '000' and jcm.disp_cd is null group by jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num order by jcm.kbn_2 asc, jcm.disp_num asc";
// 		$sql = "select jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, concat(jcm.kbn_2, '_', jcm.kbn_3) region_country, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from (select * from jm_code_m where kbn_1 = '003') jcm left outer join (select * from jm_fair_cnt where kbn_1 = '003') jfc on jcm.kbn_2 = jfc.kbn_2 and jcm.kbn_3 = jfc.kbn_3 and jcm.kbn_4 = jfc.kbn_4 where jcm.kbn_2 <> '001' and jcm.kbn_3 not in ('000', '001') and jcm.kbn_4 = '000' and jcm.disp_cd is null group by jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num order by jcm.kbn_2 asc, jcm.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);
// 		$res = $db->db->query($sql);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

	/**
	* 産業別リスト時に隠す国・地域の数を含む地域のリスト。
	*
	* @return array 集計値リスト
	*/
	function getFairCntListRegionIndustory($site_kbn) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select t1.kbn_1, t1.kbn_2, t1.kbn_3, t1.kbn_4, t1.discription_jp, t1.discription_en, t1.disp_cd, t1.disp_num, t1.reserve_1, t1.reserve_2, t1.reserve_3, t1.reserve_4, t1.reserve_5, t1.reserve_6, t1.fair_cnt, ifnull(sum(t2.cnt), 0) cnt from (select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select kbn_1, kbn_2, kbn_3, kbn_4, fair_cnt from jm_fair_cnt where site_kbn = ?) jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 <> '001' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by kbn_2 asc) t1 left outer join (select kbn_2, count(*) cnt from jm_code_m where kbn_1 = '003' and kbn_2 not in ('000', '001') and kbn_3 not in ('000', '001') and kbn_4 = '000' and disp_cd is null group by kbn_2) t2 on t1.kbn_2 = t2.kbn_2 group by t1.kbn_2 order by t1.disp_num asc";
// 		$sql = "select t1.kbn_1, t1.kbn_2, t1.kbn_3, t1.kbn_4, t1.discription_jp, t1.discription_en, t1.disp_cd, t1.disp_num, t1.reserve_1, t1.reserve_2, t1.reserve_3, t1.reserve_4, t1.reserve_5, t1.reserve_6, t1.fair_cnt, ifnull(sum(t2.cnt), 0) cnt from (select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join jm_fair_cnt jfc on jcm.kbn_1 = jfc.kbn_1 and jcm.kbn_2 = jfc.kbn_2 and jfc.kbn_3 = jcm.kbn_3 and jfc.kbn_4 = jcm.kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 <> '001' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_cd, jcm.disp_num, jcm.reserve_1, jcm.reserve_2, jcm.reserve_3, jcm.reserve_4, jcm.reserve_5, jcm.reserve_6 order by kbn_2 asc) t1 left outer join (select kbn_2, count(*) cnt from jm_code_m where kbn_1 = '003' and kbn_2 not in ('000', '001') and kbn_3 not in ('000', '001') and kbn_4 = '000' and disp_cd is null group by kbn_2) t2 on t1.kbn_2 = t2.kbn_2 group by t1.kbn_2 order by t1.disp_num asc";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);
// 		$res = $db->db->query($sql);

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
		$i = 0;
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

}

/**
 *  Jmesse_JmFairCnt
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmFairCnt extends Ethna_AppObject
{
	/**
	 *  @var    array   テーブル定義
	 */
	var $table_def = array(
		'jm_fair_cnt' => array(
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
