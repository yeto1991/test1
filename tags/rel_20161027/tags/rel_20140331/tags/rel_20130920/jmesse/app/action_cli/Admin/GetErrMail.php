<?php
/**
 *  Admin/GetErrMail.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  admin_getErrMail Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_AdminGetErrMail extends Jmesse_ActionForm
{
}

/**
 *  admin_getErrMail action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_AdminGetErrMail extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_getErrMail Action.
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
	 *  admin_getErrMail action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// IMAPサーバに接続し、メールを取得する。
		$mail_mgr =& $this->backend->getManager('mail');
		$list = $mail_mgr->getErrMail();

		if (null != $list) {
			// jm_err_mailのtruncate
			$jm_err_mail_mgr =& $this->backend->getManager('JmErrMail');
			$jm_err_mail_mgr->truncate();

			// メールをJM_ERR_MAILに登録する。
			foreach ($list as $mail) {
				$jm_err_mail =& $this->backend->getObject('JmErrMail');
				$jm_err_mail->set('yyyymmdd',  $mail['yyyymmdd']);
				$jm_err_mail->set('email',  $mail['email']);
				$jm_err_mail->set('err_kind',  $mail['err_kind']);
				$jm_err_mail->set('mail_contents',  $mail['mail_contents']);
				$jm_err_mail->add();
			}
		}

		// エラー表示
		foreach ($this->ae->getErrorList() as $key => $value) {
			echo $value['object']->getMessage()."\n";
// 			echo mb_convert_encoding($value['object']->getMessage(), 'SJIS', 'UTF-8')."\n";
		}

		return null;
	}
}

?>
