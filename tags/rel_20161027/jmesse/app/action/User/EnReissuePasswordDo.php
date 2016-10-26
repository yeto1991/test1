<?php
/**
 *  User/EnReissuePasswordDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnReissuePassword.php';
require_once 'Jmesse_JmUser.php';

/**
 *  user_enReissuePasswordDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnReissuePasswordDo extends Jmesse_Form_UserEnReissuePassword
{
}

/**
 *  user_enReissuePasswordDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnReissuePasswordDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enReissuePasswordDo Action.
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
			return 'user_enReissuePassword';
		}else{
			//入力チェック詳細
			//Eメール
			if($this->af->get('email') != null && $this->af->get('email') != ''){
				//Eメール
				if(substr($this->af->get('email'), 0, 1) == "@" || substr($this->af->get('email'), -1) == "@"){
					$this->ae->add('email', "The at mark “@” of your e-mail address is in the wrong location.");
					return 'user_enReissuePassword';
				}
				if(substr_count($this->af->get('email'),"@") != 1){
					$this->ae->add('email', "Duplicate at marks “@” have been entered in your e-mail address.");
					return 'user_enReissuePassword';
				}
			}
		}

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}

		return null;
	}

	/**
	 *  user_enReissuePasswordDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ユーザ情報取得
		$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));

		//ユーザ情報確認
		if (null == $user || null == $user->get('user_id')) {
			$this->ae->add('email', "The e-mail address you have entered is incorrect.");
			return 'user_enReissuePassword';
		} else if ($user->get('del_flg') == '1') {
			$this->ae->add('email', "The e-mail address you have entered is incorrect.");
			return 'user_enReissuePassword';
		}

		// パスワード取得
// 		$this->af->set('email',$user->get('password'));

		//メール送信処理
		$ary_value = array('mail_send_user_name' => $user->get('user_nm'), 'mail_send_user_password' => $user->get('password'));
		$mail_mgr =& $this->backend->getManager('mail');
		$mail_mgr->sendmailEnUserConfirm(strtolower($this->af->get('email')), $ary_value);

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}

		return 'user_enReissuePasswordDo';
	}
}

?>
