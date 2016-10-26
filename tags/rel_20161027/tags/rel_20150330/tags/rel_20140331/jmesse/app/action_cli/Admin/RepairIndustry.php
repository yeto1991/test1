<?php
/**
 *  Admin/RepairIndustry.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  admin_repairIndustry Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_AdminRepairIndustry extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
	);
}

/**
 *  admin_repairIndustry action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_AdminRepairIndustry extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_repairIndustry Action.
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
	 *  admin_repairIndustry action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// ユーザ情報の移行
		echo "[START]  REPAIR_INDUSTRY >>>>>\n";

		// トランザクションの開始
		$this->_begin();
		$list = @file("Industry.txt");
		foreach ($list as $row) {
			// 改行コードの削除
			$row = str_replace("\r", "", $row);
			$row = str_replace("\n", "", $row);

			// 配列化
			$ary_col = explode("\t", $row);

			// 項目取り出し
			$i = 0;
			$mihon_no = $ary_col[$i++];
			$doc_no = $ary_col[$i++];
			$fair_title_jp = $ary_col[$i++];
			$fair_title_en = $ary_col[$i++];
			$main_industory_1 = $ary_col[$i++];
			$main_industory_2 = $ary_col[$i++];
			$main_industory_3 = $ary_col[$i++];
			$main_industory_4 = $ary_col[$i++];
			$main_industory_5 = $ary_col[$i++];
			$main_industory_6 = $ary_col[$i++];
			$sub_industory_1 = $ary_col[$i++];
			$sub_industory_2 = $ary_col[$i++];
			$sub_industory_3 = $ary_col[$i++];
			$sub_industory_4 = $ary_col[$i++];
			$sub_industory_5 = $ary_col[$i++];
			$sub_industory_6 = $ary_col[$i++];

			// JM_FAIRオブジェクト取得
			$jm_fair =& $this->backend->getObject('JmFair', 'mihon_no', $mihon_no);

			// チェック
			if (Ethna::isError($jm_fair)) {
				echo "fail to get jm_fair [".$row."]\n";
				continue;
			}
			if ($fair_title_jp != $jm_fair->get('fair_title_jp') && $fair_title_en != $jm_fair->get('fair_title_en')) {
				echo "mismatch fair_title [".$row."]\n";
				continue;
			}

			// 既に更新していたら修正しない
			if ('' != $jm_fair->get('update_date') && $jm_fair->get('update_date') > '2012-01-17 00:00:00') {
				echo "already updated [".$row."]\n";
				continue;
			}

			// 同一なら設定しない
			if (
				$main_industory_1 == $jm_fair->get('main_industory_1') &&
				$main_industory_2 == $jm_fair->get('main_industory_2') &&
				$main_industory_3 == $jm_fair->get('main_industory_3') &&
				$main_industory_4 == $jm_fair->get('main_industory_4') &&
				$main_industory_5 == $jm_fair->get('main_industory_5') &&
				$main_industory_6 == $jm_fair->get('main_industory_6') &&
				$sub_industory_1 == $jm_fair->get('sub_industory_1') &&
				$sub_industory_2 == $jm_fair->get('sub_industory_2') &&
				$sub_industory_3 == $jm_fair->get('sub_industory_3') &&
				$sub_industory_4 == $jm_fair->get('sub_industory_4') &&
				$sub_industory_5 == $jm_fair->get('sub_industory_5') &&
				$sub_industory_6 == $jm_fair->get('sub_industory_6')) {
				echo "all matches [".$mihon_no."]\n";
				continue;
			}

			// 設定
			$jm_fair->set('main_industory_1', $main_industory_1);
			$jm_fair->set('main_industory_2', $main_industory_2);
			$jm_fair->set('main_industory_3', $main_industory_3);
			$jm_fair->set('main_industory_4', $main_industory_4);
			$jm_fair->set('main_industory_5', $main_industory_5);
			$jm_fair->set('main_industory_6', $main_industory_6);
			$jm_fair->set('sub_industory_1', $sub_industory_1);
			$jm_fair->set('sub_industory_2', $sub_industory_2);
			$jm_fair->set('sub_industory_3', $sub_industory_3);
			$jm_fair->set('sub_industory_4', $sub_industory_4);
			$jm_fair->set('sub_industory_5', $sub_industory_5);
			$jm_fair->set('sub_industory_6', $sub_industory_6);

			// UPDATE
			$jm_fair->update();
		}

		// トランザクション終了
		$this->_end();

		echo "[FINISH]  REPAIR_INDUSTRY <<<<<\n";
		return null;
	}

	/**
	 * トランザクションの開始。
	 *
	 */
	function _begin() {
		// トランザクション開始
		$db = $this->backend->getDB();
		$db->db->autocommit(false);
		$db->begin();
	}

	/**
	 * トランザクションの終了。
	 *
	 */
	function _end() {
		$db = $this->backend->getDB();
		$db->commit();
	}

}

?>
