<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
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
			var input = $("#jmesse_prompt input:checkbox:checked").map(function() {
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
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop" onload="init('{$config.url}', '{$form.region}', '{$form.country}', '{$form.city}')">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/en/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
					{if ('' == $form.mode) || ('e' == $form.mode)}
						<li>Fair Registration(step1)</li>
					{elseif ('c' == $form.mode)}
						<li>Fair Editing(step1)</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('' == $form.mode) || ('e' == $form.mode)}
					<h1>New Fair Registration</h1>
				{elseif ('c' == $form.mode)}
					<h1>Fair Editing</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/en/database/j-messe/images/db/fair01.jpg" alt="enfairstep1" />
				</div>
			</div>

			<div class="elem_paragraph">
				<p class="text right">user：{$session.email}</p>
			</div>

			<div class="elem_paragraph">
				<p class="text">
					Please register trade fair information according to your official website.<br />
					JETRO may verify and revise the content of the registered information based on the official website prior to its publication.
				</p>
			</div>

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

					<div class="elem_table_basic">
						<div class="elem_table_heading">
							<p><strong>Basic Information</strong></p>
						</div>
						<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
							<colgroup>
								<col width="15%">
								<col width="7%">
								<col width="78%">
							</colgroup>
							<tbody>
							{if is_error('fair_title_en')}
								<tr class="errorcheck">
							{else}
								<tr>
							{/if}
									<th class="bg_gray_lv1 nobdr">Fair title</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">
											<input type="text" value="{$form.fair_title_en}" size="60" name="fair_title_en" id="fair_title_en" maxlength="255" class="var_bg_white" />
										</div>
										{if is_error('fair_title_en')}
											<span class="error-message">{message name="fair_title_en"}</span>
										{/if}
									</td>
								</tr>
							{if is_error('abbrev_title')}
								<tr class="errorcheck">
							{else}
								<tr>
							{/if}
									<th class="bg_gray_lv1 nobdr">Fair title (abbreviation)</th>
									<th class="bg_gray_lv1"></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">
											<input type="text" value="{$form.abbrev_title}" size="30" name="abbrev_title" id="abbrev_title" maxlength="255" class="var_bg_white" />
											<strong>（one-byte alphabet and numbers)</strong> Example: Ambiente
										</div>
										{if is_error('abbrev_title')}
											<span class="error-message">{message name="abbrev_title"}</span>
										{/if}
									</td>
								</tr>
							{if is_error('fair_url')}
								<tr class="errorcheck">
							{else}
								<tr>
							{/if}
									<th class="bg_gray_lv1 nobdr">URL</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">
											<input type="text" value="{if ('' == $form.fair_url)}http://{else}{$form.fair_url}{/if}" size="60" name="fair_url" id="fair_url" maxlength="255" class="var_bg_white" />
											Enter URLs beginning with http(s)://. <br/>
										</div>
										{if is_error('fair_url')}
											<span class="error-message">{message name="fair_url"}</span>
										{/if}
									</td>
								</tr>
							{if is_error('date_from_yyyy') || is_error('date_from_mm') || is_error('date_from_dd') || is_error('date_to_yyyy') || is_error('date_to_mm') || is_error('date_to_dd')}
								<tr class="errorcheck">
							{else}
								<tr>
							{/if}
									<th class="bg_gray_lv1 nobdr">Date</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
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
									<th class="bg_gray_lv1 nobdr">Frequency of exhibition</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_form_list pt0 pb0">
											<ul class="liner">
												{section name=it loop=$app.frequency_list}
													<li>
														<label>
															<input type="radio" value="{$app.frequency_list[it].kbn_2}" name="frequency" id="frequency" {if ($app.frequency_list[it].kbn_2 == $form.frequency)}checked{/if} />{$app.frequency_list[it].discription_en}&nbsp;
															{if (0 == (($smarty.section.it.index + 1) % 5))}<br/>{/if}
														</label>
													</li>
												{/section}
											</ul>
										</div>
										{if is_error('frequency')}
											<span class="error-message">{message name="frequency"}</span><br />
										{/if}
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="elem_table_basic">
						<div class="elem_table_heading">
							<p><strong>Industries/Products Covered</strong></p>
						</div>
						<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
							<colgroup>
								<col width="15%">
								<col width="7%">
								<col width="78%">
							</colgroup>
							<tbody>

							{if is_error('main_industory_1')}
								<tr class="errorcheck">
							{else}
								<tr>
							{/if}
									<th class="bg_gray_lv1 nobdr">Main/Sub Industry</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">Click “Select”, then choose industries. <br />
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
										</div>
										<div class="elem_linkBox_list">
											<ul class="var_small_pad">
												<li>
													<div class="linkBox">
														<button class="modalInput var_mini"rel="#jmesse_prompt" /><span>select</span></button>
													</div>
												</li>
											</ul>
										</div>
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
									<th class="bg_gray_lv1 nobdr">Exhibits</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">
											<textarea cols="60" rows="3" name="exhibits_en" id="exhibits_en "class="var_bg_white">{$form.exhibits_en}</textarea><br />
											Maximum of 300 letters
										</div>
										{if is_error('exhibits_en')}
											<span class="error-message">{message name="exhibits_en"}</span><br />
										{/if}
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="elem_table_basic">
						<div class="elem_table_heading">
							<p><strong>Location/Venue</strong></p>
						</div>
						<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
							<colgroup>
								<col width="15%">
								<col width="7%">
								<col width="78%">
							</colgroup>
							<tbody>
							{if is_error('region') || is_error('country') || is_error('city') || is_error('other_city_en')}
								<tr class="errorcheck">
							{else}
								<tr>
							{/if}
									<th class="bg_gray_lv1 nobdr">Location</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
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
									<th class="bg_gray_lv1 nobdr">Venue</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">
											<input type="text" value="{$form.venue_en}" name="venue_en" id="venue_en" maxlength="255" class="var_bg_white var_size_large" />
										</div>
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
									<th class="bg_gray_lv1 nobdr">Net square meters</th>
									<th class="bg_gray_lv1"></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">
											<input type="text" value="{$form.gross_floor_area}" size="5" name="gross_floor_area" id="gross_floor_area" maxlength="10" class="var_bg_white var_size_mini"/>
											 sq.m. <br />Enter only single-byte numbers with no commas. E.g. 1000
										</div>
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
								<th class="bg_gray_lv1 nobdr">Eligibility</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_form_list pt0 pb0">
										<ul class="liner">
											{section name=it loop=$app.open_to_list}
												<li>
													<label>
														<input name="open_to" id="open_to" value="{$app.open_to_list[it].kbn_2}" type="radio" {if ($app.open_to_list[it].kbn_2 == $form.open_to)}checked{/if} />{$app.open_to_list[it].discription_en}&nbsp;
													</label>
												</li>
											{/section}
										</ul>
									</div>
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
								<th class="bg_gray_lv1 nobdr">Method of admission</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_form_list pt0 pb0">
										<ul class="liner">
											<li>
												<label>
													<input name="admission_ticket_1" id="admission_ticket_1" value="1" type="checkbox" {if ('1' == $form.admission_ticket_1)}checked{/if} />
													<span>Free</span>
												</label>
											</li>
											<li>
												<label>
													<input name="admission_ticket_2" id="admission_ticket_2" value="1" type="checkbox" {if ('1' == $form.admission_ticket_2)}checked{/if} />
													<span>Apply/register online</span>
												</label>
											</li>
{*
											<li>
												<label>
													<input name="admission_ticket_3" id="admission_ticket_3" value="1" type="checkbox" {if ('1' == $form.admission_ticket_3)}checked{/if} />
													<span>Contact organizer/agency in Japan</span></label></li>
												</label>
											</li>
*}
											<li>
												<label>
													<input name="admission_ticket_4" id="admission_ticket_4" value="1" type="checkbox" {if ('1' == $form.admission_ticket_4)}checked{/if} />
													<span>Registration/tickets available at event</span>
												</label>
											</li>
											<li>
												<label>
													<input name="admission_ticket_5" id="admission_ticket_5" value="1" type="checkbox" {if ('1' == $form.admission_ticket_5)}checked{/if} />
													<span>Others</span>
												</label>
											</li>
											<li>
												<div class="elem_custom_input pt0">
													<input name="other_admission_ticket_en" id="other_admission_ticket_en" value="{$form.other_admission_ticket_en}" size="50" type="text" maxlength="500" class="var_bg_white var_size_middle" />(Multiple selections accepted)
												</div>
											</li>
										</ul>
									</div>
									"For details, please contact the organizer directly." will be shown automatically.<br />
									{if is_error('admission_ticket_1')}
										<span class="error-message">{message name="admission_ticket_1"}</span><br />
									{/if}
									{if is_error('other_admission_ticket_en')}
										<span class="error-message">{message name="other_admission_ticket_en"}</span><br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<a href="" onclick="history.back()" class="var_small"><span class="left">Back</span></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<div id="next_btn">
													<a href="" onclick="document.form_enFairRegistStep1.submit();return false;" class="var_small"><span>Next</span></a>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</p>
			</form>
			<!-- ** include START jetro_ssl_en **  -->
			{include file="user/jetro_ssl_en.tpl"}
			<!-- ** include END jetro_ssl_en **  -->
		</div>
	</div>

	<!-- select_industries dialog -->
	<div class="modal" id="jmesse_prompt">
		<a class="close" id="jmesse_btn_close"></a>
		<div class="elem_heading_lv4">
			<h4>Industry <span class="font_red">you can select up to 6 Industrys.</span></h4>
		</div>
		<form>
			<div class="industries clearfix">
				<div class="elem_jmesse_column">
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
				<div class="elem_jmesse_column">
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
				<div class="elem_jmesse_column">
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
			<div class="elem_linkBox_list right">
				<ul>
					<li>
						<div class="linkBox">
							<button type="button" class="var_mini" id="FIN_SELECT"><span>OK</span></button>
						<!-- /linkBox --></div>
					</li>
					<li>
						<div class="linkBox">
							<button type="button" class="var_mini var_gray close"><span class="noarrow">Cancel</span></button>
						</div>
					</li>
				</ul>
			</div>
		</form>
		<br />
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
