<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="include_common_head.tpl"}
<meta name="Keywords" content="trade fair database,trade show database,exhibition database,trade fair search,trade show search,exhibition search,trade show  Japan,trade fair  Japan,exhibition  Japan,trade fair worldwide,{$app.meta_keyword}" />
<script type="text/javascript">
<!--
{literal}
	function search(form_name) {
		document.getElementById(form_name).submit();
	}

	function dosort(url) {
		var sort = document.getElementById('sort').options[document.getElementById('sort').selectedIndex].value;
		if ('' != sort) {
			document.location.href = url + "&sort=" + sort;
		}
	}

	function resetAll() {
		document.getElementById('keyword').value = '';
		var i = 0;
		if (null != document.getElementsByName('check_main_industory[]')) {
			for (i = 0; i < document.getElementsByName('check_main_industory[]').length; i++) {
				document.getElementsByName('check_main_industory[]')[i].checked = false;
			}
		}
		if (null != document.getElementsByName('check_sub_industory[]')) {
			for (i = 0; i < document.getElementsByName('check_sub_industory[]').length; i++) {
				document.getElementsByName('check_sub_industory[]')[i].checked = false;
			}
		}
		if (null != document.getElementsByName('check_region[]')) {
			for (i = 0; i < document.getElementsByName('check_region[]').length; i++) {
				document.getElementsByName('check_region[]')[i].checked = false;
			}
		}
		if (null != document.getElementsByName('check_country[]')) {
			for (i = 0; i < document.getElementsByName('check_country[]').length; i++) {
				document.getElementsByName('check_country[]')[i].checked = false;
			}
		}
		if (null != document.getElementsByName('check_city[]')) {
			for (i = 0; i < document.getElementsByName('check_city[]').length; i++) {
				document.getElementsByName('check_city[]')[i].checked = false;
			}
		}
	}
{/literal}
// -->
</script>
<title>
	{if ('1' == $form.all)}
		All Online Trade Fair Database (J-messe) - JETRO
	{elseif ('1' == $form.detail)}
		Trade Fairs held in Japan and the World - Online Trade Fair Database (J-messe) - JETRO
	{else}
		{if ('i1' == $form.type || 'i2' == $form.type)}
			{$app.title} - Trade Fairs held in Japan and the World - Online Trade Fair Database (J-messe) - JETRO
		{elseif ('v1' == $form.type || 'v2' == $form.type || 'v3' == $form.type)}
			{$app.title} - Online Trade Fair Database (J-messe) - JETRO
		{/if}
	{/if}
