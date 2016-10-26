<?php
/**
 *  Admin/Logout.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_logout Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminLogout extends Jmesse_ActionForm
{
}

/**
 *  admin_logout action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminLogout extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_logout Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		return null;
	}

	/**
	 *  admin_logout action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// SESSIONの破棄。
		$this->session->set('user_id', '');
		$this->session->set('auth_user', '');
		$this->session->set('auth_fair', '');
		$this->session->destroy();

		// ログイン画面へ遷移する。
		return 'admin_login';
	}
}

?>
