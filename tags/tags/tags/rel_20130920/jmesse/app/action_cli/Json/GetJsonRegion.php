<?php
/**
 *  Json/GetJsonRegion.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  json_getJsonRegion Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_JsonGetJsonRegion extends Jmesse_ActionForm
{
}

/**
 *  json_getJsonRegion action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_JsonGetJsonRegion extends Jmesse_ActionClass
{
	/**
	 *  preprocess of json_getJsonRegion Action.
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
	 *  json_getJsonRegion action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// このファイルは下記のethnaコマンドで作成する
		// > ethna add-action -g cli json_getJsonRegion

		// DB検索
		$jm_fair_cnt_mgr = $this->backend->getManager('JmFairCnt');

		//日本語用
		$jm_fair_cnt_region_list = $jm_fair_cnt_mgr->getJsonRegionJP();
		if (null != $jm_fair_cnt_region_list) {
			// JSON化
			$jm_fair_cnt_region_json = json_encode($jm_fair_cnt_region_list);
			// FILE出力
			$filename = $this->config->get('jsonfile_path').$this->config->get('r_jp');
			file_put_contents($filename, $jm_fair_cnt_region_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);
		}
 		//英語用
 		$jm_fair_cnt_region_list = $jm_fair_cnt_mgr->getJsonRegionEN();
 		if (null != $jm_fair_cnt_region_list) {
 			// JSON化
 			$jm_fair_cnt_region_json = json_encode($jm_fair_cnt_region_list);
 			// FILE出力
 			$filename = $this->config->get('jsonfile_path').$this->config->get('r_en');
 			file_put_contents($filename, $jm_fair_cnt_region_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);
 		}
		return null;
	}
}

?>
