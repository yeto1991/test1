<?php
/**
 *  Jmesse_AdminCommonManager.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: d4af361a99e2aaa95cedee2132d1ca3f10920c6b $
 */

/**
 *  Jmesse_AdminCommonManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_AdminCommonManager extends Ethna_AppManager
{
	/**
	 * ユーザ管理ページを表示可能であるかチェック。
	 *
	 * @return true：可、false：否。
	 */
	function isLoginUser() {

		$ret = true;

		if (!$this->session->isStart()) {
			// Sessionが開始していない。
			$ret = false;
		} else if (null == $this->session->get('username') || '' == $this->session->get('username')) {
			// ログインユーザが設定されていない。
			$ret = false;
		} else if ('1' != $this->session->get('auth_user')) {
			// 権限なし
			$ret = false;
		}

		return $ret;
	}

	/**
	 * 展示会管理ページを表示可能であるかチェック。
	 *
	 * @return true：可、false：否。
	 */
	function isLoginFair() {

		$ret = true;

		if (!$this->session->isStart()) {
			// Sessionが開始していない。
			$ret = false;
		} else if (null == $this->session->get('username') || '' == $this->session->get('username')) {
			// ログインユーザが設定されていない。
			$ret = false;
		} else if ('1' != $this->session->get('auth_fair')) {
			// 権限なし
			$ret = false;
		}

		return $ret;
	}

	/**
	 * ログテーブルに記録する。
	 *
	 * @param string $user_id ログインユーザID。
	 * @param string $ope_kbn '1'：参照、'2'：登録、'3'：更新、'4'：削除、'5'：その他。
	 * @param string $info_kbn '1'：ユーザ情報、'2'：見本市情報、'3'：その他。
	 * @param string $remarks ユーザ情報の場合はユーザID、見本市情報の場合は見本市番号を設定。
	 *
	 * @return 0：正常、Ethna_Error：エラー。
	 */
	function regLog($user_id, $ope_kbn, $info_kbn, $remarks) {
		// オブジェクトを取得
		$jm_log = $this->backend->getObject('JmLog');

		// 項目設定
		$jm_log->set('user_id', $user_id);
		$jm_log->set('ope_kbn', $ope_kbn);
		$jm_log->set('info_kbn', $info_kbn);
		$jm_log->set('remarks', $remarks);
		$jm_log->set('reg_date', date('Y/m/d H:i:s'));

		// INSERT
		$ret = $jm_log->add();

		if (Ethna::isError($ret)) {
			$this->backend->getLogger()->log(LOG_ERR, 'JM_LOGの登録に失敗しました。');
			return $ret;
		}

		return 0;
	}
}
?>
