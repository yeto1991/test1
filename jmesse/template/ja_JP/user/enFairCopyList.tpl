<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />

<title>My fairs list for copy registration - Online Trade Fair Database (J-messe) - JETRO</title>

<!--テスト用-->
<base href="http://produce.jetro.go.jp" />
<!--/テスト用-->
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<link href="/css/en/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/en/database/j-messe/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/en/printmedia.css" rel="stylesheet" type="text/css" media="print" />
{if ('1' == $form.print)}
<link href="/css/jp/print.css" rel="stylesheet" type="text/css" media="all" />
{/if}
<!--以下のCSSは最終的に削除します-->
<link href="/css/en/parts/newmodule.css" rel="stylesheet" type="text/css" media="all" />
<!--/-->
<script type="text/javascript" src="{$config.url_pub}/js/j-messe_enInclude.js"></script>
</head>

<body class="layout-LC highlight-database j-messe">
	<!-- header -->
	<div id="include_header"></div>
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<ul class="clearfix">
			<li><a href="/indexj.html">HOME</a></li>
			<li><a href="/database/">引き合い・展示会検索</a></li>
			<li><a href="/en/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			<li><a href="/en/j-messe/tradefair/">Trade Fairs held in Japan and the World</a></li>
			<li><a href="/database/j-messe/tradefair/">My Menu</a></li>
			<li>My fairs list for copy registration</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2">
				<h2>My fairs list for copy registration</h2>
			</div>
			<div class="in_main">
				<p class="t_right">User：{$session.email}</p>
				<p>
					You can regist new fair by copying registed fair informations.<br />
					<strong><span class="red">Please press fair title's link for copy registration.</span></strong>
				</p>
				<h4>My fairs list</h4>
				<p>Result：{$app.cnt}</p>
				{section name=it loop=$app.fair_list}
				{if (0 == $smarty.section.it.index%2)}
				<div class="list0">
				{else}
				<div class="list1">
				{/if}
					<dl>
						<dt>
							<a href="{$config.url}?action_user_enFairDetail=true&mode=p&mihon_no={$app.fair_list[it].mihon_no}">
							{if ('' != $app.fair_list[it].abbrev_title)}
							{$app.fair_list[it].abbrev_title} -
							{/if}
							{$app.fair_list[it].fair_title_en}
							</a>
						</dt>
						<dd>
							{$app.fair_list[it].date_from_dd}-{$app.fair_list[it].date_from_mm}-{$app.fair_list[it].date_from_yyyy}～{$app.fair_list[it].date_to_dd}-{$app.fair_list[it].date_to_mm}-{$app.fair_list[it].date_to_yyyy}<br />
							{if $app.fair_list[it].city_name_en == ""}Other({$app.fair_list[it].other_city_en}){else}{$app.fair_list[it].city_name_en}{/if} / {$app.fair_list[it].country_name_en} / {$app.fair_list[it].region_name_en}<br />
							{$app.fair_list[it].exhibits_en|replace:'&lt;br/&gt;':'<br/>'}
						</dd>
					</dl>
				</div>
				{/section}
			</div>
			<p class="totop">
				<a href="{$config.url}?action_user_enFairCopyList=true&print=1" target="print"><img src="/images/en/btn-print.gif"  alt="Print" height="14" width="46" /></a>
				<a href="javascript:window.scrollTo(0, 0);"><img src="/images/en/totop.gif" alt="Return to PAGETOP" width="103" height="14" /></a>
			</p>
		</div>
		<!-- /main -->
		<!-- submenu -->
		<div id="include_left_menu"></div>
		<!-- /submenu -->
	</div>
	<!-- /contents -->
	<!-- footer -->
	<div id="include_footer"></div>
	<!-- /footer -->
</body>
</html>