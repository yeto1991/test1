<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="include_common_head.tpl"}
<meta name="Keywords" content="見本市,展示会,商談会,見本市　検索,展示会　検索,世界の見本市,世界の展示会,{$app.meta_keyword}" />
<script type="text/javascript">
<!--
{literal}
	function dosort(url) {
		var sort = document.getElementById('sort').options[document.getElementById('sort').selectedIndex].value;
		if ('' != sort) {
			document.location.href = url + "&sort=" + sort;
		}
	}
{/literal}
// -->
</script>
<title>
	{$app.title}
</title>
{include file="jetro_gtm_snippet.tpl"}
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
					<li>{$app.title}</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>{$app.pan_1}</h1>
			</div>
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							{if ('1' == $form.all)}
								<h2>過去のものを含む見本市・展示会一覧</h2>
							{else}
								<h2>これから開催される見本市・展示会一覧</h2>
							{/if}
						</div>
						<div class="elem_column_block">
							<div class="color_gray elem_column_block_pad">
								<div class="elem_form_liner">
									<ul>
										<li>
											<div class="elem_paragraph">
												<p class="text">表示件数： </p>
											</div>
										</li>
										<li>
											<div class="elem_paragraph">
												<p class="text">
													{if ('1' == $form.all)}
														{if ('' != $form.op)}
															{if (('E' == $form.op) || ('A' == $form.op)) }
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&all={$form.all}&page=1&limit=20">20件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&all={$form.all}&page=1&limit=50">50件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&all={$form.all}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
															{elseif (('NHK' == $form.op) || ('HK' == $form.op)) }
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&all={$form.all}&page=1&limit=20">20件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&all={$form.all}&page=1&limit=50">50件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&all={$form.all}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
															{/if}
														{elseif ('' != $form.hc)}
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&all={$form.all}&page=1&limit=20">20件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&all={$form.all}&page=1&limit=50">50件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&all={$form.all}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
														{elseif ('' != $form.ha)}
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&all={$form.all}&page=1&limit=20">20件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&all={$form.all}&page=1&limit=50">50件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&all={$form.all}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
														{/if}
													{else}
														{if ('' != $form.op)}
															{if (('E' == $form.op) || ('A' == $form.op)) }
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&page=1&limit=20">20件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&page=1&limit=50">50件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
															{elseif (('NHK' == $form.op) || ('HK' == $form.op)) }
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&page=1&limit=20">20件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&page=1&limit=50">50件</a>&nbsp;&nbsp;
																<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
															{/if}
														{elseif ('' != $form.hc)}
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&page=1&limit=20">20件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&page=1&limit=50">50件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
														{elseif ('' != $form.ha)}
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&page=1&limit=20">20件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&page=1&limit=50">50件</a>&nbsp;&nbsp;
															<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&page=1&limit=100">100件</a>&nbsp;&nbsp;&nbsp;
														{/if}
													{/if}
												</p>
											</div>
										</li>
										<li>
											<div class="elem_paragraph">
												<p class="text">並び順:</p>
											</div>
										</li>
										<li>
											<div class="holder var_bg_white" style="background-color:#fff;">
												<select name="sort" id="sort"
													{if ('1' == $form.all)}
														{if ('' != $form.op)}
															{if (('E' == $form.op) || ('A' == $form.op)) }
																onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&page=1&all=1')"
															{elseif (('NHK' == $form.op) || ('HK' == $form.op)) }
																onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&page=1&all=1')"
															{/if}
														{elseif ('' != $form.hc)}
															onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&page=1&all=1')"
														{elseif ('' != $form.ha)}
															onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&page=1&all=1')"
														{/if}
													{else}
														{if ('' != $form.op)}
															{if (('E' == $form.op) || ('A' == $form.op)) }
																onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&page=1')"
															{elseif (('NHK' == $form.op) || ('HK' == $form.op)) }
																onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&page=1')"
															{/if}
														{elseif ('' != $form.hc)}
															onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&page=1')"
														{elseif ('' != $form.ha)}
															onchange="dosort('{$config.url_pub}?action_fairSearchIHList=ture&type={$form.type}&ind={$form.ind}&ha={$form.ha}&page=1')"
														{/if}
													{/if}
												>
													<option value="0" {if ('0' == $form.sort || '' == $form.sort)}selected{/if}>会期順</option>
													<option value="1" {if ('1' == $form.sort)}selected{/if}>新着順</option>
													<option value="2" {if ('2' == $form.sort)}selected{/if}>名称順</option>
													<option value="3" {if ('3' == $form.sort)}selected{/if}>展示予定面積順</option>
													<option value="4" {if ('4' == $form.sort)}selected{/if}>過去の出展社数順</option>
												</select>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="elem_paragraph">
							{if ('1' != $form.all)}
								<p class="text right">
								{if ('' != $form.op)}
									{if (('E' == $form.op) || ('A' == $form.op)) }
										<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&op={$form.op}&all=1&page=1" class="icon_arrow">すべての見本市・展示会</a>
									{elseif (('NHK' == $form.op) || ('HK' == $form.op)) }
										<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&op={$form.op}&all=1&page=1" class="icon_arrow">すべての見本市・展示会</a>
									{/if}
								{elseif ('' != $form.hc)}
									<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&hc={$form.hc}&all=1&page=1" class="icon_arrow">すべての見本市・展示会</a>
								{elseif ('' != $form.ha)}
									<a href="{$config.url_pub}?action_fairSearchIHList=true&type={$form.type}&ind={$form.ind}&ha={$form.ha}&all=1&page=1" class="icon_arrow">すべての見本市・展示会</a>
								{/if}
								</p>
							{/if}
						</div>
						<div class="elem_paragraph">
							<p class="text">{$app.total}件中 {$app.start}から{$app.end}件目</p>
						</div>
						<div class="elem_text_list_news">
							{section name=it loop=$app.fair_list}
								<div class="var_ptb10 elem_text_list_news_pad">
									<dl>
										<dd>
											<div class="elem_heading_lv3">
												<h3><a href="{$config.url_pub}tradefair/{$app.fair_list[it].detail_url}">{$app.fair_list[it].fair_title_jp}</a></h3>
											</div>
											<p>{$app.fair_list[it].date_from_yyyy}年{$app.fair_list[it].date_from_mm}月{$app.fair_list[it].date_from_dd}日～{$app.fair_list[it].date_to_yyyy}年{$app.fair_list[it].date_to_mm}月{$app.fair_list[it].date_to_dd}日</p>
											<p>{$app.fair_list[it].city_name} / {$app.fair_list[it].country_name} / {$app.fair_list[it].region_name}</p>
											<p>{$app.fair_list[it].exhibits_jp|replace:'&lt;br/&gt;':'<br/>'}</p>
										</dd>

									</dl>
								</div>
							{/section}
						</div>
						<div class="elem_pagination">
							<ul>
								{$app_ne.pager}<br/>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- **************** jmesse_faqlogin **************** -->
			{$app_ne.jmessefaqlogin}
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
