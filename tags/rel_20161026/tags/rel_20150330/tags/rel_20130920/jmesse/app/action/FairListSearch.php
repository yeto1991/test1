<?php
/**
 *  FairListSearch.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'FairList.php';

/**
 *  fairListSearch Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_FairListSearch extends Jmesse_Form_FairList
{
}

/**
 *  fairListSearch action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_FairListSearch extends Jmesse_ActionClass
{
	/**
	 *  preprocess of fairListSearch Action.
	 *
	 *  @access public
	 *  @return string    forward name(null: success.
	 *                                false: in case you want to exit.)
	 */
	function prepare()
	{
		// 入力チェック（必須）
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'error';
		}

		// 会期
		if ('e' == $this->af->get('year')) {
			if ('' == $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_mm')) {
				$this->ae->add('date_from_yyyy', '会期（開始）が正しくありません');
			}
			if ('' != $this->af->get('date_from_yyyy') && '' == $this->af->get('date_from_mm')) {
				$this->ae->add('date_from_mm', '会期（開始）が正しくありません');
			}
			if ('' == $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_mm')) {
				$this->ae->add('date_to_yyyy', '会期（終了）が正しくありません');
			}
			if ('' != $this->af->get('date_to_yyyy') && '' == $this->af->get('date_to_mm')) {
				$this->ae->add('date_to_mm', '会期（終了）が正しくありません');
			}
			if ('' != $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_mm')
				&& '' != $this->af->get('date_from_yyyy') && '' != $this->af->get('date_from_mm')
				&& '' != $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_mm')
				&& '' != $this->af->get('date_to_yyyy') && '' != $this->af->get('date_to_mm')) {
				if ($this->af->get('date_from_yyyy').$this->af->get('date_from_mm') > $this->af->get('date_to_yyyy').$this->af->get('date_to_mm')) {
					$this->ae->add('date_from_yyyy', '会期（終了）は未来の日付を入力して下さい');
				}
			}
			if ('' == $this->af->get('date_from_yyyy') && '' == $this->af->get('date_from_mm')
				&& '' == $this->af->get('date_from_yyyy') && '' == $this->af->get('date_from_mm')
				&& '' == $this->af->get('date_to_yyyy') && '' == $this->af->get('date_to_mm')
				&& '' == $this->af->get('date_to_yyyy') && '' == $this->af->get('date_to_mm')) {
				$this->ae->add('date_to_mm', '会期が未入力です');
			}
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			$this->_setMenuSelecte();
			return 'fairList';
		}

		return null;
	}

	/**
	 *  fairListSearch action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$ret = '';
		// ページ送りか絞り込みか
		if (null == $this->af->get('page') || '' == $this->af->get('page') || 0 == $this->af->get('page')) {
			$this->backend->getLogger()->log(LOG_DEBUG, '■絞り込み検索');
			// 絞り込み
			$ret = $this->_breakdown();
		} else {
			$this->backend->getLogger()->log(LOG_DEBUG, '■ページ送り・表示件数変更・ソート変更');
			// ページ送り
			$ret = $this->_paging();
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		return $ret;
	}

	/**
	 * ページ送り。
	 *
	 * @return string 出力テンプレート
	 */
	function _paging() {
		// 絞り込み（メニュー）部
		$this->_setMenuSelecte();

		// ページ設定
		$page = $this->af->get('page');

		// デフォルト設定
		// 表示件数
		$limit = $this->_setLimit();

		// ソート順
		$sort = $this->_setSort();

		// 検索結果（リスト）部
		// マネージャの取得
		$jm_fair_mgr =& $this->backend->getManager('JmFair');

		// ページ計算
		$lang = 'J';
		$total = $jm_fair_mgr->getFairListSearchDetailCnt($lang);
		if (0 < $total) {
			$this->backend->getLogger()->log(LOG_DEBUG, '■全件数 : '.$total);
			$max_page = floor($total / $limit);
			if (0 < $total % $limit) {
				$max_page += 1;
			}
			if ($max_page < $page) {
				$page = $max_page;
			}
			$offset = $limit * ($page - 1);
			$this->backend->getLogger()->log(LOG_DEBUG, '■表示開始 : '.$offset);
			$this->backend->getLogger()->log(LOG_DEBUG, '■最大ページ : '.$max_page);

			// 出力項目

			// ページャー作成
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairListSearch=true&detail=1&page=', $page, $max_page));
			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairListSearchDetail($offset, $limit, $sort, $lang)));
			// META Keyword
			$this->af->setApp('meta_keyword', $this->_getListName());
			$this->af->setApp('title', $this->_getListName());
			// リスト部タイトル
			$this->af->setApp('list_name', $this->_getListName());
			// 表示件数
			$this->af->setApp('total', $total);
			$this->af->setApp('start', $offset + 1);
			$this->af->setApp('end', ($offset + $limit) < $total ? ($offset + $limit) : $total);
			// 現在のページ番号
			$this->af->setApp('page', $page);
		} else {
			// 出力項目
			$this->_dispZero();
		}
		// パンくず
		$this->_getPan();

		// sessionの内容をformに設定
		$this->_setSessionToForm();

		return 'fairList';
	}

	/**
	 * 絞り込み検索。
	 *
	 * @return string 出力テンプレート
	 */
	function _breakdown() {
		// ページング用に検索条件をSESSIONに保存する。
		$this->_setFormToSession();

		// 絞り込み（メニュー）部
		$this->_setMenuSelecte();

		// 検索条件の整理
// 		$this->_setSearchCond();

		// ページ設定
		$page = 1;

		// デフォルト設定
		// 表示件数
		$limit = $this->_setLimit();

		// ソート順
		$sort = $this->_setSort();

		// 検索結果（リスト）部
		// マネージャの取得
		$jm_fair_mgr =& $this->backend->getManager('JmFair');

		// ページ計算
		$lang = 'J';
		$total = $jm_fair_mgr->getFairListSearchDetailCnt($lang);

		if (0 < $total) {
			$this->backend->getLogger()->log(LOG_DEBUG, '■全件数 : '.$total);
			$max_page = floor($total / $limit);
			if (0 < $total % $limit) {
				$max_page += 1;
			}
			if ($max_page < $page) {
				$page = $max_page;
			}
			$offset = $limit * ($page - 1);
			$this->backend->getLogger()->log(LOG_DEBUG, '■表示開始 : '.$offset);
			$this->backend->getLogger()->log(LOG_DEBUG, '■最大ページ : '.$max_page);

			// 出力項目

			// ページャー作成
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairListSearch=true&detail=1&page=', $page, $max_page));
			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairListSearchDetail($offset, $limit, $sort, $lang)));
			// META Keyword
			$this->af->setApp('meta_keyword', $this->_getListName());
			$this->af->setApp('title', $this->_getListName());
			// リスト部タイトル
			$this->af->setApp('list_name', $this->_getListName());
			// 表示件数
			$this->af->setApp('total', $total);
			$this->af->setApp('start', $offset + 1);
			$this->af->setApp('end', ($offset + $limit) < $total ? ($offset + $limit) : $total);
			// 現在のページ番号
			$this->af->setApp('page', $page);
		} else {
			// 出力項目
			$this->_dispZero();
		}
		// パンくず
		$this->_getPan();

		// sessionの内容をformに設定
		$this->_setSessionToForm();

		return 'fairList';
	}

	/**
	 * 検索条件をSESSIONに保存。
	 *
	 */
	function _setFormToSession() {
		// ページング用に検索条件をSESSIONに保存する。
		$search_cond = array();
		$search_cond['type'] = $this->af->get('type');
		$search_cond['i_2'] = $this->af->get('i_2');
		$search_cond['i_3'] = $this->af->get('i_3');
		$search_cond['v_2'] = $this->af->get('v_2');
		$search_cond['v_3'] = $this->af->get('v_3');
		$search_cond['v_4'] = $this->af->get('v_4');
		// i1
		$search_cond['check_sub_industory'] = $this->af->get('check_sub_industory');
		$search_cond['check_region'] = $this->af->get('check_region');
		$search_cond['check_region_country'] = $this->af->get('check_region_country');
		// v1
		$search_cond['check_country'] = $this->af->get('check_country');
		// v2
		$search_cond['check_city'] = $this->af->get('check_city');
		// v1、v2
		$search_cond['check_main_industory'] = $this->af->get('check_main_industory');
		// 詳細
		$search_cond['check_main_sub_industory'] = $this->af->get('check_main_sub_industory');
		$search_cond['select_region'] = $this->af->get('select_region');
		$search_cond['select_country'] = $this->af->get('select_country');
		$search_cond['select_city'] = $this->af->get('select_city');
		// 共通
		$search_cond['industory_selected'] = $this->af->get('industory_selected');
		$search_cond['venue_selected'] = $this->af->get('venue_selected');
		$search_cond['year'] = $this->af->get('year');
		$search_cond['date_from_yyyy'] = $this->af->get('date_from_yyyy');
		$search_cond['date_from_mm'] = $this->af->get('date_from_mm');
		$search_cond['date_to_yyyy'] = $this->af->get('date_to_yyyy');
		$search_cond['date_to_mm'] = $this->af->get('date_to_mm');
		$search_cond['keyword'] = $this->af->get('keyword');

		if (!$this->session->isStart()) {
			$this->session->start();
		}
		$this->session->set('search_cond', $search_cond);
	}

	/**
	 * メニュー部の表示項目設定。
	 *
	 */
	function _setMenuSelecte() {
		$search_cond = $this->session->get('search_cond');
		// 業種
		$industory_list = array();
		if ('1' == $search_cond['industory_selected']) {
			$check_main_sub_industory_list = $search_cond['check_main_sub_industory'];
			if (null != $check_main_sub_industory_list) {
				foreach ($check_main_sub_industory_list as $check_main_sub_industory) {
					$ary_check_main_sub_industory = explode('_', $check_main_sub_industory);
					array_push($industory_list, $ary_check_main_sub_industory[2].'/'.$ary_check_main_sub_industory[3]);
				}
			}
		} else {
			if ('i1' == $search_cond['type']) {
				// 業種選択
				$check_main_sub_industory_list = array();
				// 業種大分類
				$kbn_2 = $search_cond['i_2'];
				$main_industory = $this->_getJmCodeM('002', $kbn_2, '000', '000');
				// 業種小分類
				$sub_industory_list = $search_cond['check_sub_industory'];
				if (null != $sub_industory_list) {
					foreach ($sub_industory_list as $kbn_3) {
						$sub_industory = $this->_getJmCodeM('002', $kbn_2, $kbn_3, '000');
						array_push($industory_list, $main_industory.'/'.$sub_industory);
						array_push($check_main_sub_industory_list, $kbn_2.'_'.$kbn_3.'_'.$main_industory.'_'.$sub_industory);
					}
					// セッションの書き換え
					$search_cond['check_main_sub_industory'] = $check_main_sub_industory_list;
					$this->session->set('search_cond', $search_cond);
				} else {
					array_push($industory_list, $main_industory);
				}
			} elseif ('v1' == $search_cond['type']) {
				// 業種選択
				$industory_list = array();
				// 業種大分類
				$check_main_industory_list = $search_cond['check_main_industory'];
				if (null != $check_main_industory_list) {
					foreach ($check_main_industory_list as $check_main_industory) {
						array_push($industory_list, $this->_getJmCodeM('002', $check_main_industory, '000', '000'));
					}
				}
			} elseif ('v2' == $search_cond['type']) {
				// 業種選択
				$industory_list = array();
				// 業種大分類
				$check_main_industory_list = $search_cond['check_main_industory'];
				if (null != $check_main_industory_list) {
					foreach ($check_main_industory_list as $check_main_industory) {
						array_push($industory_list, $this->_getJmCodeM('002', $check_main_industory, '000', '000'));
					}
				}
			}
		}
		$this->af->setApp('industory_list', $industory_list);

		// 開催地
		$vanue_list = array();
		if ('1' == $search_cond['venue_selected']) {
			// 詳細検索画面にて開催地を設定した場合。
			$this->backend->getLogger()->log(LOG_DEBUG, '■select_region  : '.$search_cond['select_region']);
			$this->backend->getLogger()->log(LOG_DEBUG, '■select_country : '.$search_cond['select_country']);
			$this->backend->getLogger()->log(LOG_DEBUG, '■select_city    : '.$search_cond['select_city']);
			if ('' != $search_cond['select_region'] && '' == $search_cond['select_country'] && '' == $search_cond['select_city']) {
				// 地域
				array_push($vanue_list, $this->_getJmCodeM('003', $search_cond['select_region'], '000', '000').'/すべて/すべて');
			} elseif ('' != $search_cond['select_region'] && '' != $search_cond['select_country'] && '' == $search_cond['select_city']) {
				// 国・地域
				array_push($vanue_list, $this->_getJmCodeM('003', $search_cond['select_region'], '000', '000').'/'.$this->_getJmCodeM('003', $search_cond['select_region'], $search_cond['select_country'], '000').'/すべて');
			} elseif ('' != $search_cond['select_region'] && '' != $search_cond['select_country'] && '' != $search_cond['select_city']) {
				// 都市
				array_push($vanue_list, $this->_getJmCodeM('003', $search_cond['select_region'], '000', '000').'/'.$this->_getJmCodeM('003', $search_cond['select_region'], $search_cond['select_country'], '000').'/'.$this->_getJmCodeM('003', $search_cond['select_region'], $search_cond['select_country'], $search_cond['select_city']));
			} else {
				array_push($vanue_list, 'すべて/すべて/すべて');
			}
		} else {
			// 詳細検索画面にて開催地を設定しない場合
			if ('i1' == $search_cond['type']) {
				// 地域
				$region_list = $search_cond['check_region'];
				if (null != $region_list) {
					foreach ($region_list as $kbn_2) {
						array_push($vanue_list, $this->_getJmCodeM('003', $kbn_2, '000', '000'));
					}
				}
				// 地域、国・地域
				$region_country_list = $search_cond['check_region_country'];
				if (null != $region_country_list) {
					foreach ($region_country_list as $region_country) {
						$ary_kbn = explode('_', $region_country);
						array_push($vanue_list, $this->_getJmCodeM('003', $ary_kbn[0], '000', '000').'/'.$this->_getJmCodeM('003', $ary_kbn[0], $ary_kbn[1], '000'));
					}
				}
			} elseif ('v1' == $search_cond['type']) {
				// 地域
				$kbn_2 = $search_cond['v_2'];
				// 国・地域
				$check_country_list = $search_cond['check_country'];
				if (null != $check_country_list) {
					foreach ($check_country_list as $check_country) {
						array_push($vanue_list, $this->_getJmCodeM('003', $kbn_2, '000', '000').'/'.$this->_getJmCodeM('003', $kbn_2, $check_country, '000'));
					}
				} else {
					array_push($vanue_list, $this->_getJmCodeM('003', $kbn_2, '000', '000'));
				}
			} elseif ('v2' == $search_cond['type']) {
				// 地域
				$kbn_2 = $search_cond['v_2'];
				// 国・地域
				$kbn_3 = $search_cond['v_3'];
				// 都市
				$check_city_list = $search_cond['check_city'];
				if (null != $check_city_list) {
					foreach ($check_city_list as $check_city) {
						array_push($vanue_list, $this->_getJmCodeM('003', $kbn_2, '000', '000').'/'.$this->_getJmCodeM('003', $kbn_2, $kbn_3, '000').'/'.$this->_getJmCodeM('003', $kbn_2, $kbn_3, $check_city));
					}
				} else {
					array_push($vanue_list, $this->_getJmCodeM('003', $kbn_2, '000', '000').'/'.$this->_getJmCodeM('003', $kbn_2, $kbn_3, '000'));
				}
			}
		}
		$this->af->setApp('vanue_list', $vanue_list);
	}

	/**
	 * コード値取得（日本語）
	 *
	 * @param string $kbn_1 区分1
	 * @param string $kbn_2 区分2
	 * @param string $kbn_3 区分3
	 * @param string $kbn_4 区分4
	 */
	function _getJmCodeM($kbn_1, $kbn_2, $kbn_3, $kbn_4) {
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');
		$code = $jm_code_m_mgr->getCode($kbn_1, $kbn_2, $kbn_3, $kbn_4);
		return $code['discription_jp'];
	}

	/**
	 * 表示件数設定、取得。
	 *
	 * @return int 表示件数
	 */
	function _setLimit() {
		$search_cond = $this->session->get('search_cond');

		$this->backend->getLogger()->log(LOG_DEBUG, '■formのlimit : '.$this->af->get('limit'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■sessionのlimit : '.$search_cond['limit']);

		if (null != $this->af->get('limit') && '' != $this->af->get('limit') && 0 != $this->af->get('limit')) {
			$search_cond['limit'] =  $this->af->get('limit');
		}
		if (null == $search_cond['limit'] || '' == $search_cond['limit'] || 0 == $search_cond['limit']) {
			$search_cond['limit'] =  20;
		}
		$this->session->set('search_cond', $search_cond);

		$this->backend->getLogger()->log(LOG_DEBUG, '■formのlimit : '.$this->af->get('limit'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■sessionのlimit : '.$search_cond['limit']);

		return $search_cond['limit'];
	}

	/**
	 * ソート設定・取得。
	 *
	 * @return int ソート番号
	 */
	function _setSort() {
		$search_cond = $this->session->get('search_cond');
		// MOD-S 2012.01.20 会期順追加
		if (null != $this->af->get('sort') && '' != $this->af->get('sort')) {
// 		if (null != $this->af->get('sort') && '' != $this->af->get('sort') && 0 != $this->af->get('sort')) {
			$search_cond['sort'] =  $this->af->get('sort');
		}
		if (null == $search_cond['sort'] || '' == $search_cond['sort']) {
// 		if (null == $search_cond['sort'] || '' == $search_cond['sort'] || 0 == $search_cond['sort']) {
			$search_cond['sort'] =  0;
		}
		// MOD-E 2012.01.20 会期順追加
		$this->session->set('search_cond', $search_cond);
		return $search_cond['sort'];
	}

// 	function _setSearchCond() {
// 		$search_cond = $this->session->get('search_cond');
// 		// 業種
// 		if ('1' != $search_cond['industory_selected']) {
// 			// 大分類
// 			$main_industory_cond = array();
// 			if ('' != $search_cond['i_2'] && '' == $search_cond['i_3']) {
// 				array_push($main_industory_cond, $search_cond['i_2']);
// 			}
// 			$check_main_industory_list = $search_cond['check_main_industory'];
// 			if (null != $check_main_industory_list) {
// 				foreach ($check_main_industory_list as $check_main_industory) {
// 					array_push($main_industory_cond, $check_main_industory);
// 				}
// 			}
// 			$this->session->set('main_industory_cond', $main_industory_cond);
// 			// 小分類
// 			$sub_industory_cond = array();
// 			$check_main_sub_industory_list = $search_cond['check_main_sub_industory'];
// 			if (null != $check_main_sub_industory_list) {
// 				foreach ($check_main_sub_industory_list as $check_main_sub_industory) {
// 					array_push($sub_industory_cond, $check_main_sub_industory);
// 				}
// 			}
// 			$check_sub_industory_list = $search_cond['check_sub_industory'];
// 			if (null != $check_sub_industory_list) {
// 				$kbn_2 = $search_cond['i_2'];
// 				foreach ($check_sub_industory_list as $check_sub_industory) {
// 					array_push($sub_industory_cond, $kbn_2.'_'.$check_sub_industory);
// 				}
// 			}
// 			$this->session->set('sub_industory_cond', $sub_industory_cond);
// 		} else {
// 			// 小分類
// 			$check_main_sub_industory_list = $search_cond['check_main_sub_industory'];
// 			if (null != check_main_sub_industory) {
// 				foreach ($check_main_sub_industory_list as $check_main_sub_industory) {
// 					$ary_industory = explode('_', $check_main_sub_industory);
// 					array_push($sub_industory_cond, $ary_industory[0].'_'.$ary_industory[1]);
// 				}
// 			}
// 			$this->session->set('sub_industory_cond', $sub_industory_cond);
// 		}

// 		// 開催地
// 		if ('1' != $search_cond['venue_selected']) {
// 			// 地域
// 			$region_cond = array();
// 			if ('' != $search_cond['v_2'] && "" == $search_cond['v_3']) {
// 				array_push($region_cond, $search_cond['v_2']);
// 			}
// 			$check_region_list = $search_cond['check_region'];
// 			if (null != $check_region_list) {
// 				foreach ($check_region_list as $check_region) {
// 					array_push($region_cond, $check_region);
// 				}
// 			}
// 			$this->session->set('region_cond', $region_cond);
// 			// 国・地域
// 			$country_cond = array();
// 			if ('' != $search_cond['v_2'] && "" != $search_cond['v_3']) {
// 				array_push($country_cond, $search_cond['v_2'].'_'.$search_cond['v_3']);
// 			}
// 			$check_region_country_list = $search_cond['check_region_country'];
// 			if (null != $check_region_country_list) {
// 				foreach ($check_region_country_list as $check_region_country) {
// 					array_push($country_cond, $check_region_country);
// 				}
// 			}
// 			$check_country_list = $search_cond['check_country'];
// 			if (null != $check_country_list) {
// 				$kbn_2 = $search_cond['v_2'];
// 				foreach ($check_country_list as $check_country) {
// 					array_push($country_cond, $kbn_2.'_'.$check_country);
// 				}
// 			}
// 			$this->session->set('country_cond', $country_cond);
// 			// 都市
// 			$city_cond = array();
// 			$check_city_list = $search_cond['check_city'];
// 			if (null != $check_city_list) {
// 				$kbn_2 = $search_cond['v_2'];
// 				$kbn_3 = $search_cond['v_3'];
// 				foreach ($check_city_list as $check_city) {
// 					array_push($city_cond, $kbn_2.'_'.$kbn_3.'_'.$check_city);
// 				}
// 			}
// 			$this->session->set('city_cond', $city_cond);
// 		} else {
// 			// 地域
// 			if ('' != $search_cond['select_region'] && '' == $search_cond['select_country'] && '' == $search_cond['select_city']) {
// 				$region_cond = array($search_cond['select_region']);
// 				$this->session->set('region_cond', $region_cond);
// 			}
// 			// 国・地域
// 			if ('' != $search_cond['select_region'] && '' != $search_cond['select_country'] && '' == $search_cond['select_city']) {
// 				$country_cond = array($search_cond['select_region'].'_'.$search_cond['select_country']);
// 				$this->session->set('country_cond', $country_cond);
// 			}
// 			// 都市
// 			if ('' != $search_cond['select_region'] && '' != $search_cond['select_country'] && '' != $search_cond['select_city']) {
// 				$city_cond = array($search_cond['select_region'].'_'.$search_cond['select_country'].'_'.$search_cond['select_city']);
// 				$this->session->set('city_cond', $city_cond);
// 			}
// 		}

// 	}

	/**
	 * 検索結果が0件の場合の表示項目を設定。
	 *
	 */
	function _dispZero() {
		// ページャー作成
		$this->af->setAppNE('pager', '');
		// 検索実行
		$this->af->setApp('fair_list', '');
		// 表示項目設定
		// META Keyword
		$this->af->setApp('meta_keyword', '');
		$this->af->setApp('title', $this->_getListName());
		// パンくず
		// リスト部タイトル
		$this->af->setApp('list_name', $this->_getListName());
		// 表示件数
		$this->af->setApp('total', '0');
		$this->af->setApp('start', '0');
		$this->af->setApp('end', '0');
	}

	/**
	 * リスト部のタイトルに表示する項目を取得。
	 *
	 * @return string リスト部タイトル
	 */
	function _getListName() {
		$name = '';
		$search_cond = $this->session->get('search_cond');
		if ('i1' == $search_cond['type']) {
			if ('' != $search_cond['i_3']) {
				// 業種小分類表示
				$this->backend->getLogger()->log(LOG_DEBUG, '■業種小分類表示');
				$name = $this->_getJmCodeM('002', $search_cond['i_2'], $search_cond['i_3'], '000');
			} else {
				// 業種大分類表示
				$this->backend->getLogger()->log(LOG_DEBUG, '■業種大分類表示');
				$name = $this->_getJmCodeM('002', $search_cond['i_2'], '000', '000');
			}
		} elseif ('v1' == $search_cond['type']) {
			// 地域表示
			$name = $this->_getJmCodeM('003', $search_cond['v_2'], '000', '000');
		} elseif ('v2' == $search_cond['type']) {
			if ('' != $search_cond['v_4']) {
				// 都市表示
				$name = $this->_getJmCodeM('003', $search_cond['v_2'], $search_cond['v_3'], $search_cond['v_4']);
			} else {
				// 国・地域表示
				$name = $this->_getJmCodeM('003', $search_cond['v_2'], $search_cond['v_3'], '000');
			}
		}
		return $name;
	}

	/**
	 * パンくず設定。
	 *
	 */
	function _getPan() {
		$search_cond = $this->session->get('search_cond');
		if ('i1' == $search_cond['type']) {
			if ('' == $search_cond['i_3']) {
				$this->af->setApp('pan_1', $this->_getJmCodeM('002', $search_cond['i_2'], '000', '000'));
			} else {
				$this->af->setApp('pan_1', $this->_getJmCodeM('002', $search_cond['i_2'], '000', '000'));
				$this->af->setApp('pan_2', $this->_getJmCodeM('002', $search_cond['i_2'], $search_cond['i_3'], '000'));
			}
		} elseif ('v1' == $search_cond['type']) {
			$this->af->setApp('pan_1', $this->_getJmCodeM('003', $search_cond['v_2'], '000', '000'));
		} elseif ('v2' == $search_cond['type']) {
			if ('' == $search_cond['v_4']) {
				$this->af->setApp('pan_1', $this->_getJmCodeM('003', $search_cond['v_2'], '000', '000'));
				$this->af->setApp('pan_2', $this->_getJmCodeM('003', $search_cond['v_2'], $search_cond['v_3'], '000'));
			} else {
				$this->af->setApp('pan_1', $this->_getJmCodeM('003', $search_cond['v_2'], '000', '000'));
				$this->af->setApp('pan_2', $this->_getJmCodeM('003', $search_cond['v_2'], $search_cond['v_3'], '000'));
				$this->af->setApp('pan_3', $this->_getJmCodeM('003', $search_cond['v_2'], $search_cond['v_3'], $search_cond['v_4']));
			}
		}

	}

	/**
	 * 検索条件をFORMに設定。
	 *
	 */
	function _setSessionToForm() {
		if (!$this->session->isStart()) {
			return;
		}
		$search_cond = $this->session->get('search_cond');
		if (null == $search_cond) {
			return;
		}
		$this->af->set('type', $search_cond['type']);
		$this->af->set('i_2', $search_cond['i_2']);
		$this->af->set('i_3', $search_cond['i_3']);
		$this->af->set('v_2', $search_cond['v_2']);
		$this->af->set('v_3', $search_cond['v_3']);
		$this->af->set('v_4', $search_cond['v_4']);
		// i1
		$this->af->set('check_sub_industory', $search_cond['check_sub_industory']);
		$this->af->set('check_region', $search_cond['check_region']);
		$this->af->set('check_region_country', $search_cond['check_region_country']);
		// v1
		$this->af->set('check_country', $search_cond['check_country']);
		// v2
		$this->af->set('check_city', $search_cond['check_city']);
		// v1、v2共通
		$this->af->set('check_main_industory', $search_cond['check_main_industory']);
		// 詳細
		$this->af->set('check_main_sub_industory', $search_cond['check_main_sub_industory']);
		$this->af->set('select_region', $search_cond['select_region']);
		$this->af->set('select_country', $search_cond['select_country']);
		$this->af->set('select_city', $search_cond['select_city']);
		// 共通
		$this->af->set('industory_selected', $search_cond['industory_selected']);
		$this->af->set('venue_selected', $search_cond['venue_selected']);
		$this->af->set('year', $search_cond['year']);
		$this->af->set('date_from_yyyy', $search_cond['date_from_yyyy']);
		$this->af->set('date_from_mm', $search_cond['date_from_mm']);
		$this->af->set('date_to_yyyy', $search_cond['date_to_yyyy']);
		$this->af->set('date_to_mm', $search_cond['date_to_mm']);
		$this->af->set('keyword', $search_cond['keyword']);
		$this->af->set('limit', $search_cond['limit']);
		$this->af->set('sort', $search_cond['sort']);
	}

	/**
	 * ページャー作成。
	 *
	 * @param unknown_type $url URL
	 * @param unknown_type $page ページ番号
	 * @param unknown_type $max_page 最大ページ
	 * @return string HTML形式文字列
	 */
	function _makePager($url,$page, $max_page) {
		$pager = '';
		if (1 < $page) {
			$n = $page - 1;
			$pager .= '<a href="'.$url.$n.'">前へ'.'</a>';
		}
		if (5 >= $max_page) {
			$this->backend->getLogger()->log(LOG_DEBUG, '■TYPE : 1 2 3 4 5');
			// 1 2 3 4 5
			for ($i = 1; $i <= $max_page; $i++) {
				if ($page == $i) {
					$pager .= '<span class="current_page">'.$i.'</span>';
				} else {
					$pager .= '<a href="'.$url.$i.'">'.$i.'</a>';
				}
			}
		} else {
			if ($page <= 3) {
				$this->backend->getLogger()->log(LOG_DEBUG, '■TYPE : 1 2 3 4 ... E');
				// 1 2 3 4 ... E
				for ($i = 1; $i <= 4; $i++) {
					if ($page == $i) {
						$pager .= '<span class="current_page">'.$i.'</span>';
					} else {
						$pager .= '<a href="'.$url.$i.'">'.$i.'</a>';
					}
				}
				$pager .= '...';
				$pager .= '<a href="'.$url.$max_page.'">'.$max_page.'</a>';
			} elseif ($max_page - 2 <= $page) {
				$this->backend->getLogger()->log(LOG_DEBUG, '■TYPE : 1 ... E-3 E-2 E-1 E');
				// 1 ... E-3 E-2 E-1 E
				$pager .= '<a href="'.$url.'1">1</a>';
				$pager .= '...';
				for ($i = $max_page - 3; $i <= $max_page; $i++) {
					if ($page == $i) {
						$pager .= '<span class="current_page">'.$i.'</span>';
					} else {
						$pager .= '<a href="'.$url.$i.'">'.$i.'</a>';
					}
				}
			} elseif (4 <= $page && $page <= $max_page - 3) {
				$this->backend->getLogger()->log(LOG_DEBUG, '■TYPE : 1 ... 3 4 5 ... E');
				// 1 ... 3 4 5 ... E
				$pager .= '<a href="'.$url.'1">1</a>';
				$pager .= '...';

				for ($i = $page - 1; $i <= $page + 1; $i++) {
					if ($page == $i) {
						$pager .= '<span class="current_page">'.$i.'</span>';
					} else {
						$pager .= '<a href="'.$url.$i.'">'.$i.'</a>';
					}
				}

				$pager .= '...';
				$pager .= '<a href="'.$url.$max_page.'">'.$max_page.'</a>';
			}
		}
		if ($page < $max_page) {
			$n = $page + 1;
			$pager .= '<a href="'.$url.$n.'">次へ'.'</a>';
		}

		return $pager;
	}

	/**
	 * フレンドリーURLの表示作成。
	 *
	 * @param array $list 見本市検索結果リスト
	 * @return array 見本市検索結果リスト
	 */
	function _makeDetailUrl($list) {
		for ($i = 0; $i < count($list); $i++) {
			$url = '';
			if ('' != $list[$i]['abbrev_title']) {
				$ary_abbrev_title = explode(' ', ereg_replace("[^a-zA-Z0-9 ]", '', $list[$i]['abbrev_title']));
				$url = $ary_abbrev_title[0];
				if (2 <= count($ary_abbrev_title)) {
					if ('' != $ary_abbrev_title[1]) {
						$url .= $ary_abbrev_title[1];
					}
				}
				$url .= '_'.$list[$i]['mihon_no'];
			} elseif ('' != $list[$i]['fair_title_en']) {
				$ary_fair_title_en = explode(' ', ereg_replace("[^a-zA-Z0-9 ]", '', $list[$i]['fair_title_en']));
				$url = $ary_fair_title_en[0];
				if (2 <= count($ary_fair_title_en)) {
					if ('' != $ary_fair_title_en[1]) {
						$url .= $ary_fair_title_en[1];
					}
				}
				$url .= '_'.$list[$i]['mihon_no'];
			} else {
				$url = $list[$i]['mihon_no'];
			}
			$list[$i]['detail_url'] = $url;
		}
		return $list;
	}


}

?>
