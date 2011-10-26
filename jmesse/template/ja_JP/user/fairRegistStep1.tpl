<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="">

<!--テスト用-->
<base href="http://dev.jetro.go.jp" />
<!--/テスト用-->
<title>見本市登録 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
<script type="text/javascript" src="/js/jquery.js"></script>
<link href="/css/jp/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/j-messe/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/jp/printmedia.css" rel="stylesheet" type="text/css" media="print" />

</head>


<body class="layout-LC highlight-match j-messe">
<!-- header -->
<div id="skip_menu"><a href="#center">skip to contents.</a></div>
<div id="header">
<div class="area">
	<p id="logo"><a href="/indexj.html"><img src="/images/jp/logo.gif" alt="JETRO 日本貿易振興機構（ジェトロ）" height="41" width="283" /></a></p>
	<div id="headlink">
		<ul class="clearfix">
			<li><a href="/contact/"><img src="/images/jp/headmenu01.gif" alt="お問い合わせ" height="9" width="67" /></a></li>
			<li><a href="/guide/"><img src="/images/jp/headmenu05.gif" alt="サイト活用ガイド" height="9" width="82" /></a></li>
			<li><a href="/sitemap/"><img src="/images/jp/headmenu02.gif" alt="サイトマップ" height="9" width="62" /></a></li>
			<li class="end"><a href="/"><img src="/images/jp/headmenu03.gif" alt="Global Home" height="9" width="74" /></a></li>
		</ul>
	</div>
	<div id="headbox">
		<!-- Site Search Box Begins  -->
		<form method="get" action="http://search.jetro.go.jp/ja_all/search.x">
		<div id="search">
		<input type="text" name="q" value="サイト内検索" id="MF_form_phrase" class="search_area" autocomplete="off" onclick="if(this.value=='サイト内検索') this.value=''; this.style.color = '#555555';" onblur="if(!this.value) this.value='サイト内検索';" style="color: #555555;" />
		<input type="image" class="search_btn" alt="検索" src="/images/jp/btn-search.gif" value="search" name="sa" />
		<input type="hidden" name="ie" value="UTF-8" />
		<input type="hidden" name="page" value="1" />
		<a href="/search/"><img src="/images/jp/icon-question.gif" alt="HELP" width="14" height="14" /></a>
		</div>
		</form>
		<!-- Site Search Box eEnd  -->

		<div id="fontsizech">
			<div><img src="/images/jp/fontsizech.gif" alt="文字のサイズを変更できます" width="45" height="9" /></div>
			<ul>
				<li id="fontsizech_small"><a href="#"><img src="/images/jp/fontsizech_small.gif" alt="標準の文字サイズ" width="23" height="45" /></a></li>
				<li id="fontsizech_large"><a href="#"><img src="/images/jp/fontsizech_large.gif" alt="大きい文字サイズ" width="23" height="45" /></a></li>
			</ul>
		</div>
		<noscript id="fontsizech_noscriptalert">
			<p>文字サイズの変更機能にJavascriptを使用しています。Javascriptがお使いになれない環境では、ブラウザの機能を使用して文字サイズの変更を行ってください。</p>
		</noscript>
	</div>
</div>
</div>
<!-- global -->
<div id="globalnavi">
<ul>
	<li class="g01"><a href="/indexj.html"><img src="/images/jp/global01.gif" alt="ホーム" height="37" width="104" /></a></li>
	<li class="g02"><a href="/biz/"><img src="/images/jp/global02.gif" alt="海外ビジネス情報" height="37" width="177" /></a></li>
	<li class="g03"><a href="/database/"><img src="/images/jp/global03.gif" alt="引き合い・展示会検索" height="37" width="168" /></a></li>
	<li class="g04"><a href="/news_events/"><img src="/images/jp/global04.gif" alt="ニュース・イベント" height="37" width="158" /></a></li>
	<li class="g05"><a href="/support_services/"><img src="/images/jp/global05.gif" alt="サポート&amp;サービス" height="37" width="178" /></a></li>
	<li class="g06"><a href="/jetro/"><img src="/images/jp/global06.gif" alt="ジェトロについて" height="37" width="159" /></a></li>
</ul>
</div>
<!-- /global -->
<!-- /header -->

