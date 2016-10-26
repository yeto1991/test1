<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="見本市、展示会、商談会、{$app.meta_keyword}" />
{include file="enHeader.tpl"}
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
</head>

{if ('1' == $form.detail)}
<body class="layout-LC highlight-match  j-messe" onload="init('{$config.url_pub}', '{$form.select_region}', '{$form.select_country}', '{$form.select_city}')">
{else}
<body class="layout-LC highlight-match  j-messe">
{/if}
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<ul class="clearfix">
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			{if ('1' != $form.all)}
				{if ('1' == $form.detail)}
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/tradefair/">Trade Fair Search</a></li>
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
	<!-- /bread -->
	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2">
				<h2>Trade Fairs held in Japan and the World </h2>
			</div>
			<div class="in_main">
				{if ('1' == $form.all)}
					<h3>View All</h3>
				{elseif ('1' != $form.detail)}
					{if ('i1' == $form.type)}
						{if ('' == $form.i_3)}
							<h3>{$app.pan_1}</h3>
						{else}
							<h3>{$app.pan_2}</h3>
						{/if}
					{elseif ('v1' == $form.type)}
						<h3>{$app.pan_1}</h3>
					{elseif ('v2' == $form.type)}
						{if ('' == $form.v_4)}
							<h3>{$app.pan_2}</h3>
						{else}
							<h3>{$app.pan_3}</h3>
						{/if}
					{/if}
				{/if}
				<div id="skip_menu"><a href="#right">Skip to search refinement</a></div>
				<!-- list of tradefairs -->
				<div class="left" id="list">
					<div class="h4 clearfix">
						{if ('1' == $form.all)}
						<h4>Including Past Trade Fairs View All</h4>
						{else}
							{if ('1' == $form.detail)}
						<h4>Search Results</h4>
							{else}
								{if ('a' != $form.year)}
						<h4>List of Upcoming Trade Fairs and Exhibitions</h4>
								{else}
						<h4>Including Past Trade Fairs View All</h4>
								{/if}
							{/if}
						{/if}
						{if ('1' != $form.detail && '1' != $form.all)}
						<span class="right"><a href="{$config.url_pub}?action_enFairList=true&all=1&page=1" class="icon_arrow">View All</a></span>
						{/if}
					</div>
					<p class="t_right">
						{if ('1' == $form.all)}
						Items per page：<a href="{$config.url_pub}?action_enFairList=true&all=1&page=1&limit=20">20</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&all=1&page=1&limit=50">50</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&all=1&page=1&limit=100">100</a> &nbsp;&nbsp;&nbsp;
						{elseif ('1' == $form.detail)}
						Items per page：<a href="{$config.url_pub}?action_enFairListSearch=true&detail=1&page=1&limit=20">20</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairListSearch=true&detail=1&page=1&limit=50">50</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairListSearch=true&detail=1&page=1&limit=100">100</a> &nbsp;&nbsp;&nbsp;
						{else}
						Items per page：<a href="{$config.url_pub}?action_enFairList=true&page=1&limit=20">20</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&page=1&limit=50">50</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_enFairList=true&page=1&limit=100">100</a> &nbsp;&nbsp;&nbsp;
						{/if}
						Sort by:
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
							<option value="3" {if ('3' == $form.sort)}selected{/if}>floor size</option>
						</select>
					</p>
					<p>Results {$app.start}-{$app.end} of {$app.total}</p>
					<p class="number">
						{$app_ne.pager}<br/>
					</p>
					{section name=it loop=$app.fair_list}
					{if (0 == $smarty.section.it.index%2)}
					<div class="list0">
					{else}
					<div class="list1">
					{/if}
						<dl>
							<dt style="word-break: break-all;">
								<a href="{$config.url_pub}tradefair_en/{$app.fair_list[it].detail_url}">{$app.fair_list[it].fair_title_en}</a>
							</dt>
							<dd style="word-break: break-all;">
								{$app.fair_list[it].date_from_format} to {$app.fair_list[it].date_to_format}<br />
								{$app.fair_list[it].city_name_en} / {$app.fair_list[it].country_name_en} / {$app.fair_list[it].region_name_en}<br />
								{$app.fair_list[it].exhibits_en|replace:'&lt;br/&gt;':'<br/>'}
							</dd>
						</dl>
					</div>
					{/section}
					<p class="number">
						{$app_ne.pager}<br/>
					</p>
				</div>
				<!-- /result -->
				<!-- breakdown -->
				{if ('1' == $form.detail)}
					<!-- 詳細検索 -->
					{include file="enFairMenuDetail.tpl"}
				{else}
					{if ('i1' == $form.type)}
						<!-- 業種選択 -->
						{include file="enFairMenuIndustory.tpl"}
					{elseif ('v1' == $form.type)}
						<!-- 地域選択 -->
						{include file="enFairMenuRegion.tpl"}
					{elseif ('v2' == $form.type)}
						<!-- 国・地域選択 -->
						{include file="enFairMenuCountry.tpl"}
					{/if}
				{/if}
				<!-- /breakdown -->
			</div>
			<p class="totop">
				{if ('1' == $form.all)}
		{*			<a href="{$config.url_pub}?action_enFairListDownload=true&all=1"><img src="/images/jp/btn-print.gif" alt="CSVdownload" height="23" width="71" /></a> *}
					<a href="javascript:window.open('{$config.url_pub}?action_enFairList=true&all=1&page={$app.page}&print=1', 'print')" target="print"><img src="/images/en/btn-print.gif" alt="Print" height="14" width="46" /></a>
				{else}
					{if ('1' == $form.detail)}
		{*				<a href="{$config.url_pub}?action_enFairListDownload=true&detail=1"><img src="/images/jp/btn-print.gif" alt="CSVdownload" height="23" width="71" /></a> *}
						<a href="javascript:window.open('{$config.url_pub}?action_enFairListSearch=true&detail=1&page={$app.page}&print=1', 'print')" target="print"><img src="/images/en/btn-print.gif" alt="Print" height="14" width="46" /></a>
					{else}
		{*				<a href="{$config.url_pub}?action_enFairListDownload=true&page={$app.page}"><img src="/images/jp/btn-print.gif" alt="CSVdownload" height="23" width="71" /></a> *}
						<a href="javascript:window.open('{$config.url_pub}?action_enFairList=true&page={$app.page}&print=1', 'print')" target="print"><img src="/images/en/btn-print.gif" alt="Print" height="14" width="46" /></a>
					{/if}
				{/if}
				<a href="javascript:window.scrollTo(0, 0);"><img src="/images/en/totop.gif" alt="Return to PAGETOP" width="103" height="14" /></a>
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
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/tradefair/">Trade Fair Search</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/new-additions/">Recently Added</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/ranking/">Monthly Ranking</a></li>
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
					<p>Please direct inquiries or comments to</p>
					<p>Trade Fair Planning Division</p>
					<ul>
						<li><a href="javascript:jetro_open_win600('https://www.jetro.go.jp/form/fm/faa/inquiry_en');" class="icon_arrow">Inquiry form</a></li>
					</ul>
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