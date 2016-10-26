<?php
/**
 *  Jmesse_JmQA.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmQAManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmQAManager extends Ethna_AppManager
{

	/**
	 * アンケート質問情報取得SQL。（見本市詳細画面表示用）
	 *
	 * @var string
	 */

	function getFairQA() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql_get_fair_qa = "select q.q_id, q.q_jp, q.q_en, a.a_id, a.a_jp, a.a_en from (select * from jm_fair_q where start_date <= sysdate() and finish_date >= sysdate() order by q_id limit 1) q inner join jm_fair_a a on q.q_id = a.q_id order by a.a_id";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql_get_fair_qa);
		// SQLを実行
		$res =& $db->db->query($sql_get_fair_qa);

		// 結果の判定
		if (null == $res) {
			$this->backend->getLogger()->log(LOG_ERR, '検索結果が取得できません。');
			return null;
		}
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, '検索Errorが発生しました。');
			return null;
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
	 * アンケート回答数をカウントアップする。
	 *
	 * @param int $ans 回答
	 * @param string $lang 日または英
	 */
	function countUp($ans, $lang) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		// SQL
		$sql = 'select q.q_id,a.a_id,a.a_cnt_jp,a.a_cnt_en from (select * from jm_fair_q where start_date <= sysdate() and finish_date >= sysdate() order by q_id limit 1) q left outer join jm_fair_qa_result a on (q.q_id = a.q_id and a.a_id = ?)';
		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

		// 検索条件をArray化
		$param = array((int)$ans);

		// SQLを実行
		$res = $db->db->execute($stmt, $param);

		// 結果の判定
		if (null == $res) {
			$this->backend->getLogger()->log(LOG_ERR, 'アンケート回答検索結果が取得できません。');
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

		// リスト化
		$row = $res->fetchRow(DB_FETCHMODE_ASSOC);
		$msg='q_id='.$row['q_id'].' a_id='.$ans;
		if (is_null($row['a_id'])) {
			$this->backend->getLogger()->log(LOG_ERR, 'アンケート回答結果テーブルにレコードがありません。'.$msg);
			$db->rollback();
			return null;
		} else {
			if ($lang == 'J'){
				$cnt=$row['a_cnt_jp'];
			}else{
				$cnt=$row['a_cnt_en'];
			}
			$this->backend->getLogger()->log(LOG_DEBUG, 'アンケート回答カウントアップ更新 '.$msg.' 現在のカウント'.$cnt);

			// update
 			if ($lang == 'J'){
 				$sql_up = "update jm_fair_qa_result set a_cnt_jp = a_cnt_jp + 1 where q_id = ? and a_id = ?";
 			} else {
 				$sql_up = "update jm_fair_qa_result set a_cnt_en = a_cnt_en + 1 where q_id = ? and a_id = ?";
 			}
 			// Prepare Statement化
 			$stmt_up =& $db->db->prepare($sql_up);
 			// 検索条件をArray化
 			$param = array((int)$row['q_id'], (int)$ans);
 			// SQLを実行
 			$res_up = $db->db->execute($stmt_up, $param);
			if (DB::isError($res_up)) {
				$msg = '更新Errorが発生しました。';
				$this->backend->getLogger()->log(LOG_ERR, $msg);
				$this->ae->add('error', $msg);
				$db->rollback();
				return null;
			}
		}

		// コミット
		$db->commit();
		return true;
	}
	/**
	 * アンケート質問結果情報取得SQL。（管理画面表示用）
	 *
	 * @var string
	 */

	function getFairQAResult() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select q.q_id, q.q_jp, q.q_en, date_format(q.start_date,'%Y/%m/%d') start_date, date_format(q.finish_date,'%Y/%m/%d') finish_date, a.a_id, a.a_jp, a.a_en,ifnull((r.a_cnt_jp+r.a_cnt_en),0) cnt from (select * from jm_fair_q where start_date <= sysdate() order by q_id desc limit 2) q inner join jm_fair_a a on (q.q_id = a.q_id) left outer join jm_fair_qa_result r on (a.q_id = r.q_id and a.a_id = r.a_id) order by q.q_id,a.a_id";

		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);
		// SQLを実行
		$res =& $db->db->query($sql);

		// 結果の判定
		if (null == $res) {
			$this->backend->getLogger()->log(LOG_ERR, '検索結果が取得できません。');
			return null;
		}
		if (DB::isError($res)) {
			$this->backend->getLogger()->log(LOG_ERR, '検索Errorが発生しました。');
			return null;
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
}

/**
 *  Jmesse_JmQA
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmQA extends Ethna_AppObject
{
	/**
	 *  @var    array   テーブル定義
	 */
	var $table_def = array(
		'jm_fair_qa_result' => array(
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
