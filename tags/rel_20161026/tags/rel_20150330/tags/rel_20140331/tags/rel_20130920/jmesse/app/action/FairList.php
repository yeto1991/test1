<?php
/**
 *  FairList.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  fairList Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_FairList extends Jmesse_ActionForm
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
		'detail' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'メニュータイプ(詳細)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'i_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '区分2(業種)',   // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'i_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '区分3(業種)',   // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'v_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '区分2(開催地)', // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'v_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '区分3(開催地)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'v_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '区分4',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'check_main_industory' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '選択（業種(大分類)）', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'check_sub_industory' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '選択（業種(小分類)）', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'check_region' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '選択（地域）',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'check_country' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '選択（国・地域）', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'check_city' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '選択（都市）', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'check_region_country' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '選択（地域・国）', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 7,               // Maximum value
			'regexp'      => '/^[0-9_]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'year' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_RADIO,  // Form type
			'name'        => '開催時期',      // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[a-z]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'keyword' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'キーワード',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
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

		'select_region' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '開催地(地域)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'select_country' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '開催地(国・地域)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'select_city' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '開催地(都市)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'date_from_yyyy' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '会期(開始・年)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => 4,               // Minimum value
			'max'         => 4,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_from_mm' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '会期(開始・月)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => 2,               // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_to_yyyy' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => '会期(終了・年)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => 4,               // Minimum value
			'max'         => 4,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'date_to_mm' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT , // Form type
			'name'        => '会期(終了・月)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => 2,               // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'check_main_sub_industory' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '選択(業種)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

		'industory_selected' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '業種選択済',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'venue_selected' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => '開催地選択済',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),

	);
}

/**
 *  fairList action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_FairList extends Jmesse_ActionClass
{
	/**
	 *  preprocess of fairList Action.
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

		$this->backend->getLogger()->log(LOG_DEBUG, '■type   : '.$this->af->get('type'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■i_2    : '.$this->af->get('i_2'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■i_3    : '.$this->af->get('i_3'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■v_2    : '.$this->af->get('v_2'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■v_3    : '.$this->af->get('v_3'));
		$this->backend->getLogger()->log(LOG_DEBUG, '■v_4    : '.$this->af->get('v_4'));

		return null;
	}

	/**
	 *  fairList action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		$tpl = null;

		// 全検索か否か
		if (1 == $this->af->get('all')) {
			$this->backend->getLogger()->log(LOG_DEBUG, '■全検索');
			// 全検索
			$tpl = $this->_selectAll();
		} else {
			$this->backend->getLogger()->log(LOG_DEBUG, '■条件検索');
			// 条件検索
			$tpl = $this->_selectCond();
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'error';
		}

		return $tpl;
	}

	/**
	 * すべての見本市表示。
	 *
	 * @return string 出力テンプレート
	 */
	function _selectAll() {
		// 絞り込みメニュー設定
		$this->_setMenuSelecte();

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
		$total = $jm_fair_mgr->getFairListAllCnt($lang);
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
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairList=true&all=1&page=', $page, $max_page));
			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairListAll($offset, $limit, $sort, $lang)));
			// META Keyword
			$this->af->setApp('meta_keyword', '');
			$this->af->setApp('title', '');
			// リスト部タイトル
			$this->af->setApp('list_name', $this->_getListName());
