<?php
/**
 *  Admin/SendBatchLog.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  admin_sendBatchLog Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_AdminSendBatchLog extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	);
}

/**
 *  admin_sendBatchLog action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_AdminSendBatchLog extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_sendBatchLog Action.
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
	 *  admin_sendBatchLog action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// エラーが出ないように
		$_SERVER['HTTP_USER_AGENT'] = '';
		$_SERVER['REMOTE_ADDR'] = '';

		$title = $this->config->get('mail_mnt_batch_log_title');
		$mail_to = $this->config->get('mail_mnt_to');
		$template = 'sendBatchLog.tpl';
		$ary_value = array('msg' => @file_get_contents($this->config->get('batch_log')));

		$mail_mgr =& $this->backend->getManager('mail');
		$mail_mgr->sendMaintenanceMail($title, $mail_to, $template, $ary_value);

		// エラー表示
		foreach ($this->ae->getErrorList() as $key => $value) {
			echo $value['object']->getMessage()."\n";
		}

		return null;
	}
}

?>
