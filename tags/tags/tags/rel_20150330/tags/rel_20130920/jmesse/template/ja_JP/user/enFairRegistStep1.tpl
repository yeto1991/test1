<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />
{include file="user/enHeader.tpl"}
<script type="text/javascript">
<!--
{literal}
	function init(url, region, country, city) {
		if ('' != region) {
			dynamicpulldownlist(url+'?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=1', '', '#country', country);
			if ('' != country) {
				dynamicpulldownlist(url+'?action_json_getCity=true&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=1', '', '#city', city);
			}
		}
	}

	$(document).ready(function() {
		var triggers = $(".modalInput").overlay({
			// some mask tweaks suitable for modal dialogs
			mask : {
				color : '#ebecff',
				loadSpeed : 200,
				opacity : 0.9
			},
			top : 20,
			fixed : false,
			close : null,
			closeOnClick : true
		});
		$("#FIN_SELECT").click(function(e) {
			// get user input
			var input = $("#prompt input:checkbox:checked").map(function() {
				return this.value;
			}).get();
			if (6 < input.length) {
				window.alert('you can select up to 6 industorys.');
				return;
			}
			// close the overlay
			triggers.overlay().close();
			// 件数チェック
			// 選択値の洗い替え
			$('#INDUSOTRY_LIST').empty();

			$('#main_industory_1').val('');
			$('#sub_industory_1').val('');
			$('#main_industory_name_1').val('');
			$('#sub_industory_name_1').val('');

			$('#main_industory_2').val('');
			$('#sub_industory_2').val('');
			$('#main_industory_name_2').val('');
			$('#sub_industory_name_2').val('');

			$('#main_industory_3').val('');
			$('#sub_industory_3').val('');
			$('#main_industory_name_3').val('');
			$('#sub_industory_name_3').val('');

			$('#main_industory_4').val('');
			$('#sub_industory_4').val('');
			$('#main_industory_name_4').val('');
			$('#sub_industory_name_4').val('');

			$('#main_industory_5').val('');
			$('#sub_industory_5').val('');
			$('#main_industory_name_5').val('');
			$('#sub_industory_name_5').val('');

			$('#main_industory_6').val('');
			$('#sub_industory_6').val('');
			$('#main_industory_name_6').val('');
			$('#sub_industory_name_6').val('');

			var txt = '';
			var n = 1;
			for (i in input) {
				arry_item = input[i].split('_');
				txt += '・' + arry_item[3] + '<br/>';
				$('#main_industory_' + n).val(arry_item[0]);
				$('#sub_industory_' + n).val(arry_item[1]);
				$('#main_industory_name_' + n).val(arry_item[2]);
				$('#sub_industory_name_' + n).val(arry_item[3]);
				n++;
			}
			$('#INDUSOTRY_LIST').html(txt);
		});
		$('.close').click(function(){
			triggers.overlay().close();
		});
	});

	function set_country(url) {
		var region = document.getElementById('region').options[document.getElementById('region').selectedIndex].value;
		dynamicpulldownlist(url+'?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=1', '', '#country', null);
		clear_city();
	}

	function set_city(url) {
		var region = document.getElementById('region').options[document.getElementById('region').selectedIndex].value;
		var country = document.getElementById('country').options[document.getElementById('country').selectedIndex].value;
		dynamicpulldownlist(url+'?action_json_getCity=true&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=1', '', '#city', null);
	}

	function clear_city() {
		var select_city = document.getElementById('city');
		for (var i = select_city.length -1; i >= 0 ; i--) {
			select_city.remove(i);
		}
		var op = document.createElement('option');
		op.value = '';
		op.innerHTML = '...';
		document.getElementById('city').appendChild(op);

	}

{/literal}
// -->
</script>
{if ('' == $form.mode) || ('e' == $form.mode)}
<title>Fair Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ('c' == $form.mode)}
<title>User Editing - Online Trade Fair Database (J-messe) - JETRO</title>
{/if}
</head>

