<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
{include file="user/enHeader.tpl"}
<title>Registration of New Trade Fair Info - Online Trade Fair Database (J-messe) - JETRO</title>
</head>

<body class="layout-LC highlight-database j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<ul class="clearfix">
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
			<li>Coping registered information</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2">
				<h2>Registration of New Trade Fair Info</h2>
			</div>
			<div class="in_main">
				<p class="t_right">User：{$session.email}</p>
				<p>
					You can register new trade fair information here by copying previously recorded information from My Trade Fair List.<br />
					Click the fair title which you would like to copy.<br />
				</p>
				<h4>My Trade Fair List</h4>
				<p>Result：{$app.cnt}</p>
				{section name=it loop=$app.fair_list}
				{if (0 == $smarty.section.it.index%2)}
				<div class="list0">
				{else}
				<div class="list1">
				{/if}
					<dl>
						<dt style="word-break: break-all;">
							<a href="{$config.url}?action_user_enFairDetail=true&mode=p&mihon_no={$app.fair_list[it].mihon_no}">
							{if ('' != $app.fair_list[it].abbrev_title)}
							{$app.fair_list[it].abbrev_title} -
							{/if}
							{$app.fair_list[it].fair_title_en}
							</a>
						</dt>
						<dd style="word-break: break-all;">
							{$app.fair_list[it].date_from_format} to {$app.fair_list[it].date_to_format}<br />
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
		{$app_ne.left_menu}
		<!-- /submenu -->
	</div>
	<!-- /contents -->
	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->
</body>
</html>