<?php
/**
 *  User/EnFairRegistStep1.php
 *
 *  @author     {$author}
 *  @package    Jmesse
 *  @version    $Id: 6dbb28cac61a23f06dba884c38c304aed3dcc84b $
 */

/**
 *  user_enFairRegistStep1 Form implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Form_UserEnFairRegistStep1 extends Jmesse_ActionForm
{
	/**
	 *  @access private
	 *  @var    array   form definition.
	 */
	var $form = array(
		// '':regist(登録)、'c':change(修正)、'd':detail(修正前詳細表示)、'e':edit(修正登録)、'p':detail before copy(修正登録前詳細表示)
		'mode' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'mode',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[cdep]+$/',     // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		// '1':戻るボタンから
		'back' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'back',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[01]+$/',            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		// 改行コード
		'br' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXTAREA, // Form type
			'name'        => 'textarea br', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		// プリント画面
		'print' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'print',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1,               // Maximum value
			'regexp'      => '/^[01]+$/',            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),

		// 見本市番号
		'mihon_no' => array(
			'type'        => VAR_TYPE_INT,    // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'mihon no',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		// Step.1
		// 基本情報
		'fair_title_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Fair Title',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'abbrev_title' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Abbreviated title',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'fair_url' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'URL', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'date_from_yyyy' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'Date(from year)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 4,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'date_from_mm' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'Date(from month)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'date_from_dd' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'Date(from day)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'date_to_yyyy' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'Date(to year)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 4,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'date_to_mm' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'Date(to month)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'date_to_dd' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'Date(from day)',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 2,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'frequency' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_RADIO, // Form type
			'name'        => 'Frequency',      // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		// 業種・取扱品目
		'main_industory_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory 1',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory 1', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_name_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory name 1', // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_name_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory name 1', // Display name
			'required'    => false,            // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory 2', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory 2', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_name_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory name 2', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_name_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory name 2', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory 3', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory 3', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_name_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory name 3', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_name_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory name 3', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory 4', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory 4', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_name_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory name 4', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_name_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory name 4', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory 5', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory 5', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_name_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory name 5', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_name_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory name 5', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_6' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory 6', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_6' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory 6',          // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'main_industory_name_6' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Main industory name 6',          // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'sub_industory_name_6' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'Sub industory name 6',          // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'check_sub_industory' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => 'check sub industory',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'exhibits_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXTAREA, // Form type
// 			'name'        => '取扱品目',      // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 300,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'exhibits_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXTAREA, // Form type
			'name'        => 'Exhibits',      // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 300,             // Maximum value
			'regexp'      => '/^[ -~\r\n]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		// 開催地・会場
		'region' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'region',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'country' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'country', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'city' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'city',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 3,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'other_city_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => 'other city', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 100,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'other_city_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'City (other)',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'check_other_city' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX,  // Form type
			'name'        => 'check other city', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'venue_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => '会場名',        // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 255,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'venue_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Venue',         // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'gross_floor_area' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Net square meters ',  // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'transportation_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => '会場までの交通手段', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 500,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
// 		'transportation_en' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => 'Transportation', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 500,             // Maximum value
// 			'regexp'      => '/^[ -~]+$/',    // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'open_to' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_RADIO, // Form type
			'name'        => 'Open to',      // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'admission_ticket_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX, // Form type
			'name'        => 'Free', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'admission_ticket_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX,  // Form type
			'name'        => 'Apply/register online', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'admission_ticket_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX,  // Form type
			'name'        => 'Contact organizer/agency in Japan', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'admission_ticket_4' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX,  // Form type
			'name'        => 'Available at event', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'admission_ticket_5' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_CHECKBOX,  // Form type
			'name'        => 'Admission/ticket Other',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'other_admission_ticket_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => 'Other admission ticket', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 500,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'other_admission_ticket_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Admission ticket(other)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 500,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'app_dead_yyyy' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => '出展申込締切日(年)', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 4,               // Maximum value
// 			'regexp'      => '/^[0-9]+$/',    // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
// 		'app_dead_mm' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => '出展申込締切日(月)', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 2,               // Maximum value
// 			'regexp'      => '/^[0-9]+$/',    // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
// 		'app_dead_dd' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => '出展申込締切日(日)', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 2,               // Maximum value
// 			'regexp'      => '/^[0-9]+$/',    // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),

		// Step.2
		// 過去の実績
		'year_of_the_trade_fair' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_SELECT, // Form type
			'name'        => 'last fair year',        // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 4,               // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'total_number_of_visitor' => array(
			'type'        => VAR_TYPE_STRING,    // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Total number of visitors',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'number_of_foreign_visitor' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Total number of visitors(including foreign visitors)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'total_number_of_exhibitors' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Total number of exhibitors  ',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'number_of_foreign_exhibitors' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Total number of exhibitors(including foreign exhibitors)', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 10,              // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'net_square_meters' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'last fair net square meters',      // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 50,              // Maximum value
			'regexp'      => '/^[0-9]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'spare_field1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Data verified', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),

		// PR・キャッチフレーズ
// 		'profile_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXTAREA, // Form type
// 			'name'        => 'キャッチフレーズ', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 500,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'profile_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXTAREA, // Form type
			'name'        => 'Teaser Copy',   // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 500,             // Maximum value
			'regexp'      => '/^[ -~\r\n]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'detailed_information_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXTAREA,  // Form type
// 			'name'        => 'PR',    // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 1000,            // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'detailed_information_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXTAREA,  // Form type
			'name'        => "Organizer's statement,special features. etc.", // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 1000,            // Maximum value
			'regexp'      => '/^[ -~\r\n]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),

		'photos_1' => array(
			'type'        => VAR_TYPE_FILE,   // Input type
			'form_type'   => FORM_TYPE_FILE,  // Form type
			'name'        => 'photo1', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'photos_2' => array(
			'type'        => VAR_TYPE_FILE,   // Input type
			'form_type'   => FORM_TYPE_FILE,  // Form type
			'name'        => 'photo2', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'photos_3' => array(
			'type'        => VAR_TYPE_FILE,   // Input type
			'form_type'   => FORM_TYPE_FILE,  // Form type
			'name'        => 'photo3', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'photos_name_1' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'photo1 name', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'photos_name_2' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN, // Form type
			'name'        => 'photo2 name', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'photos_name_3' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_HIDDEN,  // Form type
			'name'        => 'photo3 name', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'del_photos_name' => array(
			'type'        => array(VAR_TYPE_STRING), // Input type
			'form_type'   => FORM_TYPE_HIDDEN,  // Form type
			'name'        => 'photo name delete ', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => null,            // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'keyword' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Search keyword', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),

		// 主催者
// 		'organizer_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => '主催者(日)',        // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 500,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'organizer_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Show Management name',    // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 500,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'organizer_addr' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Show Management address', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'organizer_div' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Show Management department', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'organizer_pers' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Show Management person', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'organizer_tel' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Show Management TEL', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => '/^[0-9\+\-]+$/', // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'organizer_fax' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Show Management FAX', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => '/^[0-9\+\-]+$/', // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'organizer_email' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Show Management Email', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[!-~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'agency_in_japan_jp' => array(
// 			'type'        => VAR_TYPE_STRING, // Input type
// 			'form_type'   => FORM_TYPE_TEXT,  // Form type
// 			'name'        => '日本国内の照会先(名称(日))', // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => 255,             // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
		'agency_in_japan_en' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Agency in Japan name', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[ -~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'agency_in_japan_addr' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Agency in Japan address', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'agency_in_japan_div' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Agency in Japan department', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'agency_in_japan_pers' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Agency in Japan person', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => null,            // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'agency_in_japan_tel' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Agency in Japan TEL', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => '/^[0-9\+\-]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'agency_in_japan_fax' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Agency in Japan FAX', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 100,             // Maximum value
			'regexp'      => '/^[0-9\+\-]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
		'agency_in_japan_email' => array(
			'type'        => VAR_TYPE_STRING, // Input type
			'form_type'   => FORM_TYPE_TEXT,  // Form type
			'name'        => 'Agency in Japan Email', // Display name
			'required'    => false,           // Required Option(true/false)
			'min'         => null,            // Minimum value
			'max'         => 255,             // Maximum value
			'regexp'      => '/^[!-~]+$/',    // String by Regexp
			'mbregexp'    => null,            // Multibype string by Regexp
			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
			'filter'      => null,            // Optional Input filter to convert input
			'custom'      => null,            // Optional method name which
			'required_error' => '{form} is incorrect.',
			'type_error'     => '{form} is incorrect.',
			'min_error'      => '{form} is incorrect.',
			'max_error'      => '{form} is incorrect.',
			'regexp_error'   => '{form} is incorrect.',
		),
// 		'select_language_info' => array(
// 			'type'        => VAR_TYPE_INT,    // Input type
// 			'form_type'   => FORM_TYPE_RADIO, // Form type
// 			'name'        => '海外への紹介を希望しますか',  // Display name
// 			'required'    => false,           // Required Option(true/false)
// 			'min'         => null,            // Minimum value
// 			'max'         => null,            // Maximum value
// 			'regexp'      => null,            // String by Regexp
// 			'mbregexp'    => null,            // Multibype string by Regexp
// 			'mbregexp_encoding' => 'UTF-8',   // Matching encoding when using mbregexp
// 			'filter'      => null,            // Optional Input filter to convert input
// 			'custom'      => null,            // Optional method name which
// 			'required_error' => '{form} is incorrect.',
// 			'type_error'     => '{form} is incorrect.',
// 			'min_error'      => '{form} is incorrect.',
// 			'max_error'      => '{form} is incorrect.',
// 			'regexp_error'   => '{form} is incorrect.',
// 		),
	);
}

/**
 *  user_enFairRegistStep1 action implementation.
 *
 *  @author     {$author}
 *  @access     public
 *  @package    Jmesse
 */
class Jmesse_Action_UserEnFairRegistStep1 extends Jmesse_ActionClass
{
	/**
	 *  preprocess of user_enFairRegistStep1 Action.
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
			$this->af->set('function', $this->config->get('host_path').$_SERVER[REQUEST_URI]);
			return 'user_enLogin';
		}

		// 戻った場合
		if ('1' == $this->af->get('back')) {
			return null;
		}

		// 入力チェック
		if ($this->af->validate() > 0) {
			$this->backend->getLogger()->log(LOG_ERR, 'バリデーションエラー');
			return 'enError';
		}

		// 見本市番号
		if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
			if ('' == $this->af->get('mihon_no')) {
				$this->ae->add('error', 'A system error has occurred.');
			}
		}

		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, '詳細チェックエラー');
			return 'enError';
		}

		return null;
	}

	/**
	 *  user_enFairRegistStep1 action implementation.
	 *
	 *  @access public
	 *  @return string  forward name.
	 */
	function perform()
	{
		// typeの判定
		if ('1' == $this->af->get('back')) {
			// 戻った場合
			$this->backend->getLogger()->log(LOG_DEBUG, '■戻った場合');

			// 入力情報の復元
			$this->_setSessionToForm();
		} else {
			if ('c' == $this->af->get('mode') || 'e' == $this->af->get('mode')) {
				// 修正の場合
				$this->backend->getLogger()->log(LOG_DEBUG, '■修正の場合');

				// オブジェクトの取得
				$jm_fair_obj = $this->backend->getObject('JmFair', 'mihon_no', $this->af->get('mihon_no'));
				if (Ethna::isError($jm_fair_obj)) {
					$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
					$this->ae->add('error', $jm_fair_obj);
					return 'enError';
				}
				if (null == $jm_fair_obj || $this->af->get('mihon_no') != $jm_fair_obj->get('mihon_no')) {
					$this->backend->getLogger()->log(LOG_ERR, '見本市検索エラー');
					$this->ae->add('error', 'A system error has occurred.');
					return 'enError';
				}
				if ('1' == $jm_fair_obj->get('del_flg')) {
					$this->backend->getLogger()->log(LOG_ERR, '見本市削除済 削除時刻 '.$jm_fair_obj->get('del_date'));
					$this->ae->add('error', 'A system error has occurred.');
					return 'enError';
				}
				if ($this->session->get('user_id') != $jm_fair_obj->get('user_id')) {
					$this->backend->getLogger()->log(LOG_ERR, '他人の見本市 '.$this->session->get('user_id').' '.$jm_fair_obj->get('user_id'));
					$this->ae->add('error', 'A system error has occurred.');
					return 'enError';
				}

				// オブジェクトの内容をSESSIONに設定する。
				$this->_setObjToSession($jm_fair_obj);

				// 表示項目をSESSIONからFORMに設定する。
				$this->_setSessionToForm();
			} else {
				// sessionの削除
				$this->session->set('regist_param_1', null);
				$this->session->set('regist_param_2', null);
				$this->session->set('regist_param_3', null);
			}

			// 表示用Eメールの取得
			$user_obj = $this->backend->getObject('JmUser', 'user_id', $this->session->get('user_id'));
			if (Ethna::isError($user_obj)) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->addObject('error', $user_obj);
				return 'enError';
			}
			if (null == $user_obj || $this->session->get('user_id') != $user_obj->get('user_id')) {
				$this->backend->getLogger()->log(LOG_ERR, 'ユーザ検索エラー');
				$this->ae->add('error', 'A system error has occurred.');
				return 'enError';
			}
			$this->session->set('email', $user_obj->get('email'));
		}

		// エラー判定
		if (0 < $this->ae->count()) {
			$this->backend->getLogger()->log(LOG_ERR, 'システムエラー');
			return 'enError';
		}

		return 'user_enFairRegistStep1';
	}

	function _setSessionToForm() {
		$regist_param_1 = $this->session->get('regist_param_1');
		if (null == $regist_param_1) {
			return;
		}
		$this->af->set('fair_title_en', $regist_param_1['fair_title_en']);
		$this->af->set('abbrev_title', $regist_param_1['abbrev_title']);
		$this->af->set('fair_url', $regist_param_1['fair_url']);
		$this->af->set('date_from_yyyy', $regist_param_1['date_from_yyyy']);
		$this->af->set('date_from_mm', $regist_param_1['date_from_mm']);
		$this->af->set('date_from_dd', $regist_param_1['date_from_dd']);
		$this->af->set('date_to_yyyy', $regist_param_1['date_to_yyyy']);
		$this->af->set('date_to_mm', $regist_param_1['date_to_mm']);
		$this->af->set('date_to_dd', $regist_param_1['date_to_dd']);
		$this->af->set('frequency', $regist_param_1['frequency']);
		$this->af->set('main_industory_1', $regist_param_1['main_industory_1']);
		$this->af->set('sub_industory_1', $regist_param_1['sub_industory_1']);
		$this->af->set('main_industory_name_1', $regist_param_1['main_industory_name_1']);
		$this->af->set('sub_industory_name_1', $regist_param_1['sub_industory_name_1']);
		$this->af->set('main_industory_2', $regist_param_1['main_industory_2']);
		$this->af->set('sub_industory_2', $regist_param_1['sub_industory_2']);
		$this->af->set('main_industory_name_2', $regist_param_1['main_industory_name_2']);
		$this->af->set('sub_industory_name_2', $regist_param_1['sub_industory_name_2']);
		$this->af->set('main_industory_3', $regist_param_1['main_industory_3']);
		$this->af->set('sub_industory_3', $regist_param_1['sub_industory_3']);
		$this->af->set('main_industory_name_3', $regist_param_1['main_industory_name_3']);
		$this->af->set('sub_industory_name_3', $regist_param_1['sub_industory_name_3']);
		$this->af->set('main_industory_4', $regist_param_1['main_industory_4']);
		$this->af->set('sub_industory_4', $regist_param_1['sub_industory_4']);
		$this->af->set('main_industory_name_4', $regist_param_1['main_industory_name_4']);
		$this->af->set('sub_industory_name_4', $regist_param_1['sub_industory_name_4']);
		$this->af->set('main_industory_5', $regist_param_1['main_industory_5']);
		$this->af->set('sub_industory_5', $regist_param_1['sub_industory_5']);
		$this->af->set('main_industory_name_5', $regist_param_1['main_industory_name_5']);
		$this->af->set('sub_industory_name_5', $regist_param_1['sub_industory_name_5']);
		$this->af->set('main_industory_6', $regist_param_1['main_industory_6']);
		$this->af->set('sub_industory_6', $regist_param_1['sub_industory_6']);
		$this->af->set('main_industory_name_6', $regist_param_1['main_industory_name_6']);
		$this->af->set('sub_industory_name_6', $regist_param_1['sub_industory_name_6']);
		$this->af->set('check_sub_industory', $regist_param_1['check_sub_industory']);
		$this->af->set('exhibits_en', $regist_param_1['exhibits_en']);
		$this->af->set('region', $regist_param_1['region']);
		$this->af->set('country', $regist_param_1['country']);
		$this->af->set('city', $regist_param_1['city']);
		$this->af->set('other_city_en', $regist_param_1['other_city_en']);
		$this->af->set('check_other_city', $regist_param_1['check_other_city']);
		$this->af->set('venue_en', $regist_param_1['venue_en']);
		$this->af->set('gross_floor_area', $regist_param_1['gross_floor_area']);
		$this->af->set('open_to', $regist_param_1['open_to']);
		$this->af->set('admission_ticket_1', $regist_param_1['admission_ticket_1']);
		$this->af->set('admission_ticket_2', $regist_param_1['admission_ticket_2']);
		$this->af->set('admission_ticket_3', $regist_param_1['admission_ticket_3']);
		$this->af->set('admission_ticket_4', $regist_param_1['admission_ticket_4']);
		$this->af->set('admission_ticket_5', $regist_param_1['admission_ticket_5']);
		$this->af->set('other_admission_ticket_en', $regist_param_1['other_admission_ticket_en']);
	}

	function _setObjToSession($obj) {
		$jm_code_m_mgr =& $this->backend->getManager('JmCodeM');

		$regist_param_1 = array();
		$regist_param_1['fair_title_en'] = $obj->get('fair_title_en');
		$regist_param_1['abbrev_title'] = $obj->get('abbrev_title');
		$regist_param_1['fair_url'] = $obj->get('fair_url');
		$regist_param_1['date_from_yyyy'] = $obj->get('date_from_yyyy');
		$regist_param_1['date_from_mm'] = $obj->get('date_from_mm');
		$regist_param_1['date_from_dd'] = $obj->get('date_from_dd');
		$regist_param_1['date_to_yyyy'] = $obj->get('date_to_yyyy');
		$regist_param_1['date_to_mm'] = $obj->get('date_to_mm');
		$regist_param_1['date_to_dd'] = $obj->get('date_to_dd');
		$regist_param_1['frequency'] = $obj->get('frequency');
		$regist_param_1['main_industory_1'] = $obj->get('main_industory_1');
		$regist_param_1['sub_industory_1'] = $obj->get('sub_industory_1');
		$regist_param_1['main_industory_2'] = $obj->get('main_industory_2');
		$regist_param_1['sub_industory_2'] = $obj->get('sub_industory_2');
		$regist_param_1['main_industory_3'] = $obj->get('main_industory_3');
		$regist_param_1['sub_industory_3'] = $obj->get('sub_industory_3');
		$regist_param_1['main_industory_4'] = $obj->get('main_industory_4');
		$regist_param_1['sub_industory_4'] = $obj->get('sub_industory_4');
		$regist_param_1['main_industory_5'] = $obj->get('main_industory_5');
		$regist_param_1['sub_industory_5'] = $obj->get('sub_industory_5');
		$regist_param_1['main_industory_6'] = $obj->get('main_industory_6');
		$regist_param_1['sub_industory_6'] = $obj->get('sub_industory_6');
		$regist_param_1['exhibits_en'] = str_replace('<br/>', "\n", $obj->get('exhibits_en'));
		$regist_param_1['region'] = $obj->get('region');
		$regist_param_1['country'] = $obj->get('country');
		$regist_param_1['city'] = $obj->get('city');
		$regist_param_1['other_city_en'] = $obj->get('other_city_en');
		if ('' != $obj->get('other_city_en')) {
			$regist_param_1['check_other_city'] = '1';
		} else {
			$regist_param_1['check_other_city'] = '';
		}
		$regist_param_1['venue_en'] = $obj->get('venue_en');
		$regist_param_1['gross_floor_area'] = $obj->get('gross_floor_area');
		$regist_param_1['open_to'] = $obj->get('open_to');
		$regist_param_1['admission_ticket_1'] = $obj->get('admission_ticket_1');
		$regist_param_1['admission_ticket_2'] = $obj->get('admission_ticket_2');
		$regist_param_1['admission_ticket_3'] = $obj->get('admission_ticket_3');
		$regist_param_1['admission_ticket_4'] = $obj->get('admission_ticket_4');
		if ('' != $obj->get('other_admission_ticket_en')) {
			$regist_param_1['admission_ticket_5'] = '1';
		} else {
			$regist_param_1['admission_ticket_5'] = '';
		}
		$regist_param_1['other_admission_ticket_en'] = $obj->get('other_admission_ticket_en');

		$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_1'), '000', '000');
		$regist_param_1['main_industory_name_1'] = $code['discription_en'];
		$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_1'), $obj->get('sub_industory_1'), '000');
		$regist_param_1['sub_industory_name_1'] = $code['discription_en'];
		if ('' != $obj->get('main_industory_2')) {
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_2'), '000', '000');
			$regist_param_1['main_industory_name_2'] = $code['discription_en'];
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_2'), $obj->get('sub_industory_2'), '000');
			$regist_param_1['sub_industory_name_2'] = $code['discription_en'];
		}
		if ('' != $obj->get('main_industory_3')) {
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_3'), '000', '000');
			$regist_param_1['main_industory_name_3'] = $code['discription_en'];
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_3'), $obj->get('sub_industory_3'), '000');
			$regist_param_1['sub_industory_name_3'] = $code['discription_en'];
		}
		if ('' != $obj->get('main_industory_4')) {
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_4'), '000', '000');
			$regist_param_1['main_industory_name_4'] = $code['discription_en'];
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_4'), $obj->get('sub_industory_4'), '000');
			$regist_param_1['sub_industory_name_4'] = $code['discription_en'];
		}
		if ('' != $obj->get('main_industory_5')) {
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_5'), '000', '000');
			$regist_param_1['main_industory_name_5'] = $code['discription_en'];
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_5'), $obj->get('sub_industory_5'), '000');
			$regist_param_1['sub_industory_name_5'] = $code['discription_en'];
		}
		if ('' != $obj->get('main_industory_6')) {
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_6'), '000', '000');
			$regist_param_1['main_industory_name_6'] = $code['discription_en'];
			$code = $jm_code_m_mgr->getCode('002', $obj->get('main_industory_6'), $obj->get('sub_industory_6'), '000');
			$regist_param_1['sub_industory_name_6'] = $code['discription_en'];
		}
		$regist_param_1['check_sub_industory'] = $this->_mekaCheckSubIndustory($regist_param_1);
		$regist_param_1['spare_field1'] = $obj->get('spare_field1'); //承認機関
		$this->session->set('regist_param_1', $regist_param_1);

		$regist_param_2 = array();
		$regist_param_2['year_of_the_trade_fair'] = $obj->get('year_of_the_trade_fair');
		$regist_param_2['total_number_of_visitor'] = $obj->get('total_number_of_visitor');
		$regist_param_2['number_of_foreign_visitor'] = $obj->get('number_of_foreign_visitor');
		$regist_param_2['total_number_of_exhibitors'] = $obj->get('total_number_of_exhibitors');
		$regist_param_2['number_of_foreign_exhibitors'] = $obj->get('number_of_foreign_exhibitors');
		$regist_param_2['net_square_meters'] = $obj->get('net_square_meters');
		$regist_param_2['profile_en'] = str_replace('<br/>', "\n", $obj->get('profile_en'));
		$regist_param_2['detailed_information_en'] = str_replace('<br/>', "\n", $obj->get('detailed_information_en'));
		$regist_param_2['photos_name_1'] = $obj->get('photos_1');
		$regist_param_2['photos_name_2'] = $obj->get('photos_2');
		$regist_param_2['photos_name_3'] = $obj->get('photos_3');
		$regist_param_2['keyword'] = $obj->get('keyword');
		$regist_param_2['organizer_en'] = $obj->get('organizer_en');
		$regist_param_2['organizer_addr'] = $obj->get('organizer_addr');
		$regist_param_2['organizer_div'] = $obj->get('organizer_div');
		$regist_param_2['organizer_pers'] = $obj->get('organizer_pers');
		$regist_param_2['organizer_tel'] = $obj->get('organizer_tel');
		$regist_param_2['organizer_fax'] = $obj->get('organizer_fax');
		$regist_param_2['organizer_email'] = $obj->get('organizer_email');
		$regist_param_2['agency_in_japan_en'] = $obj->get('agency_in_japan_en');
		$regist_param_2['agency_in_japan_addr'] = $obj->get('agency_in_japan_addr');
		$regist_param_2['agency_in_japan_div'] = $obj->get('agency_in_japan_div');
		$regist_param_2['agency_in_japan_pers'] = $obj->get('agency_in_japan_pers');
		$regist_param_2['agency_in_japan_tel'] = $obj->get('agency_in_japan_tel');
		$regist_param_2['agency_in_japan_fax'] = $obj->get('agency_in_japan_fax');
		$regist_param_2['agency_in_japan_email'] = $obj->get('agency_in_japan_email');
		$this->session->set('regist_param_2', $regist_param_2);
	}

	function _mekaCheckSubIndustory($regist_param_1) {
		$industory_tmp_1 = $regist_param_1['main_industory_1'].'_'.$regist_param_1['sub_industory_1'].'_'.$regist_param_1['main_industory_name_1'].'_'.$regist_param_1['sub_industory_name_1'];
		$industory_tmp_2 = $regist_param_1['main_industory_2'].'_'.$regist_param_1['sub_industory_2'].'_'.$regist_param_1['main_industory_name_2'].'_'.$regist_param_1['sub_industory_name_2'];
		$industory_tmp_3 = $regist_param_1['main_industory_3'].'_'.$regist_param_1['sub_industory_3'].'_'.$regist_param_1['main_industory_name_3'].'_'.$regist_param_1['sub_industory_name_3'];
		$industory_tmp_4 = $regist_param_1['main_industory_4'].'_'.$regist_param_1['sub_industory_4'].'_'.$regist_param_1['main_industory_name_4'].'_'.$regist_param_1['sub_industory_name_4'];
		$industory_tmp_5 = $regist_param_1['main_industory_5'].'_'.$regist_param_1['sub_industory_5'].'_'.$regist_param_1['main_industory_name_5'].'_'.$regist_param_1['sub_industory_name_5'];
		$industory_tmp_6 = $regist_param_1['main_industory_6'].'_'.$regist_param_1['sub_industory_6'].'_'.$regist_param_1['main_industory_name_6'].'_'.$regist_param_1['sub_industory_name_6'];
		return array($industory_tmp_1, $industory_tmp_2, $industory_tmp_3, $industory_tmp_4, $industory_tmp_5, $industory_tmp_6);
	}

}

?>
