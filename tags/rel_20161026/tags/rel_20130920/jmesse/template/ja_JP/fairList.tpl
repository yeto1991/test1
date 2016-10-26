<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="見本市、展示会、商談会、{$app.meta_keyword}" />
{include file="header.tpl"}
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
すべての見本市・展示会(J-messe) -ジェトロ
{elseif ('1' == $form.detail)}
世界の見本市・展示会(J-messe) -ジェトロ
{else}
	{if ('i1' == $form.type || 'i2' == $form.type)}
{$app.title} - 世界の見本市・展示会(J-messe) -ジェトロ
	{elseif ('v1' == $form.type || 'v2' == $form.type || 'v3' == $form.type)}
{$app.title}で開催される見本市・展示会(J-messe) -ジェトロ
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
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			{if ('1' != $form.all)}
				{if ('1' == $form.detail)}
					<li><a href="{$config.url_pub}tradefair/">詳細検索</a></li>
					<li>検索結果一覧</li>
				{elseif ('i1' == $form.type)}
					<li><a href="{$config.url_pub}industry/">業種別に見る</a></li>
					{if ('' == $form.i_3)}
						<li>{$app.pan_1}</li>
					{else}
						<li><a href="{$config.url_pub}?action_fairList=true&type=i1&i_2={$form.i_2}">{$app.pan_1}</a></li>
						<li>{$app.pan_2}</li>
					{/if}
				{elseif ('v1' == $form.type)}
					<li><a href="{$config.url_pub}country/">開催地別に見る</a></li>
					<li>{$app.pan_1}</li>
				{elseif ('v2' == $form.type)}
					<li><a href="{$config.url_pub}country/">開催地別に見る</a></li>
					{if ('' == $form.v_4)}
						<li><a href="{$config.url_pub}?action_fairList=true&type=v1&v_2={$form.v_2}">{$app.pan_1}</a></li>
						<li>{$app.pan_2}</li>
					{else}
						<li><a href="{$config.url_pub}?action_fairList=true&type=v1&v_2={$form.v_2}">{$app.pan_1}</a></li>
						<li><a href="{$config.url_pub}?action_fairList=true&type=v2&v_2={$form.v_2}&v_3={$form.v_3}">{$app.pan_2}</a></li>
						<li>{$app.pan_3}</li>
					{/if}
				{/if}
			{else}
				<li>検索結果一覧</li>
			{/if}
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
								<h1>見本市・展示会データベース（J-messe)</h1>
							</div>

							<div class="h2">
								<h2>世界の見本市・展示会</h2>
							</div>
							<div class="in_main">
								{if ('1' == $form.all)}
									<h3>すべての見本市</h3>
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
								<div id="skip_menu">
									<a href="">絞り込み条件にスキップ</a>
								</div>

								<!-- list of tradefairs -->
								<div class="left" id="list">

									<div class="h4 clearfix">
										{if ('1' == $form.all)}
										<h4>過去のものを含む見本市・展示会一覧</h4>
										{else}
											{if ('1' == $form.detail)}
										<h4>検索結果一覧</h4>
											{else}
												{if ('a' != $form.year)}
										<h4>これから開催される見本市・展示会一覧</h4>
												{else}
										<h4>過去のものを含む見本市・展示会一覧</h4>
												{/if}
											{/if}
										{/if}
										{if ('1' != $form.detail && '1' != $form.all)}
										<span class="right"><a href="{$config.url_pub}?action_fairList=true&all=1&page=1" class="icon_arrow">すべての見本市・展示会</a></span>
										{/if}
									</div>

									<p class="t_right">
										{if ('1' == $form.all)}
										表示件数：<a href="{$config.url_pub}?action_fairList=true&all=1&page=1&limit=20">20件</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_fairList=true&all=1&page=1&limit=50">50件</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_fairList=true&all=1&page=1&limit=100">100件</a> &nbsp;&nbsp;&nbsp;
										{elseif ('1' == $form.detail)}
										表示件数：<a href="{$config.url_pub}?action_fairListSearch=true&detail=1&page=1&limit=20">20件</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_fairListSearch=true&detail=1&page=1&limit=50">50件</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_fairListSearch=true&detail=1&page=1&limit=100">100件</a> &nbsp;&nbsp;&nbsp;
										{else}
										表示件数：<a href="{$config.url_pub}?action_fairList=true&page=1&limit=20">20件</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_fairList=true&page=1&limit=50">50件</a>&nbsp;&nbsp;<a href="{$config.url_pub}?action_fairList=true&page=1&limit=100">100件</a> &nbsp;&nbsp;&nbsp;
										{/if}
										並び順:
										<select name="sort" id="sort"
											{if ('1' == $form.all)}
											onchange="dosort('{$config.url_pub}?action_fairList=ture&page=1&all=1')"
											{elseif ('1' == $form.detail)}
											onchange="dosort('{$config.url_pub}?action_fairListSearch=ture&detail=1&page=1')"
											{else}
											onchange="dosort('{$config.url_pub}?action_fairList=ture&page=1')"
											{/if}
											>
											<option value="0" {if ('0' == $form.sort || '' == $form.sort)}selected{/if}>会期順</option>
											<option value="1" {if ('1' == $form.sort)}selected{/if}>新着順</option>
											<option value="2" {if ('2' == $form.sort)}selected{/if}>名称順</option>
											<option value="3" {if ('3' == $form.sort)}selected{/if}>規模順</option>
										</select>
									</p>

									<p>{$app.total}件中 {$app.start}から{$app.end}件目</p>
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
												<a href="{$config.url_pub}tradefair/{$app.fair_list[it].detail_url}">{$app.fair_list[it].fair_title_jp}</a>
											</dt>
											<dd style="word-break: break-all;">
												{$app.fair_list[it].date_from_yyyy}年{$app.fair_list[it].date_from_mm}月{$app.fair_list[it].date_from_dd}日～{$app.fair_list[it].date_to_yyyy}年{$app.fair_list[it].date_to_mm}月{$app.fair_list[it].date_to_dd}日<br />
												{$app.fair_list[it].city_name} / {$app.fair_list[it].country_name} / {$app.fair_list[it].region_name}<br />
												{$app.fair_list[it].exhibits_jp|replace:'&lt;br/&gt;':'<br/>'}
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
									{include file="fairMenuDetail.tpl"}
								{else}
									{if ('i1' == $form.type)}
										<!-- 業種選択 -->
										{include file="fairMenuIndustory.tpl"}
									{elseif ('v1' == $form.type)}
										<!-- 地域選択 -->
										{include file="fairMenuRegion.tpl"}
									{elseif ('v2' == $form.type)}
										<!-- 国・地域選択 -->
										{include file="fairMenuCountry.tpl"}
									{/if}
								{/if}
								<!-- /breakdown -->

							</div>
						</div>
					</div>

				</div>
				<p class="totop">
					{if ('1' == $form.all)}
				{*		<a href="{$config.url_pub}?action_fairListDownload=true&all=1"><img src="/images/jp/btn-print.gif" alt="CSVダウンロード" height="23" width="71" /></a> *}
						<a href="javascript:window.open('{$config.url_pub}?action_fairList=true&all=1&page={$app.page}&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
					{else}
						{if ('1' == $form.detail)}
				{*			<a href="{$config.url_pub}?action_fairListDownload=true&detail=1"><img src="/images/jp/btn-print.gif" alt="CSVダウンロード" height="23" width="71" /></a> *}
							<a href="javascript:window.open('{$config.url_pub}?action_fairListSearch=true&detail=1&page={$app.page}&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{else}
				{*			<a href="{$config.url_pub}?action_fairListDownload=true&page={$app.page}"><img src="/images/jp/btn-print.gif" alt="CSVダウンロード" height="23" width="71" /></a> *}
							<a href="javascript:window.open('{$config.url_pub}?action_fairList=true&page={$app.page}&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{/if}
					{/if}
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
