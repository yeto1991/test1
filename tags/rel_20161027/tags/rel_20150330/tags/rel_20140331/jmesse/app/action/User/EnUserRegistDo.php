<?php
/**
 *  User/EnUserRegistDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnUserRegist.php';

/**
 *  user_enUserRegistDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnUserRegistDo extends Jmesse_Form_UserEnUserRegist
{
}

/**
 *  user_enUserRegistDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnUserRegistDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enUserRegistDo Action.
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

		//入力値チェック
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'user_enUserRegist';
		}else{
			//入力チェック詳細
			//Eメール
			if($this->af->get('email') != null && $this->af->get('email') != ''){
				//Eメール
				if(substr($this->af->get('email'), 0, 1) == "@" || substr($this->af->get('email'), -1) == "@"){
					$this->ae->add('email', "Email is incorrect.");
					return 'user_enUserRegist';
				}
				if(substr_count($this->af->get('email'),"@") != 1){
					$this->ae->add('email', "Email is incorrect.");
					return 'user_enUserRegist';
				}
			}
			//Eメール確認
			if($this->af->get('email2') != null && $this->af->get('email2') != ''){
				//Eメール
				if(substr($this->af->get('email2'), 0, 1) == "@" || substr($this->af->get('email2'), -1) == "@"){
					$this->ae->add('email2', "Email(Confirm) is incorrect.");
					return 'user_enUserRegist';
				}
				if(substr_count($this->af->get('email2'),"@") != 1){
					$this->ae->add('email2', "Email(Confirm) is incorrect.");
					return 'user_enUserRegist';
				}
			}
			//URL
			if($this->af->get('url') != null && $this->af->get('url') != ''){
				if (0 !== strpos($this->af->get('url'), 'http')) {
					$this->ae->add('url', "URL is incorrect.");
					return 'user_enUserRegist';
				}
			}
			//Eメール2重登録チェック
			if($this->af->get('email') != $this->af->get('email2')){
				$this->ae->add('email2', "Email doesn't match.");
				return 'user_enUserRegist';
			}
			//パスワード2重登録チェック
			if($this->af->get('password') != $this->af->get('password2')){
				$this->ae->add('password2', "Password doesn't match.");
				return 'user_enUserRegist';
			}
			//重複チェック
			$jmUserMgr = $this->backend->getManager('jmUser');
			$emailCheck = $jmUserMgr->getEmailForDoubleCheckForFront('',$this->af->get('email'));
			if (Ethna::isError($emailCheck)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ登録 Eメール重複チェックエラー');
				return 'enError';
			}
			if($emailCheck == "DOUBLE_CHECK_NG"){
				$this->ae->add('email', "The e-mail address you have entered has already been registered by someone. Please enter another e-mail address.");
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ登録 Eメール重複エラー');
				return 'user_enUserRegist';
			}
			//チェックフラグ Formに設定
			$this->af->set('emailCheckFlg', $emailCheck);

			// 最終エラー確認
			if (0 < $this->ae->count()) {
				$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
				return 'enError';
			}
			return null;
		}
	}

	/**
	 *  user_enUserRegistDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// 入力項目をsessionに設定。
		$this->_setSession();

		// 確認画面へ遷移
		return 'user_enUserRegistDo';
	}

	/**
	 * 入力項目をセッションに設定。
	 *
	 */
	function _setSession() {
		$user_regist = array();
		$user_regist['email'] = $this->af->get('email');
		$user_regist['password'] = $this->af->get('password');
		$user_regist['companyNm'] = $this->af->get('companyNm');
		$user_regist['divisionDeptNm'] = $this->af->get('divisionDeptNm');
		$user_regist['userNm'] = $this->af->get('userNm');
		$user_regist['genderCd'] = $this->af->get('genderCd');
		$user_regist['postCode'] = $this->af->get('postCode');
		$user_regist['address'] = $this->af->get('address');
		$user_regist['tel'] = $this->af->get('tel');
		$user_regist['fax'] = $this->af->get('fax');
		$user_regist['url'] = $this->af->get('url');
		$user_regist['delFlg'] = $this->af->get('delFlg');
		$this->session->set('user_regist', $user_regist);
	}

}

?>
