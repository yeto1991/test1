<?php
/**
 *  User/EnFairListDel.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'EnFairList.php';

/**
 *  user_enFairListDel Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnFairListDel extends Jmesse_Form_UserEnFairList
{
}

/**
 *  user_enFairListDel action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnFairListDel extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enFairListDel Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// ログインチェック
		if (!$this->backend->getManager('userCommon')->isLoginUser()) {
			$this->backend->getLogger()->log(LOG_ERR, '未ログイン');
			$this->af->set('function', '');
			return 'user_enLogin';
		}
		return null;
	}

	/**
	 *  user_enFairListDel action implementation.
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
					$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
					$this->ae->addObject('error', $jm_fair);
					$db->rollback();
					return 'enError';
				}
				if (null == $jm_fair || $mihon_no != $jm_fair->get('mihon_no')) {
					$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
					$this->ae->add('error', 'A system error has occurred.');
					$db->rollback();
					return 'enError';
				}
				if ($this->session->get('user_id') != $jm_fair->get('user_id')) {
					$this->backend->getLogger()->log(LOG_ERR, '他人の見本市 '.$this->session->get('user_id').' '.$jm_fair->get('user_id'));
					$this->ae->add('error', 'A system error has occurred.');
					$db->rollback();
					return 'enError';
				}

				//項目設定
				$jm_fair->set('del_flg', '1');
				$jm_fair->set('del_date', date('Y/m/d H:i:s'));
				$jm_fair->set('update_user_id', $this->session->get('user_id'));
				$jm_fair->set('update_date', date('Y/m/d H:i:s'));

				// UPDATE
				$ret = $jm_fair->update();
				if (Ethna::isError($ret)) {
					$this->ae->addObject('error', $ret);
					$db->rollback();
					return 'enError';
				}

				// JM_FAIR_TEMPにコピー
				$jmFairTempMgr = $this->backend->getManager('jmFairTemp');
				$jmFairTempMgr->copyFair($jm_fair->get('mihon_no'));
			}
		}
		// コミット
		$db->commit();

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}

		header('Location: '.$this->config->get('url').'?action_user_enFairList=true');
		return null;
	}
}
?>
