<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />

<!--テスト用-->
<base href="http://dev.jetro.go.jp" />
<!--/テスト用-->
<link href="/css/jp/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/j-messe/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/jp/printmedia.css" rel="stylesheet" type="text/css" media="print" />
{if ('1' == $form.print)}
<link href="/css/jp/print.css" rel="stylesheet" type="text/css" media="all" />
{/if}

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.tools.min.js"></script>
<script type="text/javascript" src="/j-messe/js/j-messe-form.js" charset="utf-8"></script>
<script type="text/javascript" src="{$config.url}js/jquery.dynamicselect.js"></script>
<script type="text/javascript" src="{$config.url}js/jquery.dynamicselectforjson.js"></script>
<script type="text/javascript">
<!--
{literal}
	function init(url, region, country, city) {
		if ('' != region) {
			dynamicpulldownlist(url+'?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=0', '', '#country', country);
			if ('' != country) {
				dynamicpulldownlist(url+'?action_json_getCity=true&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=0', '', '#city', city);
			}
		}
	}


	$(function(){
		$("#include_header").load("http://localhost/jmesse/www/header.html");
	});

	$(function(){
		$("#include_footer").load("http://localhost/jmesse/www/footer.html");
	});

	$(function(){
		$("#include_left_menu").load("http://localhost/jmesse/www/left_menu.html");
	});

	$(document).ready(function() {
		var triggers = $(".modalInput").overlay({
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
		$("#FIN_SELECT").click(function(e) {
			// get user input
			var input = $("#prompt input:checkbox:checked").map(function() {
				return this.value;
			}).get();
			if (6 < input.length) {
				window.alert('業種は6個まで選択できます');
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
		dynamicpulldownlist(url+'?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=0', '', '#country', null);
		clear_city();
	}

	function set_city(url) {
		var region = document.getElementById('region').options[document.getElementById('region').selectedIndex].value;
		var country = document.getElementById('country').options[document.getElementById('country').selectedIndex].value;
		dynamicpulldownlist(url+'?action_json_getCity=true&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=0', '', '#city', null);
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
<title>見本市登録 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
</head>
<body class="layout-LC highlight-match j-messe" onload="init('{$config.url}', '{$form.region}', '{$form.country}', '{$form.city}')">
	<!-- header -->
	<div id="include_header"></div>
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="/indexj.html">HOME</a></li>
			<li><a href="/database/">引き合い・展示会検索</a></li>
			<li><a href="/database/j-messe/">見本市・展示会データベース（J-messe）</a></li>
			<li><a href="/database/j-messe/tradefair/">世界の見本市・展示会</a></li>
			<li>見本市登録</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<div class="area">

			<!-- left -->
			<div id="include_left_menu"></div>
			<!-- /left -->

			<!-- center -->
			<div id="center">
				<div id="main">
					<div class="bgbox_set">
						<div class="bgbox_base">
							<div class="h1">
								<h1>見本市・展示会データベース</h1>
							</div>
							<div class="h2">
								<h2>見本市登録</h2>
							</div>
							<div class="in_main">
								<h3 class="img t_center">
									<img src="/j-messe/images/db/fair02.jpg" alt="見本市登録　ステップ1" />
								</h3>
								<p class="t_right">
									ユーザー：{$session.email}
								</p>

								{* エラー表示 *}
								{if count($errors)}
								<p class="error-message" id="error-pagetop">入力に誤りがあります。ご確認ください。</p>
								{/if}

								<form name="form_fairRegistStep1" id="form_fairRegistStep1" method="post" action="">
									<!-- HIDDEN -->
									<input type="hidden" name="action_user_fairRegistStep2" id="action_user_fairRegistStep2" value="dummy" />
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

									<h4>基本情報</h4>
									<table id="registration">
										<tr>
											<th class="item">見本市名</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input type="text" value="{$form.fair_title_jp}" size="60" name="fair_title_jp" id="fair_title_jp" maxlength="255" /><br />
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*見本市名.*/i':'見本市名' eq '見本市名'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">見本市略称</th>
											<th class="required"></th>
											<td>
												<input type="text" value="{$form.abbrev_title}" size="30"  name="abbrev_title" id="abbrev_title" maxlength="255" /><br />
												<strong>半角英数</strong>で入力してください。 例：Ambiente。<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*見本市略称.*/i':'見本市略称' eq '見本市略称'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">見本市公式サイトURL</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input type="text" value="{if ('' == $form.fair_url)}http://{else}{$form.fair_url}{/if}" size="60" name="fair_url" id="fair_url" maxlength="255" /><br />
												URLはhttp:// から入力して下さい。<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*見本市公式サイトURL.*/i':'見本市公式サイトURL' eq '見本市公式サイトURL'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">会期</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<select name="date_from_yyyy" size="1" id="date_from_yyyy">
													<option value=""></option>
													{section name=it loop=$app.year_list}
													<option value="{$app.year_list[it]}" {if $app.year_list[it]==$form.date_from_yyyy}selected{/if}>{$app.year_list[it]}</option>
													{/section}
												</select> 年
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
												</select> 月
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
												</select> 日 ～
												<select name="date_to_yyyy" size="1" id="date_to_yyyy">
													<option value=""></option>
													{section name=it loop=$app.year_list}
													<option value="{$app.year_list[it]}" {if ($app.year_list[it]==$form.date_to_yyyy)}selected{/if}>{$app.year_list[it]}</option>
													{/section}
												</select> 年
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
												</select> 月
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
												</select> 日まで<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*会期.*/i':'会期' eq '会期'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">開催頻度</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												{section name=it loop=$app.frequency_list}
												<input type="radio" value="{$app.frequency_list[it].kbn_2}" name="frequency" id="frequency" {if ($app.frequency_list[it].kbn_2 == $form.frequency)}checked{/if} />{$app.frequency_list[it].discription_jp}&nbsp;
												{if (0 == (($smarty.section.it.index + 1) % 5))}<br/>{/if}
												{/section}<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*開催頻度.*/i':'開催頻度' eq '開催頻度'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
									</table>

									<h4>業種・取扱品目</h4>
									<table id="registration">
										<tr>
											<th class="item">業種</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												現在、以下の業種が選択されています。<br />
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
												<button class="modalInput" rel="#prompt">業種選択</button><br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*業種.*/i':'業種' eq '業種'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">取扱品目</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<textarea cols="60" rows="3" name="exhibits_jp" id="exhibits_jp">{$form.exhibits_jp}</textarea><br />
												300文字以内で、具体的な品目名を記載ください。<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*取扱品目.*/i':'取扱品目' eq '取扱品目'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
									</table>
									<h4>開催地・会場</h4>
									<table id="registration">
										<tr>
											<th class="item">開催地</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												地域：
												<select name="region" id="region" style="width:200px;" onchange="set_country('{$config.url}')">
													<option value="">...</option>
													{section name=it loop=$app.region_list}
														<option value="{$app.region_list[it].kbn_2}" {if ($app.region_list[it].kbn_2 == $form.region)}selected{/if}>{$app.region_list[it].discription_jp}</option>
													{/section}
													</select>
												国・地域：
													<select name="country" id="country" style="width:200px;" onchange="set_city('{$config.url}')">
														<option value="">...</option>'
													</select><br/>
												都市：
													<select name="city" id="city" style="width:200px;">
														<option value="">...</option>'
													</select>
												その他：
													<input type="checkbox" name="check_other_city" id="check_other_city" value="1" {if ('1' == $form.check_other_city)}checked{/if} //>
													<input type="text" name="other_city_jp" id="other_city_jp" value="{$form.other_city_jp}" size="30" maxlength="100" /><br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*開催地.*/i':'開催地' eq '開催地'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">会場名</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input type="text" value="{$form.venue_jp}" size="50" name="venue_jp" id="venue_jp" maxlength="255" /><br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*会場名.*/i':'会場名' eq '会場名'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">開催予定規模</th>
											<th class="required"></th>
											<td>
												<input type="text" value="{$form.gross_floor_area}" size="5" name="gross_floor_area" id="gross_floor_area" maxlength="10" /> <strong>sqm（NET）</strong><br />
												半角数字で入力して下さい。","(カンマ)は使用しないで下さい。例：1000<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*開催予定規模.*/i':'開催予定規模' eq '開催予定規模'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
{*
										<tr>
											<th class="item">会場までの交通手段</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input type="text" value="{$form.transportation_jp}" size="60" name="transportation_jp" id="transportation_jp" maxlength="500"><br />
												例：成田空港からA12バスで30分<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*会場までの交通手段.*/i':'会場までの交通手段' eq '会場までの交通手段'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
*}
										<tr>
											<th class="item">入場資格</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												{section name=it loop=$app.open_to_list}
												<input name="open_to" id="open_to" value="{$app.open_to_list[it].kbn_2}" type="radio" {if ($app.open_to_list[it].kbn_2 == $form.open_to)}checked{/if}>{$app.open_to_list[it].discription_jp}&nbsp;
												{/section}<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*入場資格.*/i':'入場資格' eq '入場資格'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">チケットの入手方法</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input name="admission_ticket_1" id="admission_ticket_1" value="1" type="checkbox" {if ('1' == $form.admission_ticket_1)}checked{/if} />登録の必要なし
												<input name="admission_ticket_2" id="admission_ticket_2" value="1" type="checkbox" {if ('1' == $form.admission_ticket_2)}checked{/if} />WEBからの事前登録 <br />
												<input name="admission_ticket_3" id="admission_ticket_3" value="1" type="checkbox" {if ('1' == $form.admission_ticket_3)}checked{/if} />主催者・日本の照会先へ問い合わせ
												<input name="admission_ticket_4" id="admission_ticket_4" value="1" type="checkbox" {if ('1' == $form.admission_ticket_4)}checked{/if} />当日会場で入手 <br />
												<input name="admission_ticket_5" id="admission_ticket_5" value="1" type="checkbox" {if ('1' == $form.admission_ticket_5)}checked{/if} />その他<input name="other_admission_ticket_jp" id="other_admission_ticket_jp" value="{$form.other_admission_ticket_jp}" size="50" type="text" maxlength="500" /> <br />
												複数選択可能<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*チケットの入手方法.*/i':'チケットの入手方法' eq 'チケットの入手方法'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
{*
										<tr>
											<th class="item">出展申込締切日</th>
											<th class="required"></th>
											<td>
												<select name="app_dead_yyyy" size="1" id="app_dead_yyyy">
													<option value=""></option>
													{section name=it loop=$app.year_list}
													<option value="{$app.year_list[it]}" {if ($app.year_list[it]==$form.app_dead_yyyy)}selected{/if}>{$app.year_list[it]}</option>
													{/section}
												</select> 年
												<select name="app_dead_mm" size="1" id="app_dead_mm">
													<option value=""></option>
													<option value="01" {if ('01' == $form.app_dead_mm)}selected{/if}>1</option>
													<option value="02" {if ('02' == $form.app_dead_mm)}selected{/if}>2</option>
													<option value="03" {if ('03' == $form.app_dead_mm)}selected{/if}>3</option>
													<option value="04" {if ('04' == $form.app_dead_mm)}selected{/if}>4</option>
													<option value="05" {if ('05' == $form.app_dead_mm)}selected{/if}>5</option>
													<option value="06" {if ('06' == $form.app_dead_mm)}selected{/if}>6</option>
													<option value="07" {if ('07' == $form.app_dead_mm)}selected{/if}>7</option>
													<option value="08" {if ('08' == $form.app_dead_mm)}selected{/if}>8</option>
													<option value="09" {if ('09' == $form.app_dead_mm)}selected{/if}>9</option>
													<option value="10" {if ('10' == $form.app_dead_mm)}selected{/if}>10</option>
													<option value="11" {if ('11' == $form.app_dead_mm)}selected{/if}>11</option>
													<option value="12" {if ('12' == $form.app_dead_mm)}selected{/if}>12</option>
												</select> 月
												<select name="app_dead_dd" size="1" id="app_dead_dd">
													<option value=""></option>
													<option value="01" {if ('01' == $form.app_dead_dd)}selected{/if}>1</option>
													<option value="02" {if ('02' == $form.app_dead_dd)}selected{/if}>2</option>
													<option value="03" {if ('03' == $form.app_dead_dd)}selected{/if}>3</option>
													<option value="04" {if ('04' == $form.app_dead_dd)}selected{/if}>4</option>
													<option value="05" {if ('05' == $form.app_dead_dd)}selected{/if}>5</option>
													<option value="06" {if ('06' == $form.app_dead_dd)}selected{/if}>6</option>
													<option value="07" {if ('07' == $form.app_dead_dd)}selected{/if}>7</option>
													<option value="08" {if ('08' == $form.app_dead_dd)}selected{/if}>8</option>
													<option value="09" {if ('09' == $form.app_dead_dd)}selected{/if}>9</option>
													<option value="10" {if ('10' == $form.app_dead_dd)}selected{/if}>10</option>
													<option value="11" {if ('11' == $form.app_dead_dd)}selected{/if}>11</option>
													<option value="12" {if ('12' == $form.app_dead_dd)}selected{/if}>12</option>
													<option value="13" {if ('13' == $form.app_dead_dd)}selected{/if}>13</option>
													<option value="14" {if ('14' == $form.app_dead_dd)}selected{/if}>14</option>
													<option value="15" {if ('15' == $form.app_dead_dd)}selected{/if}>15</option>
													<option value="16" {if ('16' == $form.app_dead_dd)}selected{/if}>16</option>
													<option value="17" {if ('17' == $form.app_dead_dd)}selected{/if}>17</option>
													<option value="18" {if ('18' == $form.app_dead_dd)}selected{/if}>18</option>
													<option value="19" {if ('19' == $form.app_dead_dd)}selected{/if}>19</option>
													<option value="20" {if ('20' == $form.app_dead_dd)}selected{/if}>20</option>
													<option value="21" {if ('21' == $form.app_dead_dd)}selected{/if}>21</option>
													<option value="22" {if ('22' == $form.app_dead_dd)}selected{/if}>22</option>
													<option value="23" {if ('23' == $form.app_dead_dd)}selected{/if}>23</option>
													<option value="24" {if ('24' == $form.app_dead_dd)}selected{/if}>24</option>
													<option value="25" {if ('25' == $form.app_dead_dd)}selected{/if}>25</option>
													<option value="26" {if ('26' == $form.app_dead_dd)}selected{/if}>26</option>
													<option value="27" {if ('27' == $form.app_dead_dd)}selected{/if}>27</option>
													<option value="28" {if ('28' == $form.app_dead_dd)}selected{/if}>28</option>
													<option value="29" {if ('29' == $form.app_dead_dd)}selected{/if}>29</option>
													<option value="30" {if ('30' == $form.app_dead_dd)}selected{/if}>30</option>
													<option value="21" {if ('31' == $form.app_dead_dd)}selected{/if}>31</option>
												</select> 日<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*出展申込締切日.*/i':'出展申込締切日' eq '出展申込締切日'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
*}
									</table>
									<div class="line_dot">
										<hr />
									</div>
									<table width="100%">
										<tr>
											<td width="250px"><a href="{$config.url}?action_user_fairManu=true"><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" /></a></td>
											<td align="right"><input type="image" src="/j-messe/images/db/btn-next.gif" alt="次へ" width="180" height="37" class="over" /></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
				<p class="totop">
					{if ('c' == $form.mode || 'e' == $form.mode)}
						{if ('1' == $form.back)}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep1=true&mode={$form.mode}&mihon_no={$form.mihon_no}&back=1&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{else}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep1=true&mode={$form.mode}&mihon_no={$form.mihon_no}&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{/if}
					{else}
						{if ('1' == $form.back)}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep1=true&back=1&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{else}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep1=true&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{/if}
					{/if}
					<a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /></a>
				</p>
			</div>
			<!-- /center -->
		</div>
	</div>
	<!-- /contents -->

	<!-- select_industries dialog -->
	<div class="modal" id="prompt">
		<a class="close" id="btn_close"></a>
		<h2>
			業種選択 <span>業種は6つまで選択できます。</span>
		</h2>
		<form>
			<div class="industries clearfix">
				<div class="column">
					<h5>総合</h5>
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
					<h5>基礎産業</h5>
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
					<h5>建築</h5>
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
					<h5>機械・工業技術</h5>
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
					<h5>情報・通信</h5>
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
					<h5>輸送・物流・包装</h5>
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

					<h5>医療・健康</h5>
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
					<h5>サービス</h5>
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
					<h5>その他</h5>
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
					<h5>生活</h5>
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
					<h5>趣味・教育</h5>
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
				</div>
			</div>
			<div class="btn">
				<button type="button" id="FIN_SELECT">選択終了</button>
				<button type="button" class="close">キャンセル</button>
			</div>
		</form>
		<br />
	</div>

	<!-- footer -->
	<div id="include_footer"></div>
	<!-- /footer -->

</body>
</html>
