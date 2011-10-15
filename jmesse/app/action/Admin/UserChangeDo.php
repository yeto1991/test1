<?php
/**
 *  Admin/UserChangeDo.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'UserChange.php';

/**
 *  admin_userChangeDo Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminUserChangeDo extends Jmesse_Form_AdminUserChange
{
}

/**
 *  admin_userChangeDo action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminUserChangeDo extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_userChangeDo Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('adminCommon')->isLoginUser()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			return 'admin_Login';
		}
		//入力値チェック
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'admin_userRegist';
		}
		//重複チェック
		$jmUserMgr = $this->backend->getManager('jmUser');
		$emailCheck = $jmUserMgr->getEmailForDoubleCheck($this->af->get('email'));
		if (Ethna::isError($emailCheck)) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ登録 Eメール重複チェックエラー');
			return 'error';
		}
		if($emailCheck == "DOUBLE_CHECK_NG"){
			$user =& $this->backend->getObject('JmUser', 'email', $this->af->get('email'));
			if($user->get('user_id') == $this->af->get('user_id')){
				//Eメール重複するユーザIDと更新対象のユーザIDが同ユーザIDの場合
				return null;
			}
			$this->ae->add(null, "入力されたEメールは既に使用されています。");
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ登録 Eメール重複エラー');
			return 'admin_userRegist';
		}
		return null;
	}

	/**
	*  admin_userChangeDo action implementation.
	*
	*  @access public
	*  @return string  forward name.
	*/
	function perform()
	{

		$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->af->get('user_id'));
		if (Ethna::isError($jm_fair)) {
			$this->ae->addObject('error', $jm_fair);
			return 'error';
		}
		if (Ethna_Util::isDuplicatePost()) {
			// 二重POSTの場合
			$this->backend->getLogger()->log(LOG_WARNING, '二重POST');
			header('Location: '.$this->config->get('url').'?action_admin_userChange=true&user_id='.$this->af->get('user_id').'&mode=change');
			return null;
		}
		//更新項目 設定
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
		$jm_user->set('use_language_cd', $this->af->get('useLanguageCd'));
		$jm_user->set('regist_result_notice_cd', $this->af->get('registResultNoticeCd'));
		if ($this->af->get('authGen') == '1') {
			$jm_user->set('auth_gen', $this->af->get('authGen'));
		}else{
			$jm_user->set('auth_gen', '0');
		}
		if ($this->af->get('authUser') == '1') {
			$jm_user->set('auth_user', $this->af->get('authUser'));
		}else{
			$jm_user->set('auth_user', '0');
		}
		if ($this->af->get('authFair') == '1') {
			$jm_user->set('auth_fair', $this->af->get('authFair'));
		}else{
			$jm_user->set('auth_fair', '0');
		}
		$jm_user->set('idpass_notice_cd', $this->af->get('idpassNoticeCd'));
		$jm_user->set('del_flg', $this->af->get('delFlg'));
		if ($this->af->get('delFlg') == '1') {
			$jm_user->set('del_date', date('Y/m/d H:i:s'));
		}else{
			$jm_user->set('del_date', null);
		}
		$jm_user->set('update_user_id', $this->session->get('user_id'));
		$jm_user->set('update_date', date('Y/m/d H:i:s'));

		// UPDATE処理実行
		$ret = $jm_user->update();
		if (Ethna::isError($ret)) {
			$this->ae->addObject('error', $ret);
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザ登録 更新エラー');
			return 'error';
		}
		$this->af->setApp('user_id', $jm_user->get('user_id'));

		// ログテーブル登録
		$mgr = $this->backend->getManager('adminCommon');
		if ($this->af->get('delFlg') == '1') {
			$ope_kbn = '4'; //削除
		} else {
			$ope_kbn = '3'; //更新
		}
		$ret = $mgr->regLog($this->session->get('user_id'), $ope_kbn, '1', $jm_user->get('user_id'));
		if (Ethna::isError($ret)) {
			$this->ae->addObject('error', $ret);
			return 'error';
		}
		// 更新画面へ遷移
		header('Location: '.$this->config->get('url').'?action_admin_userChange=true&user_id='.$this->af->get('user_id').'&mode=change&success=1');
		return null;
	}
}

?>
