<?php
/**
 *  Admin/UserCsvDownload.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_JmUser.php';

/**
 *  admin_userCsvDownload Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminUserCsvDownload extends Jmesse_ActionForm
{
}

/**
 *  admin_userCsvDownload action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminUserCsvDownload extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_userCsvDownload Action.
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
			$this->af->set('function', '');
			return 'admin_login';
		}

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		return null;
	}

	/**
	 *  admin_userCsvDownload action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$jm_user_mgr =& $this->backend->getManager('JmUser');
		$jm_user_csv_list = $jm_user_mgr->getUserListDownload();

		$file = 'userList.csv';

		header ("Content-Disposition: attachment; filename=$file");
		header ("Content-type: application/x-csv");

		// MOD-S 2012.01.31 ダウンロード項目、コード値変換対応
		$csvtitle = '"Eメール"';
		echo mb_convert_encoding($csvtitle, 'CP932', 'UTF-8');
		echo "\n";
		// MOD-E 2012.01.31 ダウンロード項目、コード値変換対応

		for ($i = 0; $i < count($jm_user_csv_list); $i++) {
			$row = $jm_user_csv_list[$i];
			$j = 0;
			foreach ($row as $key => $value) {
				if (0 < $j) {
					echo ',';
				}
				//echo $value;
				echo '"'.mb_convert_encoding($value, 'CP932', 'UTF-8').'"';
				$j++;
			}
			echo "\n";
		}
		return null;
	}
}

?>
