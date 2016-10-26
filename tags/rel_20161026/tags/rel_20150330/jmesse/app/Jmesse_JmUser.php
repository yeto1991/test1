<?php
/**
 *  Jmesse_JmUser.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmUserManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmUserManager extends Ethna_AppManager
{
	/**
	 * 見本市移譲先ユーザ情報取得
	 *
	 * @param string $user_id 見本市移譲先ユーザID
	 * @return array<string>：検索結果、null：データなし、DB::Error()：エラー
	 */
	function getUserTrasferTargetInfo($user_id) {

		$db = $this->backend->getDB();
		$sql = "select user_id, user_nm, email from jm_user where user_id = ?";
		$stmt =& $db->db->prepare($sql);
		$param = array($user_id);
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
	 * 見本市未移譲ユーザ一覧データ取得
	 *
	 * @return array<string>：検索結果、null：データなし、DB::Error()：エラー
	 */
	function getUserTrasferList() {

		$db = $this->backend->getDB();
		$sql = " select jmu.user_id, user_nm, email, fair_cnt from jm_user as jmu ";
		$sql .= " left join (select user_id, count(*) as fair_cnt from jm_fair group by user_id) as jmf on jmu.user_id = jmf.user_id ";
		$sql .= " where jmu.del_flg = ? and fair_cnt is not null order by jmu.user_id ASC; ";
		$stmt =& $db->db->prepare($sql);
		$param = array('1');
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
	* Eメール重複チェック用データ取得
	*
	* @param string $email 登録するEメール
	* @return string 取得結果（重複エラーの場合[DOUBLE_CHECK_OK],重複エラーではない場合[DOUBLE_CHECK_NG]）
	*/
	function getEmailForDoubleCheck($email) {
		$db = $this->backend->getDB();
		$sql = "select count(*) cnt from jm_user where email = ?";
		$stmt =& $db->db->prepare($sql);
		$param = array($email);
		$res = $db->db->execute($stmt, $param);
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, '検索Errorが発生しました。');
			$this->backend->getActionError()->addObject('error', $res);
			return $res;
		}
		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		if($row['cnt'] != 0){
			return "DOUBLE_CHECK_NG";
		}
		return "DOUBLE_CHECK_OK";
	}

	/**
	* Eメール重複チェック用データ取得（フロントサイト用）
	*
	* @param string $user_id Eメールを登録予定のユーザID（新規登録の場合、''空文字）
	* @param string $email 登録するEメール
	* @return string 取得結果（重複エラーの場合[DOUBLE_CHECK_OK],重複エラーではない場合[DOUBLE_CHECK_NG]）
	*/
	function getEmailForDoubleCheckForFront($user_id, $email) {
		$db = $this->backend->getDB();
		$sql = "select user_id, del_flg from jm_user where email = ?";
		$stmt =& $db->db->prepare($sql);
		$param = array($email);
		$res = $db->db->execute($stmt, $param);
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, '検索Errorが発生しました。');
			$this->backend->getActionError()->addObject('error', $res);
			return $res;
		}
		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		if($row['del_flg'] == '0'){
			if($row['user_id'] == $user_id){
				return "DOUBLE_CHECK_OK";
			}else{
				return "DOUBLE_CHECK_NG";
			}
		}elseif($row['del_flg'] == '1'){
			return "DOUBLE_CHECK_DEL_FLG1";
		}else{
			return "DOUBLE_CHECK_OK";
		}
	}

	/**
	* テキスト入力、検索条件。
	*
	* @param string $column カラム名
	* @param string $text 入力値
	* @param string $cond 検索条件
	* @param array $data 完成した条件式
	* @return string 成功:作成SQL 失敗:空文字
	*/
	function _mkSqlText($column, $text, $cond, &$data) {
		if ( '' == $text) {
			return '';
		}
		$sql = '';
		// ' '区切りを配列へ
		$value = explode(' ', $text);
		if ('1' == $cond) {
			// 一致
			$sql .= $column.' in (';
			for ($i = 0; $i < count($value); $i++) {
				if ('' != $value[$i]) {
					$sql .= ' ?,';
					array_push($data, $value[$i]);
				}
			}
			$sql = rtrim($sql, ",");
			$sql .= ' ) ';
		} elseif ('2' == $cond) {
			// 不一致
			$sql .= ' not '.$column.' in (';
			for ($i = 0; $i < count($value); $i++) {
				if ('' != $value[$i]) {
					$sql .= ' ?,';
					array_push($data, $value[$i]);
				}
			}
			$sql = rtrim($sql, ",");
			$sql .= ' ) ';
		} elseif ('3' == $cond) {
			// 前一致
			$sql .= ' '.$column.' like ';
			$sqlA = ' and '.$column.' like ';
			for ($i = 0; $i < count($value); $i++) {
				if ('' != $sql) {
					$sql .= ' ? '.$sqlA;
				}
				array_push($data, $value[$i].'%');
			}
			$sql = rtrim($sql, $sqlA);
		} elseif ('4' == $cond) {
			// 前不一
			$sql .= ' '.$column.' not like ';
			$sqlA = ' and '.$column.' not like ';
			for ($i = 0; $i < count($value); $i++) {
				if ('' != $sql) {
					$sql .= ' ? '.$sqlA;
				}
				array_push($data, $value[$i].'%');
			}
			$sql = rtrim($sql, $sqlA);
		} elseif ('5' == $cond) {
			// 含む
			$sql .= ' '.$column.' like ';
			$sqlA = ' and '.$column.' like ';
			for ($i = 0; $i < count($value); $i++) {
				if ('' != $sql) {
					$sql .= ' ? '.$sqlA;
				}
				array_push($data, '%'.$value[$i].'%');
			}
			$sql = rtrim($sql, $sqlA);
		} elseif ('6' == $cond) {
			// 含まず
			$sql .= ' '.$column.' not like ';
			$sqlA = ' and '.$column.' not like ';
			for ($i = 0; $i < count($value); $i++) {
				if ('' != $sql) {
					$sql .= ' ? '.$sqlA;
				}
				array_push($data, '%'.$value[$i].'%');
			}
			$sql = rtrim($sql, $sqlA);
		}
		return $sql;
	}

	/**
	 * where句の連結
	 *
	 * @param string $sql_ext where句
	 * @param string $sql_tmp 追加のwhere句
	 * @return string where句の連結文
	 */
	function _addWhere($sql_ext, $sql_tmp) {
		if ('' != $sql_tmp) {
			if ('' == $sql_ext) {
				$sql_ext = ' where ';
			} else {
				$sql_ext .= ' and ';
			}
			$sql_ext .= $sql_tmp;
		}
		return $sql_ext;
	}

	/**
	* 性別条件
	*
	* @param string $column カラム名
	* @param array $gender0 性別0
	* @param array $gender1 性別1
	* @param array $gender2 性別2
	* @return array $data 完成した条件式
	*/
	function _mkSqlCheckGender($column, $gender0, $gender1, $gender2, &$data) {
		$sql = ' '.$column." in (";
		if($gender0 == "1"){
			$sql = $sql."?,";
			array_push($data, '0');
		}
		if($gender1 == "1"){
			$sql = $sql."?,";
			array_push($data, '1');
		}
		if($gender2 == "1"){
			$sql = $sql."?,";
			array_push($data, '2');
		}
		//最後のカンマを削除
		$sql = rtrim($sql, ",");
		$sql = $sql.") ";
		if($sql == ' '.$column." in (".") "){
			return '';
		}
		return $sql;
	}

	/**
	* 選択項目コード２つのパターン系
	*
	* @param string $column カラム名
	* @param array $code0 コード値：0のデータ
	* @param array $code1 コード値：1のデータ
	* @return array $data 完成した条件式
	*/
	function _mkSqlCheckSelectCode2($column, $code0, $code1, &$data) {
		$sql = ' '.$column." in (";
		if($code0 == "1"){
			$sql = $sql."?,";
			array_push($data, '0');
		}
		if($code1 == "1"){
			$sql = $sql."?,";
			array_push($data, '1');
		}
		//最後のカンマを削除
		$sql = rtrim($sql, ",");
		$sql = $sql.") ";
		if($sql == ' '.$column." in (".") "){
			return '';
		}
		return $sql;
	}

	/**
	* 検索条件によるwhere句の作成。
	*
	* @param array $data 入力値
	* @return 形成したWhere句
	*/
	function _getWhere(&$data) {
		// 入力値を取得
		$search_cond = $this->session->get('search_cond');
		// 形成用変数
		$sql_ext = '';
		$sql_tmp = '';

		//Eメール
		$sql_tmp = $this->_mkSqlText('email', $search_cond['searchEmail'], $search_cond['searchConditionEmail'], $data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//パスワード
		$sql_tmp = $this->_mkSqlText('password', $search_cond['searchPassword'], $search_cond['searchConditionPassword'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//会社名
		$sql_tmp = $this->_mkSqlText('company_nm', $search_cond['searchCompanyNm'], $search_cond['searchConditionCompanyNm'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//部署名
		$sql_tmp = $this->_mkSqlText('division_dept_nm', $search_cond['searchDivisionDeptNm'], $search_cond['searchConditionDivisionDeptNm'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//氏名
		$sql_tmp = $this->_mkSqlText('user_nm', $search_cond['searchUserNm'], $search_cond['searchConditionUserNm'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//郵便番号
		$sql_tmp = $this->_mkSqlText('post_code', $search_cond['searchPostCode'], $search_cond['searchConditionPostCode'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//住所
		$sql_tmp = $this->_mkSqlText('address', $search_cond['searchAddress'], $search_cond['searchConditionAddress'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//TEL
		$sql_tmp = $this->_mkSqlText('tel', $search_cond['searchTel'], $search_cond['searchConditionTel'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//FAX
		$sql_tmp = $this->_mkSqlText('fax', $search_cond['searchFax'], $search_cond['searchConditionFax'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//URL
		$sql_tmp = $this->_mkSqlText('url', $search_cond['searchUrl'], $search_cond['searchConditionUrl'],$data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		// 性別
		$sql_tmp = $this->_mkSqlCheckGender('gender_cd', $search_cond['searchGenderCd0'],$search_cond['searchGenderCd1'],$search_cond['searchGenderCd2'], $data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//ユーザ使用言語
		$sql_tmp = $this->_mkSqlCheckSelectCode2('use_language_cd', $search_cond['searchUseLanguageCd0'],$search_cond['searchUseLanguageCd1'], $data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//一般権限
		$sql_tmp = $this->_mkSqlCheckSelectCode2('auth_gen', $search_cond['searchAuthGen0'],$search_cond['searchAuthGen1'], $data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//ユーザ管理権限
		$sql_tmp = $this->_mkSqlCheckSelectCode2('auth_user', $search_cond['searchAuthUser0'],$search_cond['searchAuthUser1'], $data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//展示会管理権限
		$sql_tmp = $this->_mkSqlCheckSelectCode2('auth_fair', $search_cond['searchAuthFair0'],$search_cond['searchAuthFair1'], $data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		//削除フラグ
		$sql_tmp = $this->_mkSqlCheckSelectCode2('del_flg', $search_cond['searchdelflg0'],$search_cond['searchdelflg1'], $data);
		$sql_ext = $this->_addWhere($sql_ext, $sql_tmp);
		$sql_ext = $sql_ext." order by user_id asc";

		return $sql_ext;
	}

	/**
	* ユーザ管理 ユーザ情報検索画面 検索処理。
	* @param array ページング $offset
	* @param array ページング $limit
	* @return array<string>：検索結果、null：データなし、DB::Error()：エラー
	*/
	function getUserInfoList($offset, $limit) {
		$db = $this->backend->getDB();
		$sql = "select user_id, password, company_nm, division_dept_nm, user_nm,gender_cd, email, post_code, address, tel, fax, url, use_language_cd, regist_result_notice_cd, auth_gen, auth_user, auth_fair, idpass_notice_cd, del_flg, del_date, regist_user_id, regist_date, update_user_id, update_date from jm_user";
		$data = array();
		// where句の取得
		$sql_ext =$this->_getWhere($data);
		// ページング
		$sql_limit = ' limit '.$offset.', '.$limit;
		$this->backend->getLogger()->log(LOG_DEBUG, 'SQL : '.$sql.$sql_ext.$sql_limit);
		// Prepare Statement化
		$stmt =& $db->db->prepare($sql.$sql_ext.$sql_limit);
		// SQLを実行
		$res = $db->db->execute($stmt, $data);
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
		while ($tmp =& $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i] = $tmp;
			$i ++;
		}
		return $list;
	}

	/**
	* ユーザ管理 ユーザ情報検索画面 検索処理総件数取得。
	*
	* @return array<string>：検索結果件数、null：データなし、DB::Error()：エラー
	*/
	function getUserInfoListCount() {
		$db = $this->backend->getDB();
		$sql = "select count(*) cnt from jm_user";
		$data = array();
		// where句の取得
		$sql_ext = $this->_getWhere($data);
		// Prepare Statement化
		$stmt =& $db->db->prepare($sql.$sql_ext);
		// SQLを実行
		$res = $db->db->execute($stmt, $data);
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
		return $row['cnt'];
	}

	/**
	* ユーザ管理 ユーザ情報ダウンロード用検索処理
	*
	* @return array<string>：検索結果、null：データなし、DB::Error()：エラー
	*/
	function getUserListDownload() {
		$db = $this->backend->getDB();
		$sql = "select email from jm_user";
		$data = array();
		// where句の取得
		$sql_ext =$this->_getWhere($data);
		// Prepare Statement化
		$stmt =& $db->db->prepare($sql.$sql_ext);
		// SQLを実行
		$res = $db->db->execute($stmt, $data);
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
 *  Jmesse_JmUser
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmUser extends Ethna_AppObject
{

	/**
	 *  @var    array   テーブル定義
	 */
	var $table_def = array(
		'jm_user' => array(
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
