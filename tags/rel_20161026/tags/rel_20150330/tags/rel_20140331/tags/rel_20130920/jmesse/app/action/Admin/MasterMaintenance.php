<?php
/**
 *  Admin/MasterMaintenance.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  admin_masterMaintenance Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_AdminMasterMaintenance extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		'mode' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'モード',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'del' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => '削除フラグ',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'kbn_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '区分１',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'kbn_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '区分２',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'kbn_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '区分３',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'kbn_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '区分４',        // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'discription_jp' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '内容(日本語)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'discription_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '内容(英語)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'disp_cd' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '表示コード',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'disp_num' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '表示順',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => 0,               // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'reserve_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '予備1',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'reserve_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '予備2',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'reserve_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '予備3',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'reserve_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '予備4',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'reserve_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '予備5',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
		'reserve_6' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => '予備6',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
		),
	);
}

/**
 *  admin_masterMaintenance action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_AdminMasterMaintenance extends Jmesse_ActionClass
{
	/**
	 *  preprocess of admin_masterMaintenance Action.
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

		// モード
		$mode = $this->af->get('mode');

		if ('' != $mode) {
			// バリデーション
			if ($this->af->validate() > 0) {
				return 'admin_error';
			}
		}

		return null;
	}

	/**
	 *  admin_masterMaintenance action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{

		// '0':検索
		// '1':更新
		// '2':登録
		// '3':一覧
		$mode = $this->af->get('mode');

		$kbn_1 = $this->af->get('kbn_1');
		$kbn_2 = $this->af->get('kbn_2');
		$kbn_3 = $this->af->get('kbn_3');
		$kbn_4 = $this->af->get('kbn_4');

		$ary_col = array('kbn_1', 'kbn_2', 'kbn_3', 'kbn_4');
		$ary_key = array($kbn_1, $kbn_2, $kbn_3, $kbn_4);

		if ('0' == $mode) {
			// 検索モード
			$jm_code_m =& $this->backend->getObject('JmCodeM', $ary_col, $ary_key);
			if (Ethna::isError($jm_code_m)) {
				$this->ae->set('error', 'DB ERROR');
				return 'admin_error';
			}
			if ($kbn_1 == $jm_code_m->get('kbn_1') && $kbn_2 == $jm_code_m->get('kbn_2') && $kbn_3 == $jm_code_m->get('kbn_3') && $kbn_4 == $jm_code_m->get('kbn_4')) {
				// 更新モード
				$this->af->setApp('mode', '1');
				$this->af->set('discription_jp', $jm_code_m->get('discription_jp'));
				$this->af->set('discription_en', $jm_code_m->get('discription_en'));
				$this->af->set('disp_cd', $jm_code_m->get('disp_cd'));
				$this->af->set('disp_num', $jm_code_m->get('disp_num'));
				$this->af->set('reserve_1', $jm_code_m->get('reserve_1'));
				$this->af->set('reserve_2', $jm_code_m->get('reserve_2'));
				$this->af->set('reserve_3', $jm_code_m->get('reserve_3'));
				$this->af->set('reserve_4', $jm_code_m->get('reserve_4'));
				$this->af->set('reserve_5', $jm_code_m->get('reserve_5'));
				$this->af->set('reserve_6', $jm_code_m->get('reserve_6'));
			} else {
				// 新規登録モード
				$this->af->setApp('mode', '2');
			}
		} elseif ('3' == $mode) {
			// 一覧取得
			$jm_code_m =& $this->backend->getObject('JmCodeM');
			$res = $jm_code_m->searchProp(array('kbn_1', 'kbn_2', 'kbn_3', 'kbn_4', 'discription_jp', 'discription_en'), array(), array('kbn_1'=>'asc', 'kbn_2'=>'asc', 'kbn_3'=>'asc', 'kbn_4'=>'asc'));
			$this->af->setApp('total', $res[0]);
			$this->af->setApp('list', $res[1]);
			$this->af->setApp('mode', '3');
		} else {
			// 入力値
			$discription_jp = $this->af->get('discription_jp');
			$discription_en = $this->af->get('discription_en');
			$disp_cd = $this->af->get('disp_cd');
			$disp_num = $this->af->get('disp_num');
			$reserve_1 = $this->af->get('reserve_1');
			$reserve_2 = $this->af->get('reserve_2');
			$reserve_3 = $this->af->get('reserve_3');
			$reserve_4 = $this->af->get('reserve_4');
			$reserve_5 = $this->af->get('reserve_5');
			$reserve_6 = $this->af->get('reserve_6');

			// 更新・登録モード
			if ('1' == $mode) {
				// 削除フラグ
				$del = $this->af->get('del');

				// 更新モード
				$jm_code_m =& $this->backend->getObject('JmCodeM', $ary_col, $ary_key);
				if ('1' == $del) {
					// 削除
					$jm_code_m->remove();
				} else {
					// アップデート
					$jm_code_m->set('discription_jp', $this->_changeNull($discription_jp));
					$jm_code_m->set('discription_en', $this->_changeNull($discription_en));
					$jm_code_m->set('disp_cd', $this->_changeNull($disp_cd));
					$jm_code_m->set('disp_num', $this->_changeNull($disp_num));
					$jm_code_m->set('reserve_1', $this->_changeNull($reserve_1));
					$jm_code_m->set('reserve_2', $this->_changeNull($reserve_2));
					$jm_code_m->set('reserve_3', $this->_changeNull($reserve_3));
					$jm_code_m->set('reserve_4', $this->_changeNull($reserve_4));
					$jm_code_m->set('reserve_5', $this->_changeNull($reserve_5));
					$jm_code_m->set('reserve_6', $this->_changeNull($reserve_6));
					$jm_code_m->update();
					$this->af->setApp('mode', '1');
				}
			} elseif ('2' == $mode) {
				// 登録モード
				$jm_code_m =& $this->backend->getObject('JmCodeM');
				$jm_code_m->set('kbn_1', $kbn_1);
				$jm_code_m->set('kbn_2', $kbn_2);
				$jm_code_m->set('kbn_3', $kbn_3);
				$jm_code_m->set('kbn_4', $kbn_4);
				$jm_code_m->set('discription_jp', $this->_changeNull($discription_jp));
				$jm_code_m->set('discription_en', $this->_changeNull($discription_en));
				$jm_code_m->set('disp_cd', $this->_changeNull($disp_cd));
				$jm_code_m->set('disp_num', $this->_changeNull($disp_num));
				$jm_code_m->set('reserve_1', $this->_changeNull($reserve_1));
				$jm_code_m->set('reserve_2', $this->_changeNull($reserve_2));
				$jm_code_m->set('reserve_3', $this->_changeNull($reserve_3));
				$jm_code_m->set('reserve_4', $this->_changeNull($reserve_4));
				$jm_code_m->set('reserve_5', $this->_changeNull($reserve_5));
				$jm_code_m->set('reserve_6', $this->_changeNull($reserve_6));
				$jm_code_m->add();

				$this->af->setApp('mode', '1');
			}
		}

		return 'admin_masterMaintenance';
	}

	/**
	 * 空文字をnullに変換する。
	 *
	 * @param unknown_type $str
	 */
	function _changeNull($str) {
		if ('' == $str) {
			return null;
		}
		return $str;
	}
}

?>