<!-- bread -->
<div id="bread">
<ul>
	<li><a href="/indexj.html">HOME</a></li>
	<li><a href="/database/">引き合い・展示会検索</a></li>
	<li><a href="/database/j-messe/">見本市・展示会データベース（J-messe）</a></li>
	<li><a href="/database/j-messe/tradefair/">世界の見本市・展示会</a></li>
	<li>見本市登録</li>
</ul>
</div>
<!-- /bread -->

<!-- contents -->
<div id="contents">



<div class="area">
<!-- left -->
<div id="left">
	<div class="bgbox_set">
	<p id="title"><a href="/j-messe/">見本市・展示会データベース(J-messe)</a></p>
	<div class="bgbox_base">
		<div class="bgbox_in">
			<div class="submenu no_border">
<ul class="navi">
	<li class="lv01_title"><a href="/j-messe/tradefair/industry/">業種別に見る</a></li>
	<li class="lv01_title"><a href="/j-messe/tradefair/country/">開催地別に見る</a></li>
	<li class="lv01_title"><a href="/j-messe/tradefair/">詳細検索</a></li>
	<li class="lv01_title"><a href="/j-messe/new_fair/">新着見本市</a></li>
	<li class="lv01_title"><a href="/j-messe/ranking/">月間ランキング</a></li>
</ul>

<ul class="navi">
	<li class="lv01_label">出展お役立ち情報</li>
	<li class="lv02_title"><a href="/j-messe/w-info/">見本市レポート</a></li>
	<li class="lv02_title"><a href="/services/tradefair/">出展支援</a></li>
	<li class="lv02_title"><a href="/j-messe/center/">世界の展示会場</a></li>
	<li class="lv02_title"><a href="/j-messe/business/">世界の見本市ビジネス動向</a></li>
</ul>
<ul class="navi no_border">
	<li class="lv01_label">出展者向け</li>
	<li class="lv02_title on"><a href="/j-messe/registration/">見本市登録</a></li>
</ul>
			</div>
		</div>
	</div>
</div>

<div id="sub_inquiry">
	<div class="bgbox_set">
		<dl class="frame_beige">
			<dt>お問い合わせ<br />ご意見・ご感想</dt>
			<dd>ジェトロ展示事業課<br />
			（TEL:03-3582-5541）<br />
			<a href="javascript:jetro_open_win600('https://www.jetro.go.jp/form/fm/faa/inquiry_j');" class="icon_arrow">お問い合わせ</a></dd>
		</dl>
	</div>
</div>
</div>
<!-- /left -->



