//			$this->af->setApp('list_name', 'すべての見本市');
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
		$this->_setSessionToForm();

		return 'fairList';
	}

	/**
	 * 検索条件付き見本市表示。
	 *
	 * @return string 出力テンプレート
	 */
	function _selectCond() {
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
		$total = $jm_fair_mgr->getFairListCnt($lang);
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
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairList=true&page=', $page, $max_page));
			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairList($offset, $limit, $sort, $lang)));
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
		$total = $jm_fair_mgr->getFairListCnt($lang);
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
			$this->af->setAppNE('pager', $this->_makePager($this->config->get('url_pub').'?action_fairList=true&page=', $page, $max_page));
			// 検索実行
			$this->af->setApp('fair_list', $this->_makeDetailUrl($jm_fair_mgr->getFairList($offset, $limit, $sort, $lang)));
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
// 		$search_cond['check_main_industory'] = $this->af->get('check_main_industory');
// 		$search_cond['check_sub_industory'] = $this->af->get('check_sub_industory');
// 		$search_cond['check_region'] = $this->af->get('check_region');
// 		$search_cond['check_country'] = $this->af->get('check_country');
// 		$search_cond['check_city'] = $this->af->get('check_city');
// 		$search_cond['check_region_country'] = $this->af->get('check_region_country');
// 		$search_cond['year'] = $this->af->get('year');
// 		$search_cond['keyword'] = $this->af->get('keyword');
		if (!$this->session->isStart()) {
			$this->session->start();
		}
		$this->session->set('search_cond', $search_cond);
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
// 		$this->af->set('check_main_industory', $search_cond['check_main_industory']);
// 		$this->af->set('check_sub_industory', $search_cond['check_sub_industory']);
// 		$this->af->set('check_region', $search_cond['check_region']);
// 		$this->af->set('check_country', $search_cond['check_country']);
// 		$this->af->set('check_city', $search_cond['check_city']);
// 		$this->af->set('check_region_country', $search_cond['check_region_country']);
// 		$this->af->set('year', $search_cond['year']);
// 		$this->af->set('keyword', $search_cond['keyword']);
		$this->af->set('limit', $search_cond['limit']);
		$this->af->set('sort', $search_cond['sort']);
	}

	/**
	 * メニュー部の表示項目設定。
	 *
	 */
	function _setMenuSelecte() {
		// type : i1:業種（大分類、小分類）表示、v1:開催地（地域）表示、v2:開催地（国・地域、都市）表示
		$search_cond = $this->session->get('search_cond');
		if ('i1' == $search_cond['type']) {
			// 業種選択
			if ('' == $search_cond['i_2']) {
				$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
				$this->ae->add('error', '業種が選択されていません。');
				return 'error';
			}
			// 業種（小分類）集計値
			$this->af->setApp('sub_industory_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListSubIndustory($search_cond['i_2'], '0'));

			// 開催地（地域）集計値
			$main_industory = $search_cond['i_2'];
			$sub_industory = '' == $search_cond['i_3'] ? '000' : $search_cond['i_3'];
			$this->af->setApp('region_cnt', $this->backend->getManager('JmFairDetailCnt')->getFairCntListRegionIndustory('0', $main_industory, $sub_industory));
// 			$this->af->setApp('region_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListRegionIndustory('0'));
			// 開催地（国・地域）集計値
			$this->af->setApp('country_disp_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListCountryDisp('0'));
			$this->af->setApp('country_close_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListCountryClose('0'));

		} elseif ('v1' == $search_cond['type']) {
			// 地域選択
			if ('' == $search_cond['v_2']) {
				$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
				$this->ae->add('error', '地域が選択されていません。');
				return 'error';
			}
			// 開催地（国・地域）集計値
			$this->af->setApp('country_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListCountry($search_cond['v_2'], '0'));

			// 業種（大分類）集計値
			$region = $search_cond['v_2'];
			$this->af->setApp('main_industory_cnt', $this->backend->getManager('JmFairDetailCnt')->getFairCntListMainIndustory('0', $region, '000', '000'));
// 			$this->af->setApp('main_industory_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListMainIndustory('0'));
		} elseif ('v2' == $search_cond['type']) {
			// 地域選択
			if ('' == $search_cond['v_2']) {
				$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
				$this->ae->add('error', '地域が選択されていません。');
				return 'error';
			}
			// 地域選択
			if ('' == $search_cond['v_3']) {
				$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
				$this->ae->add('error', '国・地域が選択されていません。');
				return 'error';
			}
			// 開催地（都市）集計値
			$this->af->setApp('city_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListCity($search_cond['v_2'], $search_cond['v_3'], '0'));

			// 業種（大分類）集計値
			$region = $search_cond['v_2'];
			$country = $search_cond['v_3'];
			$city = '' == $search_cond['v_4'] ? '000' : $search_cond['v_4'];
			$this->af->setApp('main_industory_cnt', $this->backend->getManager('JmFairDetailCnt')->getFairCntListMainIndustory('0', $region, $country, $city));
// 			$this->af->setApp('main_industory_cnt', $this->backend->getManager('JmFairCnt')->getFairCntListMainIndustory('0'));
		}

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
