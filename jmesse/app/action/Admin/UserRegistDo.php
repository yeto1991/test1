<?php
/**
 *  Admin/UserRegistDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'UserRegist.php';

/**
 *  admin_userRegistDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminUserRegistDo extends Jmesse_Form_AdminUserRegist
{
}

/**
 *  admin_userRegistDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminUserRegistDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_userRegistDo Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('adminCommon')->isLoginFair()) {
			return 'admin_Login';
		}

		//入力値チェック
		if ($this->af->validate() > 0) {
			//重複チェック
			$user =& $this->backend->getObject('JmUser', 'user_id', $this->af->get('userId'));
			if ($this->af->get('userId') != null && ($this->af->get('userId') == $user->get('user_id'))) {
				$this->ae->add(null, "入力されたユーザIDは既に使用されています。");
			}
			if ($this->af->get('email') != null && ($this->af->get('email') == $user->get('email'))) {
				$this->ae->add(null, "入力されたEメールは既に使用されています。");
			}
			return 'admin_userRegist';
		}
		return null;
	}

	/**
	 *  admin_userRegistDo action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$jm_user =& $this->backend->getObject('JmUser');
		$jm_user->set('user_id', $this->af->get('userId'));
		$jm_user->set('password', $this->af->get('password'));
		$jm_user->set('company_nm', $this->af->get('companyNm'));
		$jm_user->set('division_dept_nm', $this->af->get('divisionDeptNm'));
		$jm_user->set('user_nm', $this->af->get('userNm'));
		$jm_user->set('gender_cd', $this->af->get('genderCd'));
		$jm_user->set('email', $this->af->get('email'));
		$jm_user->set('post_code', $this->af->get('postCode'));
		$jm_user->set('address', $this->af->get('address'));
		$jm_user->set('tel', $this->af->get('tel'));
		$jm_user->set('fax', $this->af->get('fax'));
		$jm_user->set('url', $this->af->get('url'));
		$jm_user->set('secret_question_cd', $this->af->get('secretQuestionCd'));
		$jm_user->set('secret_question_answer', $this->af->get('secretQuestionAnswer'));
		$jm_user->set('use_language_cd', $this->af->get('useLanguageCd'));
		$jm_user->set('regist_result_notice_cd', $this->af->get('registResultNoticeCd'));
		if ($this->af->get('authGen') == 1) {
			$jm_user->set('auth_gen', $this->af->get('authGen'));
		}else{
			$jm_user->set('auth_gen', '0');
		}
		if ($this->af->get('authUser') == 1) {
			$jm_user->set('auth_user', $this->af->get('authUser'));
		}else{
			$jm_user->set('auth_user', '0');
		}
		if ($this->af->get('authFair') == 1) {
			$jm_user->set('auth_fair', $this->af->get('authFair'));
		}else{
			$jm_user->set('auth_fair', '0');
		}
		$jm_user->set('idpass_notice_cd', $this->af->get('idpassNoticeCd'));
		$jm_user->set('del_flg', '0');
		$jm_user->set('del_date', null);
		$jm_user->set('regist_user_id', $this->session->get('username'));
		$jm_user->set('regist_date', date('Y/m/d H:i:s'));
		$jm_user->set('update_user_id', null);
		$jm_user->set('update_date', null);
		$ret = $jm_user->add();

		if (Ethna::isError($ret)) {
			$this->backend->getLogger()->log(LOG_DEBUG, 'ユーザ新規登録失敗');
			return 'error';
		}
		// ログに記録
		$mgr = $this->backend->getManager('adminCommon');
		if (null == $mgr) {
			$this->backend->getLogger()->log(LOG_ERR, 'adminCommonマネージャ取得失敗');
			$this->ae->addObject(Ethna::raiseError('adminCommonマネージャ取得に失敗しました。', E_FAIL_TO_GET_MANAGER_ADMIN_COMMON));
			return 'error';
		}
		$ret = $mgr->regLog($this->session->get('username'), '2', '1', $this->af->get('userId'));
		if (Ethna::isError($ret)) {
			$this->ae->addObject('error', $ret);
			return 'error';
		}
		$this->backend->getLogger()->log(LOG_DEBUG, 'ユーザ新規登録完了');
		return 'admin_userRegistDo';
	}
}

?>
