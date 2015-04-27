<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<title>見本市修正登録選択一覧 - 世界の見本市・展示会 - ジェトロ</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="http://www.jetro.go.jp/indexj.html"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">見本市・展示会データベース（J-messe）</a></li>
					<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
					<li>登録済み見本市修正登録一覧</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>見本市修正登録選択一覧</h1>
			</div>

			<div class="elem_paragraph">
				<p class="text right">ユーザー：{$session.email}</p>
			</div>

			<div class="elem_paragraph">
				<p class="text">
					過去に登録した見本市情報をコピーして、新規の見本市情報として登録します。<br />
					<strong><font color="red">元にする見本市を選択してください。</font></strong>
				</p>
			</div>
			<div class="elem_table_basic">
				<div class="elem_table_heading">
					<p><strong>登録済みの見本市一覧</strong></p>
				</div>
				<div class="elem_paragraph">
					<p class="text">
						総件数：{$app.cnt}件
					</p>
				</div>
				<div class="elem_text_list_news">
					{section name=it loop=$app.fair_list}
						<div class="var_ptb10 elem_text_list_news_pad">
							<dl>
								<dd>
									<div class="elem_heading_lv3">
										<h3>
											<a href="{$config.url}?action_user_fairDetail=true&mode=p&mihon_no={$app.fair_list[it].mihon_no}">
												{if ('' != $app.fair_list[it].abbrev_title)}
													{$app.fair_list[it].abbrev_title} -
												{/if}
												{$app.fair_list[it].fair_title_jp}
											</a>
										</h3>
									</div>
									<p>{$app.fair_list[it].date_from_yyyy}年{$app.fair_list[it].date_from_mm}月{$app.fair_list[it].date_from_dd}日～{$app.fair_list[it].date_to_yyyy}年{$app.fair_list[it].date_to_mm}月{$app.fair_list[it].date_to_dd}日</p>
									<p>
										{if $app.fair_list[it].city_name == ""}
											Other({$app.fair_list[it].other_city_jp})
										{else}
											{$app.fair_list[it].city_name}
										{/if}
										 / {$app.fair_list[it].country_name} / {$app.fair_list[it].region_name}
									</p>
									<p>{$app.fair_list[it].exhibits_jp|replace:'&lt;br/&gt;':'<br/>'}</p>
								</dd>
							</dl>
						</div>
					{/section}
				</div>
			</div>
			<!-- ** include START jetro_ssl_ja **  -->
			{include file="user/jetro_ssl_ja.tpl"}
			<!-- ** include END jetro_ssl_ja **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>

