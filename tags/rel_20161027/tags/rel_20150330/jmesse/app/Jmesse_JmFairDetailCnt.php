<?php
/**
 *  Jmesse_JmFairDetailCnt.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmFairDetailCntManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmFairDetailCntManager extends Ethna_AppManager
{
	/**
	 * 産業別リスト時に隠す国・地域の数を含む地域のリスト。
	 *
	 * @return array 集計値リスト
	 */
	function getFairCntListRegionIndustory($site_kbn, $main_industory, $sub_industory) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		// MOD-S 2012.02.03 カラム削除
		$sql = "select t1.kbn_2, t1.kbn_3, t1.discription_jp, t1.discription_en, t1.disp_num, t1.fair_cnt, ifnull(sum(t2.cnt), 0) cnt from (select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select v_kbn_2, v_kbn_3, v_kbn_4, fair_cnt from jm_fair_detail_cnt where site_kbn = ? and i_kbn_2 = ? and i_kbn_3 = ?) jfc on jcm.kbn_2 = jfc.v_kbn_2 and jcm.kbn_3 = jfc.v_kbn_3 and jcm.kbn_4 = jfc.v_kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 <> '001' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num) t1 left outer join (select kbn_2, count(*) cnt from jm_code_m where kbn_1 = '003' and kbn_2 not in ('000', '001') and kbn_3 not in ('000', '001') and kbn_4 = '000' and disp_cd is null group by kbn_2) t2 on t1.kbn_2 = t2.kbn_2 group by t1.kbn_2, t1.kbn_3 order by t1.disp_num asc";
// 		$sql = "select t1.kbn_2, t1.kbn_3, t1.discription_jp, t1.discription_en, t1.disp_num, t1.fair_cnt, ifnull(sum(t2.cnt), 0) cnt from (select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select v_kbn_1, v_kbn_2, v_kbn_3, v_kbn_4, fair_cnt from jm_fair_detail_cnt where site_kbn = ? and i_kbn_2 = ? and i_kbn_3 = ?) jfc on jcm.kbn_1 = jfc.v_kbn_1 and jcm.kbn_2 = jfc.v_kbn_2 and jcm.kbn_3 = jfc.v_kbn_3 and jcm.kbn_4 = jfc.v_kbn_4 where jcm.kbn_1 = '003' and jcm.kbn_2 <> '001' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num) t1 left outer join (select kbn_2, count(*) cnt from jm_code_m where kbn_1 = '003' and kbn_2 not in ('000', '001') and kbn_3 not in ('000', '001') and kbn_4 = '000' and disp_cd is null group by kbn_2) t2 on t1.kbn_2 = t2.kbn_2 group by t1.kbn_2, t1.kbn_3 order by t1.disp_num asc";
		// MOD-E 2012.02.03 カラム削除

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn, $main_industory, $sub_industory);

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
		$list = array();
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
	function getFairCntListMainIndustory($site_kbn, $region, $country, $city) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		// MOD-S 2012.02.03 カラム削除
		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select i_kbn_2, i_kbn_3, i_kbn_4, fair_cnt from jm_fair_detail_cnt where site_kbn = ? and v_kbn_2 = ? and v_kbn_3 = ? and v_kbn_4 = ?) jfc on jcm.kbn_2 = jfc.i_kbn_2 and jcm.kbn_3 = jfc.i_kbn_3 and jcm.kbn_4 = jfc.i_kbn_4 where jcm.kbn_1 = '002' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num order by jcm.disp_num asc";
// 		$sql = "select jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num, ifnull(sum(jfc.fair_cnt), 0) fair_cnt from jm_code_m jcm left outer join (select i_kbn_1, i_kbn_2, i_kbn_3, i_kbn_4, fair_cnt from jm_fair_detail_cnt where site_kbn = ? and v_kbn_2 = ? and v_kbn_3 = ? and v_kbn_4 = ?) jfc on jcm.kbn_1 = jfc.i_kbn_1 and jcm.kbn_2 = jfc.i_kbn_2 and jcm.kbn_3 = jfc.i_kbn_3 and jcm.kbn_4 = jfc.i_kbn_4 where jcm.kbn_1 = '002' and jcm.kbn_3 = '000' and jcm.kbn_4 = '000' group by jcm.kbn_1, jcm.kbn_2, jcm.kbn_3, jcm.kbn_4, jcm.discription_jp, jcm.discription_en, jcm.disp_num order by jcm.disp_num asc";
		// MOD-E 2012.02.03 カラム削除

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($site_kbn, $region, $country, $city);

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
		$list = array();
		while ($tmp = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}

		return $list;
	}

}

/**
 *  Jmesse_JmFairDetailCnt
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmFairDetailCnt extends Ethna_AppObject
{
	/**
	 *  @var    array   テーブル定義
	 */
	var $table_def = array(
		'jm_fair_detail_cnt' => array(
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
