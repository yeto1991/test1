<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<title>Registration of New Trade Fair Info - Online Trade Fair Database (J-messe) - JETRO</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/en/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
					<li>Copying registered information</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>Registration of New Trade Fair Info</h1>
			</div>

			<div class="elem_paragraph">
				<p class="text right">User：{$session.email}</p>
			</div>

			<div class="elem_paragraph">
				<p class="text">
					You can register new trade fair information here by copying previously recorded information from My Trade Fair List.<br />
					Click the fair title which you would like to copy.<br />
				</p>
			</div>
			<div class="elem_table_basic">
				<div class="elem_table_heading">
					<p><strong>My Trade Fair List</strong></p>
				</div>
				<div class="elem_paragraph">
					<p class="text">
						Result：{$app.cnt}
					</p>
				</div>
				<div class="elem_text_list_news">
					{section name=it loop=$app.fair_list}
						<div class="var_ptb10 elem_text_list_news_pad">
							<dl>
								<dd>
									<div class="elem_heading_lv3">
										<h3>
											<a href="{$config.url}?action_user_enFairDetail=true&mode=p&mihon_no={$app.fair_list[it].mihon_no}">
												{if ('' != $app.fair_list[it].abbrev_title)}
													{$app.fair_list[it].abbrev_title} -
												{/if}
												{$app.fair_list[it].fair_title_en}
											</a>
										</h3>
									</div>
									<p>{$app.fair_list[it].date_from_format} to {$app.fair_list[it].date_to_format}</p>
									<p>
										{if $app.fair_list[it].city_name_en == ""}
											Other({$app.fair_list[it].other_city_en})
										{else}
											{$app.fair_list[it].city_name_en}
										{/if}
										 / {$app.fair_list[it].country_name_en} / {$app.fair_list[it].region_name_en}
									</p>
									<p>{$app.fair_list[it].exhibits_en|replace:'&lt;br/&gt;':'<br/>'}</p>
								</dd>
							</dl>
						</div>
					{/section}
				</div>
			</div>
			<!-- ** include START jetro_ssl_en **  -->
			{include file="user/jetro_ssl_en.tpl"}
			<!-- ** include END jetro_ssl_en **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>

