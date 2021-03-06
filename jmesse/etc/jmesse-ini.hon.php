<?php
/*
 * jmesse-ini.php
*
* update:
*/
$config = array(
	// site
	'url'         => '/j-messe/',
	'url_pub'     => '/j-messe/',

	// base（本番では<base>がなくなる予定）
//	'base'        => 'http://dev.jetro.go.jp/',
//	'base_en'     => 'http://produce.jetro.go.jp/',
//	'base_pub'    => 'http://dev.jetro.go.jp/',
//	'base_pub_en' => 'http://produce.jetro.go.jp/',

	// css,js,base
	'css_js_base'     => '/',
	'css_js_base_pub' => '/',

	// path
	'host_path'      => 'https://www.jetro.go.jp',
	'img_path'       => 'img/user/',
	'img_tmp_path'   => 'img/user/tmp/',
	'flag_path'      => '/images/flag/',
	'photos_dir_max' => 10000,

	//JSONファイル作成格納場所
	'jsonfile_path' => '/home/jmesse1112/app/jmesse_new/www/jsonfile/',

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
// 	'left_menu_url'        => '/home/jmesse1112/app/jmesse_new/www/ja_left_menu.html',
// 	'left_menu_url_en'     => '/home/jmesse1112/app/jmesse_new/www/en_left_menu.html',
	// MOD-S 2013.10.08 2013年度保守対応No.21
	//https用
// 	'header_url'           => 'https://www.jetro.go.jp/static/parts/ja_header.html',
// 	'footer_url'           => 'https://www.jetro.go.jp/static/parts/ja_footer.html',
// 	'footer_script_rul'    => 'https://www.jetro.go.jp/static/parts/ja_footer_script.html',
// 	'header_url_en'        => 'https://www.jetro.go.jp/static/parts/en_header.html',
// 	'footer_url_en'        => 'https://www.jetro.go.jp/static/parts/en_footer.html',
// 	'footer_script_rul_en' => 'https://www.jetro.go.jp/static/parts/en_footer_script.html',
// 	//http用
// 	'http_header_url'           => 'http://www.jetro.go.jp/static/parts/ja_header.html',
// 	'http_footer_url'           => 'http://www.jetro.go.jp/static/parts/ja_footer.html',
// 	'http_footer_script_rul'    => 'http://www.jetro.go.jp/static/parts/ja_footer_script.html',
// 	'http_header_url_en'        => 'http://www.jetro.go.jp/static/parts/en_header.html',
// 	'http_footer_url_en'        => 'http://www.jetro.go.jp/static/parts/en_footer.html',
// 	'http_footer_script_rul_en' => 'http://www.jetro.go.jp/static/parts/en_footer_script.html',
// 	// MOD-E 2013.10.08 2013年度保守対応No.21

	// MOD-S 2015.04.23 2015年度保守対応No.1
	//https用
// 	'header_url'           => 'https://www.jetro.go.jp/asset/parts/j-messe/old/ja_header.html',
// 	'footer_url'           => 'https://www.jetro.go.jp/asset/parts/j-messe/old/ja_footer.html',
// 	'footer_script_rul'    => 'https://www.jetro.go.jp/asset/parts/j-messe/old/ja_footer_script.html',
// 	'header_url_en'        => 'https://www.jetro.go.jp/asset/parts/j-messe/old/en_header.html',
// 	'footer_url_en'        => 'https://www.jetro.go.jp/asset/parts/j-messe/old/en_footer.html',
// 	'footer_script_rul_en' => 'https://www.jetro.go.jp/asset/parts/j-messe/old/en_footer_script.html',
// 	//http用
// 	'http_header_url'           => 'http://www.jetro.go.jp/asset/parts/j-messe/old/ja_header.html',
// 	'http_footer_url'           => 'http://www.jetro.go.jp/asset/parts/j-messe/old/ja_footer.html',
// 	'http_footer_script_rul'    => 'http://www.jetro.go.jp/asset/parts/j-messe/old/ja_footer_script.html',
// 	'http_header_url_en'        => 'http://www.jetro.go.jp/asset/parts/j-messe/old/en_header.html',
// 	'http_footer_url_en'        => 'http://www.jetro.go.jp/asset/parts/j-messe/old/en_footer.html',
// 	'http_footer_script_rul_en' => 'http://www.jetro.go.jp/asset/parts/j-messe/old/en_footer_script.html',
	// MOD-E 2015.04.23 2015年度保守対応No.1

	// debug
	// (to enable ethna_info and ethna_unittest, turn this true)
	'debug' => false,

	// db
	// 新本番環境(80:本番 81:検証(ただし使用しない。)  共にJETRO本番環境)
	'dsn' => 'mysql://jmesse:idsjmesse@172.16.20.80/jmesse',
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
			'level'  => 'err',
			'option' => 'pid,function,pos',
			'mode'   => '666',
			'file'   => '/home/jmesse1112/app/jmesse_new/log/jmesse_'.date('Ymd').'.log',
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
	'mail_smtp_host' => '172.16.24.51',
	'mail_smtp_port' => '25',
	'mail_smtp_auth' => false,
	'mail_smtp_user' => '',
	'mail_smtp_pass' => '',

	'mail_from'        => mb_encode_mimeheader(mb_convert_encoding("J-messe 事務局", "ISO-2022-JP", "UTF-8"), "ISO-2022-JP").' <j-messe@totec-net.com>',
	'mail_from_en'     => 'J-messe Administrator <j-messe@totec-net.com>',
	'mail_bcc'         => 'j-messe@totec-net.com',
	'mail_return-path' => 'j-messe@totec-net.com',

	'mail_title_user_regist'  => 'J-messe 見本市ユーザー登録完了のお知らせ',
	'mail_title_user_change'  => 'J-messe 見本市ユーザー更新完了のお知らせ',
	'mail_title_user_confirm' => 'J-messe パスワード再発行のお知らせ',
	'mail_title_fair_regist'  => 'J-messe 見本市登録申請受付のお知らせ',
	'mail_title_fair_change'  => 'J-messe 見本市更新受付のお知らせ',
	'mail_title_fair_rejection'  => 'J-messe 見本市一般公開否認のお知らせ',
	'mail_title_fair_approved'  => 'J-messe 見本市一般公開のお知らせ',
	//ユーザ管理画面メール起動時の文言
	'mail_to_top_menu_regist'  => 'j-messe@totec-net.com',
	'mail_title_top_menu_regist'  => urlencode('【J-messe】代理店情報の送付'),
	'mail_body_top_menu_regist'   => urlencode('※代理店の皆さま'.PHP_EOL
							.'見本市・展示会主催者から委託を受けた代理店におかれましては、'
							.'見本市・展示会情報をご登録いただく前に、主催者との委任関係が分かる情報'
							.'（ウェブページ、委任状、契約書コピーの一部等）のご提示をお願いしております。'
							.'j-messe@totec-net.comまで、下記必要情報をご連絡願います。'.PHP_EOL
							.'＜ご連絡いただく内容＞'.PHP_EOL
							.'(1)登録予定の見本市・展示会名'.PHP_EOL
							.'(2)主催者名'.PHP_EOL
							.'(3)主催者との関係が分かる情報（ウェブページ、委任状、契約書コピーの一部等）'.PHP_EOL
							.'(4)代理店名'),
	'mail_body_top_menu_regist_sjis'   => urlencode(mb_convert_encoding('※代理店の皆さま'.PHP_EOL
							.'見本市・展示会主催者から委託を受けた代理店におかれましては、'
							.'見本市・展示会情報をご登録いただく前に、主催者との委任関係が分かる情報'
							.'（ウェブページ、委任状、契約書コピーの一部等）のご提示をお願いしております。'
							.'j-messe@totec-net.comまで、下記必要情報をご連絡願います。'.PHP_EOL
							.'＜ご連絡いただく内容＞'.PHP_EOL
							.'(1)登録予定の見本市・展示会名'.PHP_EOL
							.'(2)主催者名'.PHP_EOL
							.'(3)主催者との関係が分かる情報（ウェブページ、委任状、契約書コピーの一部等）'.PHP_EOL
							.'(4)代理店名','Shift-JIS' ,'UTF-8')),
	'mail_to_top_menu_regist_en'  => 'j-messe@totec-net.com',
	'mail_title_top_menu_regist_en'  => rawurlencode('[J-messe] Agency Information'),
	'mail_body_top_menu_regist_en'   => rawurlencode('To all agents,'.PHP_EOL
								.'In order to verify the relationship between you and the organizer,'
								.' we ask for additional information before registering the trade fair on our database. '
								.'Please send relevant information and documents(web page, a letter of attorney, part of copied contract, etc.)'
								.' which show that you are the official agent delegated by the organizer to the following address:j-messe@totec-net.com .'.PHP_EOL
						.'Required information:'.PHP_EOL
						.'1. Fair title'.PHP_EOL
						.'2. Name of organizer'.PHP_EOL
						.'3. Documents that show your relationship with the organizer (web page, a letter of attorney, part of copied contract, etc.)'.PHP_EOL
						.'4. Name of agency'),

	'mail_title_user_regist_en'  => 'Notice of completion of your user registration for J-messe',
	'mail_title_user_change_en'  => 'Notice of completion of updating your user information for J-messe',
	'mail_title_user_confirm_en' => 'Notice of reissue of your password for J-messe',
	'mail_title_fair_regist_en'  => 'Notice of receiving your trade fair registration for J-messe',
	'mail_title_fair_change_en'  => 'Notice of receiving your updated trade fair information for J-messe',
	'mail_title_fair_rejection_en'  => 'Notice of rejection of trade fair registration to J-messe',
	'mail_title_fair_approved_en'  => 'Notice of approval of your trade fair registration on J-messe',

	// ADD-S 2012.02.24 バッチログメール追加
	// バッチログ配信情報
	'mail_mnt_batch_log_title'     => '[JETRO]batch.log('.date('Ymd').')',
	'mail_mnt_batch_mon_log_title' => '[JETRO]batch_mon.log('.date('Ymd').')',
	'mail_mnt_to'                  => 'goto@ids.co.jp,tanimoto@ids.co.jp',
	'batch_log'                    => '/home/jmesse1112/app/jmesse_new/log/batch.log',
	'batch_mon_log'                => '/home/jmesse1112/app/jmesse_new/log/batch_mon.log',
	// ADD-E 2012.02.24 バッチログメール追加

	//'mail_func_workaround' => false,

	// ADD-S 2015.02.07 各種産業区分コード定義設定
	//農林水産・食品(ind=001)
	'industry_001_name_jp' => '農林水産・食品',
	'industry_001_002_001' => '013001', //農林水産業（生産物含む）20160627 Upd
	'industry_001_008_001' => '013002', //食・飲料、食品加工 20160627 Upd
	//ファッション・繊維(ind=002)
	'industry_002_name_jp' => 'ファッション・繊維',
	'industry_002_008_002' => '008002', //皮革（素材、製品、機器）、履物
	'industry_002_008_003' => '008003', //繊維・衣料（素材、製品、機器）
	'industry_002_008_009' => '008009', //宝石、貴金属、アクセサリー
	//デザイン(ind=003)
	'industry_003_name_jp' => 'デザイン',
	'industry_003_008_005' => '008005', //家具・インテリア用品
	'industry_003_008_006' => '008006', //家庭用品、食卓用品、陶磁器等
	'industry_003_008_007' => '008007', //ギフト用品、手工芸品、販促用品
	'industry_003_009_008' => '009008', //美術工芸品、骨董品
	//コンテンツ(ind=004)
	'industry_004_name_jp' => 'コンテンツ',
	'industry_004_005_004' => '005004', //新聞、放送、映像（映画、フォト）
	'industry_004_009_001' => '009001', //音楽（楽器、音盤、楽譜等）
	'industry_004_009_002' => '009002', //玩具、遊戯用具、ゲーム用品
	'industry_004_009_007' => '009007', //書籍（ブックフェア）、図書館設備
	//サービス(ind=005)
	'industry_005_name_jp' => 'サービス',
	'industry_005_007_005' => '007005', //ヘルスケア、保健産業、保健用品
	'industry_005_007_006' => '007006', //フィットネス
	'industry_005_008_014' => '008014', //冠婚葬祭、宗教関連
	'industry_005_009_006' => '009006', //教育・訓練、学校用品、文房具
	'industry_005_009_009' => '009009', //観光・旅行（施設、用品等含む）
	'industry_005_010_001' => '010001', //ホテル、レストラン、ケータリング
	'industry_005_010_002' => '010002', //店舗用設備・機器、ディスプレイ
	'industry_005_010_005' => '010005', //流通業、フランチャイズビジネス
	'industry_005_010_008' => '010008', //見本市・コンベンション産業関連
	//ライフサイエンス(ind=006)
	'industry_006_name_jp' => 'ライフサイエンス',
	'industry_006_007_001' => '007001', //医療・病院用機器、医療技術
	'industry_006_007_002' => '007002', //歯科用・眼科用機器・用品
	'industry_006_007_003' => '007003', //福祉・介護・リハビリ用機器・用具
	'industry_006_007_004' => '007004', //医薬品、製薬・製剤、薬学
	//機械・機器(ind=007)
	'industry_007_name_jp' => '機械・機器',
	'industry_007_004_001' => '004001', //金属製品、工具、金型
	'industry_007_004_002' => '004002', //工作機械・金属加工
	'industry_007_004_003' => '004003', //木材加工機械、家具製造機械
	'industry_007_004_004' => '004004', //マテハン機器、圧力機器
	'industry_007_004_005' => '004005', //精密・測定・試験機器
	'industry_007_004_006' => '004006', //電気・電子（製品、機器）
	'industry_007_004_007' => '004007', //その他の産業用機器・設備
	'industry_007_005_001' => '005001', //通信、情報処理、コンピュータ
	'industry_007_005_002' => '005002', //光学、光工学、レーザー技術・機器
	'industry_007_006_001' => '006001', //自動車（部品・製造関連機器含む）
	'industry_007_006_002' => '006002', //自動車補修・サービス用品
	'industry_007_006_003' => '006003', //自転車、自動二輪車（部品含む）
	//環境・エネルギー(ind=008)
	'industry_008_name_jp' => '環境・エネルギー',
	'industry_008_002_002' => '002002', //鉱業、エネルギー
	'industry_008_011_001' => '011001', //環境、廃棄物処理、リサイクリング
	//インフラ・プラント(ind=009)
	'industry_009_name_jp' => 'インフラ・プラント',
	'industry_009_002_002' => '002002', //鉱業、エネルギー
	'industry_009_003_001' => '003001', //建築・建設、不動産
	'industry_009_003_002' => '003002', //衛生設備、空調、給排水、照明
	'industry_009_006_004' => '006004', //海運、造船、港湾関連機器
	'industry_009_006_006' => '006006', //航空・宇宙関連機器、設備
	'industry_009_006_007' => '006007', //鉄道、その他の輸送用機器、交通
	'industry_009_008_013' => '008013', //防災、警備、消防、防衛
	'industry_009_010_009' => '010009', //産業安全、労災、労務管理
	// ADD-E 2015.02.07 産業区分コード設定



	// ADD-S 2015.04.21 2015年度保守対応No.1(JETRO広報課ソース外部参照 hon）
	// headタグ内CSSリンク部
	'http_ja_headtagu'           => '/asset/parts/j-messe/ja_head.html',
	'https_ja_headtagu'          => '/asset/parts/j-messe/ja_head.html',
	'http_en_headtagu'           => '/asset/parts/j-messe/en_head.html',
	'https_en_headtagu'          => '/asset/parts/j-messe/en_head.html',

	// (画面内)JETROフロントヘッダー部
	'http_ja_jetro_header'       => '/asset/parts/ja_header.html',
	'https_ja_jetro_header'      => '/asset/parts/ja_header.html',
	'http_en_jetro_header'       => '/asset/parts/en_header.html',
	'https_en_jetro_header'      => '/asset/parts/en_header.html',

	// (画面内)JETROフロントフッター部
	'http_ja_jetro_footer'       => '/asset/parts/ja_footer.html',
	'https_ja_jetro_footer'      => '/asset/parts/ja_footer.html',
	'http_en_jetro_footer'       => '/asset/parts/en_footer.html',
	'https_en_jetro_footer'      => '/asset/parts/en_footer.html',

	// (画面内)J-messeタイトルとメニュー部
	'http_ja_jmesse_top'         => '/asset/parts/j-messe/ja_localnavi.html',
	'https_ja_jmesse_top'        => '/asset/parts/j-messe/ja_localnavi.html',
	'http_en_jmesse_top'         => '/asset/parts/j-messe/en_localnavi.html',
	'https_en_jmesse_top'        => '/asset/parts/j-messe/en_localnavi.html',

	// (フロント画面内)FAQとユーザ登録案内
	'http_ja_jmesse_faq_login'   => '/asset/parts/j-messe/ja_contact.html',
	'https_ja_jmesse_faq_login'  => '/asset/parts/j-messe/ja_contact.html',
	'http_en_jmesse_faq_login'   => '/asset/parts/j-messe/en_contact.html',
	'https_en_jmesse_faq_login'  => '/asset/parts/j-messe/en_contact.html',
	// ADD-E 2015.04.21 2015年度保守対応No.1(JETRO広報課ソース外部参照 hon）

	//見本市移譲先ユーザID(honban j-messe@totec-net.com)
	'transfer_user_id'      => '2453',

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
