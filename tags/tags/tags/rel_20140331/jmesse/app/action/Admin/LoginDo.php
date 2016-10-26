<?php
/**
 *  Admin/LoginDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Login.php';
require_once 'Jmesse_JmUser.php';

/**
 *  admin_loginDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminLoginDo extends Jmesse_Form_AdminLogin
{
}

/**
 *  admin_loginDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminLoginDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_loginDo Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		if ($this->af->validate() > 0) {
			return 'admin_login';
		}

		return null;
	}

	/**
	 *  admin_loginDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$login_ok = true;

		// ユーザ情報取得
		$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));

		// ユーザ認証
		if (null == $user || null == $user->get('user_id')) {
			$this->backend->getLogger()->log(LOG_DEBUG, 'ユーザが未登録');
			$login_ok = false;
		} else if ($this->af->get('password') != $user->get('password')) {
			$this->backend->getLogger()->log(LOG_DEBUG, 'パスワード相違');
			$login_ok = false;
		} else if ('1' != $user->get('auth_user') && '1' != $user->get('auth_fair')) {
			$this->backend->getLogger()->log(LOG_DEBUG, '管理権限なし');
			$login_ok = false;
		}

		$mgr = $this->backend->getManager('adminCommon');
		if ($login_ok) {
			// ログに記録
			$ret = $mgr->regLog($user->get('user_id'), '5', '3', 'Successful login.');
			if (Ethna::isError($ret)) {
				$this->ae->addObject('error', $ret);
				return 'admin_error';
			}

			// SESSIONに設定
			$this->session->start();
			$this->session->set('user_id', $user->get('user_id'));
			$this->session->set('auth_user', $user->get('auth_user'));
			$this->session->set('auth_fair', $user->get('auth_fair'));

			$ret_view = 'admin_top';
		} else {
			// ログイン失敗画面へ遷移
			$ret = $mgr->regLog('0', '5', '3', 'Login failed.('.$this->af->get('email').':'.$_SERVER['REMOTE_ADDR'].')');
			if (Ethna::isError($ret)) {
				$this->ae->addObject('error', $ret);
				return 'admin_error';
			}
			$this->ae->add('error', 'Eメールまたはパスワードが間違っています。');
			return 'admin_login';
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		// 転送
		if (null != $this->af->get('function') && '' != $this->af->get('function')) {
			header('Location: '.$this->af->get('function'));
		}

		// TOP画面へ遷移
		return $ret_view;
	}
}

?>
