<?php
/**
 *  User/EnUserRegistDone.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnUserRegistDo.php';

/**
 *  user_enUserRegistDone Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnUserRegistDone extends Jmesse_Form_UserEnUserRegistDo
{
}

/**
 *  user_enUserRegistDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnUserRegistDone extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enUserRegistDone Action.
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

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}
		return null;
	}

	/**
	 *  user_enUserRegistDone action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		if (Ethna_Util::isDuplicatePost()) {
			// 二重POSTの場合
			$this->backend->getLogger()->log(LOG_WARNING, '二重POST');
			header('Location: '.$this->config->get('url').'?action_user_enUserRegist=true');
			return null;
		}

		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		if($this->af->get('emailCheckFlg') == "DOUBLE_CHECK_DEL_FLG1"){
			//Eメール重複チェック対象Eメールが削除済みである場合物理レコード削除
			// 削除対象ユーザ情報取得
			$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
			if (Ethna::isError($user)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->addObject('error', $user);
				$db->rollback();
				return 'enError';
			}
			if (null == $user || strtolower($this->af->get('email')) != $user->get('email')) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->add('error', 'A system error has occurred.');
				$db->rollback();
				return 'enError';
			}
			$user_id_target = $user->get('user_id');

			//jm_userテーブル
			$jm_user_del = $this->backend->getObject('JmUser','email',strtolower($this->af->get('email')));
			if (Ethna::isError($jm_user_del)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->addObject('error', $jm_user_del);
				$db->rollback();
				return 'enError';
			}
			if (null == $jm_user_del || strtolower($this->af->get('email')) != $jm_user_del->get('email')) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->add('error', 'A system error has occurred.');
				$db->rollback();
				return 'enError';
			}
			$userdel = $jm_user_del->remove();
			if (Ethna::isError($userdel)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ情報テーブル物理削除エラー');
				$this->ae->addObject('error', $userdel);
				$db->rollback();
				return 'enError';
			}
			//jm_fairテーブル
			$deleteResults1 = $this->backend->getManager('jmFair')->deleteUserInfo($user_id_target);
			if ($deleteResults1 == "NG") {
				$this->backend->getLogger()->log(LOG_ERR, 'JM_FAIRレコード削除エラー');
				$db->rollback();
				return 'enError';
			}
			//jm_fair_tempテーブル
			$deleteResults2 = $this->backend->getManager('jmFairTemp')->deleteUserInfo($user_id_target);
			if ($deleteResults2 == "NG") {
				$this->backend->getLogger()->log(LOG_ERR, 'JM_FAIR_TEMPレコード削除エラー');
				$db->rollback();
				return 'enError';
			}
		}
		$jm_user =& $this->backend->getObject('JmUser');
		$jm_user->set('email', strtolower($this->af->get('email'))); //メールアドレスを小文字変換
		$jm_user->set('password', $this->af->get('password'));
		$jm_user->set('company_nm', $this->af->get('companyNm'));
		$jm_user->set('division_dept_nm', $this->af->get('divisionDeptNm'));
		$jm_user->set('user_nm', $this->af->get('userNm'));
		$jm_user->set('gender_cd', $this->af->get('genderCd'));
		$jm_user->set('post_code', $this->af->get('postCode'));
		$jm_user->set('address', $this->af->get('address'));
		$jm_user->set('tel', $this->af->get('tel'));
		$jm_user->set('fax', $this->af->get('fax'));
		$jm_user->set('url', $this->af->get('url'));
		$jm_user->set('use_language_cd', '1');
		$jm_user->set('regist_result_notice_cd', '0');
		$jm_user->set('auth_gen', '1');
		$jm_user->set('auth_user', '0');
		$jm_user->set('auth_fair', '0');
		$jm_user->set('idpass_notice_cd', '1');
		$jm_user->set('del_flg', '0');
		$jm_user->set('regist_user_id', '0');
		$jm_user->set('regist_date', date('Y/m/d H:i:s'));
		// INSERT処理実行
		$ret = $jm_user->add();
		if (Ethna::isError($ret)) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ新規登録エラー');
			$this->ae->addObject('error', $ret);
			$db->rollback();
			return 'enError';
		}
		// 登録したユーザ情報取得
		$user =& $this->backend->getObject('JmUser', 'email', strtolower($this->af->get('email')));
		if (Ethna::isError($user)) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->addObject('error', $user);
			return 'enError';
		}
		if (null == $user || strtolower($this->af->get('email')) != $user->get('email')) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
			$this->ae->add('error', 'A system error has occurred.');
			return 'enError';
		}

		// COMMIT
		$db->commit();

		//メール送信処理
		$ary_value = array('mail_send_user_name' => $this->af->get('userNm'), 'mail_send_user_email' => strtolower($this->af->get('email')), 'mail_send_user_password' => $this->_passwordMasking($this->af->get('password')));
		$mail_mgr =& $this->backend->getManager('mail');
		$mail_mgr->sendmailEnUserReigst(strtolower($this->af->get('email')), $ary_value);

		// sessionのクリア
		$this->session->set('user_regist', null);

		// 完了画面へ遷移
		// SESSIONに設定
		$this->session->start();
		$this->session->set('user_id', $user->get('user_id'));
		$this->session->set('auth_gen', $user->get('auth_gen'));
		//2013/08/25 保守課題No.013対応
		$this->session->set('email2', $user->get('email'));

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}
		return 'user_enUserRegistDone';
	}

	/**
	 * パスワードをマスクする。
	 *
	 * @param unknown_type $pass パスワード
	 */
	function _passwordMasking($pass) {
		$mask = substr($pass, 0, 2);
		$cnt = strlen($pass) - 2;
		for ($i=0; $i<$cnt; $i++) {
			$mask .= '*';
		}
		return $mask;
	}

}

?>
