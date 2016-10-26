<?php
/**
 *  Jmesse_MailManager.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: d4af361a99e2aaa95cedee2132d1ca3f10920c6b $
 */

require_once('Mail.php');

/**
 *  Jmesse_MailManager
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_MailManager extends Ethna_AppManager
{
	/**
	 * 見本市ユーザ情報登録完了メール送信。（日本語メール）
	 *
	 * @access public
	 * @param string $mail_to 送信先Eメール
	 * @param array $ary_param 置き換え文字列
	 */
	function sendmailUserReigst($mail_to, $ary_param) {
		$this->_sendmail('userRegist.tpl', $this->config->get('mail_title_user_regist'), $mail_to, $ary_param, 'J');
	}

	/**
	* 見本市ユーザ情報登録完了メール送信。（英語メール）
	*
	* @access public
	* @param string $mail_to 送信先Eメール
	* @param array $ary_param 置き換え文字列
	*/
	function sendmailEnUserReigst($mail_to, $ary_param) {
		$this->_sendmail('enUserRegist.tpl', $this->config->get('mail_title_user_regist_en'), $mail_to, $ary_param, 'E');
	}

	/**
	 * 見本市ユーザ情報更新完了メール送信。（日本語メール）
	 *
	 * @access public
	 * @param string $mail_to 送信先Eメール
	 * @param array $ary_param 置き換え文字列
	 */
	function sendmailUserChange($mail_to, $ary_param) {
		$this->_sendmail('userChange.tpl', $this->config->get('mail_title_user_change'), $mail_to, $ary_param, 'J');
	}

	/**
	* 見本市ユーザ情報更新完了メール送信。（英語メール）
	*
	* @access public
	* @param string $mail_to 送信先Eメール
	* @param array $ary_param 置き換え文字列
	*/
	function sendmailEnUserChange($mail_to, $ary_param) {
		$this->_sendmail('enUserChange.tpl', $this->config->get('mail_title_user_change_en'), $mail_to, $ary_param, 'E');
	}

	/**
	 * ID/パスワード確認メール送信。（日本語メール）
	 *
	 * @access public
	 * @param string $mail_to 送信先Eメール
	 * @param array $ary_param 置き換え文字列
	 */
	function sendmailUserConfirm($mail_to, $ary_param) {
		$this->_sendmail('userConfirm.tpl', $this->config->get('mail_title_user_confirm'), $mail_to, $ary_param, 'J');
	}

	/**
	* ID/パスワード確認メール送信。（英語メール）
	*
	* @access public
	* @param string $mail_to 送信先Eメール
	* @param array $ary_param 置き換え文字列
	*/
	function sendmailEnUserConfirm($mail_to, $ary_param) {
		$this->_sendmail('enUserConfirm.tpl', $this->config->get('mail_title_user_confirm_en'), $mail_to, $ary_param, 'E');
	}

	/**
	 * 見本市情報登録完了メール送信。（日本語メール）
	 *
	 * @access public
	 * @param string $mail_to 送信先Eメール
	 * @param array $ary_param 置き換え文字列
	 */
	function sendmailFairReigst($mail_to, $ary_param) {
		$this->_sendmail('fairRegist.tpl', $this->config->get('mail_title_fair_regist'), $mail_to, $ary_param, 'J');
	}

	/**
	* 見本市情報登録完了メール送信。（英語メール）
	*
	* @access public
	* @param string $mail_to 送信先Eメール
	* @param array $ary_param 置き換え文字列
	*/
	function sendmailEnFairReigst($mail_to, $ary_param) {
		$this->_sendmail('enFairRegist.tpl', $this->config->get('mail_title_fair_regist_en'), $mail_to, $ary_param, 'E');
	}

	/**
	 * 見本市情報更新完了メール送信。（日本語メール）
	 *
	 * @access public
	 * @param string $mail_to 送信先Eメール
	 * @param array $ary_param 置き換え文字列
	 */
	function sendmailFairChange($mail_to, $ary_param) {
		$this->_sendmail('fairChange.tpl', $this->config->get('mail_title_fair_change'), $mail_to, $ary_param, 'J');
	}

	/**
	* 見本市情報更新完了メール送信。（英語メール）
	*
	* @access public
	* @param string $mail_to 送信先Eメール
	* @param array $ary_param 置き換え文字列
	*/
	function sendmailEnFairChange($mail_to, $ary_param) {
		$this->_sendmail('enFairChange.tpl', $this->config->get('mail_title_fair_change_en'), $mail_to, $ary_param, 'E');
	}

	// MOD-S 2012.06.15 【問合せ管理票20120612-001】メール送信機能改修
	/**
	* 見本市 承認メール送信。（日本語メール）
	*
	* @access public
	* @param string $mail_to 送信先Eメール
	* @param array $ary_param 置き換え文字列
	*/
	function sendmailFairApproved($mail_to, $ary_param) {
		$this->_sendmail('fairApproved.tpl', $this->config->get('mail_title_fair_approved'), $mail_to, $ary_param, 'J');
	}

	/**
	 * 見本市 承認メール送信。（英語メール）
	 *
	 * @access public
	 * @param string $mail_to 送信先Eメール
	 * @param array $ary_param 置き換え文字列
	 */
	function sendmailEnFairApproved($mail_to, $ary_param) {
		$this->_sendmail('enFairApproved.tpl', $this->config->get('mail_title_fair_approved_en'), $mail_to, $ary_param, 'E');
	}
	// MOD-E 2012.06.15 【問合せ管理票20120612-001】メール送信機能改修

	// MOD-S 2012.03.02 メール送信機能追加
	/**
	* 見本市登録否認メール送信。（日本語メール）
	*
	* @access public
	* @param string $mail_to 送信先Eメール
	* @param array $ary_param 置き換え文字列
	*/
	function sendmailFairRejection($mail_to, $ary_param) {
		$this->_sendmail('fairRejection.tpl', $this->config->get('mail_title_fair_rejection'), $mail_to, $ary_param, 'J');
	}

	/**
	 * 見本市登録否認メール送信。（英語メール）
	 *
	 * @access public
	 * @param string $mail_to 送信先Eメール
	 * @param array $ary_param 置き換え文字列
	 */
	function sendmailEnFairRejection($mail_to, $ary_param) {
		$this->_sendmail('enFairRejection.tpl', $this->config->get('mail_title_fair_rejection_en'), $mail_to, $ary_param, 'E');
	}
	// MOD-E 2012.03.02 メール送信機能追加

	/**
	 * メール送信。
	 *
	 * @access private
	 * @param string $template テンプレート名(mail_*)
	 * @param string $title メールのサブジェクト
	 * @param string $mail_to メール送信先
	 * @param array $ary_value 置き換え文字列
	 * @param string $mail_language メール言語判定値(J:日本語メール、E:英語メール)
	 */
	function _sendmail($template, $title, $mail_to, $ary_value, $mail_language) {

		// 日本語メールを送る際の設定
		mb_language("Japanese");
		mb_internal_encoding("UTF-8");

		// SMTPサーバーの情報を配列に設定
		$params = array(
			'host'       => $this->config->get('mail_smtp_host'),
			'port'       => $this->config->get('mail_smtp_port'),
			'auth'       => $this->config->get('mail_smtp_auth'),
			'username'   => base64_encode($this->config->get('mail_smtp_user')),
			'password'   => base64_encode($this->config->get('mail_smtp_pass')),
			'localhost'  => null,
			'timeout'    => null,
			'debug'      => false,
			'persist'    => null,
			'pipelining' => null
		);

		// メールヘッダ情報を配列に設定
		// 日本語メールの場合
		if($mail_language == 'J'){
			$headers = array (
						'To'          => mb_encode_mimeheader($mail_to, "ISO-2022-JP"),
						'Bcc'         => mb_encode_mimeheader($this->config->get('mail_bcc'), "ISO-2022-JP"),
						'From'        => $this->config->get('mail_from'),
// 						'From'        => mb_encode_mimeheader(mb_convert_encoding($this->config->get('mail_from'), "ISO-2022-JP", "UTF-8"), "ISO-2022-JP"),
						'Return-Path' => mb_encode_mimeheader($this->config->get('mail_return-path'), "ISO-2022-JP"),
						'Subject'     => mb_encode_mimeheader(mb_convert_encoding($title, "ISO-2022-JP", "UTF-8"), "ISO-2022-JP")
			);
		}else{
			$headers = array (
						'To'          => mb_encode_mimeheader($mail_to, "ISO-2022-JP"),
						'Bcc'         => mb_encode_mimeheader($this->config->get('mail_bcc'), "ISO-2022-JP"),
						'From'        => mb_encode_mimeheader(mb_convert_encoding($this->config->get('mail_from_en'), "ISO-2022-JP", "UTF-8"), "ISO-2022-JP"),
						'Return-Path' => mb_encode_mimeheader($this->config->get('mail_return-path'), "ISO-2022-JP"),
						'Subject'     => mb_encode_mimeheader(mb_convert_encoding($title, "ISO-2022-JP", "UTF-8"), "ISO-2022-JP")
			);
		}

		// メール本文
		$ethna_mail =& new Ethna_MailSender($this->backend);
		$body_tmp = $ethna_mail->send(
			null,
			$template,
			$ary_value
		);
		$this->backend->getLogger()->log(LOG_DEBUG, '■本文(UTF-8) : '.$body_tmp);
		$body = mb_convert_encoding($body_tmp, "ISO-2022-JP", "UTF-8");
		$this->backend->getLogger()->log(LOG_DEBUG, '■本文(JIS) : '.$body);

		// 送信者
		$recipients = $mail_to.','.$this->config->get('mail_bcc');

		// 送信
		$mail_obj =& Mail::factory('smtp', $params);
		$result = $mail_obj->send($recipients, $headers, $body);
		if (PEAR::isError($result)) {
			$msg = 'メールの送信に失敗しました';
			$this->backend->getLogger()->log(LOG_ERR, $msg);
			$this->backend->getActionError()->add('error', $msg);
			// DEBUG-S
// 			echo '<pre>';
// 			var_dump($headers);
// 			echo '</pre><br/><br/>';
// 			echo '<pre>';
// 			var_dump($ary_value);
// 			echo '</pre><br/><br/>';
			// DEBUG-E
		}

		return;
	}

	/**
	 * IMAP接続によりメールを取得する。
	 *
	 * @return array メールリスト
	 */
	function getErrMail() {
		// 言語と文字コードの設定
		mb_language('Japanese');
		mb_internal_encoding('UTF-8');

		// メールボックスのオープン
		$mbox = @imap_open('{'.$this->config->get('mail_imap_host').':'.$this->config->get('mail_imap_port').'/imap/notls}INBOX',
			$this->config->get('mail_imap_user'),
			$this->config->get('mail_imap_pass')
		);
		if (null == $mbox) {
			$msg = imap_last_error();
			$this->backend->getLogger()->log(LOG_ERR, $msg);
			$this->backend->getActionError()->add('error', $msg);
			return null;
		}

		// メールの取り込み
		$err_mail_list = array();
		for ($i = 1; $i <= imap_num_msg($mbox); $i++) {
			$header = imap_header($mbox, $i);
			$body = imap_body($mbox, $i);
			if (false !== stripos($header->subject, 'The email account that you tried to reach does not exist. Please try')) {
				// アドレス不正
				$err_mail = array('yyyymmdd' => date('Ymd', strtotime(imap_headerinfo($mbox, $i)->date)), 'email' => $this->_getMailAddr($body), 'err_kind' => '0', 'mail_contents' => mb_convert_encoding(imap_body($mbox, $i), 'UTF-8', 'ISO-2022-JP'));
				array_push($err_mail_list, $err_mail);
			} elseif (false !== stripos($header->subject, 'Host unknown')) {
				// メールサーバ不正
				$err_mail = array('yyyymmdd' => date('Ymd', strtotime(imap_headerinfo($mbox, $i)->date)), 'email' => $this->_getMailAddr($body), 'err_kind' => '1', 'mail_contents' => mb_convert_encoding(imap_body($mbox, $i), 'UTF-8', 'ISO-2022-JP'));
				array_push($err_mail_list, $err_mail);
			} else {
				// その他
				if ('' != $header->toaddress) {
					$email = $header->to[0]->mailbox.'@'.$header->to[0]->host;
				} else {
					$email = "";
				}
				$err_mail = array('yyyymmdd' => date('Ymd', strtotime(imap_headerinfo($mbox, $i)->date)), 'email' => $email, 'err_kind' => '2', 'mail_contents' => mb_convert_encoding(imap_body($mbox, $i), 'UTF-8', 'ISO-2022-JP'));
				array_push($err_mail_list, $err_mail);
 			}
		}

		// エラー表示
		echo imap_last_error();

		// メールボックスのクローズ
		imap_close($mbox);

		return $err_mail_list;
	}

	/**
	 * エラーメールの宛先を取得する。
 	 *
 	 * @param unknown_type $msg エラーメールのbody
 	 */
 	function _getMailAddr($msg) {
		$email = '';
		$text_array = explode("\n", $msg);
		foreach ($text_array as $line) {
			if (false !== stripos($line, 'Final-Recipient')) {
				$col_array = explode(' ', str_replace("\r", "", $line));
				$email = $col_array[2];
				break;
			}
		}
		return $email;
	}

	// ADD-S 2012.02.24 バッチログメール追加
	/**
	 * 保守担当者にメールする。（日本語メール）
	 *
	 * @param string $title メールタイトル
	 * @param string $to メール送信先
	 * @param string $template テンプレート
	 * @param array $ary_value 置き換え文字列
	 */
	function sendMaintenanceMail($title, $mail_to, $template, $ary_value) {
		// 日本語メールを送る際の設定
		mb_language("Japanese");
		mb_internal_encoding("UTF-8");

		// SMTPサーバーの情報を配列に設定
		$params = array(
			'host'       => $this->config->get('mail_smtp_host'),
			'port'       => $this->config->get('mail_smtp_port'),
			'auth'       => $this->config->get('mail_smtp_auth'),
			'username'   => base64_encode($this->config->get('mail_smtp_user')),
			'password'   => base64_encode($this->config->get('mail_smtp_pass')),
			'localhost'  => null,
			'timeout'    => null,
			'debug'      => false,
			'persist'    => null,
			'pipelining' => null
		);

		// メールヘッダ情報を配列に設定
		// 日本語メールの場合
		$headers = array (
			'To'          => mb_encode_mimeheader($mail_to, "ISO-2022-JP"),
			'From'        => $this->config->get('mail_from'),
			'Return-Path' => mb_encode_mimeheader($this->config->get('mail_return-path'), "ISO-2022-JP"),
			'Subject'     => mb_encode_mimeheader(mb_convert_encoding($title, "ISO-2022-JP", "UTF-8"), "ISO-2022-JP")
		);

		// メール本文
		$ethna_mail =& new Ethna_MailSender($this->backend);
		$body_tmp = $ethna_mail->send(
			null,
			$template,
			$ary_value
		);
		$this->backend->getLogger()->log(LOG_DEBUG, '■本文(UTF-8) : '.$body_tmp);
		$body = mb_convert_encoding($body_tmp, "ISO-2022-JP", "UTF-8");

		// 送信者
		$recipients = $mail_to;

		// 送信
		$mail_obj =& Mail::factory('smtp', $params);
		$result = $mail_obj->send($recipients, $headers, $body);
		if (PEAR::isError($result)) {
			$msg = 'メールの送信に失敗しました';
			$this->backend->getLogger()->log(LOG_ERR, $msg);
			$this->backend->getActionError()->add('error', $msg);
		}

		return;
	}
	// ADD-E 2012.02.24 バッチログメール追加
}
?>