</title>
{include file="jetro_gtm_snippet.tpl"}
</head>
{if ('1' == $form.detail)}
<body class="layout-C" id="PageTop" onload="init('{$config.url_pub}', '{$form.select_region}', '{$form.select_country}', '{$form.select_city}')">
{else}
<body class="layout-C" id="PageTop" >
{/if}

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="http://www.jetro.go.jp/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					{if ('1' != $form.all)}
						{if ('1' == $form.detail)}
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/tradefair/">Advanced Search</a></li>
							<li>Search Results</li>
						{elseif ('i1' == $form.type)}
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/industry/">By Industry</a></li>
							{if ('' == $form.i_3)}
								<li>{$app.pan_1}</li>
							{else}
								<li><a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$form.i_2}">{$app.pan_1}</a></li>
								<li>{$app.pan_2}</li>
							{/if}
						{elseif ('v1' == $form.type)}
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/country/">By Country</a></li>
							<li>{$app.pan_1}</li>
						{elseif ('v2' == $form.type)}
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/country/">By Country</a></li>
							{if ('' == $form.v_4)}
								<li><a href="{$config.url_pub}?action_enFairList=true&type=v1&v_2={$form.v_2}">{$app.pan_1}</a></li>
								<li>{$app.pan_2}</li>
							{else}
								<li><a href="{$config.url_pub}?action_enFairList=true&type=v1&v_2={$form.v_2}">{$app.pan_1}</a></li>
								<li><a href="{$config.url_pub}?action_enFairList=true&type=v2&v_2={$form.v_2}&v_3={$form.v_3}">{$app.pan_2}</a></li>
								<li>{$app.pan_3}</li>
							{/if}
						{/if}
					{else}
						<li>Search Results</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('1' == $form.all)}
					<h1>View All</h1>
				{elseif ('1' != $form.detail)}
					{if ('i1' == $form.type)}
						{if ('' == $form.i_3)}
							<h1>{$app.pan_1}</h1>
						{else}
							<h1>{$app.pan_2}</h1>
						{/if}
					{elseif ('v1' == $form.type)}
						<h1>{$app.pan_1}</h1>
					{elseif ('v2' == $form.type)}
						{if ('' == $form.v_4)}
							<h1>{$app.pan_2}</h1>
						{else}
							<h1>{$app.pan_3}</h1>
						{/if}
					{/if}
				{/if}
			</div>
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							{if ('1' == $form.all)}
								<h2>Including Past Trade Fairs View All</h2>
							{else}
								{if ('1' == $form.detail)}
									<h2>Search Results</h2>
								{else}
									{if ('a' != $form.year)}
										<h2>List of Upcoming Trade Fairs and Exhibitions</h2>
									{else}
										<h2>Including Past Trade Fairs View All</h2>
									{/if}
								{/if}
							{/if}
						</div>
						<div class="elem_column_block">
							<div class="color_gray elem_column_block_pad">
								<div class="elem_form_liner">
									<ul>
										<li>
											<div class="elem_paragraph">
												<p class="text">Items per page： </p>
											</div>
										</li>
										<li>
											<div class="elem_paragraph">
												<p class="text">
													{if ('1' == $form.all)}
														<a href="{$config.url_pub}?action_enFairList=true&all=1&page=1&limit=20">20</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&all=1&page=1&limit=50">50</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&all=1&page=1&limit=100">100</a> &nbsp;&nbsp;&nbsp;
													{elseif ('1' == $form.detail)}
														<a href="{$config.url_pub}?action_enFairListSearch=true&detail=1&page=1&limit=20">20</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairListSearch=true&detail=1&page=1&limit=50">50</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairListSearch=true&detail=1&page=1&limit=100">100</a> &nbsp;&nbsp;&nbsp;
													{else}
														<a href="{$config.url_pub}?action_enFairList=true&page=1&limit=20">20</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&page=1&limit=50">50</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&page=1&limit=100">100</a> &nbsp;&nbsp;&nbsp;
													{/if}
												</p>
											</div>
										</li>
										<li>
											<div class="elem_paragraph">
												<p class="text">Sort by:</p>
											</div>
										</li>
										<li>
											<div class="holder var_bg_white" style="background-color:#fff;">
												<select name="sort" id="sort"
													{if ('1' == $form.all)}
													onchange="dosort('{$config.url_pub}?action_enFairList=ture&page=1&all=1')"
													{elseif ('1' == $form.detail)}
													onchange="dosort('{$config.url_pub}?action_enFairListSearch=ture&detail=1&page=1')"
													{else}
													onchange="dosort('{$config.url_pub}?action_enFairList=ture&page=1')"
													{/if}
													>
													<option value="0" {if ('0' == $form.sort || '' == $form.sort)}selected{/if}>Term</option>
													<option value="1" {if ('1' == $form.sort)}selected{/if}>Newest</option>
													<option value="2" {if ('2' == $form.sort)}selected{/if}>Name</option>
													<option value="3" {if ('3' == $form.sort)}selected{/if}>Expected floor size</option>
													<option value="4" {if ('4' == $form.sort)}selected{/if}>Exhibitors(past record)</option>
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
									{if ('1' != $form.detail && '1' != $form.all)}
										<span class="right"><a href="{$config.url_pub}?action_enFairList=true&all=1&page=1" class="icon_arrow">View All</a></span>
									{/if}
								</p>
							{/if}
						</div>
						<div class="elem_paragraph">
							<p class="text">Results {$app.start}-{$app.end} of {$app.total}</p>
						</div>
						<div class="elem_text_list_news">
							{section name=it loop=$app.fair_list}
								<div class="var_ptb10 elem_text_list_news_pad">
									<dl>
										<dd>
											<div class="elem_heading_lv3">
												<h3><a href="{$config.url_pub}tradefair_en/{$app.fair_list[it].detail_url}">{$app.fair_list[it].fair_title_en}</a></h3>
											</div>
											<p>{$app.fair_list[it].date_from_format} to {$app.fair_list[it].date_to_format}</p>
											<p>{$app.fair_list[it].city_name_en} / {$app.fair_list[it].country_name_en} / {$app.fair_list[it].region_name_en}</p>
											<p>{$app.fair_list[it].exhibits_en|replace:'&lt;br/&gt;':'<br/>'}</p>
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
					<!-- **************** detail_search_Menu  **************** -->
					{if ('1' == $form.detail)}
						<!-- 詳細検索 -->
						{include file="enFairMenuDetail.tpl"}
					{else}
						{if ('i1' == $form.type)}
							<!-- 業種小選択 -->
							{include file="enFairMenuIndustory.tpl"}
						{elseif ('v1' == $form.type)}
							<!-- 国選択 -->
							{include file="enFairMenuRegion.tpl"}
						{elseif ('v2' == $form.type)}
							<!-- 都市選択 -->
							{include file="enFairMenuCountry.tpl"}
						{/if}
					{/if}
					<!-- **************** /detail_search_Menu **************** -->
				</div>
			</div>
		</div>
		<!-- **************** jmesse_faqlogin **************** -->
		{$app_ne.jmessefaqlogin}
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
