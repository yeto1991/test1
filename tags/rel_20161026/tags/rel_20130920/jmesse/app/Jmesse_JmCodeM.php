<?php
/**
 *  Jmesse_JmCodeM.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmCodeMManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmCodeMManager extends Ethna_AppManager
{

	/**
	 * 都市のコード値を取得。
	 *
	 * @param string $kbn_2 地域コード値
	 * @param string $kbn_3 国・地域コード値
	 * @param string $discription_jp 都市名
	 * @return string 都市のコード値
	 */
	function getCityCode($kbn_2, $kbn_3, $discription_jp) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select kbn_4 from jm_code_m where kbn_1 = '003' and kbn_2 = ? and kbn_3 = ? and kbn_4 <> '000' and discription_jp = ?";

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($kbn_2, $kbn_3, $discription_jp);

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
			return $res;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		return $row['kbn_4'];
	}

	/**
	 * 国・地域のコード値を取得。
	 *
	 * @param string $kbn_2 地域コード値
	 * @param string $discription_jp 国・地域名
	 * @return string 国・地域のコード値
	 */
	function getCountryCode($kbn_2, $discription_jp) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select kbn_3 from jm_code_m where kbn_1 = '003' and kbn_2 = ? and kbn_3 <> '000' and kbn_4 = '000' and discription_jp = ?";

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($kbn_2, $discription_jp);

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
			return $res;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		return $row['kbn_3'];
	}

	/**
	 * 地域のコード値を取得。
	 *
	 * @param string $discription_jp 地域名
	 * @return string 地域のコード値
	 */
	function getRegionCode($discription_jp) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select kbn_2 from jm_code_m where kbn_1 = '003' and kbn_2 <> '000' and kbn_3 = '000' and kbn_4 = '000' and discription_jp = ?";

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($discription_jp);

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
			return $res;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		return $row['kbn_2'];
	}

	/**
	 * 業種（小分類）のコード値を取得。
	 *
	 * @param string $kbn_2 業種（大分類）コード値
	 * @param string $discription_jp 業種（小分類）名
	 * @return string 業種（小分類）のコード値
	 */
	function getSubIndustoryCode($kbn_2, $discription_jp) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select kbn_3 from jm_code_m where kbn_1 = '002' and kbn_2 = ? and kbn_3 <> '000' and kbn_4 = '000' and discription_jp = ?";

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($kbn_2, $discription_jp);

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
			return $res;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		return $row['kbn_3'];
	}


	/**
	 * 業種（大分類）のコード値を取得。
	 *
	 * @param string $discription_jp 業種（大分類）名
	 * @return string 業種（大分類）のコード値
	 */
	function getMainIndustoryCode($discription_jp) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select kbn_2 from jm_code_m where kbn_1 = '002' and kbn_2 <> '000' and kbn_3 = '000' and kbn_4 = '000' and discription_jp = ?";

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($discription_jp);

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
			return $res;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		return $row['kbn_2'];
	}

	/**
	 * コードを取得する。
	 *
	 * @param unknown_type $kbn_1
	 * @param unknown_type $kbn_2
	 * @param unknown_type $kbn_3
	 * @param unknown_type $kbn_4
	 * @return hashmap
	 */
	function getCode($kbn_1, $kbn_2, $kbn_3, $kbn_4) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_2 = ? and kbn_3 = ? and kbn_4 = ?';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array($kbn_1, $kbn_2, $kbn_3, $kbn_4);

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
			return $res;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		return $row;
	}


	/**
	 * 開催頻度のリストを取得する。
	 *
	 * @return array<string>：開催頻度リスト、null：データなし、DB::Error()：エラー
	 */
	function getFrequencyList() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_2, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by kbn_2 asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('001', '000', '000');

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
			return $res;
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
	 * 業種（大分類）リストを取得する。
	 *
	 * @return array<string>：業種（大分類）リスト、null：データなし、DB::Error()：エラー
	 */
	function getMainIndustoryList() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_2, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by disp_num asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('002', '000', '000');

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
			return $res;
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
	 * 業種（小分類）リストを取得する。
	 *
	 * @param string $kbn_2 業種（大分類）
	 * @return array<string>：業種（小分類）リスト、null：データなし、DB::Error()：エラー
	 */
	function getSubIndustoryList($kbn_2) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_3, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_2 = ? and kbn_3 <> ? and kbn_4 = ? order by disp_num asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('002', $kbn_2, '000', '000');

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
			return $res;
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
	 * 地域リストを取得する。
	 *
	 * @return array<string>：地域リスト、null：データなし、DB::Error()：エラー
	 */
	function getRegionList() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_2, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_2 <> ? and kbn_3 = ? and kbn_4 = ? order by disp_num asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('003', '001', '000', '000');

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
			return $res;
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
	 * 地域リストを取得する。（検索画面用）
	 *
	 * @return array<string>：地域リスト、null：データなし、DB::Error()：エラー
	 */
	function getRegionListSearch() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_2, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by disp_num asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('003', '000', '000');

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
			return $res;
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
	 * 国・地域リストを取得する。
	 *
	 * @param string $kbn_2 地域
	 * @return array<string>：国・地域リスト、null：データなし、DB::Error()：エラー
	 */
	function getCountryList($kbn_2) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_3, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_2 = ? and kbn_3 not in (?, ?) and kbn_4 = ? order by disp_num asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('003', $kbn_2, '000', '001', '000');

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
			return $res;
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
	* 国・地域リストを取得する。（検索画面用）
	*
	* @param string $kbn_2 地域
	* @return array<string>：国・地域リスト、null：データなし、DB::Error()：エラー
	*/
	function getCountryListSearch($kbn_2) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_3, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_2 = ? and kbn_3 <> ? and kbn_4 = ? order by disp_num asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('003', $kbn_2, '000', '000');

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
			return $res;
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
	 * 都市リストを取得する。
	 *
	 * @param string $kbn_2 地域
	 * @param string $kbn_3 国・地域
	 * @return array<string>：都市リスト、null：データなし、DB::Error()：エラー
	 */
	function getCityList($kbn_2, $kbn_3) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_4, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_2 = ? and kbn_3 = ? and kbn_4 <> ? order by disp_num asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('003', $kbn_2, $kbn_3, '000');

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
			return $res;
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
	* 都市名を取得する。
	*
	* @param string $kbn_2 地域
	* @param string $kbn_3 国・地域
	* @param string $kbn_4 都市
	* @return array<string>：都市名配列、null：データなし、DB::Error()：エラー
	*/
	function getCityName($kbn_2, $kbn_3, $kbn_4) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_2 = ? and kbn_3 = ? and kbn_4 = ?';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('003', $kbn_2, $kbn_3, $kbn_4);

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
			return $res;
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

		return $list[0];
	}

	/**
	 * 入場資格リストを取得する。
	 *
	 * @return array<string>：入場資格リスト、null：データなし、DB::Error()：エラー
	 */
	function getOpenToList() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = 'select kbn_2, discription_jp, discription_en, disp_cd, disp_num, reserve_1, reserve_2, reserve_3, reserve_4, reserve_5, reserve_6 from jm_code_m where kbn_1 = ? and kbn_3 = ? and kbn_4 = ? order by kbn_2 asc';

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array('004', '000', '000');

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
			return $res;
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
	 * 業種（大分類_小分類）を取得する。(JP)
	 *
	 */
	function getMainSubIndustory() {

		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select si.kbn_2, si.kbn_3, mi.discription_jp main_industory_name, si.discription_jp sub_industory_name, concat(si.kbn_2, '_', si.kbn_3, '_', mi.discription_jp, '_', si.discription_jp) sub_industory_code from (select kbn_2, kbn_3, discription_jp, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 <> '000') si left outer join (select kbn_2, discription_jp, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000') mi on si.kbn_2 = mi.kbn_2 order by mi.disp_num asc, si.disp_num asc";

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
			return $res;
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
	* 業種（大分類_小分類）を取得する。(EN)
	*
	*/
	function getEnMainSubIndustory() {

		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select si.kbn_2, si.kbn_3, mi.discription_en main_industory_name, si.discription_en sub_industory_name, concat(si.kbn_2, '_', si.kbn_3, '_', mi.discription_en, '_', si.discription_en) sub_industory_code from (select kbn_2, kbn_3, discription_en, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 <> '000') si left outer join (select kbn_2, discription_en, disp_num from jm_code_m where kbn_1 = '002' and kbn_3 = '000' and kbn_4 = '000') mi on si.kbn_2 = mi.kbn_2 order by mi.disp_num asc, si.disp_num asc";

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
			return $res;
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
 *  Jmesse_JmCodeM
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmCodeM extends Ethna_AppObject
{
	/**
	 *  @var    array   テーブル定義
	 */
	var $table_def = array(
		'jm_code_m' => array(
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
