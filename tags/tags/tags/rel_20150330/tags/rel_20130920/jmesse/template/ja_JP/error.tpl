<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
{include file="header.tpl"}
<title>世界の見本市・展示会 - ジェトロ</title>
</head>

<body class="layout-LC highlight-match j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li>見本市・展示会データベース（J-messe）</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">

		<div class="area">
			<!-- left -->
			<div id="left">
				<div class="bgbox_set">
					<p id="title">
						<a href="http://www.jetro.go.jp/j-messe/">見本市・展示会データベース</a>
					</p>
					<div class="bgbox_base">
						<div class="bgbox_in">
							<div class="submenu no_border">
								<ul class="navi">
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/industry/">業種別に見る</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/country/">開催地別に見る</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/tradefair/">詳細検索</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/new-additions/">新着見本市</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/ranking/">月間ランキング</a></li>
								</ul>
								<ul class="navi">
									<li class="lv01_label">出展お役立ち情報</li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/j-messe/w-info/">見本市レポート</a></li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/services/tradefair/">出展支援</a></li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/j-messe/center/">世界の展示会場</a></li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/j-messe/business/">世界の見本市ビジネス動向</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="j-messe_left">
					<div class="wrap">
						<dl>
							<dt><img src="/j-messe/images/title-left-organizer.gif" alt="主催者様へ" width="150" height="32" /></dt>
							<dd>J-messeの「見本市・展示会データベース」に見本市の情報を登録できます。<br />
								<strong class="orange">登録は無料！</strong><br />
								ぜひご登録いただき、PRにご活用ください。<br />
								<a href="https://www.jetro.go.jp/j-messe/?action_user_login=true"><img src="/j-messe/images/btn_regist.gif" alt="見本市を登録する" width="140" height="63" class="padding_l05 margin_t10" /></a></dd>
						</dl>
					</div>
					<div class="wrap">
						<dl>
							<dt><img src="/j-messe/images/title-left-inquiry.gif" alt="お問い合わせ" width="150" height="26" /></dt>
							<dd>本コーナーに関するお問い合わせ・ご意見・ご感想はこちらまで<br />
								<a href="javascript:jetro_open_win600('https://www.jetro.go.jp/form5/pub/faa/inquiry_j');"><img src="/j-messe/images/btn_inquiry.gif" alt="お問い合わせフォーム" width="140" height="25" class="over padding_l05 margin_tb10" /></a><br />
								ジェトロ展示事業課<br />
								（TEL：03-3582-5541）</dd>
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

							<div class="h1">
								<h1>見本市・展示会データベース</h1>
							</div>

							<div class="h2">
								<h2>世界の見本市・展示会</h2>
							</div>

							<div class="in_main">
								<h3>
									システムエラー
								</h3>

								{if count($errors)}
								<p>下記の理由のため、ページを表示できません。</p>
								<ul>
								{foreach from=$errors item=error}
									<li>{$error}</li>
								{/foreach}
								</ul>
								{/if}

								<p>お手数ですが、世界の見本市・展示会データベーストップページから、該当するページをお探しください。</p>

								<ul class="icon_arrow">
									<li><a href="/j-messe/">世界の見本市・展示会データベーストップページに戻る</a></li>
									<li><a href="/indexj.html">日本語トップページに戻る</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
				<p class="totop">
					<a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /> </a>
				</p>
			</div>
			<!-- /center -->

		</div>
	</div>
	<!-- /contents -->

	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->

</body>
</html>