<body class="layout-LC highlight-database j-messe" onload="init('{$config.url}', '{$form.region}', '{$form.country}', '{$form.city}')">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<ul class="clearfix">
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
			{if ('' == $form.mode) || ('e' == $form.mode)}
			<li>Fair Registration(step1)</li>
			{elseif ('c' == $form.mode)}
			<li>Fair Editing(step1)</li>
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
				{if ('' == $form.mode) || ('e' == $form.mode)}
				<h2>New Fair Registration</h2>
				{elseif ('c' == $form.mode)}
				<h2>Fair Editing</h2>
				{/if}
			</div>
			<div class="in_main">
				<h3 class="img t_center">
					<img src="/en/database/j-messe/images/db/fair01.jpg" alt="見本市登録ステップ1" />
				</h3>
				<p class="t_right">
					user：{$session.email}
				</p>

				{* エラー表示 *}
				{if count($errors)}
				<p class="error-message" id="error-pagetop">The data you have entered is invalid. Please re-enter.</p>
				{/if}

				<form name="form_enFairRegistStep1" id="form_enFairRegistStep1" method="post" action="">
					<!-- HIDDEN -->
					<input type="hidden" name="action_user_enFairRegistStep2" id="action_user_enFairRegistStep2" value="dummy" />
					<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
					{if ('c' == $form.mode || 'e' == $form.mode)}
					<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
					{/if}
					<input type="hidden" name="main_industory_1" id="main_industory_1" value="{$form.main_industory_1}" />
					<input type="hidden" name="sub_industory_1" id="sub_industory_1" value="{$form.sub_industory_1}" />
					<input type="hidden" name="main_industory_2" id="main_industory_2" value="{$form.main_industory_2}" />
					<input type="hidden" name="sub_industory_2" id="sub_industory_2" value="{$form.sub_industory_2}" />
					<input type="hidden" name="main_industory_3" id="main_industory_3" value="{$form.main_industory_3}" />
					<input type="hidden" name="sub_industory_3" id="sub_industory_3" value="{$form.sub_industory_3}" />
					<input type="hidden" name="main_industory_4" id="main_industory_4" value="{$form.main_industory_4}" />
					<input type="hidden" name="sub_industory_4" id="sub_industory_4" value="{$form.sub_industory_4}" />
					<input type="hidden" name="main_industory_5" id="main_industory_5" value="{$form.main_industory_5}" />
					<input type="hidden" name="sub_industory_5" id="sub_industory_5" value="{$form.sub_industory_5}" />
					<input type="hidden" name="main_industory_6" id="main_industory_6" value="{$form.main_industory_6}" />
					<input type="hidden" name="sub_industory_6" id="sub_industory_6" value="{$form.sub_industory_6}" />

					<input type="hidden" name="main_industory_name_1" id="main_industory_name_1" value="{$form.main_industory_name_1}" />
					<input type="hidden" name="sub_industory_name_1" id="sub_industory_name_1" value="{$form.sub_industory_name_1}" />
					<input type="hidden" name="main_industory_name_2" id="main_industory_name_2" value="{$form.main_industory_name_2}" />
					<input type="hidden" name="sub_industory_name_2" id="sub_industory_name_2" value="{$form.sub_industory_name_2}" />
					<input type="hidden" name="main_industory_name_3" id="main_industory_name_3" value="{$form.main_industory_name_3}" />
					<input type="hidden" name="sub_industory_name_3" id="sub_industory_name_3" value="{$form.sub_industory_name_3}" />
					<input type="hidden" name="main_industory_name_4" id="main_industory_name_4" value="{$form.main_industory_name_4}" />
					<input type="hidden" name="sub_industory_name_4" id="sub_industory_name_4" value="{$form.sub_industory_name_4}" />
					<input type="hidden" name="main_industory_name_5" id="main_industory_name_5" value="{$form.main_industory_name_5}" />
					<input type="hidden" name="sub_industory_name_5" id="sub_industory_name_5" value="{$form.sub_industory_name_5}" />
					<input type="hidden" name="main_industory_name_6" id="main_industory_name_6" value="{$form.main_industory_name_6}" />
					<input type="hidden" name="sub_industory_name_6" id="sub_industory_name_6" value="{$form.sub_industory_name_6}" />
					<!-- /HIDDEN -->

					<h4>Basic Information</h4>
					<table id="registration">
						{if is_error('fair_title_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Fair title</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<input type="text" value="{$form.fair_title_en}" size="60" name="fair_title_en" id="fair_title_en" maxlength="255" /><br />
								{if is_error('fair_title_en')}
								<span class="error-message">{message name="fair_title_en"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('abbrev_title')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Fair title (abbreviation)</th>
							<th class="required"></th>
							<td>
								<input type="text" value="{$form.abbrev_title}" size="30"  name="abbrev_title" id="abbrev_title" maxlength="255" /><br />
								<strong>（one-byte alphabet and numbers)</strong> Example: Ambiente<br/>
								{if is_error('abbrev_title')}
								<span class="error-message">{message name="abbrev_title"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('fair_url')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">URL</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<input type="text" value="{if ('' == $form.fair_url)}http://{else}{$form.fair_url}{/if}" size="60" name="fair_url" id="fair_url" maxlength="255" /><br />
								Enter URLs beginning with http(s)://. <br/>
								{if is_error('fair_url')}
								<span class="error-message">{message name="fair_url"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('date_from_yyyy') || is_error('date_from_mm') || is_error('date_from_dd') || is_error('date_to_yyyy') || is_error('date_to_mm') || is_error('date_to_dd')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Date</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<select name="date_from_yyyy" size="1" id="date_from_yyyy">
									<option value=""></option>
									{section name=it loop=$app.year_list}
									<option value="{$app.year_list[it]}" {if $app.year_list[it]==$form.date_from_yyyy}selected{/if}>{$app.year_list[it]}</option>
									{/section}
								</select> Year
								<select name="date_from_mm" size="1" id="date_from_mm">
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
								</select> Month
								<select name="date_from_dd" size="1" id="date_from_dd">
									<option value=""></option>
									<option value="01" {if ('01' == $form.date_from_dd)}selected{/if}>1</option>
									<option value="02" {if ('02' == $form.date_from_dd)}selected{/if}>2</option>
									<option value="03" {if ('03' == $form.date_from_dd)}selected{/if}>3</option>
									<option value="04" {if ('04' == $form.date_from_dd)}selected{/if}>4</option>
									<option value="05" {if ('05' == $form.date_from_dd)}selected{/if}>5</option>
									<option value="06" {if ('06' == $form.date_from_dd)}selected{/if}>6</option>
									<option value="07" {if ('07' == $form.date_from_dd)}selected{/if}>7</option>
									<option value="08" {if ('08' == $form.date_from_dd)}selected{/if}>8</option>
									<option value="09" {if ('09' == $form.date_from_dd)}selected{/if}>9</option>
									<option value="10" {if ('10' == $form.date_from_dd)}selected{/if}>10</option>
									<option value="11" {if ('11' == $form.date_from_dd)}selected{/if}>11</option>
									<option value="12" {if ('12' == $form.date_from_dd)}selected{/if}>12</option>
									<option value="13" {if ('13' == $form.date_from_dd)}selected{/if}>13</option>
									<option value="14" {if ('14' == $form.date_from_dd)}selected{/if}>14</option>
									<option value="15" {if ('15' == $form.date_from_dd)}selected{/if}>15</option>
									<option value="16" {if ('16' == $form.date_from_dd)}selected{/if}>16</option>
									<option value="17" {if ('17' == $form.date_from_dd)}selected{/if}>17</option>
									<option value="18" {if ('18' == $form.date_from_dd)}selected{/if}>18</option>
									<option value="19" {if ('19' == $form.date_from_dd)}selected{/if}>19</option>
									<option value="20" {if ('20' == $form.date_from_dd)}selected{/if}>20</option>
									<option value="21" {if ('21' == $form.date_from_dd)}selected{/if}>21</option>
									<option value="22" {if ('22' == $form.date_from_dd)}selected{/if}>22</option>
									<option value="23" {if ('23' == $form.date_from_dd)}selected{/if}>23</option>
									<option value="24" {if ('24' == $form.date_from_dd)}selected{/if}>24</option>
									<option value="25" {if ('25' == $form.date_from_dd)}selected{/if}>25</option>
									<option value="26" {if ('26' == $form.date_from_dd)}selected{/if}>26</option>
									<option value="27" {if ('27' == $form.date_from_dd)}selected{/if}>27</option>
									<option value="28" {if ('28' == $form.date_from_dd)}selected{/if}>28</option>
									<option value="29" {if ('29' == $form.date_from_dd)}selected{/if}>29</option>
									<option value="30" {if ('30' == $form.date_from_dd)}selected{/if}>30</option>
									<option value="31" {if ('31' == $form.date_from_dd)}selected{/if}>31</option>
								</select> Day ～
								<select name="date_to_yyyy" size="1" id="date_to_yyyy">
									<option value=""></option>
									{section name=it loop=$app.year_list}
									<option value="{$app.year_list[it]}" {if ($app.year_list[it]==$form.date_to_yyyy)}selected{/if}>{$app.year_list[it]}</option>
									{/section}
								</select> Year
								<select name="date_to_mm" size="1" id="date_to_mm">
									<option value="" ></option>
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
								</select> Month
								<select name="date_to_dd" size="1" id="date_to_dd">
									<option value="" ></option>
									<option value="01" {if ('01' == $form.date_to_dd)}selected{/if}>1</option>
									<option value="02" {if ('02' == $form.date_to_dd)}selected{/if}>2</option>
									<option value="03" {if ('03' == $form.date_to_dd)}selected{/if}>3</option>
									<option value="04" {if ('04' == $form.date_to_dd)}selected{/if}>4</option>
									<option value="05" {if ('05' == $form.date_to_dd)}selected{/if}>5</option>
									<option value="06" {if ('06' == $form.date_to_dd)}selected{/if}>6</option>
									<option value="07" {if ('07' == $form.date_to_dd)}selected{/if}>7</option>
									<option value="08" {if ('08' == $form.date_to_dd)}selected{/if}>8</option>
									<option value="09" {if ('09' == $form.date_to_dd)}selected{/if}>9</option>
									<option value="10" {if ('10' == $form.date_to_dd)}selected{/if}>10</option>
									<option value="11" {if ('11' == $form.date_to_dd)}selected{/if}>11</option>
									<option value="12" {if ('12' == $form.date_to_dd)}selected{/if}>12</option>
									<option value="13" {if ('13' == $form.date_to_dd)}selected{/if}>13</option>
									<option value="14" {if ('14' == $form.date_to_dd)}selected{/if}>14</option>
									<option value="15" {if ('15' == $form.date_to_dd)}selected{/if}>15</option>
									<option value="16" {if ('16' == $form.date_to_dd)}selected{/if}>16</option>
									<option value="17" {if ('17' == $form.date_to_dd)}selected{/if}>17</option>
									<option value="18" {if ('18' == $form.date_to_dd)}selected{/if}>18</option>
									<option value="19" {if ('19' == $form.date_to_dd)}selected{/if}>19</option>
									<option value="20" {if ('20' == $form.date_to_dd)}selected{/if}>20</option>
									<option value="21" {if ('21' == $form.date_to_dd)}selected{/if}>21</option>
									<option value="22" {if ('22' == $form.date_to_dd)}selected{/if}>22</option>
									<option value="23" {if ('23' == $form.date_to_dd)}selected{/if}>23</option>
									<option value="24" {if ('24' == $form.date_to_dd)}selected{/if}>24</option>
									<option value="25" {if ('25' == $form.date_to_dd)}selected{/if}>25</option>
									<option value="26" {if ('26' == $form.date_to_dd)}selected{/if}>26</option>
									<option value="27" {if ('27' == $form.date_to_dd)}selected{/if}>27</option>
									<option value="28" {if ('28' == $form.date_to_dd)}selected{/if}>28</option>
									<option value="29" {if ('29' == $form.date_to_dd)}selected{/if}>29</option>
									<option value="30" {if ('30' == $form.date_to_dd)}selected{/if}>30</option>
									<option value="31" {if ('31' == $form.date_to_dd)}selected{/if}>31</option>
								</select> Day<br/>
								{if is_error('date_from_yyyy')}
								<span class="error-message">{message name="date_from_yyyy"}</span><br />
								{/if}
								{if is_error('date_from_mm')}
								<span class="error-message">{message name="date_from_mm"}</span><br />
								{/if}
								{if is_error('date_from_dd')}
								<span class="error-message">{message name="date_from_dd"}</span><br />
								{/if}
								{if is_error('date_to_yyyy')}
								<span class="error-message">{message name="date_to_yyyy"}</span><br />
								{/if}
								{if is_error('date_to_mm')}
								<span class="error-message">{message name="date_to_mm"}</span><br />
								{/if}
								{if is_error('date_to_dd')}
								<span class="error-message">{message name="date_to_dd"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('frequency')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Frequency of exhibition</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								{section name=it loop=$app.frequency_list}
								<input type="radio" value="{$app.frequency_list[it].kbn_2}" name="frequency" id="frequency" {if ($app.frequency_list[it].kbn_2 == $form.frequency)}checked{/if} />{$app.frequency_list[it].discription_en}&nbsp;
								{if (0 == (($smarty.section.it.index + 1) % 4))}<br/>{/if}
								{/section}<br/>
								{if is_error('frequency')}
								<span class="error-message">{message name="frequency"}</span><br />
								{/if}
							</td>
						</tr>
					</table>

					<h4>Industries/Products Covered</h4>
					<table id="registration">
						{if is_error('main_industory_1')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Main/Sub Industry</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								Click “Select”, then choose industries. <br />
								<div id="INDUSOTRY_LIST">
								{if ('' != $form.sub_industory_name_1)}
								・{$form.sub_industory_name_1}<br />
								{/if}
								{if ('' != $form.sub_industory_name_2)}
								・{$form.sub_industory_name_2}<br />
								{/if}
								{if ('' != $form.sub_industory_name_3)}
								・{$form.sub_industory_name_3}<br />
								{/if}
								{if ('' != $form.sub_industory_name_4)}
								・{$form.sub_industory_name_4}<br />
								{/if}
								{if ('' != $form.sub_industory_name_5)}
								・{$form.sub_industory_name_5}<br />
								{/if}
								{if ('' != $form.sub_industory_name_6)}
								・{$form.sub_industory_name_6}<br />
								{/if}
								</div>
								<button class="modalInput" rel="#prompt">select</button><br/>
								{if is_error('main_industory_1')}
								<span class="error-message">{message name="main_industory_1"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('exhibits_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Exhibits</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<textarea cols="60" rows="3" name="exhibits_en" id="exhibits_en">{$form.exhibits_en}</textarea><br />
								Maximum of 300 letters (about 30 words) <br/>
								{if is_error('exhibits_en')}
								<span class="error-message">{message name="exhibits_en"}</span><br />
								{/if}
							</td>
						</tr>
					</table>

					<h4>Location/Venue</h4>
					<table id="registration">
						{if is_error('region') || is_error('country') || is_error('city') || is_error('other_city_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Location</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<table style="border-style:none;border-collapse:collapse;">
									{if is_error('region') || is_error('country') || is_error('city') || is_error('other_city_en')}
									<tr class="errorcheck">
									{else}
									<tr>
									{/if}
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">Region</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">：</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">
											<select name="region" id="region" style="width:200px;" onchange="set_country('{$config.url}')">
												<option value="">...</option>
												{section name=it loop=$app.region_list}
												<option value="{$app.region_list[it].kbn_2}" {if ($app.region_list[it].kbn_2 == $form.region)}selected{/if}>{$app.region_list[it].discription_en}</option>
												{/section}
											</select>
										</td>
									</tr>
									{if is_error('region') || is_error('country') || is_error('city') || is_error('other_city_en')}
									<tr class="errorcheck">
									{else}
									<tr>
									{/if}
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">Country/Area</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">：</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">
											<select name="country" id="country" style="width:200px;" onchange="set_city('{$config.url}')">
												<option value="">...</option>
											</select>
										</td>
									</tr>
									{if is_error('region') || is_error('country') || is_error('city') || is_error('other_city_en')}
									<tr class="errorcheck">
									{else}
									<tr>
									{/if}
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">City</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">：</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">
											<select name="city" id="city" style="width:200px;">
												<option value="">...</option>
											</select>
										</td>
									</tr>
									{if is_error('region') || is_error('country') || is_error('city') || is_error('other_city_en')}
									<tr class="errorcheck">
									{else}
									<tr>
									{/if}
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">City(Other)</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">：</td>
										<td style="border-style:none;padding:0px;font-size:1em;border-collapse:collapse;">
											<input type="checkbox" name="check_other_city" id="check_other_city" value="1" {if ('1' == $form.check_other_city)}checked{/if} />
											<input type="text" name="other_city_en" id="other_city_en" value="{$form.other_city_en}" size="30" maxlength="100" /><br/>
										</td>
									</tr>
								</table>
								{if is_error('region')}
								<span class="error-message">{message name="region"}</span><br />
								{/if}
								{if is_error('country')}
								<span class="error-message">{message name="country"}</span><br />
								{/if}
								{if is_error('city')}
								<span class="error-message">{message name="city"}</span><br />
								{/if}
								{if is_error('other_city_en')}
								<span class="error-message">{message name="other_city_en"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('venue_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Venue</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<input type="text" value="{$form.venue_en}" size="50" name="venue_en" id="venue_en" maxlength="255" /><br/>
								{if is_error('venue_en')}
								<span class="error-message">{message name="venue_en"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('gross_floor_area')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Net square meters</th>
							<th class="required"></th>
							<td>
								<input type="text" value="{$form.gross_floor_area}" size="5" name="gross_floor_area" id="gross_floor_area" maxlength="10" /> <strong>sq.m.</strong><br />
								Enter only single-byte numbers with no commas. E.g. 1000<br/>
								{if is_error('gross_floor_area')}
								<span class="error-message">{message name="gross_floor_area"}</span><br />
								{/if}
							</td>
						</tr>
						{if is_error('open_to')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Eligibility</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								{section name=it loop=$app.open_to_list}
								<input name="open_to" id="open_to" value="{$app.open_to_list[it].kbn_2}" type="radio" {if ($app.open_to_list[it].kbn_2 == $form.open_to)}checked{/if} />{$app.open_to_list[it].discription_en}&nbsp;
								{/section}<br/>
								{if is_error('open_to')}
								<span class="error-message">{message name="open_to"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('admission_ticket_1') || is_error('other_admission_ticket_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Method of obtaining tickets</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<input name="admission_ticket_1" id="admission_ticket_1" value="1" type="checkbox" {if ('1' == $form.admission_ticket_1)}checked{/if} />Free
								<input name="admission_ticket_2" id="admission_ticket_2" value="1" type="checkbox" {if ('1' == $form.admission_ticket_2)}checked{/if} />Apply/register online<br />
								<input name="admission_ticket_3" id="admission_ticket_3" value="1" type="checkbox" {if ('1' == $form.admission_ticket_3)}checked{/if} />Contact organizer/agency in Japan
								<input name="admission_ticket_4" id="admission_ticket_4" value="1" type="checkbox" {if ('1' == $form.admission_ticket_4)}checked{/if} />Available at event<br />
								<input name="admission_ticket_5" id="admission_ticket_5" value="1" type="checkbox" {if ('1' == $form.admission_ticket_5)}checked{/if} />Other<input name="other_admission_ticket_en" id="other_admission_ticket_en" value="{$form.other_admission_ticket_en}" size="50" type="text" maxlength="500" /> <br />
								(Multiple selections accepted) <br/>
								{if is_error('admission_ticket_1')}
								<span class="error-message">{message name="admission_ticket_1"}</span><br />
								{/if}
								{if is_error('other_admission_ticket_en')}
								<span class="error-message">{message name="other_admission_ticket_en"}</span><br />
								{/if}
							</td>
						</tr>
					</table>
					<div class="line_dot"><hr /></div>
					<table width="100%">
						<tr>
							<td width="250px"><img src="/en/database/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" onclick="history.back()"/></td>
							<td align="right"><input type="image" src="/en/database/j-messe/images/db/btn-next.gif" alt="次へ" width="180" height="37" class="over" /></td>
						</tr>
					</table>
				</form>
			</div>
			<p class="totop">
				<a href="javascript:window.scrollTo(0, 0);"><img src="/images/en/totop.gif" alt="Return to PAGETOP" width="103" height="14" /></a>
			</p>
		</div>
		<!-- /main -->
		<!-- submenu -->
		{$app_ne.left_menu}
		<!-- /submenu -->
	</div>
	<!-- /contents -->
	<!-- select_industries dialog -->
	<div class="modal" id="prompt">
		<a class="close" id="btn_close"></a>
		<h2>
			Industry <span>you can select up to 6 Industrys.</span>
		</h2>
		<form>
			<div class="industries clearfix">
				<div class="column">
					<h5>General Exhibition</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('001' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Fundamental Industries</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('002' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Building, Construction</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('003' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Machinery, Industrial Technology</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('004' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Information, Telecommunication</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('005' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
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
					<h5>Transportation, Logistics, Packaging</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('006' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>

					<h5>Medical Care, Health</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('007' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Services</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('010' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Others</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('012' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
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
					<h5>Living</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('008' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Hobby, Education</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('009' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
							checked
									{/if}
								{/section}
							/> {$app.main_sub_industory_list[it].sub_industory_name}
						</li>
							{/if}
						{/section}
					</ul>
					<h5>Environment</h5>
					<ul>
						{section name=it loop=$app.main_sub_industory_list}
							{if ('011' == $app.main_sub_industory_list[it].kbn_2)}
						<li>
							<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_sub_industory[]" id="check_sub_industory[]"
								{section name=it2 loop=$form.check_sub_industory}
									{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_sub_industory[it2])}
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
				<button type="button" id="FIN_SELECT">OK</button>
				<button type="button" class="close">Cancel</button>
			</div>
		</form>
		<br />
	</div>
	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->
</body>
</html>