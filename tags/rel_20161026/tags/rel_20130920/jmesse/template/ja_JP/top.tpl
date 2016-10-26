<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/jp/default.css"                 rel="stylesheet" type="text/css" media="all" />
<link href="/j-messe/css/style.css"              rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="{$config.css_js_base_pub}js/jquery.js"></script>
<script type="text/javascript" src="{$config.css_js_base_pub}j-messe/js/j-messe.js"    charset="utf-8"></script>
<script type="text/javascript" src="{$config.css_js_base_pub}js/jquery/jquery.prettyPhoto.js" charset="utf-8"></script>
<script type="text/javascript" src="{$config.css_js_base_pub}js/jquery/jquery.tools.min.js"></script>
<script type="text/javascript" src="{$config.css_js_base_pub}j-messe/js2/j-messe/jquery.dynamicselectforjson.js"></script>
<script type="text/javascript" src="{$config.css_js_base_pub}j-messe/js2/j-messe/jquery.dynamicselect.js"></script>
<title>ダミーTopページ</title>
</head>
<body onload="init('{$config.url_pub}', '{$form.select_region}', '{$form.select_country}', '{$form.select_city}')">

{* エラー表示 *}
{if count($errors)}
<ul>
	{foreach from=$errors item=error}
	<li><font color="#ff0000">{$error}</font></li>
	{/foreach}
</ul>
{/if}

<h1>このページはダミーです。</h1>
<br />

<a href="{$config.url_pub}?action_fairListDetailSearch=true">詳細検索</a>

<br />

