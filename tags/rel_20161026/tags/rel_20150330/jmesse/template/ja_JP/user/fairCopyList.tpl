<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
{include file="user/header.tpl"}
<title>見本市修正登録選択一覧 - 世界の見本市・展示会 - ジェトロ</title>
</head>

<body class="layout-LC highlight-match j-messe">

	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
			<li>登録済み見本市修正登録一覧</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">

		<div class="area">
			<!-- left -->
			{$app_ne.left_menu}
			<!-- /left -->

			<!-- center -->
			<div id="center">
				<div id="main">
					<div class="bgbox_set">
						<div class="bgbox_base">
							<div class="h1">
								<h1>見本市・展示会データベース（J-messe)</h1>
							</div>
							<div class="h2">
								<h2>見本市修正登録選択一覧</h2>
							</div>
							<div class="in_main">
								<p class="t_right">ユーザー：{$session.email}</p>
								<p>
									過去に登録した見本市情報をコピーして、新規の見本市情報として登録します。<br />
									<strong><span class="red">元にする見本市を選択してください。</span></strong>
								</p>
								<h4>登録済みの見本市一覧</h4>
								<p>総件数：{$app.cnt}件</p>
								{section name=it loop=$app.fair_list}
								{if (0 == $smarty.section.it.index%2)}
								<div class="list0">
								{else}
								<div class="list1">
								{/if}
									<dl>
										<dt style="word-break: break-all;">
											<a href="{$config.url}?action_user_fairDetail=true&mode=p&mihon_no={$app.fair_list[it].mihon_no}">
											{if ('' != $app.fair_list[it].abbrev_title)}
											{$app.fair_list[it].abbrev_title} -
											{/if}
											{$app.fair_list[it].fair_title_jp}
											</a>
										</dt>
										<dd style="word-break: break-all;">
											{$app.fair_list[it].date_from_yyyy}年{$app.fair_list[it].date_from_mm}月{$app.fair_list[it].date_from_dd}日～{$app.fair_list[it].date_to_yyyy}年{$app.fair_list[it].date_to_mm}月{$app.fair_list[it].date_to_dd}日<br />
											{if $app.fair_list[it].city_name == ""}Other({$app.fair_list[it].other_city_jp}){else}{$app.fair_list[it].city_name}{/if} / {$app.fair_list[it].country_name} / {$app.fair_list[it].region_name}<br />
											{$app.fair_list[it].exhibits_jp|replace:'&lt;br/&gt;':'<br/>'}
										</dd>
									</dl>
								</div>
								{/section}

							</div>
						</div>
					</div>
				</div>
				<p class="totop">
					<a href="{$config.url}?action_user_fairCopyList=true&print=1" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
					<a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /></a>
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