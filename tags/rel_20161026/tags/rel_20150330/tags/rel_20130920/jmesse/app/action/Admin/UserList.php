<?php
/**
 *  Admin/UserList.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

require_once 'UserSearch.php';

/**
 *  admin_userList Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminUserList extends Jmesse_Form_AdminUserSearch
{
}

/**
 *  admin_userList action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminUserList extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_userList Action.
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
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
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
	 *  admin_userList action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		if (null == $this->session->get('search_cond')) {
			// 検索条件をセッションに保存
			$search_cond = array();
			$search_cond['searchEmail'] = $this->af->get('searchEmail');
			$search_cond['searchConditionEmail'] = $this->af->get('searchConditionEmail');
			$search_cond['searchPassword'] = $this->af->get('searchPassword');
			$search_cond['searchConditionPassword'] = $this->af->get('searchConditionPassword');
			$search_cond['searchCompanyNm'] = $this->af->get('searchCompanyNm');
			$search_cond['searchConditionCompanyNm'] = $this->af->get('searchConditionCompanyNm');
			$search_cond['searchDivisionDeptNm'] = $this->af->get('searchDivisionDeptNm');
			$search_cond['searchConditionDivisionDeptNm'] = $this->af->get('searchConditionDivisionDeptNm');
			$search_cond['searchUserNm'] = $this->af->get('searchUserNm');
			$search_cond['searchConditionUserNm'] = $this->af->get('searchConditionUserNm');
			$search_cond['searchPostCode'] = $this->af->get('searchPostCode');
			$search_cond['searchConditionPostCode'] = $this->af->get('searchConditionPostCode');
			$search_cond['searchAddress'] = $this->af->get('searchAddress');
			$search_cond['searchConditionAddress'] = $this->af->get('searchConditionAddress');
			$search_cond['searchTel'] = $this->af->get('searchTel');
			$search_cond['searchConditionTel'] = $this->af->get('searchConditionTel');
			$search_cond['searchFax'] = $this->af->get('searchFax');
			$search_cond['searchConditionFax'] = $this->af->get('searchConditionFax');
			$search_cond['searchUrl'] = $this->af->get('searchUrl');
			$search_cond['searchConditionUrl'] = $this->af->get('searchConditionUrl');
			$search_cond['searchGenderCd0'] = $this->af->get('searchGenderCd0');
			$search_cond['searchGenderCd1'] = $this->af->get('searchGenderCd1');
			$search_cond['searchGenderCd2'] = $this->af->get('searchGenderCd2');
			$search_cond['searchUseLanguageCd0'] = $this->af->get('searchUseLanguageCd0');
			$search_cond['searchUseLanguageCd1'] = $this->af->get('searchUseLanguageCd1');
			$search_cond['searchAuthGen0'] = $this->af->get('searchAuthGen0');
			$search_cond['searchAuthGen1'] = $this->af->get('searchAuthGen1');
			$search_cond['searchAuthUser0'] = $this->af->get('searchAuthUser0');
			$search_cond['searchAuthUser1'] = $this->af->get('searchAuthUser1');
			$search_cond['searchAuthFair0'] = $this->af->get('searchAuthFair0');
			$search_cond['searchAuthFair1'] = $this->af->get('searchAuthFair1');
			$search_cond['searchdelflg0'] = $this->af->get('searchdelflg0');
			$search_cond['searchdelflg1'] = $this->af->get('searchdelflg1');
			$this->session->set('search_cond', $search_cond);
		}
		// マネージャの取得
		$jm_user_mgr =& $this->backend->getManager('JmUser');
		// 総件数の取得
		$jm_user_cnt = $jm_user_mgr->getUserInfoListCount();
		if (0 < $jm_user_cnt) {
			// ページ設定
			$limit = 100;
			$max_page = floor($jm_user_cnt / $limit);
			if (0 < $jm_user_cnt % $limit) {
				$max_page += 1;
			}
			if ('' == $this->af->get('page')) {
				$page = 1;
			} elseif ($max_page < $this->af->get('page')) {
				$page = $max_page;
			} else {
				$page = $this->af->get('page');
			}
			$offset = $limit * ($page - 1);
			//検索結果取得
			$jm_user_list = $jm_user_mgr->getUserInfoList($offset, $limit);
			//検索結果取得情報設定
			$this->af->setApp('user_search_info_list', $jm_user_list);
			// 全件数
			$this->af->setApp('user_search_count', $jm_user_cnt);
			// 表示開始
			$this->af->setApp('begin', $offset + 1);
			// 表示件数
			if ($jm_user_cnt > ($page * $limit)) {
				$this->af->setApp('limit', $limit);
			} else {
				$this->af->setApp('limit', $jm_user_cnt - (($page - 1) * $limit));
			}
			// ページ
			$this->af->setApp('page', $page);
			$this->af->setApp('page_next', $page + 1);
			$this->af->setApp('page_prev', $page - 1);
			// 最初・最後？
			if (1 == $page) {
				$this->af->setApp('first_page', '1');
			}
			if ($max_page == $page) {
				$this->af->setApp('last_page', '1');
			}
		} else {
			// 見本市リスト
			$this->af->setApp('user_search_info_list', null);
			// 全件数
			$this->af->setApp('user_search_count', $jm_user_cnt);
			// 表示開始
			$this->af->setApp('begin', 0);
			// 表示件数
			$this->af->setApp('limit', 0);
			// ページ
			$this->af->setApp('page', 1);
			$this->af->setApp('page_next', $page + 1);
			$this->af->setApp('page_prev', $page - 1);
			// 最初・最後？
			$this->af->setApp('first_page', '1');
			$this->af->setApp('last_page', '1');
		}

		// 最終エラー確認
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'admin_error';
		}
		return 'admin_userList';
    }
}

?>
