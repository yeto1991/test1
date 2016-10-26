<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
{include file="enHeader.tpl"}
<title>error page</title>

<body class="layout-LC highlight-database j-messe">

	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul class="clearfix">
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li>Online Trade Fair Database (J-messe)</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2">
				<h2>Trade Fairs held in Japan and the World</h2>
			</div>
			<div class="in_main">

				<h3>
					System error
				</h3>
				{if count($errors)}
				<p>For the following reasons, can not display the page.</p>
				<ul>
				{foreach from=$errors item=error}
					<li>{$error}</li>
				{/foreach}
				</ul>
				{/if}

				<p>Close this trade fairs and exhibitions from the world's top database, please locate your pages.</p>
				<ul class="icon_arrow">
					<li><a href="/en/database/j-messe/">Back to Top Database of World Trade Fair.</a></li>
					<li><a href="/">English Back to top.</a></li>
				</ul>

			</div>
			<p class="totop">
				<a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /> </a>
			</p>
		</div>
		<!-- /main -->

		<!-- submenu -->
		<div id="submenu">
			<div class="submenu_box">
				<div class="submenu_box_inside">
					<p class="menu_title"><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database</a></p>
					<div class="menu_content">
						<ul>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/industry/">By Industry</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/country/">By Country</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/tradefair/">Advanced Search</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/new-additions/">Recently Added</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/ranking/">Monthly Ranking</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/faq/">FAQ</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/report/">Special Reports on Major Trade Shows in Japan</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/center/">Major Exhibition Sites</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/links/">Related Links</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="direct_inquiries">
				<div id="direct_inquiries_inside">
					<p><strong>For Organaizers</strong><br />
						Register Your Trade Show <strong class="red">For Free</strong>!</p>
					<p><a href="https://www.jetro.go.jp/j-messe/?action_user_enLogin=true"><img src="/en/database/j-messe/images/btn_registration.gif" width="138" height="63" /></a></p>
				</div>
			</div>
			<div id="direct_inquiries">
				<div id="direct_inquiries_inside">
					<p><strong>Inquiries to Online Trade Fair Database J-messe</strong></p>
					<ul>
						<li><a href="/en/database/j-messe/faq/">FAQ</a></li>
						<li><a href="javascript:jetro_open_win600('https://www.jetro.go.jp/form5/pub/faa/inquiry_en');" class="icon_arrow">Inquiry form</a></li>
					</ul>
					<p>(Trade Fair Division, JETRO)</p>
				</div>
			</div>
		</div>
		<!-- /submenu -->

	</div>
	<!-- /contents -->

	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->

</body>
</html>