<!-- center -->
<div id="center">
	<div id="main">
		<div class="bgbox_set">
			<div class="bgbox_base">
				<div class="h1"><h1>見本市・展示会データベース</h1></div>
				<div class="h2"><h2>見本市登録</h2></div>
				<div class="in_main">
					<h3 class="img t_center"><img src="/j-messe/images/db/fair02.jpg" alt="見本市登録　ステップ1"></h3>
					<p class="t_right">ユーザー：abcdef123</a>
					<form>
						<h4>基本情報</h4>
						<table id="registration">
							<tr>
								<th class="item">見本市名</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td><input type="text" value="" size="60" name="name"><br /></td>
							</tr>
							<tr>
								<th class="item">見本市略称</th>
								<th class="required"></th>
								<td><input type="text" value="" size="30" name="abbreviation"><br />
								<strong>半角英数</strong>で入力してください。　例：Ambiente。
								</td>
							</tr>
							<tr>
								<th class="item">見本市公式サイトURL</th>
								<th class="required"></th>
								<td><input type="text" value="http://" size="60" name="website">
								<br />
								URLはhttp:// から入力して下さい。</td>
							</tr>
							<tr>
								<th class="item">会期</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td><select name="from_yyyy" size="1" id="from_yyyy"><option value=""></option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option></select> 年
								<select name="from_mm" size="1" id="from_mm">
								<option value=""></option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select> 月<option value=""></option>
								<select name="from_dd" size="1" id="from_dd"><option value=""></option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select> 日　～
								<select name="to_yyyy" size="1" id="to_yyyy"><option value=""></option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option></select> 年 <select name="to_mm" size="1" id="to_mm"><option value="" selected="selected"></option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select> 月
								<select name="to_dd" size="1" id="to_dd"><option value=""></option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select> 日まで
								</td>
							</tr>
							<tr>
								<th class="item">開催頻度</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td><input type="radio" value="毎年" name="freq">毎年&nbsp;
								<input type="radio" value="1年に2回" name="freq">1年に2回&nbsp;
								<input type="radio" value="1年に3回以上" name="freq">1年に3回以上&nbsp;
								<input type="radio" value="2年に1回" name="freq">2年に1回&nbsp;
								<input type="radio" value="3年に1回" name="freq">3年に1回&nbsp;<br />
								<input type="radio" value="4年に1回" name="freq">4年に1回&nbsp;
								<input type="radio" value="5年に1回" name="freq">5年に1回&nbsp;
								<input type="radio" value="不定期" name="freq">不定期&nbsp;
								<input type="radio" value="その他" name="freq">その他&nbsp;
								</td>
							</tr>
						</table>
						<h4>業種・取扱品目</h4>
						<table id="registration">
							<tr>
								<th class="item">業種</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td>
									現在、以下の業種が選択されています。<br />
									家具・インテリア用品<br />
									家庭用品、食卓用品、陶磁器等<br />
									<button class="modalInput" rel="#prompt">業種選択</button>
								</td>
							</tr>
							<tr>
								<th class="item">取扱品目</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td><textarea cols="60" rows="3" name="items"></textarea><br />
								300文字以内で、具体的な品目名を記載ください。
								</td>
							</tr>
						</table>
							<h4>開催地・会場</h4>
							<table id="registration">
								<tr>
									<th class="item">開催地</th>
									<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
									<td><br /></td>
								</tr>
								<tr>
									<th class="item">会場名</th>
									<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
									<td><input type="text" value="" size="50" name="venue"></td>
							</tr>
							<tr>
								<th class="item">同展示会で使用する面積</th>
								<th class="required"></th>
								<td><input type="text" value="" size="5" name="netarea"> <strong>sqm（NET）</strong><br />
								半角数字で入力して下さい。","(カンマ)は使用しないで下さい。例：1000
								</td>
							</tr>
							<tr>
								<th class="item">会場までの交通手段</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td><input type="text" value="" size="60" name="trafic"><br />
								例：成田空港からA12バスで30分</td>
							</tr>
							<tr>
								<th class="item">入場資格</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td>
								<input name="qualification" value="一般" type="radio">一般&nbsp;
								<input name="qualification" value="ビジネス関係者＆一般" type="radio">ビジネス関係者＆一般&nbsp;
								<input name="qualification" value="ビジネス関係者のみ" type="radio">ビジネス関係者のみ
								</td>
							</tr>
							<tr>
								<th class="item">チケットの入手方法</th>
								<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
								<td><input name="ticket" value="登録の必要なし" type="checkbox">登録の必要なし　<input name="ticket" value="WEBからの事前登録" type="checkbox">WEBからの事前登録　<br /><input name="ticket" value="主催者・日本の照会先へ問い合わせ" type="checkbox">主催者・日本の照会先へ問い合わせ　<input name="ticket" value="当日会場で入手" type="checkbox">当日会場で入手　<br /><input name="ticket" value="その他" type="checkbox">その他　<input name="ticket-other" value="" size="50" type="text">
								<br />複数選択可能
								</td>
							</tr>
							<tr>
								<th class="item">出展申込締切日</th>
								<th class="required"></th>
								<td>
								<select name="deadline_yyyy" size="1" id="deadline_yyyy"><option value=""></option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option></select> 年
								<select name="deadline_mm" size="1" id="deadlinem_mm">
								<option value=""></option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select> 月<option value=""></option>
								<select name="deadline_dd" size="1" id="deadline_dd"><option value=""></option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select> 日</td>
							</tr>
						</table>
						<div class="line_dot"><hr /></div>
						<table width="100%">
							<tr>
								<td width="250px"><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" /></td>
								<td align="right"><img src="/j-messe/images/db/btn-next.gif" alt="次へ" width="180" height="37" class="over" /></td>
							</tr>
						</table>
					</form>
					</div>
				</div>
			</div>
		</div>
	<p class="totop"><a href="?print=1" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a><a href="#header"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /></a></p>
</div>
<!-- /center -->


























</div>
</div>
<!-- /contents -->

<!-- footer -->
<div id="footer">
	<div class="area">

		<ul id="footlink">
			<li class="start"><a href="/privacy/">個人情報保護</a></li>
			<li><a href="/legal/">利用規約・免責事項</a></li>
			<li><a href="/disclosure/">情報公開</a></li>
			<li><a href="/contact/">FAQ/お問い合わせ</a></li>
			<li class="end"><a href="/links/">リンク</a></li>
		</ul>
		<p id="copyright">Copyright (C) 1995-2011 Japan External Trade Organization(JETRO). All rights reserved.</p>
	</div>
