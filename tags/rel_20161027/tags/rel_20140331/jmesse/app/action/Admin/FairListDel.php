<?php
/**
 *  Admin/FairListDel.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairSearch.php';

/**
 *  admin_fairListDel Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminFairListDel extends Jmesse_Form_AdminFairSearch
{
}

/**
 *  admin_fairListDel action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminFairListDel extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_fairListDel Action.
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
	 *  admin_fairListDel action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{

		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();

		$ary_mihon_no = $this->af->get('check_mihon_no');
		for ($i = 0; $i < count($ary_mihon_no); $i++) {
			$mihon_no = $ary_mihon_no[$i];
			if ('' != $mihon_no) {
				// JM_FAIRオブジェクトの取得
				$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $mihon_no);
				if (Ethna::isError($jm_fair)) {
					$this->ae->addObject('error', $jm_fair);
					$db->rollback();
					return 'admin_error';
				}
				$jm_fair->set('del_flg', '1');
				$jm_fair->set('del_date', date('Y/m/d H:i:s'));

				// UPDATE
				$ret = $jm_fair->update();
				if (Ethna::isError($ret)) {
					$this->ae->addObject('error', $ret);
					$db->rollback();
					return 'admin_error';
				}

				// JM_FAIR_TEMPにコピー
				$jmFairTempMgr = $this->backend->getManager('jmFairTemp');
				$jmFairTempMgr->copyFair($jm_fair->get('mihon_no'));

				// ログに登録
				$mgr = $this->backend->getManager('adminCommon');
				$ret = $mgr->regLog($this->session->get('user_id'), '4', '2', $jm_fair->get('mihon_no'));
				if (Ethna::isError($ret)) {
					$this->ae->addObject('error', $ret);
					$db->rollback();
					return 'admin_error';
				}

			}
		}
		// コミット
		$db->commit();

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		header('Location: '.$this->config->get('url').'?action_admin_fairList=true&type='.$this->af->get('type').'&page='.$this->af->get('page'));
		return null;
	}
}
?>
