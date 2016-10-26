<?php
/**
 *  User/UserChange.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'UserRegist.php';

/**
 *  user_userChange Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserUserChange extends Jmesse_Form_UserUserRegist
{
}

/**
 *  user_userChange action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserUserChange extends Jmesse_ActionClass
{
	/**
	*  preprocess of user_userChange Action.
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

		// ユーザIDは必須
		if (null == $this->af->get('user_id') || '' == $this->af->get('user_id')) {
			$this->backend->getLogger()->log(LOG_ERR, 'ユーザIDなし');
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'error';
		}

		// 登録モードも必須
		if (null == $this->af->get('mode') || '' == $this->af->get('mode')) {
			$this->backend->getLogger()->log(LOG_ERR, '登録モードなし');
			$this->ae->add('error', 'システムエラーが発生しました。');
			return 'error';
		}

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}
		return null;
	}

	/**
	*  user_userChange action implementation.
	*
	*  @access public
	*  @return string  forward name.
	*/
	function perform()
	{
		// 戻った場合
		if ('1' == $this->af->get('back')) {
			// sessionからformへ設定
			$this->_setSessionToForm();
		} else {
			$jm_user =& $this->backend->getObject('JmUser', 'user_id', $this->af->get('user_id'));
			if (Ethna::isError($jm_user)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->addObject('error', $jm_user);
				return 'error';
			}
			if (null == $jm_user || $this->af->get('user_id') != $jm_user->get('user_id')) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->add('error', 'システムエラーが発生しました。');
				return 'enError';
			}

			//Form値設定
			$this->af->set('user_id', $jm_user->get('user_id'));
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
		}
		// modeを設定
		$this->af->set('mode', 'change');

		return 'user_userRegist';
	}

	/**
	 * 前回入力項目をsessionからformへ設定。
	 *
	 */
	function _setSessionToForm() {
		$user_regist = $this->session->get('user_regist');
		if (null != $user_regist) {
			$this->af->set('email', $user_regist['email']);
			$this->af->set('password', $user_regist['password']);
			$this->af->set('companyNm', $user_regist['companyNm']);
			$this->af->set('divisionDeptNm', $user_regist['divisionDeptNm']);
			$this->af->set('userNm', $user_regist['userNm']);
			$this->af->set('genderCd', $user_regist['genderCd']);
			$this->af->set('postCode', $user_regist['postCode']);
			$this->af->set('address', $user_regist['address']);
			$this->af->set('tel', $user_regist['tel']);
			$this->af->set('fax', $user_regist['fax']);
			$this->af->set('url', $user_regist['url']);
			$this->af->set('delFlg', $user_regist['delFlg']);
		}
	}

}

?>
