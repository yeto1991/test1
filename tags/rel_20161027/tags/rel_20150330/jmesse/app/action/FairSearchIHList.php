<?php
/**
 *  FairSearchIHList.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  fairSearchIHList Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_FairSearchIHList extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'all' => array(
			'type'        => VAR_TYPE_INT, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '全表示',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'type' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'メニュータイプ', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9a-z]+$/', // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'page' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'ページ番号',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'limit' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '表示件数',      // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'sort' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'ソート順',      // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'print' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'プリント用表示', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'ind' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '産業区分', // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'ha' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '開催地-地域', // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'hc' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '開催地-国', // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'op' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '開催地オプション', // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,               // Maximum value
			'regexp'      => null,    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

	);
}

/**
 *  fairSearchIHList action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_FairSearchIHList extends Jmesse_ActionClass
{
	/**
	 *  preprocess of fairSearchIHList Action.
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

		return null;

	}

	/**
	 *  fairSearchIHList action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$tpl = null;

		// 全検索か否か
		if (1 == $this->af->get('all')) {
			// 全検索
			$tpl = $this->_selectAllForIH();
		} else {
			if (null == $this->af->get('page') || '' == $this->af->get('page') || 0 == $this->af->get('page')) {
				//産業区分検索の場合
				$tpl = $this->_breakdownForIH();
			} else {
				// ページング
				$tpl = $this->_pagingForIH();
			}
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		return $tpl;
	}

	/**
	 * 開催地×産業区分組合せ検索
	 *
	 * @return string 出力テンプレート
	 */
	function _breakdownForIH() {
		// ページング用に検索条件をSESSIONに保存する。
		$this->_setFormToSessionForIH();

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
		$total = $jm_fair_mgr->getFairListCntForIH($lang);
		if (0 < $total) {
			$max_page = floor($total / $limit);
			if (0 < $total % $limit) {
				$max_page += 1;
			}
			if ($max_page < $page) {
				$page = $max_page;
			}
			$offset = $limit * ($page - 1);

			// 出力項目
			// ページャー作成
			// 保存したセッション情報（検索条件）を使用してページング情報に追加する。（tmpl表示側で条件分岐で使用しているため。）
			$search_cond = $this->session->get('search_cond');
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairSearchIHList=true&type='.$search_cond['type'].'&ind='.$search_cond['ind'].'&ha='.$search_cond['ha'].'&hc='.$search_cond['hc'].'&op='.$search_cond['op'].'&page=', $page, $max_page));
			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairListForIH($offset, $limit, $sort, $lang)));
			// META Keyword
			$titlename = $this->_getListName();
			$this->af->setApp('meta_keyword', $titlename);
			$this->af->setApp('title', $titlename);
			// リスト部タイトル
			$this->af->setApp('list_name', $titlename);
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
		$this->_setSessionToFormForIH();

		return 'fairSearchIHList';
	}


	/**
	 * ページ送り。
	 *
	 * @return string 出力テンプレート
	 */
	function _pagingForIH() {

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
		$total = $jm_fair_mgr->getFairListCntForIH($lang);
		if (0 < $total) {
			$max_page = floor($total / $limit);
			if (0 < $total % $limit) {
				$max_page += 1;
			}
			if ($max_page < $page) {
				$page = $max_page;
			}
			$offset = $limit * ($page - 1);

			// 出力項目
			// ページャー作成
			// 保存したセッション情報（検索条件）を使用してページング情報に追加する。（tmpl表示側で条件分岐で使用しているため。）
			$search_cond = $this->session->get('search_cond');
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairSearchIHList=true&type='.$search_cond['type'].'&ind='.$search_cond['ind'].'&ha='.$search_cond['ha'].'&hc='.$search_cond['hc'].'&op='.$search_cond['op'].'&page=', $page, $max_page));

			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairListForIH($offset, $limit, $sort, $lang)));
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
		$this->_setSessionToFormForIH();

		return 'fairSearchIHList';
	}

	/**
	 * すべての見本市表示。(過去を含む)
	 *
	 * @return string 出力テンプレート
	 */
	function _selectAllForIH() {

		// ページ
		if (null == $this->af->get('page') || '' == $this->af->get('page') || 0 == $this->af->get('page')) {
			$page = 1;
		} else {
			$page = $this->af->get('page');
		}

		// 表示件数
		$limit = $this->_setLimit();

		// ソート順
		$sort = $this->_setSort();

		// マネージャの取得
		$jm_fair_mgr =& $this->backend->getManager('JmFair');

		// ページ計算
		$lang = 'J';
		$total = $jm_fair_mgr->getFairListAllCntForIH($lang);
		if (0 < $total) {
			$max_page = floor($total / $limit);
			if (0 < $total % $limit) {
				$max_page += 1;
			}
			if ($max_page < $page) {
				$page = $max_page;
			}
			$offset = $limit * ($page - 1);

			// 出力項目
			// ページャー作成
			// 保存したセッション情報（検索条件）を使用してページング情報に追加する。（tmpl表示側で条件分岐で使用しているため。）
			$search_cond = $this->session->get('search_cond');
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairSearchIHList=true&type='.$search_cond['type'].'&ind='.$search_cond['ind'].'&ha='.$search_cond['ha'].'&hc='.$search_cond['hc'].'&op='.$search_cond['op'].'&all=1&page=', $page, $max_page));

			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairListAllForIH($offset, $limit, $sort, $lang)));
			// META Keyword
			$this->af->setApp('meta_keyword', '');
			$this->af->setApp('title', '');
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

		// sessionの内容をformに設定
		$this->_setSessionToFormForIH();

		return 'fairSearchIHList';
	}

	/**
	 * 検索条件をSESSIONに保存。
	 *
	 */
	function _setFormToSessionForIH() {
		// ページング用に検索条件をSESSIONに保存する。
		$search_cond = array();
		$search_cond['type'] = $this->af->get('type');
		$search_cond['ind'] = $this->af->get('ind'); //産業区分
		$search_cond['ha'] = $this->af->get('ha'); //開催地エリア
		$search_cond['hc'] = $this->af->get('hc'); //開催地国
		$search_cond['op'] = $this->af->get('op'); //オプション情報
		if (!$this->session->isStart()) {
			$this->session->start();
		}
		$this->session->set('search_cond', $search_cond);
	}

	/**
	 * 検索条件をFORMに設定。
	 *
	 */
	function _setSessionToFormForIH() {
		if (!$this->session->isStart()) {
			return;
		}
		$search_cond = $this->session->get('search_cond');
		if (null == $search_cond) {
			return;
		}
		$this->af->set('type', $search_cond['type']);
		$this->af->set('ind', $search_cond['ind']);
		$this->af->set('ha', $search_cond['ha']);
		$this->af->set('hc', $search_cond['hc']);
		$this->af->set('op', $search_cond['op']);
		//$this->af->set('page', $search_cond['page']);
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
	 * 表示件数設定、取得。
	 *
	 * @return int 表示件数
	 */
	function _setLimit() {

		$search_cond = $this->session->get('search_cond');

		if (null != $this->af->get('limit') && '' != $this->af->get('limit') && 0 != $this->af->get('limit')) {
			$search_cond['limit'] =  $this->af->get('limit');
		}
		if (null == $search_cond['limit'] || '' == $search_cond['limit'] || 0 == $search_cond['limit']) {
			$search_cond['limit'] =  20;
		}

		$this->session->set('search_cond', $search_cond);
		return $search_cond['limit'];
	}

	/**
	 * ソート設定・取得。
	 *
	 * @return int ソート番号
	 */
	function _setSort() {

		$search_cond = $this->session->get('search_cond');

		if (null != $this->af->get('sort') && '' != $this->af->get('sort')) {
			$search_cond['sort'] =  $this->af->get('sort');
		}
		if (null == $search_cond['sort'] || '' == $search_cond['sort']) {
			$search_cond['sort'] =  0;
		}

		$this->session->set('search_cond', $search_cond);
		return $search_cond['sort'];
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
	 * リスト部のタイトルに表示する項目を取得。
	 *
	 * @return string リスト部タイトル
	 */
	function _getListName() {
		$name = '';
		$search_cond = $this->session->get('search_cond');

		//産業区分名（JP）
		$indName = '';
		if ('' != $search_cond['ind']) {
			if ('001' == $search_cond['ind']) {
				$indName = $this->config->get('industry_001_name_jp');
			} elseif ('002' == $search_cond['ind']) {
				$indName = $this->config->get('industry_002_name_jp');
			} elseif ('003' == $search_cond['ind']) {
				$indName = $this->config->get('industry_003_name_jp');
			} elseif ('004' == $search_cond['ind']) {
				$indName = $this->config->get('industry_004_name_jp');
			} elseif ('005' == $search_cond['ind']) {
				$indName = $this->config->get('industry_005_name_jp');
			} elseif ('006' == $search_cond['ind']) {
				$indName = $this->config->get('industry_006_name_jp');
			} elseif ('007' == $search_cond['ind']) {
				$indName = $this->config->get('industry_007_name_jp');
			} elseif ('008' == $search_cond['ind']) {
				$indName = $this->config->get('industry_008_name_jp');
			} elseif ('009' == $search_cond['ind']) {
				$indName = $this->config->get('industry_009_name_jp');
			}
		}

		//開催地情報（JP）
		$hostName = null;
		if ('' != $search_cond['ha']) {
			//オプション別条件分岐
			if ('' != $search_cond['op']) {
				if ('E' == $search_cond['op']) {
					$hostName = 'EU'; //EU
				}elseif ('A' == $search_cond['op']) {
					$hostName = 'ASEAN'; //ASEAN
				}elseif ('NHK' == $search_cond['op']) {
					$hostName = '中国'; //中国（香港以外）
				}elseif ('HK' == $search_cond['op']) {
					$hostName = '香港'; //香港
				}
			}else{
				if ('' != $search_cond['hc']) {
					//国指定
					$hostName = $this->_getJmCodeM('003', $search_cond['ha'], $search_cond['hc'], '000');
				}else{
					//地域指定
					$hostName = $this->_getJmCodeM('003', $search_cond['ha'], '000', '000');
				}
			}
		}

		$name = $hostName.'における'.$indName.'関連の見本市・展示会';
		return $name;
	}

	/**
	 * 検索結果が0件の場合の表示項目を設定。
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
	 * パン屑値設定
	 *
	 */
	function _getPan() {
		$search_cond = $this->session->get('search_cond');
		$this->af->setApp('pan_1', $this->_getListName());
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
