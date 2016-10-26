<?php
/**
 *  Jmesse_JmErrMail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 82fb28d30e5eeac17975be5c2e3c1f3eb2c3efda $
 */

/**
 *  Jmesse_JmErrMailManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmErrMailManager extends Ethna_AppManager
{
	/**
	 * テーブルのtruncate。
	 *
	 */
	function truncate() {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "truncate table jm_err_mail";

		// SQLを実行
		$res = $db->db->query($sql);
	}

	/**
	 * エラーメール検索。
	 *
	 * @param string $date_from
	 * @param string $date_to
	 * @param string $email
	 * @param string $address
	 * @param string $server
	 * @param string $other
	 * @return array エラーメールリスト
	 */
	function getErrMailList($date_from, $date_to, $email, $address, $server, $other) {
		// DBオブジェクト取得
		$db = $this->backend->getDB();

		// SQL作成
		$sql = "select yyyymmdd, email, err_kind from jm_err_mail ";

		// where句
		$data = array();
		$sql_where = '';
		if ('' != $date_from) {
			if ('' == $sql_where) {
				$sql_where .= ' where ';
			} else {
				$sql_where .= ' and ';
			}
			$sql_where .= ' yyyymmdd >= ? ';
			array_push($data, $date_from);
		}
		if ('' != $date_to) {
			if ('' == $sql_where) {
				$sql_where .= ' where ';
			} else {
				$sql_where .= ' and ';
			}
			$sql_where .= ' yyyymmdd <= ? ';
			array_push($data, $date_to);
		}
		if ('' != $email) {
			if ('' == $sql_where) {
				$sql_where .= ' where ';
			} else {
				$sql_where .= ' and ';
			}
			$sql_where .= ' email = ? ';
			array_push($data, $email);
		}
		if ('0' == $address || '1' == $server || '2' == $other) {
			if ('' == $sql_where) {
				$sql_where .= ' where ';
			} else {
				$sql_where .= ' and ';
			}
			$sql_where_tmp = '';
			if ('0' == $address) {
				if ('' == $sql_where_tmp) {
					$sql_where_tmp .= ' ? ';
				} else {
					$sql_where_tmp .= ' , ? ';
				}
				array_push($data, $address);
			}
			if ('1' == $server) {
				if ('' == $sql_where_tmp) {
					$sql_where_tmp .= ' ? ';
				} else {
					$sql_where_tmp .= ' , ? ';
				}
				array_push($data, $server);
			}
			if ('2' == $other) {
				if ('' == $sql_where_tmp) {
					$sql_where_tmp .= ' ? ';
				} else {
					$sql_where_tmp .= ' , ? ';
				}
				array_push($data, $other);
			}
			$sql_where .= ' err_kind in ( '.$sql_where_tmp.' ) ';
		}

		// sort
		$sql_sort = ' order by yyyymmdd asc ';

		// SQL完成
		$sql .= $sql_where.$sql_sort;
		$this->backend->getLogger()->log(LOG_DEBUG, '■SQL : '.$sql);

		// Prepare Statement化
		$stmt =& $db->db->prepare($sql);

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
			return null;
		}
		if (0 == $res->numRows()) {
			$this->backend->getLogger()->log(LOG_WARNING, '検索件数が0件です。');
			return null;
		}

		// リスト化
		$i = 0;
		$list = array();
		while ($row = $res->fetchRow(DB_FETCHMODE_ASSOC)) {
			$list[$i++] = $row;
		}

		return $list;
	}
}

/**
 *  Jmesse_JmErrMail
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_JmErrMail extends Ethna_AppObject
{
	/**
	*  @var    array   テーブル定義
	*/
	var $table_def = array(
		'jm_err_mail' => array(
			'primary' => false,
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