</div>

<!-- select_industries dialog -->
<div class="modal" id="prompt">
	<a class="close" id="btn_close"></a>
	<h2>業種選択 <span>業種は6つまで選択できます。</span></h2>
	<form>
<div class="industries clearfix">
<div class="column">
        <h5>総合</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 総合見本市</li>
        </ul>
        <h5>基礎産業</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 農林水産業</li>
        <li><input type="checkbox" value="" name="industries"> 鉱業、エネルギー</li>
        <li><input type="checkbox" value="" name="industries"> 鉱物、土石、ガラス,セラミック</li>
        </ul>
        <h5>建築</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 建築・建設、不動産</li>
        <li><input type="checkbox" value="" name="industries"> 衛生設備、空調、給排水、照明</li>
        <li><input type="checkbox" value="" name="industries"> 公共施設用機器・備品、都市計画</li>

        <li><input type="checkbox" value="" name="industries"> ビル保守管理、営繕、清掃</li>
        </ul>
       <h5>機械・工業技術</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 金属製品、工具、金型</li>

        <li><input type="checkbox" value="" name="industries"> 工作機械・金属加工</li>
        <li><input type="checkbox" value="" name="industries"> 木材加工機械、家具製造機械</li>
        <li><input type="checkbox" value="" name="industries"> マテハン機器、圧力機器</li>
        <li><input type="checkbox" value="" name="industries"> 精密・測定・試験機器</li>
        <li><input type="checkbox" value="" name="industries"> 電気・電子（製品、機器）</li>
        <li><input type="checkbox" value="" name="industries"> その他の産業用機器・設備</li>
        <li><input type="checkbox" value="" name="industries"> 製造・生産技術、品質管理</li>
        <li><input type="checkbox" value="" name="industries"> 先端技術、新素材、合成物、R&amp;D</li>
        </ul>
        <h5>情報・通信</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 通信、情報処理、コンピュータ</li>
        <li><input type="checkbox" value="" name="industries"> 光学、光工学、レーザー技術・機器</li>
        <li><input type="checkbox" value="" name="industries"> 事務用品・機器、OA機器</li>
        <li><input type="checkbox" value="" name="industries"> 新聞、放送、映像（映画、フォト）</li>
        </ul>

</div>

