<?php
/**
 *  Admin/UserTransferAct.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'Jmesse_JmFair.php';
require_once 'Jmesse_JmUser.php';
require_once 'UserTransferList.php';

/**
 *  admin_userTransferAct Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminUserTransferAct extends Jmesse_Form_AdminUserTransferList
{
}

/**
 *  admin_userTransferAct action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminUserTransferAct extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_userTransferAct Action.
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
	 *  admin_userTransferAct action implementation.
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

		//Update項目設定A
		$transfer_user_id = $this->config->get('transfer_user_id'); //定義情報からユーザIDを取得
		$update_id = $this->session->get('user_id');
		$update_date = date('Y/m/d H:i:s');

		// マネージャの取得
		$jm_user_mgr =& $this->backend->getManager('JmUser');
		$jm_fair_mgr =& $this->backend->getManager('JmFair');
		$jm_fair_temp_mgr =& $this->backend->getManager('jmFairTemp');

		//画面内での選択対象ユーザID群をArray取得
		$ary_check_user_ids = $this->af->get('check_user_id');

		for ($i = 0; $i < count($ary_check_user_ids); $i++) {
			$ary_check_user_id = $ary_check_user_ids[$i];
			if ('' != $ary_check_user_id) {

				//移譲元ユーザのEメール取得(データ管理者備考欄 更新用文字列形成のため)
				$ary_check_user_id_obj = $this->backend->getObject('JmUser', 'user_id', $ary_check_user_id);
				$ary_check_user_email = $ary_check_user_id_obj->get('email', $ary_check_user_id_obj);

				//移譲対象ユーザの保有見本市番号取得
				$target_mihon_no_list = $jm_fair_mgr->getTransferMihonNoList($ary_check_user_id);

				//対象見本市番号群分繰り返す
				for ($k = 0; $k < count($target_mihon_no_list); $k++) {
					$target_mihon_no = $target_mihon_no_list[$k]['mihon_no'];
					if ('' != $target_mihon_no) {

						//（各見本市毎に）現存をまずJM_FAIR_TEMPコピーする。
						$jm_fair_temp_mgr->copyFair($target_mihon_no);

						// JM_FAIRオブジェクトの取得
						$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $target_mihon_no);
						if (Ethna::isError($jm_fair)) {
							$this->ae->addObject('error', $jm_fair);
							$db->rollback();
							return 'admin_error';
						}

						//Update項目設定B
						$commentString = "[移譲実行]".date('Y/m/d H:i:s')." [移譲元ユーザ情報(ID/Eメール)]".$ary_check_user_id."/".$ary_check_user_email;

						//項目設定
						$jm_fair->set('user_id', $transfer_user_id);
						$jm_fair->set('note_for_data_manager', $commentString);
						$jm_fair->set('update_user_id', $this->session->get('user_id'));
						$jm_fair->set('update_date', date('Y/m/d H:i:s'));

						// UPDATE
						$ret = $jm_fair->update();
						if (Ethna::isError($ret)) {
							$this->ae->addObject('error', $ret);
							$db->rollback();
							return 'admin_error';
						}

						// 更新後の状態も履歴に残すため、再度JM_FAIR_TEMPコピーする。
						$jm_fair_temp_mgr->copyFair($target_mihon_no);
					}
				}
			}
		}
		// コミット
		$db->commit();

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}

		header('Location: '.$this->config->get('url').'?action_admin_userTransferList=true');
		return null;
	}
}

?>
