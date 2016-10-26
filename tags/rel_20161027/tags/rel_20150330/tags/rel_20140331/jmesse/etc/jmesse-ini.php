<?php
/*
 * jmesse-ini.php (適宜、個人のローカル環境に合わせて設定すること)
*
* update:
*/
$config = array(
	// site
	'url'         => 'https://localhost/jmesse/www/',
	'url_pub'     => 'http://localhost/jmesse/www/',

	// base
	'base'        => 'https://www.jetro.go.jp/',
	'base_en'     => 'https://www.jetro.go.jp/',
	'base_pub'    => 'http://www.jetro.go.jp/',
	'base_pub_en' => 'http://www.jetro.go.jp/',

	// css,js,base
	'css_js_base'     => 'https://www.jetro.go.jp/',
	'css_js_base_pub' => 'http://www.jetro.go.jp/',

	// path
	'host_path'      => 'https://localhost',
	'img_path'       => 'img/user/',
	'img_tmp_path'   => 'img/user/tmp/',
	'flag_path'      => '/images/flag/',
	'photos_dir_max' => 10000,

	//JSONファイル作成格納場所
	'jsonfile_path' => 'C:/JETRO/xampp/apache/htdocs/jmesse/www/jsonfile/',

	// JSONファイル名
	'r_jp'  => 'region_jp.json',
	'r_en'  => 'region_en.json',
	'i_jp'  => 'industry_jp.json',
	'i_en'  => 'industry_en.json',
	'i2_jp'  => 'industry2_jp.json',
	'i2_en'  => 'industry2_en.json',
	'n_jp'  => 'new-mihonichi_jp.json',
	'n_en'  => 'new-mihonichi_en.json',
	'r1_jp' => 'ranking1_jp.json',
	'r2_jp' => 'ranking2_jp.json',
	'r3_jp' => 'ranking3_jp.json',
	'r4_jp' => 'ranking4_jp.json',
	'r5_jp' => 'ranking5_jp.json',
	'r6_jp' => 'ranking6_jp.json',
	'r1_en' => 'ranking1_en.json',
	'r2_en' => 'ranking2_en.json',
	'r3_en' => 'ranking3_en.json',
	'r4_en' => 'ranking4_en.json',
	'r5_en' => 'ranking5_en.json',
	'r6_en' => 'ranking6_en.json',

	// MOD-S 2013.01.22 JECC認証用ファイル作成
	'jecc_jp' => 'jecc-mihonichi_jp.json',
	'jecc_en' => 'jecc-mihonichi_en.json',
	// MOD-E 2013.01.22 JECC認証用ファイル作成

	// MOD-S 2012.01.23 top3用ファイル作成
	'n_jp_top3'  => 'new-mihonichi_jp_top3.json',
	'n_en_top3'  => 'new-mihonichi_en_top3.json',
	'r1_jp_top3' => 'ranking1_jp_top3.json',
	'r4_en_top3' => 'ranking4_en_top3.json',
	// MOD-E 2012.01.23 top3用ファイル作成

	// 共通部分URL
	'left_menu_url'        => 'ja_left_menu.html',
	'left_menu_url_en'     => 'en_left_menu.html',
	// MOD-S 2013.10.08 2013年度保守対応No.21
	//https用
	'header_url'           => 'ja_header.html ',
	'footer_url'           => 'ja_footer.html',
	'footer_script_rul'    => 'ja_footer_script.html',
	'header_url_en'        => 'en_header.html',
	'footer_url_en'        => 'en_footer.html',
	'footer_script_rul_en' => 'en_footer_script.html',
	//http用
	'http_header_url'           => 'ja_header.html ',
	'http_footer_url'           => 'ja_footer.html',
	'http_footer_script_rul'    => 'ja_footer_script.html',
	'http_header_url_en'        => 'en_header.html',
	'http_footer_url_en'        => 'en_footer.html',
	'http_footer_script_rul_en' => 'en_footer_script.html',
	// MOD-E 2013.10.08 2013年度保守対応No.21

	// debug
	// (to enable ethna_info and ethna_unittest, turn this true)
	'debug' => true,

	// db
	'dsn' => 'mysql://jmesse:idsjmesse@ec2-54-254-121-156.ap-southeast-1.compute.amazonaws.com/jmesse',
	// sample-1: single db
	// 'dsn' => 'mysql://user:password@server/database',
	//
	// sample-2: single db w/ multiple users
	// 'dsn'   => 'mysql://rw_user:password@server/database', // read-write
	// 'dsn_r' => 'mysql://ro_user:password@server/database', // read-only
	//
	// sample-3: multiple db (slaves)
	// 'dsn'   => 'mysql://rw_user:password@master/database', // read-write(master)
	// 'dsn_r' => array(
	//     'mysql://ro_user:password@slave1/database',         // read-only(slave)
	//     'mysql://ro_user:password@slave2/database',         // read-only(slave)
	// ),

	// log
	'log' => array(
		'file' => array(
			'level'  => 'debug',
			'option' => 'pid,function,pos',
			'mode'   => '666',
			'file'   => 'C:/JETRO/xampp/apache/htdocs/jmesse/log/jmesse_'.date('Ymd').'.log',
		),
	),
	// sample-1: sigile facility
	//     'log_facility'          => 'echo',
	//     'log_level'             => 'debug',
	//     'log_option'            => 'pid,function,pos',
	//     'log_filter_do'         => '',
	//     'log_filter_ignore'     => 'Undefined index.*%%.*tpl',
	//
	// sample-2: mulitple facility
	//'log' => array(
	//    'echo'  => array(
	//        'level'         => 'warning',
	//    ),
	//    'file'  => array(
	//        'level'         => 'notice',
	//        'file'          => '/var/log/jmesse.log',
	//        'mode'          => 0666,
	//    ),
	//    'alertmail'  => array(
	//        'level'         => 'err',
	//        'mailaddress'   => 'alert@ml.example.jp',
	//    ),
	//),
	//'log_option'            => 'pid,function,pos',
	//'log_filter_do'         => '',
	//'log_filter_ignore'     => 'Undefined index.*%%.*tpl',

	// memcache
	// sample-1: single (or default) memcache
	// 'memcache_host' => 'localhost',
	// 'memcache_port' => 11211,
	// 'memcache_use_pconnect' => false,
	// 'memcache_retry' => 3,
	// 'memcache_timeout' => 3,
	//
	// sample-2: multiple memcache servers (distributing w/ namespace and ids)
	// 'memcache' => array(
	//     'namespace1' => array(
	//         0 => array(
	//             'memcache_host' => 'cache1.example.com',
	//             'memcache_port' => 11211,
	//         ),
	//         1 => array(
	//             'memcache_host' => 'cache2.example.com',
	//             'memcache_port' => 11211,
	//         ),
	//     ),
	// ),

	// i18n
	//'use_gettext' => false,

	// mail
	'mail_smtp_host' => '210.161.156.130',
	'mail_smtp_port' => '25',
	'mail_smtp_auth' => false,
	'mail_smtp_user' => '',
	'mail_smtp_pass' => '',

	'mail_from'        => mb_encode_mimeheader(mb_convert_encoding("J-messe 事務局", "ISO-2022-JP", "UTF-8"), "ISO-2022-JP").' <tanimoto@ids.co.jp>',
	'mail_from_en'     => 'J-messe Administrator <tanimoto@ids.co.jp>',
	'mail_bcc'         => 'tanimoto@ids.co.jp,a.komatsu@ids.co.jp',
	'mail_return-path' => 'tanimoto@ids.co.jp',

	'mail_title_user_regist'  => 'J-messe 見本市ユーザー登録完了のお知らせ',
	'mail_title_user_change'  => 'J-messe 見本市ユーザー更新完了のお知らせ',
	'mail_title_user_confirm' => 'J-messe パスワード再発行のお知らせ',
	'mail_title_fair_regist'  => 'J-messe 見本市登録申請受付のお知らせ',
	'mail_title_fair_change'  => 'J-messe 見本市更新受付のお知らせ',
	'mail_title_fair_rejection'  => 'J-messe 見本市一般公開否認のお知らせ',
	'mail_title_fair_approved'  => 'J-messe 見本市一般公開のお知らせ',
	'mail_title_user_regist_en'  => 'Notice of completion of your user registration for J-messe',
	'mail_title_user_change_en'  => 'Notice of completion of updating your user information for J-messe',
	'mail_title_user_confirm_en' => 'Notice of reissue of your password for J-messe',
	'mail_title_fair_regist_en'  => 'Notice of receiving your trade fair registration for J-messe',
	'mail_title_fair_change_en'  => 'Notice of receiving your updated trade fair information for J-messe',
	'mail_title_fair_rejection_en'  => 'Notice of rejection of trade fair registration to J-messe',
	'mail_title_fair_approved_en'  => 'Notice of approval of your trade fair registration on J-messe',

	//管理者サイト機能（エラーメール一覧機能削除によりコメントアウト）
	//'mail_imap_host' => 'imap.gmail.com',
	//'mail_imap_port' => '993',
	//'mail_imap_user' => '',
	//'mail_imap_pass' => '',

	// ADD-S 2012.02.24 バッチログメール追加
	// バッチログ配信情報
	'mail_mnt_batch_log_title'     => '[JETRO]batch.log('.date('Ymd').')',
	'mail_mnt_batch_mon_log_title' => '[JETRO]batch_mon.log('.date('Ymd').')',
	'mail_mnt_to'                  => 'goto@ids.co.jp,tanimoto@ids.co.jp',
	'batch_log'                    => 'C:/JETRO/xampp/apache/htdocs/jmesse/log/batch.log',
	'batch_mon_log'                => 'C:/JETRO/xampp/apache/htdocs/jmesse/log/batch_mon.log',
	// ADD-E 2012.02.24 バッチログメール追加

	//'mail_func_workaround' => false,

	// Smarty
	//'renderer' => array(
	//    'smarty' => array(
	//        'left_delimiter' => '{',
	//        'right_delimiter' => '}',
	//    ),
	//),

	// csrf
	// 'csrf' => 'Session',
);
?>
