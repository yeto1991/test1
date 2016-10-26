<?php
/**
 *  Admin/ErrMailDownload.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'ErrMail.php';

/**
 *  admin_errMailDownload Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminErrMailDownload extends Jmesse_Form_AdminErrMail
{
}

/**
 *  admin_errMailDownload action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminErrMailDownload extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_errMailDownload Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('adminCommon')->isLoginError()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', '');
			return 'admin_login';
		}

		// 入力チェック
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'admin_errMail';
		}

		// 期間
		if ('' != $this->af->get('date_from_yyyy') || '' != $this->af->get('date_from_mm') || '' != $this->af->get('date_from_dd')) {
			if (!checkdate($this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))) {
				$this->ae->add('error', '期間(開始)が正しくありません');
			}
		}
		if ('' != $this->af->get('date_to_yyyy') || '' != $this->af->get('date_to_mm') || '' != $this->af->get('date_to_dd')) {
			if (!checkdate($this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('error', '期間(終了)が正しくありません');
			}
		}
		if ('' != $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_mm') && '' != $this->af->get('date_from_dd')
			&& '' != $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_mm') && '' != $this->af->get('date_to_dd')) {
			if (mktime(0, 0, 0, $this->af->get('date_from_mm'), $this->af->get('date_from_dd'), $this->af->get('date_from_yyyy'))
				> mktime(0, 0, 0, $this->af->get('date_to_mm'), $this->af->get('date_to_dd'), $this->af->get('date_to_yyyy'))) {
				$this->ae->add('error', '期間が正しくありません(開始 > 終了)');
			}
		}

		// メールアドレス
		if ('' != $this->af->get('email')) {
			if (!strpos($this->af->get('email'), '@')
				|| 0 === strpos($this->af->get('email'), '@')
				|| strlen($this->af->get('email')) - 1 === strpos($this->af->get('email'), '@')) {
				$this->ae->add('error', 'メールアドレスが不正です');
			}
		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'admin_errMail';
		}

		return null;
	}

	/**
	 *  admin_errMailDownload action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// 期間(開始)
		if ('' != $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_mm') && '' != $this->af->get('date_from_dd')) {
			$date_from = $this->af->get('date_from_yyyy').$this->af->get('date_from_mm').$this->af->get('date_from_dd');
		} else {
			$date_from = '';
		}

		// 期間(終了)
		if ('' != $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_mm') && '' != $this->af->get('date_to_dd')) {
			$date_to = $this->af->get('date_to_yyyy').$this->af->get('date_to_mm').$this->af->get('date_to_dd');
		} else {
			$date_to = '';
		}

		// 検索
		$jm_err_mail_mgr =& $this->backend->getManager('JmErrMail');
		$list = $jm_err_mail_mgr->getErrMailList($date_from, $date_to, $this->af->get('email'), $this->af->get('address'), $this->af->get('server'), $this->af->get('other'));

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		// MOD-S 2012.01.31 ダウンロード項目、コード値変換対応
		// CSV出力
		// ファイル名
		$file = 'list.csv';

		// CSV出力
		header ("Content-Disposition: attachment; filename=$file");
		header ("Content-type: application/x-csv");

		$csvtitle = '"年月日","Eメール","エラー種別"';
		echo mb_convert_encoding($csvtitle, 'CP932', 'UTF-8');
		echo "\n";
		for ($i = 0; $i < count($list); $i++) {
			$row = $list[$i];
			$j = 0;
			foreach ($row as $key => $value) {
				if (0 < $j) {
					echo ',';
				}
				if ('err_kind' == $key) {
					echo '"'.mb_convert_encoding($this->err_kind[$value], 'CP932', 'UTF-8').'"';
				} else {
					echo '"'.mb_convert_encoding($value, 'CP932', 'UTF-8').'"';
				}
				$j++;
			}
			echo "\n";
		}
		return null;
		// MOD-E 2012.01.31 ダウンロード項目、コード値変換対応
	}

	var $err_kind = array('0' => 'アドレス不正', '1' => 'メールサーバ不正', '2' => 'その他');
}

?>