<table>
<tr valign="top">
<td>
<b>■開催地■</b><br/>
<ul class="icon_arrow" id="venue">
</ul>
</td>
<td>
<b>■業種■</b><br/>
<ul class="icon_arrow" id="industory">
</ul>
</td>
<td>
<b>■検索条件■</b><br/><br/>
<form name="form_dummy_top" id="form_dummy_top" method="post" action="">
<input type="hidden" name="action_fairListSearch" id="action_fairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="i_2" id="i_2" value="" />
<input type="hidden" name="i_3" id="i_3" value="" />
<input type="hidden" name="v_2" id="v_2" value="" />
<input type="hidden" name="v_3" id="v_3" value="" />
<input type="hidden" name="v_4" id="v_4" value="" />
<input type="hidden" name="industory_selected" id="industory_selected" value="" />
<input type="hidden" name="venue_selected" id="venue_selected" value="" />
<table border="1">
	<tr>
		<th>業種</th>
		<td>
			<div id="industory_disp">
				{section name=it loop=$app.industory_list}
					・{$app.industory_list[it]}<br/>
				{/section}
			</div>
			<button class="modalInputIndustory" rel="#prompt_industory">業種を変更する</button>
		</td>
	</tr>
	<tr>
		<th>開催地</th>
		<td>
			<div id="venue_disp">
				{section name=it loop=$app.vanue_list}
					・{$app.vanue_list[it]}<br/>
				{/section}
			</div>
			<button class="modalInputVenue" rel="#prompt_venue">開催地選択</button>
		</td>
	</tr>
	<tr>
		<th>会期</th>
		<td>
			<input type="radio" name="year" id="year_u" value="u" {if ('u' == $form.year || '' == $form.year)}checked{/if} />これから開催のもの<br />
			<input type="radio" name="year" id="year_a" value="a" {if ('a' == $form.year)}checked{/if} />過去のものを含む<br/>
			<input type="radio" name="year" id="year_e" value="e" {if ('e' == $form.year)}checked{/if} />期間を選択する<br/>
			&nbsp;&nbsp;&nbsp;
			<select name="date_from_yyyy" id="date_from_yyyy">
				<option value=""></option>
				{section name=it loop=$app.year_list}
				<option value="{$app.year_list[it]}" {if ($app.year_list[it] == $form.date_from_yyyy)}selected{/if}>{$app.year_list[it]}</option>
				{/section}
			</select>年
			<select name="date_from_mm" id="date_from_mm">
				<option value=""></option>
				<option value="01" {if ('01' == $form.date_from_mm)}selected{/if}>1</option>
				<option value="02" {if ('02' == $form.date_from_mm)}selected{/if}>2</option>
				<option value="03" {if ('03' == $form.date_from_mm)}selected{/if}>3</option>
				<option value="04" {if ('04' == $form.date_from_mm)}selected{/if}>4</option>
				<option value="05" {if ('05' == $form.date_from_mm)}selected{/if}>5</option>
				<option value="06" {if ('06' == $form.date_from_mm)}selected{/if}>6</option>
				<option value="07" {if ('07' == $form.date_from_mm)}selected{/if}>7</option>
				<option value="08" {if ('08' == $form.date_from_mm)}selected{/if}>8</option>
				<option value="09" {if ('09' == $form.date_from_mm)}selected{/if}>9</option>
				<option value="10" {if ('10' == $form.date_from_mm)}selected{/if}>10</option>
				<option value="11" {if ('11' == $form.date_from_mm)}selected{/if}>11</option>
				<option value="12" {if ('12' == $form.date_from_mm)}selected{/if}>12</option>
			</select>月～<br/>
			&nbsp;&nbsp;&nbsp;
			<select name="date_to_yyyy" id="date_to_yyyy">
				<option value=""></option>
				{section name=it loop=$app.year_list}
				<option value="{$app.year_list[it]}" {if ($app.year_list[it] == $form.date_to_yyyy)}selected{/if}>{$app.year_list[it]}</option>
				{/section}
			</select>年
			<select name="date_to_mm" id="date_to_mm">
				<option value=""></option>
				<option value="01" {if ('01' == $form.date_to_mm)}selected{/if}>1</option>
				<option value="02" {if ('02' == $form.date_to_mm)}selected{/if}>2</option>
				<option value="03" {if ('03' == $form.date_to_mm)}selected{/if}>3</option>
				<option value="04" {if ('04' == $form.date_to_mm)}selected{/if}>4</option>
				<option value="05" {if ('05' == $form.date_to_mm)}selected{/if}>5</option>
				<option value="06" {if ('06' == $form.date_to_mm)}selected{/if}>6</option>
				<option value="07" {if ('07' == $form.date_to_mm)}selected{/if}>7</option>
				<option value="08" {if ('08' == $form.date_to_mm)}selected{/if}>8</option>
				<option value="09" {if ('09' == $form.date_to_mm)}selected{/if}>9</option>
				<option value="10" {if ('10' == $form.date_to_mm)}selected{/if}>10</option>
				<option value="11" {if ('11' == $form.date_to_mm)}selected{/if}>11</option>
				<option value="12" {if ('12' == $form.date_to_mm)}selected{/if}>12</option>
			</select>月<br/>
			{if is_error('date_from_yyyy')}
			<span class="error-message">{message name="date_from_yyyy"}</span><br />
			{/if}
			{if is_error('date_from_mm')}
			<span class="error-message">{message name="date_from_mm"}</span><br />
			{/if}
			{if is_error('date_to_yyyy')}
			<span class="error-message">{message name="date_to_yyyy"}</span><br />
			{/if}
			{if is_error('date_to_mm')}
			<span class="error-message">{message name="date_to_mm"}</span><br />
			{/if}
		</td>
	</tr>
	<tr>
		<th>キーワード</th>
		<td><input type="text" name="keyword" id="keyword" value="{$form.keyword}" size="30" /></td>
	</tr>
</table>
<input type="submit" value="検索" />
</td>
</tr>
</table>

<br/>
<b>■登録ページ■</b><br/>
・<a href="{$config.url}?action_user_login=true">ログインページ</a><br/>
<br/>
<b>■英語ページ■</b><br/>
・<a href="{$config.url_pub}?action_enTop=true">TOPページ</a><br/>
・<a href="{$config.url}?action_user_enLogin=true">ログインページ</a><br/>
<br/><br/>

<b>■新着TOP3■</b><br/>
<ul class="icon_arrow" id="new_entry_top3">
</ul>
<br/><br/>

<b>■ランキング 国内TOP3■</b><br/>
<ul class="icon_arrow" id="ranking1_top3">
</ul>
<br/><br/>

<b>■新着■</b><br/>
<ul class="icon_arrow" id="new_entry">
</ul>
<br/>

<b>■JECC認証リスト■</b><br/>
<ul class="icon_arrow" id="jecc_list">
</ul>
<br/>

