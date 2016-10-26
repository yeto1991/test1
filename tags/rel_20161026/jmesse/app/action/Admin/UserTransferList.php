<?php
/**
 *  Admin/UserTransferList.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_userTransferList Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminUserTransferList extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'check_user_id' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => 'チェックされたユーザID', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
	);
}

/**
 *  admin_userTransferList action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminUserTransferList extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_userTransferList Action.
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
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'admin_login';
		}
		return null;
    }

	/**
	 *  admin_userTransferList action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		//定義情報からユーザIDを取得
		$transfer_user_id = $this->config->get('transfer_user_id');

		// マネージャの取得
		$jm_user_mgr =& $this->backend->getManager('JmUser');

		// 移譲先ユーザ情報取得セット
		$this->af->setApp('jm_user_transfer_info', $jm_user_mgr->getUserTrasferTargetInfo($transfer_user_id));

		// 未移譲ユーザ一覧情報取得セット
		$this->af->setApp('jm_user_transfer_list', $jm_user_mgr->getUserTrasferList());

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}
		return 'admin_userTransferList';
    }
}

?>
