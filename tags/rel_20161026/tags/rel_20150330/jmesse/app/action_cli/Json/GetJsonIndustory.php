<?php
/**
 *  Json/GetJsonIndustory.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: a99a32157780abedaf1b817cf022da94c2d1572c $
 */

/**
 *  json_getJsonIndustory Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Form_JsonGetJsonIndustory extends Jmesse_ActionForm
{
}

/**
 *  json_getJsonIndustory action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Cli_Action_JsonGetJsonIndustory extends Jmesse_ActionClass
{
	/**
	 *  preprocess of json_getJsonIndustory Action.
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
	 *  json_getJsonIndustory action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// DB検索
		$jm_fair_cnt_mgr = $this->backend->getManager('JmFairCnt');

		//会場区分判別様
		$area_jp = '0';
		$area_world = '1';

		//日本語用
		$jm_fair_cnt_indutory_list = $jm_fair_cnt_mgr->getJsonIndustoryJP();
		if (null != $jm_fair_cnt_indutory_list) {
			// JSON化
			$jm_fair_cnt_indutory_json = json_encode($jm_fair_cnt_indutory_list);
			// FILE出力
			$filename = $this->config->get('jsonfile_path').$this->config->get('i_jp');
			file_put_contents($filename, $jm_fair_cnt_indutory_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);

			// 2列
			$json_array = array_chunk($jm_fair_cnt_indutory_list, 6);
			$jm_fair_cnt_indutory_json = json_encode($json_array);
			// FILE出力
			$filename = $this->config->get('jsonfile_path').$this->config->get('i2_jp');
			file_put_contents($filename, $jm_fair_cnt_indutory_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);
		}

		//英語用
		$jm_fair_cnt_indutory_list = $jm_fair_cnt_mgr->getJsonIndustoryEN();
		if (null != $jm_fair_cnt_indutory_list) {
			// JSON化
			$jm_fair_cnt_indutory_json = json_encode($jm_fair_cnt_indutory_list);
			// FILE出力
			$filename = $this->config->get('jsonfile_path').$this->config->get('i_en');
			file_put_contents($filename, $jm_fair_cnt_indutory_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);

			// 2列
			$json_array = array_chunk($jm_fair_cnt_indutory_list, 6);
			$jm_fair_cnt_indutory_json = json_encode($json_array);
			// FILE出力
			$filename = $this->config->get('jsonfile_path').$this->config->get('i2_en');
			file_put_contents($filename, $jm_fair_cnt_indutory_json);
			$this->backend->getLogger()->log(LOG_DEBUG, '■JSON出力 : '.$filename);
		}

// 		//日本語（国内）用
// 		$jm_fair_cnt_indutory_list = $jm_fair_cnt_mgr->getJsonIndustoryJP($area_jp);
// 		if (null != $jm_fair_cnt_indutory_list) {
// 			// JSON化
// 			$jm_fair_cnt_indutory_json = json_encode($jm_fair_cnt_indutory_list);
// 			// FILE出力
// 			$filename = $this->config->get('jsonfile_path').'industory_jp_venue0.json';
// 			file_put_contents($filename, $jm_fair_cnt_indutory_json);
//  		}
//  		//日本語（海外）用
//  		$jm_fair_cnt_indutory_list = $jm_fair_cnt_mgr->getJsonIndustoryJP($area_world);
//  		if (null != $jm_fair_cnt_indutory_list) {
//  			// JSON化
//  			$jm_fair_cnt_indutory_json = json_encode($jm_fair_cnt_indutory_list);
//  			// FILE出力
//  			$filename = $this->config->get('jsonfile_path').'industory_jp_venue1.json';
//  			file_put_contents($filename, $jm_fair_cnt_indutory_json);
//  		}
//  		//英語（国内）用
//  		$jm_fair_cnt_indutory_list = $jm_fair_cnt_mgr->getJsonIndustoryEN($area_jp);
//  		if (null != $jm_fair_cnt_indutory_list) {
//  			// JSON化
//  			$jm_fair_cnt_indutory_json = json_encode($jm_fair_cnt_indutory_list);
//  			// FILE出力
//  			$filename = $this->config->get('jsonfile_path').'industory_en_venue0.json';
//  			file_put_contents($filename, $jm_fair_cnt_indutory_json);
//  		}
//  		//英語（海外）用
//  		$jm_fair_cnt_indutory_list = $jm_fair_cnt_mgr->getJsonIndustoryEN($area_world);
//  		if (null != $jm_fair_cnt_indutory_list) {
//  			// JSON化
//  			$jm_fair_cnt_indutory_json = json_encode($jm_fair_cnt_indutory_list);
//  			// FILE出力
//  			$filename = $this->config->get('jsonfile_path').'industory_en_venue1.json';
//  			file_put_contents($filename, $jm_fair_cnt_indutory_json);
//  		}

		return null;
	}
}

?>
