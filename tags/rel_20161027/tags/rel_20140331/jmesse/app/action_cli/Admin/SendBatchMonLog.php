<?php
/**
 *  Admin/SendBatchMonLog.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  admin_sendBatchMonLog Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_AdminSendBatchMonLog extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	);
}

/**
 *  admin_sendBatchMonLog action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_AdminSendBatchMonLog extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_sendBatchMonLog Action.
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
	 *  admin_sendBatchMonLog action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// エラーが出ないように
		$_SERVER['HTTP_USER_AGENT'] = '';
		$_SERVER['REMOTE_ADDR'] = '';

		$title = $this->config->get('mail_mnt_batch_mon_log_title');
		$mail_to = $this->config->get('mail_mnt_to');
		$template = 'sendBatchMonLog.tpl';
		$ary_value = array('msg' => @file_get_contents($this->config->get('batch_mon_log')));

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