<b>■ランキング■</b><br/>
<table>
<tr valign="top">
<td>
<b>先月（国内）</b><br/>
<ul class="icon_arrow" id="ranking1">
</ul>
</td>
<td>
<b>先月（海外）</b><br/>
<ul class="icon_arrow" id="ranking4">
</ul>
</td>
</tr>
<tr valign="top">
<td>
<b>２ヶ月前（国内）</b><br/>
<ul class="icon_arrow" id="ranking2">
</ul>
</td>
<td>
<b>２ヶ月前（海外）</b><br/>
<ul class="icon_arrow" id="ranking5">
</ul>
</td>
</tr>
<tr valign="top">
<td>
<b>３ヶ月前（国内）</b><br/>
<ul class="icon_arrow" id="ranking3">
</ul>
</td>
<td>
<b>３ヶ月前（海外）</b><br/>
<ul class="icon_arrow" id="ranking6">
</ul>
</td>
</tr>
</table>


<!-- 業種選択 -->
<script type="text/javascript">
{literal}
$(document).ready(function() {
	var triggers = $(".modalInputIndustory").overlay({
		// some mask tweaks suitable for modal dialogs
		mask : {
			color : "#ebecff",
			loadSpeed : 200,
			opacity : 0.9
		},
		top : 20,
		fixed : false,
		close : null,
		closeOnClick : true
	});
	$("#fin_select_industory").click(function(e) {
		// get user input
		var input = $("#prompt_industory input:checkbox:checked").map(function() {
			return this.value;
		}).get();
		// close the overlay
		triggers.overlay().close();
		// 選択値の洗い替え
		$("#industory_disp").empty();
		var txt = "";
		var n = 1;
		for (i in input) {
			arry_item = input[i].split("_");
			txt += "・" + arry_item[2] + "/" + arry_item[3] + "<br/>";
		}
		$("#industory_disp").html(txt);
		$("#industory_selected").val("1");
	});
	$(".close").click(function(){
		triggers.overlay().close();
	});
});
{/literal}
</script>
<div class="modal" id="prompt_industory">
	<a class="close" id="btn_close"></a>
	<h2>
		業種選択 <span>業種を複数選択できます。</span>
	</h2>
	<div class="industries clearfix">
		<div class="column">
			<h5>総合</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('001' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory_{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>基礎産業</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('002' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>建築</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('003' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>機械・工業技術</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('004' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>情報・通信</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('005' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>

		</div>

		<div class="column">
			<h5>輸送・物流・包装</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('006' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>

			<h5>医療・健康</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('007' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>サービス</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('010' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>その他</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('012' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
		</div>

		<div class="column">
			<h5>生活</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('008' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>趣味・教育</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('009' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>
			<h5>環境</h5>
			<ul>
				{section name=it loop=$app.main_sub_industory_list}
					{if ('011' == $app.main_sub_industory_list[it].kbn_2)}
				<li>
					<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
						{section name=it2 loop=$form.check_main_sub_industory}
							{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
					checked
							{/if}
						{/section}
					/> {$app.main_sub_industory_list[it].sub_industory_name}
				</li>
					{/if}
				{/section}
			</ul>

		</div>
	</div>
	<div class="btn">
		<button type="button" id="fin_select_industory">選択終了</button>
		<button type="button" class="close">キャンセル</button>
	</div>
	<br />
</div>
<!-- /業種選択 -->

<!-- 開催地選択 -->
<script type="text/javascript">
{literal}
$(document).ready(function() {
	var triggers = $(".modalInputVenue").overlay({
		// some mask tweaks suitable for modal dialogs
		mask : {
			color : '#ebecff',
			loadSpeed : 200,
			opacity : 0.9
		},
		top : 20,
		close : null,
		closeOnClick : true
	});
	$("#fin_select_venue").click(function(e) {
		// get user input
		var region = $("#select_region option:selected").val();
		var region_name = $("#select_region option:selected").text();
		var country = $("#select_country option:selected").val();
		var country_name = $("#select_country option:selected").text();
		var city = $("#select_city option:selected").val();
		var city_name = $("#select_city option:selected").text();
		// close the overlay
		triggers.overlay().close();
		// 設定
		$("#region").val(region);
		$("#country").val(country);
		$("#city").val(city);
		// 選択値の洗い替え
		$("#venue_disp").empty();
		var txt = "・" + region_name;
		if ("" != country_name) {
			txt += "/" + country_name;
			if ("" != city_name) {
				txt += "/" + city_name;
			}
		}
		$("#venue_disp").html(txt);
		$("#venue_selected").val("1");
	});
	$(".close").click(function(){
		triggers.overlay().close();
	});
});

function init(url, region, country, city) {
	if ("" != region) {
		dynamicpulldownlist(url+'?action_json_getCountry=true&search=1&kbn_2='+region+'&use_language_flag=0', '', '#select_country', country);
	}
	if ("" != country) {
		dynamicpulldownlist(url+'?action_json_getCity=true&search=1&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=0', '', '#select_city', city);
	}
}

function set_country(url) {
	var region = document.getElementById('select_region').options[document.getElementById('select_region').selectedIndex].value;
	if ('' != region) {
		dynamicpulldownlist(url+'?action_json_getCountry=true&search=1&kbn_2='+region+'&use_language_flag=0', '', '#select_country', null);
	} else {
		clear_country();
	}
	clear_city();
}

function set_city(url) {
	var region = document.getElementById('select_region').options[document.getElementById('select_region').selectedIndex].value;
	var country = document.getElementById('select_country').options[document.getElementById('select_country').selectedIndex].value;
	dynamicpulldownlist(url+'?action_json_getCity=true&search=1&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=0', '', '#select_city', null);
}

function clear_country() {
	var select_country = document.getElementById('select_country');
	for (var i = select_country.length -1; i >= 0 ; i--) {
		select_country.remove(i);
	}
	var op = document.createElement('option');
	op.value = '';
	op.innerHTML = 'すべて';
	document.getElementById('select_country').appendChild(op);

}

function clear_city() {
	var select_city = document.getElementById('select_city');
	for (var i = select_city.length -1; i >= 0 ; i--) {
		select_city.remove(i);
	}
	var op = document.createElement('option');
	op.value = '';
	op.innerHTML = 'すべて';
	document.getElementById('select_city').appendChild(op);

}

{/literal}
</script>
<div class="modal" id="prompt_venue">
	<a class="close" id="btn_close"></a>
	<h2>
		開催地選択<span>「地域」→「国・地域」→「都市」の順に選択してください</span>
	</h2>
	<div class="venue clearfix">

	<table>
		<tr>
			<th>地域</th>
			<td>
				<select name="select_region" id="select_region" onchange="set_country('{$config.url_pub}')" style="width:200px;">
					<option value="">すべて</option>
					{section name=it loop=$app.region_list}
					<option value="{$app.region_list[it].kbn_2}" {if $app.region_list[it].kbn_2 == $form.select_region}selected{/if}>{$app.region_list[it].discription_jp}</option>
					{/section}
				</select>
			</td>
		</tr>
		<tr>
			<th>国・地域</th>
			<td>
				<select name="select_country" id="select_country" onchange="set_city('{$config.url_pub}')" style="width:200px;">
					<option value="">すべて</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>都市</th>
			<td>
				<select name="select_city" id="select_city" style="width:200px;">
					<option value="">すべて</option>
				</select>
			</td>
		</tr>
	</table>

	</div>
	<div class="btn">
		<button type="button" id="fin_select_venue">選択終了</button>
		<button type="button" class="close">キャンセル</button>
	</div>
	<br />
</div>
<!-- /開催地選択 -->

<!-- JSON表示 -->
<script type="text/javascript">
{literal}
$(function(){
	/**
	 * JSONデータをサーバーから取得し、指定したDOMにHTML加工してから挿入する関数
	 *
	 * @parameter url: jsonリソースを得られるURL
	 * @parameter jQueryTargetObj:HTMLにしたJSONをinnerHTMLに入れられるDOM
	 * @parameter convertFunc:JSONのデータ構造に対して、HTML変換を実装する関数
	 * @return : void
	 */
	function insertHTMLContentFromUserJSON(url, jQueryTargetObj, convertFunc){
		//ajax
		$.ajax({
			"url":url,
			"dataType":"json",
			"success":function(data){
				var content_data = convertFunc(data);
				jQueryTargetObj.html(content_data);
			}
		});
	}

	/**
	 * 開催地表示。
	 *
	 * @parameter data: JSONデータ
	 * @return : JSONデータを加工したHTML文字列
	 */
	var region_ConvertJSONtoHTML = function(data){
		//variables
		var content_data ='';
		var content_length = data.length;
		var temp_loop_ref = null;
		//core logic
		for(var i=0; i<content_length; ++i){
			temp_loop_ref = data[i];
			content_data += '<li><a href="' + temp_loop_ref["url"] + '">' + temp_loop_ref["region"] + '（' + temp_loop_ref["count"] + '）</a></li>';
		}
		return content_data;
	};

	/**
	 * 業種（大分類）表示。
	 *
	 * @parameter data: JSONデータ
	 * @return : JSONデータを加工したHTML文字列
	 */
	var industory_ConvertJSONtoHTML = function(data){
		//variables
		var content_data ='';
		var content_length = data.length;
		var temp_loop_ref = null;
		//core logic
		for(var i=0; i<content_length; ++i){
			temp_loop_ref = data[i];
			content_data += '<li><a href="' + temp_loop_ref["url"] + '">' + temp_loop_ref["industory"] + '（' + temp_loop_ref["count"] + '）</a></li>';
		}
		return content_data;
	};

	/**
	 * 新着表示。
	 *
	 * @parameter data: JSONデータ
	 * @return : JSONデータを加工したHTML文字列
	 */
	var new_entry_ConvertJSONtoHTML = function(data){
		//variables
		var content_data ='';
		var content_length = data.length;
		var temp_loop_ref = null;
		//core logic
		for(var i=0; i<content_length; ++i){
			temp_loop_ref = data[i];
			content_data += '<li><a href="' + temp_loop_ref["url"] + '">' + temp_loop_ref["name"] + '</a><br/>' + temp_loop_ref["start"] + '～' + temp_loop_ref["end"] + ' ' + temp_loop_ref["country"] + '/' + temp_loop_ref["city"] + '</li>';
		}
		return content_data;
	};

	/**
	 * JECC認証リスト表示。
	 *
	 * @parameter data: JSONデータ
	 * @return : JSONデータを加工したHTML文字列
	 */
	var jecc_list_ConvertJSONtoHTML = function(data){
		//variables
		var content_data ='';
		var content_length = data.length;
		var temp_loop_ref = null;
		//core logic
		for(var i=0; i<content_length; ++i){
			temp_loop_ref = data[i];
			content_data += '<li><a href="' + temp_loop_ref["url"] + '">' + temp_loop_ref["name"] + '</a><br/>' + temp_loop_ref["start"] + '～' + temp_loop_ref["end"] + ' ' + temp_loop_ref["country"] + '/' + temp_loop_ref["city"] + '</li>';
		}
		return content_data;
	};

	/**
	 * ランキング表示。
	 *
	 * @parameter data: JSONデータ
	 * @return : JSONデータを加工したHTML文字列
	 */
	var ranking_ConvertJSONtoHTML = function(data){
		//variables
		var content_data ='';
		var content_length = data.length;
		var temp_loop_ref = null;
		//core logic
		for(var i=0; i<content_length; ++i){
			temp_loop_ref = data[i];
			content_data += '<li id=rank' + i+1 + '><a href="' + temp_loop_ref["url"] + '">' + temp_loop_ref["name"] + '</a><br/>' + temp_loop_ref["start"] + '～' + temp_loop_ref["end"] + '<br/>' + temp_loop_ref["venue"] + '</li>';
		}
		return content_data;
	};

	insertHTMLContentFromUserJSON( "jsonfile/region_jp.json", $('#venue'), region_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/industry_jp.json", $('#industory'), industory_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/new-mihonichi_jp.json", $('#new_entry'), new_entry_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/jecc-mihonichi_jp.json", $('#jecc_list'), jecc_list_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/new-mihonichi_jp_top3.json", $('#new_entry_top3'), new_entry_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/ranking1_jp_top3.json", $('#ranking1_top3'), ranking_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/ranking1_jp.json", $('#ranking1'), ranking_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/ranking2_jp.json", $('#ranking2'), ranking_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/ranking3_jp.json", $('#ranking3'), ranking_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/ranking4_jp.json", $('#ranking4'), ranking_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/ranking5_jp.json", $('#ranking5'), ranking_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON( "jsonfile/ranking6_jp.json", $('#ranking6'), ranking_ConvertJSONtoHTML);

});
{/literal}
</script>
<!-- /JSON表示 -->

</form>
</body>
</html>
