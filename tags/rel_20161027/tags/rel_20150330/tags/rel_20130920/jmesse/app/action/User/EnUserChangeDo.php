<?php
/**
 *  User/EnUserChangeDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnUserChange.php';

/**
 *  user_enUserChangeDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnUserChangeDo extends Jmesse_Form_UserEnUserChange
{
}

/**
 *  user_enUserChangeDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnUserChangeDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enUserChangeDo Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('userCommon')->isLoginUser()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'user_enLogin';
		}
		if($this->af->get('delFlg') == '1'){
			//ユーザ削除の場合
			$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->af->get('user_id'));
			if (Ethna::isError($jm_user)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->addObject('error', $jm_user);
				return 'enError';
			}
			if (null == $jm_user || $this->af->get('user_id') != $jm_user->get('user_id')) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->add('error', 'A system error has occurred.');
				return 'enError';
			}
			//Form値設定
			$this->af->set('email', $jm_user->get('email'));
			$this->af->set('password', $jm_user->get('password'));
			$this->af->set('companyNm', $jm_user->get('company_nm'));
			$this->af->set('divisionDeptNm', $jm_user->get('division_dept_nm'));
			$this->af->set('userNm', $jm_user->get('user_nm'));
			$this->af->set('genderCd', $jm_user->get('gender_cd'));
			$this->af->set('postCode', $jm_user->get('post_code'));
			$this->af->set('address', $jm_user->get('address'));
			$this->af->set('tel', $jm_user->get('tel'));
			$this->af->set('fax', $jm_user->get('fax'));
			$this->af->set('url', $jm_user->get('url'));
			return null;
		}
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
					$this->ae->add('email', "The at mark “@” of your e-mail address is in the wrong location.");
					return 'user_enUserRegist';
				}
				if(substr_count($this->af->get('email'),"@") != 1){
					$this->ae->add('email', "Duplicate at marks “@” have been entered in your e-mail address.");
					return 'user_enUserRegist';
				}
			}
			//Eメール確認
			if($this->af->get('email2') != null && $this->af->get('email2') != ''){
				//Eメール
				if(substr($this->af->get('email2'), 0, 1) == "@" || substr($this->af->get('email2'), -1) == "@"){
					$this->ae->add('email2', "The at mark “@” of your e-mail address for confirmation is in the wrong location.");
					return 'user_enUserRegist';
				}
				if(substr_count($this->af->get('email2'),"@") != 1){
					$this->ae->add('email2', "Duplicate at marks “@” have been entered in your e-mail address for confirmation.");
					return 'user_enUserRegist';
				}
			}
			//URL
			if($this->af->get('url') != null && $this->af->get('url') != ''){
				if (0 !== strpos($this->af->get('url'), 'http')) {
					$this->ae->add('url', "Please write the URL beginning with “http(s)://”");
					return 'user_enUserRegist';
				}
			}
			//Eメール2重登録チェック
			if($this->af->get('email') != $this->af->get('email2')){
				$this->ae->add('email2', "The e-mail address you have entered for confirmation does not match the original one.");
				return 'user_enUserRegist';
			}
			//パスワード2重登録チェック
			if($this->af->get('password') != $this->af->get('password2')){
				$this->ae->add('password2', "The password you have entered for confirmation does not match the original one.");
				return 'user_enUserRegist';
			}
			//重複チェック
			$jmUserMgr = $this->backend->getManager('jmUser');
			$emailCheck = $jmUserMgr->getEmailForDoubleCheckForFront($this->af->get('user_id'),$this->af->get('email'));
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
	 *  user_enUserChangeDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// 入力項目をsessionに設定。
		$this->_setSession();

		if($this->af->get('delFlg') == '1'){
			//削除の場合
			$this->af->set('mode', 'delete');
		}
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
