<?php
/**
 *  User/UserChangeDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'UserChange.php';

/**
 *  user_userChangeDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserUserChangeDo extends Jmesse_Form_UserUserChange
{
}

/**
 *  user_userUserDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserUserChangeDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_userUserDo Action.
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
			return 'user_login';
		}
		if($this->af->get('delFlg') == '1'){
			//ユーザ削除の場合
			$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->af->get('user_id'));
			if (Ethna::isError($jm_user)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->addObject('error', $jm_user);
				return 'error';
			}
			if (null == $jm_user || $this->af->get('user_id') != $jm_user->get('user_id')) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->add('error', 'システムエラーが発生しました。');
				return 'error';
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
			return 'user_userRegist';
		}else{
			//入力チェック詳細
			//Eメール
			if($this->af->get('email') != null && $this->af->get('email') != ''){
				//Eメール
				if(substr($this->af->get('email'), 0, 1) == "@" || substr($this->af->get('email'), -1) == "@"){
					$this->ae->add('email', "Eメール 「@」の位置が不正です");
					return 'user_userRegist';
				}
				if(substr_count($this->af->get('email'),"@") != 1){
					$this->ae->add('email', "Eメール 「@」の入力が重複しています。");
					return 'user_userRegist';
				}
			}
			//Eメール確認
			if($this->af->get('email2') != null && $this->af->get('email2') != ''){
				//Eメール
				if(substr($this->af->get('email2'), 0, 1) == "@" || substr($this->af->get('email2'), -1) == "@"){
					$this->ae->add('email2', "Eメール(確認) 「@」の位置が不正です");
					return 'user_userRegist';
				}
				if(substr_count($this->af->get('email2'),"@") != 1){
					$this->ae->add('email2', "Eメール(確認) 「@」の入力が重複しています。");
					return 'user_userRegist';
				}
			}
			//URL
			if($this->af->get('url') != null && $this->af->get('url') != ''){
				if (0 !== strpos($this->af->get('url'), 'http')) {
					$this->ae->add('url', "URLは「http」から入力してください");
					return 'user_userRegist';
				}
			}
			//Eメール2重登録チェック
			if($this->af->get('email') != $this->af->get('email2')){
				$this->ae->add('email2', "入力されたEメールと合致していません。");
				return 'user_userRegist';
			}
			//パスワード2重登録チェック
			if($this->af->get('password') != $this->af->get('password2')){
				$this->ae->add('password2', "入力されたパスワードと合致していません。");
				return 'user_userRegist';
			}
			//重複チェック
			$jmUserMgr = $this->backend->getManager('jmUser');
			$emailCheck = $jmUserMgr->getEmailForDoubleCheckForFront($this->af->get('user_id'),$this->af->get('email'));
			if (Ethna::isError($emailCheck)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ登録 Eメール重複チェックエラー');
				return 'error';
			}
			if($emailCheck == "DOUBLE_CHECK_NG"){
				$this->ae->add('email', "入力されたEメールは既に使用登録されています。他のアドレスを入力してください。");
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ登録 Eメール重複エラー');
				return 'user_userRegist';
			}
			//チェックフラグ Formに設定
			$this->af->set('emailCheckFlg', $emailCheck);

			// 最終エラー確認
			if (0 < $this->ae->count()) {
				$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
				return 'error';
			}
			return null;
		}
	}

	/**
	 *  user_userChangeDo action implementation.
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
		return 'user_userRegistDo';
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
