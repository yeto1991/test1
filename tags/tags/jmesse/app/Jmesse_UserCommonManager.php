<?php
/**
 *  Jmesse_UserCommonManager.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: d4af361a99e2aaa95cedee2132d1ca3f10920c6b $
 */

/**
 *  Jmesse_UserCommonManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_UserCommonManager extends Ethna_AppManager
{
	/**
	 * ユーザ個人ページを表示可能であるかチェック
	 *
	 * @return true：可、false：否。
	 */
	function isLoginUser() {
// 		// "https"判定
// 		if ('on' != $_SERVER['HTTPS']) {
// 			header('Location: https://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']);
// 		}

		$ret = true;
		if (!$this->session->isStart()) {
			// Sessionが開始していない。
			$ret = false;
		} else if (null == $this->session->get('user_id') || '' == $this->session->get('user_id')) {
			// ログインユーザが設定されていない。
			$ret = false;
		} else if ('1' != $this->session->get('auth_gen')) {
			// 権限なし
			$ret = false;
		}
		return $ret;
	}
}
?>
