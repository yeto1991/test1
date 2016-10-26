<?php
/**
 *  User/EnLoginDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnLogin.php';
require_once 'Jmesse_JmUser.php';

/**
 *  user_enLoginDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnLoginDo extends Jmesse_Form_UserEnLogin
{
}

/**
 *  user_enLoginDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnLoginDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enLoginDo Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
// 		// "https"判定
// 		if ('on' != $_SERVER['HTTPS']) {
// 			header('Location: https://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']);
// 		}

		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'user_enLogin';
		}else{
			//入力チェック詳細
			//Eメール
			if($this->af->get('email') != null && $this->af->get('email') != ''){
				//Eメール
				if(substr($this->af->get('email'), 0, 1) == "@" || substr($this->af->get('email'), -1) == "@"){
					$this->ae->add('email', "The at mark “@” of your e-mail address is in the wrong location.");
					return 'user_enLogin';
				}
				if(substr_count($this->af->get('email'),"@") != 1){
					$this->ae->add('email', "Duplicate at marks “@” have been entered in your e-mail address. ");
					return 'user_enLogin';
				}
			}
		}
		return null;
	}

	/**
	 *  user_enLoginDo action implementation.
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
		} else if ('1' != $user->get('auth_gen')) {
			$this->backend->getLogger()->log(LOG_DEBUG, '管理権限なし');
			$login_ok = false;
// 		} else if ('1' != $user->get('use_language_cd')) {
// 			$this->backend->getLogger()->log(LOG_DEBUG, '使用言語英語ユーザ以外');
// 			$login_ok = false;
		} else if ('1' == $user->get('del_flg')) {
			$this->backend->getLogger()->log(LOG_DEBUG, '削除済みユーザ');
			$login_ok = false;
		}

		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		$mgr = $this->backend->getManager('userCommon');
		if ($login_ok) {
			// ログに記録
			$ret = $mgr->regLog($user->get('user_id'), '5', '3', 'Successful login.');
			if (Ethna::isError($ret)) {
				$this->ae->addObject('error', $ret);
				$db->rollback();
				return 'enError';
			}

			// SESSIONに設定
			$this->session->start();
			$this->session->set('user_id', $user->get('user_id'));
			$this->session->set('auth_gen', $user->get('auth_gen'));
			$ret_view = 'user_enTop';
		} else {
			// ログイン失敗画面へ遷移
			$ret = $mgr->regLog('0', '5', '3', 'Login failed.('.$this->af->get('email').':'.$_SERVER['REMOTE_ADDR'].')');
			if (Ethna::isError($ret)) {
				$this->ae->addObject('error', $ret);
				$db->rollback();
				return 'enError';
			}
			$this->ae->add('email', "Login authentication has failed. The e-mail address you have entered is incorrect.");
			$this->ae->add('password', "Login authentication has failed. The password you have entered is incorrect.");
			return 'user_enLogin';
		}

		// COMMIT
		$db->commit();

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
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