<div class="column">
        <h5>輸送・物流・包装</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 自動車（部品・製造関連機器含む）</li>
        <li><input type="checkbox" value="" name="industries"> 自動車補修・サービス用品</li>
        <li><input type="checkbox" value="" name="industries"> 自転車、自動二輪車（部品含む）</li>
        <li><input type="checkbox" value="" name="industries"> 海運、造船、港湾関連機器</li>
        <li><input type="checkbox" value="" name="industries"> ボート、ボート用品、各種小型船舶</li>
        <li><input type="checkbox" value="" name="industries"> 航空・宇宙関連機器、設備</li>
        <li><input type="checkbox" value="" name="industries"> 鉄道、その他の輸送用機器、交通</li>
        <li><input type="checkbox" value="" name="industries"> 物流、貯蔵、保蔵</li>
        <li><input type="checkbox" value="" name="industries"> 包装（資材、関連機器）</li>

        </ul>

        <h5>医療・健康</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 医療・病院用機器、医療技術</li>

        <li><input type="checkbox" value="" name="industries"> 歯科用・眼科用機器・用品</li>
        <li><input type="checkbox" value="" name="industries"> 福祉・介護・リハビリ用機器・用具</li>
        <li><input type="checkbox" value="" name="industries"> 医薬品、製薬・製剤、薬学</li>
        <li><input type="checkbox" value="" name="industries"> ヘルスケア、保健産業、保健用品</li>
        <li><input type="checkbox" value="" name="industries"> フィットネス</li>
        </ul>
        <h5>サービス</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> ホテル、レストラン、ケータリング</li>
        <li><input type="checkbox" value="" name="industries"> 店舗用設備・機器、ディスプレイ</li>
        <li><input type="checkbox" value="" name="industries"> 広告、マーケティング、経営管理</li>
        <li><input type="checkbox" value="" name="industries"> 金融、保険、財務</li>
        <li><input type="checkbox" value="" name="industries"> 流通業、フランチャイズビジネス</li>
        <li><input type="checkbox" value="" name="industries"> 流通業、フランチャイズビジネス</li>
        <li><input type="checkbox" value="" name="industries"> デザイン(工業デザイン）</li>
        <li><input type="checkbox" value="" name="industries"> 見本市・コンベンション産業関連</li>
        </ul>
                <h5>その他</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> その他</li>
        </ul>
</div>

<div class="column">
        <h5>生活</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 食・飲料、食品加工</li>
        <li><input type="checkbox" value="" name="industries"> 皮革（素材、製品、機器）、履物</li>
        <li><input type="checkbox" value="" name="industries"> 繊維・衣料（素材、製品、機器）</li>
        <li><input type="checkbox" value="" name="industries"> 紙・紙製品、製紙機械、印刷・出版</li>
        <li><input type="checkbox" value="" name="industries"> 家具・インテリア用品</li>
        <li><input type="checkbox" value="" name="industries"> 家庭用品、食卓用品、陶磁器等</li>
        <li><input type="checkbox" value="" name="industries"> ギフト用品、手工芸品、販促用品</li>
        <li><input type="checkbox" value="" name="industries"> 時計、カメラ</li>
        <li><input type="checkbox" value="" name="industries"> 宝石、貴金属、アクセサリー</li>
        <li><input type="checkbox" value="" name="industries"> 化粧品、美容関連用品、香水</li>
        <li><input type="checkbox" value="" name="industries"> 子供用品、ベビー用品</li>
        <li><input type="checkbox" value="" name="industries"> ランドリー、染色</li>
        <li><input type="checkbox" value="" name="industries"> 防災、警備、消防、防衛</li>
        <li><input type="checkbox" value="" name="industries"> 冠婚葬祭、宗教関連</li>
        </ul>
        <h5>趣味・教育</h5>
        <ul>
        <li><input type="checkbox" value="" name="industries"> 音楽（楽器、音盤、楽譜等）</li>
        <li><input type="checkbox" value="" name="industries"> 玩具、遊戯用具、ゲーム用品</li>
        <li><input type="checkbox" value="" name="industries"> 趣味、DIY</li>
        <li><input type="checkbox" value="" name="industries"> スポーツ(用品・施設)</li>
        <li><input type="checkbox" value="" name="industries"> アミューズメント（機器・施設）</li>
        <li><input type="checkbox" value="" name="industries"> 教育・訓練、学校用品、文房具</li>
        <li><input type="checkbox" value="" name="industries"> 書籍（ブックフェア）、図書館設備</li>
        <li><input type="checkbox" value="" name="industries"> 美術工芸品、骨董品</li>
        <li><input type="checkbox" value="" name="industries"> 観光・旅行（施設、用品等含む）</li>
        <li><input type="checkbox" value="" name="industries"> ペット</li>
        <li><input type="checkbox" value="" name="industries"> 園芸・造園</li>
        </ul>
	</div>
</div>
	<div class="btn">
		<button type="submit"> 選択終了 </button>
		<button type="button" class="close"> キャンセル </button>
	</div>
	</form>
	<br />

</div>
<script>
$(document).ready(function() {

var triggers = $(".modalInput").overlay({

	// some mask tweaks suitable for modal dialogs
	mask: {
		color: '#ebecff',
		loadSpeed: 200,
		opacity: 0.9
	},
	top: 20,
	close:null,
	closeOnClick: true
});

$("#prompt form").submit(function(e) {

	// close the overlay
	triggers.eq(1).overlay().close();

	// get user input
	var input = $("input", this).val();

	// do something with the answer
	triggers.eq(1).html(input);

	// do not submit the form
	return e.preventDefault();
});

});
</script>
<!-- /select industries dialog -->
<!-- form_script -->
<script type="text/javascript" src="/js/jquery/jquery.tools.min.js"></script>
<script src="/j-messe/js/j-messe-form.js" type="text/javascript" charset="utf-8"></script>
<!-- /form_script -->
<!-- footer_script -->
<script src="http://search.jetro.go.jp/site/js/suggest_ext.js#unitid=ja_all" type="text/javascript" charset=" UTF-8"></script>
<script type="text/javascript" src="/js/galink.js"></script>
<script type="text/javascript" src="/js/matc.js"></script>
<script type="text/javascript" src="/js/gatrack.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<!-- /footer_script -->
<!-- /footer -->

</body></html>