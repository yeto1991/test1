<?php
/**
 *  Admin/FairCheckListCsvDownload.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_JmFair.php';

/**
 *  admin_fairCheckListCsvDownload Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairCheckListCsvDownload extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	);
}

/**
 *  admin_fairCheckListCsvDownload action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairCheckListCsvDownload extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairCheckListCsvDownload Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('adminCommon')->isLoginFair()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', '');
			return 'admin_login';
		}
		return null;
	}

	/**
	 *  admin_fairCheckListCsvDownload action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ソート順
		$sort_cond = $this->session->get('sort_cond');
		$ary_sort = array($sort_cond['sort_1'], $sort_cond['sort_2'], $sort_cond['sort_3'], $sort_cond['sort_4'], $sort_cond['sort_5']);
		$ary_sort_cond = array($sort_cond['sort_cond_1'], $sort_cond['sort_cond_2'], $sort_cond['sort_cond_3'], $sort_cond['sort_cond_4'], $sort_cond['sort_cond_5']);

		// 検索
		$jm_fair_mgr =& $this->backend->getManager('JmFair');
		$jm_fair_checklist = $jm_fair_mgr->getFairCheckListDownload($ary_sort, $ary_sort_cond);

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		// ファイル名
		$file = 'checklist.csv';

		// header出力
		header ("Content-Disposition: attachment; filename=$file");
		header ("Content-type: application/x-csv");

		$csvtitle = '"No.","見本市名","見本市略称","見本市URL","会期開始日","会期終了日","開催地","会場名","Eメール（ID）","主催者名","主催者TEL","主催者FAX","主催者Eメール","日本国内の連絡先名称(日)","システム管理者備考欄","申請年月日","登録日","否認コメント"';
		echo mb_convert_encoding($csvtitle, 'CP932', 'UTF-8');
		echo "\n";

		for ($i = 0; $i < count($jm_fair_checklist); $i++) {
			$row = $jm_fair_checklist[$i];
			$j = 0;
			foreach ($row as $key => $value) {
				if (0 < $j) {
					echo ',';
				}
				echo '"'.mb_convert_encoding($value, 'CP932', 'UTF-8').'"';
				$j++;
			}
			echo "\n";
		}

		return null;
	}
}

?>
