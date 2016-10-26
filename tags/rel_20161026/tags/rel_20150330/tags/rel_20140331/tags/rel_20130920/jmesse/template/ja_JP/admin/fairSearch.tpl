<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="{$config.css_js_base}js/jquery.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselect.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselectforjson.js"></script>
<script type="text/javascript">
{literal}
<!--
	/**
	 * 初期表示。
	 */
	function init(sub_industory, country) {
		// 業種関連
		var main_industory = document.getElementById('main_industory').options[document.getElementById('main_industory').selectedIndex].value;
		if ('' == sub_industory) {
			sub_industory = document.getElementById('tmp_sub_industory').value;
		} else {
			document.getElementById('tmp_sub_industory').value = sub_industory;
		}
		if (null != main_industory && '' != main_industory) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&search=1&kbn_2='+main_industory+'&use_language_flag=0', '', '#sub_industory', sub_industory);
		}

		// 開催地関連
		if ('' == country) {
			country = document.getElementById('tmp_country').value;
		} else {
			document.getElementById('tmp_country').value = country;
		}
		var region = document.getElementById('region').options[document.getElementById('region').selectedIndex].value;
		if (null != region && '' != region) {
			dynamicpulldownlist('?action_json_getCountry=true&search=1&kbn_2='+region+'&use_language_flag=0', '', '#country', country);
		}
	}
	/**
	 * 業種関連。
	 */
	function set_sub_industory() {
		var main_industory = document.getElementById('main_industory').options[document.getElementById('main_industory').selectedIndex].value;
		dynamicpulldownlist('?action_json_getSubIndustory=true&search=1&kbn_2='+main_industory+'&use_language_flag=0','','#sub_industory',null);
	}
	function save_sub_industory() {
		document.getElementById('tmp_sub_industory').value = document.getElementById('sub_industory').options[document.getElementById('sub_industory').selectedIndex].value;
	}

	/**
	 * 開催地関連。
	 */
	function set_country() {
		var region = document.getElementById('region').options[document.getElementById('region').selectedIndex].value;
		dynamicpulldownlist('?action_json_getCountry=true&search=1&kbn_2='+region+'&use_language_flag=0','','#country',null);
	}
	function save_country() {
		document.getElementById('tmp_country').value = document.getElementById('country').options[document.getElementById('country').selectedIndex].value;
		document.getElementById('city_name').value = '';
		document.getElementById('city').value = '';
	}
	function open_select_city(url) {
		var region = document.getElementById('region').options[document.getElementById('region').selectedIndex].value;
		var country = document.getElementById('country').options[document.getElementById('country').selectedIndex].value;
		if ('' == region || '001' == region ||'' == country || '001' == country) {
			window.alert('地域と国・地域の両方を選択して下さい');
			return;
		}
		window.open("?action_admin_selectCity=1&kbn_2=" + region + "&kbn_3=" + country + "&use_language_flag=2", 'select_city', 'width=400, height=300, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
	}
	function search() {
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_admin_fairList';
		action.id = 'action_admin_fairList';
		action.value = 'dummy';
		document.getElementById('form_fairSearch').appendChild(action);
		document.getElementById('form_fairSearch').submit();
	}
	function summary() {
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_admin_fairSummary';
		action.id = 'action_admin_fairSummary';
		action.value = 'dummy';
		document.getElementById('form_fairSearch').appendChild(action);
		document.getElementById('form_fairSearch').submit();
	}
	// -->
{/literal}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body onload="init('{$form.sub_industory}', '{$form.country}')">
	<form name="form_fairSearch" id="form_fairSearch" method="post" action="">
		<input type="hidden" name="type" id="type" value="a" />
		<input type="hidden" name="tmp_sub_industory" id="tmp_sub_industory" value="{if ('' == $form.tmp_sub_industory)}{$form.sub_industory}{else}{$form.tmp_sub_industory}{/if}" />
		<input type="hidden" name="tmp_country" id="tmp_country" value="{$form.country}" />
		<input type="hidden" name="city" id="city" value="{$form.city}" />
		<table style="width: 100%;">
			<tr>
				<td valign="top" style="width: 200px;">{include file="admin/menu.tpl"}</td>
				<td valign="top">

					<div align="center">
						<font size="5"><b>見本市ＤＢ 管理者用</b></font>
					</div>
					<hr>

					{* エラー表示 *}
					{if count($errors)}
					<ul>
						{foreach from=$errors item=error}
						<li><font color="#ff0000">{$error}</font></li>
						{/foreach}
					</ul>
					{/if}

					<div align="center">検索画面</div>
					<input type="button" value="検索実行" onclick="search()" />
					<input type="button" value="集計実行" onclick="summary()" />
					<input type="reset" value="リセット" />
					<hr/>
					<dl>
						<!-- 全文検索 -->
						<dt>キーワード
						<dd><input type="text" name="phrases" id="phrases" value="{$form.phrases}" size="40" />
						<dd><input type="radio" name="phrase_connection" id="phrase_connection" value="a" {if ('a' == $form.phrase_connection || '' == $form.phrase_connection)}checked{/if} />両方を含む（AND）
						<dd><input type="radio" name="phrase_connection" id="phrase_connection" value="o" {if ('o' == $form.phrase_connection)}checked{/if}>どちらかを含む（OR）
					</dl>
					<hr>

					項目検索
					<table border="1">
						<tr>
							<td nowrap>項目間の関連</td>
							<td nowrap>
								<input type="radio" name="connection" id="connection" value="a" {if ('a' == $form.connection || '' ==$form.connection)}checked{/if} />AND
								<input type="radio" name="connection" id="connection" value="o" {if ('o' == $form.connection)}checked{/if} />OR
							</td>
						</tr>
						<tr>
							<td nowrap>項目内の関連</td>
							<td nowrap>
								<input type="radio" name="relation" id="relation" value="a" {if ('a' == $form.relation)}checked{/if} />AND
								<input type="radio" name="relation" id="relation" value="o" {if ('o' == $form.relation || '' == $form.relation)}checked{/if} />OR
							</td>
						</tr>

						<tr>
							<td nowrap>Webページの表示／非表示</td>
							<!-- Ｗｅｂページの表示／非表示 -->
							<td nowrap>
								<input type="checkbox" name="web_display_type[]" id="web_display_type[]" value="1"
								{section name=it loop=$form.web_display_type}
								{if ('1' == $form.web_display_type[it])}checked{/if}
								{/section}
								/>表示する
								<input type="checkbox" name="web_display_type[]" id="web_display_type[]" value="0"
								{section name=it loop=$form.web_display_type}
								{if ('0' == $form.web_display_type[it])}checked{/if}
								{/section}
								/>表示しない
							</td>
						</tr>

						<tr>
							<td nowrap>承認フラグ</td>
							<!-- 承認フラグ -->
							<!-- 否認コメント -->
							<td nowrap>
								<input type="checkbox" name="confirm_flag[]" id="confirm_flag[]" value="1"
								{section name=it loop=$form.confirm_flag}
								{if ('1' == $form.confirm_flag[it])}checked{/if}
								{/section}
								/>承認
								<input type="checkbox" name="confirm_flag[]" id="confirm_flag[]" value="0"
								{section name=it loop=$form.confirm_flag}
								{if ('0' == $form.confirm_flag[it])}checked{/if}
								{/section}
								/>承認待ち
								<input type="checkbox" name="confirm_flag[]" id="confirm_flag[]" value="2"
								{section name=it loop=$form.confirm_flag}
								{if ('2' == $form.confirm_flag[it])}checked{/if}
								{/section}
								/>否認<br/>
								否認コメント：<input type="text" name="negate_comment" id="negate_comment" value="{$form.negate_comment}" size="50" />
								<select name="negate_comment_cond" id="negate_comment_cond">
									<option value="1" {if ('1' == $form.negate_comment_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.negate_comment_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.negate_comment_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.negate_comment_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.negate_comment_cond || '' == $form.negate_comment_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.negate_comment_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap>メール送信フラグ</td>
							<!-- メール送信フラグ -->
							<td nowrap>
								<input type="checkbox" name="mail_send_flag[]" id="mail_send_flag[]" value="1"
								{section name=it loop=$form.mail_send_flag}
								{if ('1' == $form.mail_send_flag[it])}checked{/if}
								{/section}
								/>送信しない
								<input type="checkbox" name="mail_send_flag[]" id="mail_send_flag[]" value="0"
								{section name=it loop=$form.mail_send_flag}
								{if ('0' == $form.mail_send_flag[it])}checked{/if}
								{/section}
								/>送信する
							</td>
						</tr>

						<tr>
							<td nowrap>ユーザ使用言語フラグ</td>
							<!-- ユーザ使用言語フラグ -->
							<td nowrap>
								<input type="checkbox" name="use_language_flag[]" id="use_language_flag[]" value="0"
								{section name=it loop=$form.use_language_flag}
								{if ('0' == $form.use_language_flag[it])}checked{/if}
								{/section}
								/>日本語
								<input type="checkbox" name="use_language_flag[]" id="use_language_flag[]" value="1"
								{section name=it loop=$form.use_language_flag}
								{if ('1' == $form.use_language_flag[it])}checked{/if}
								{/section}
								/>英語
							</td>
						</tr>

						<tr>
							<td nowrap>Eメール</td>
							<!-- Eメール -->
							<td nowrap>
								<input type="text" name="email" id="email" value="{$form.email}" size="50" />
								<select name="email_cond" id="email_cond">
									<option value="1" {if ('1' == $form.email_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.email_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.email_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.email_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.email_cond || '' == $form.email_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.email_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap>申請年月日</td>
							<!-- 申請年月日 -->
							<td nowrap>
								<input type="text" name="date_of_application_y_from" id="date_of_application_y_from" value="{$form.date_of_application_y_from}" maxlength="4" size="4" />年
								<input type="text" name="date_of_application_m_from" id="date_of_application_m_from" value="{$form.date_of_application_m_from}" maxlength="2" size="2" />月
								<input type="text" name="date_of_application_d_from" id="date_of_application_d_from" value="{$form.date_of_application_d_from}" maxlength="2" size="2" />日から&nbsp;
								<input type="text" name="date_of_application_y_to" id="date_of_application_y_to" value="{$form.date_of_application_y_to}" maxlength="4" size="4" />年
								<input type="text" name="date_of_application_m_to" id="date_of_application_m_to" value="{$form.date_of_application_m_to}" maxlength="2" size="2" />月
								<input type="text" name="date_of_application_d_to" id="date_of_application_d_to" value="{$form.date_of_application_d_to}" maxlength="2" size="2" />日まで
							</td>
						</tr>

						<tr>
							<td nowrap>登録日(承認日)</td>
							<!-- 登録日(承認日) -->
							<td nowrap>
								<input type="text" name="date_of_registration_y_from" id="date_of_registration_y_from" value="{$form.date_of_registration_y_from}" maxlength="4" size="4" />年
								<input type="text" name="date_of_registration_m_from" id="date_of_registration_m_from" value="{$form.date_of_registration_m_from}" maxlength="2" size="2" />月
								<input type="text" name="date_of_registration_d_from" id="date_of_registration_d_from" value="{$form.date_of_registration_d_from}" maxlength="2" size="2" />日から&nbsp;
								<input type="text" name="date_of_registration_y_to" id="date_of_registration_y_to" value="{$form.date_of_registration_y_to}" maxlength="4" size="4" />年
								<input type="text" name="date_of_registration_m_to" id="date_of_registration_m_to" value="{$form.date_of_registration_m_to}" maxlength="2" size="2" />月
								<input type="text" name="date_of_registration_d_to" id="date_of_registration_d_to" value="{$form.date_of_registration_d_to}" maxlength="2" size="2" />日まで
							</td>
						</tr>

						<tr>
							<td nowrap>Web表示言語</td>
							<!-- 言語選択情報 -->
							<td nowrap>
								<input type="checkbox" name="select_language_info[]" id="select_language_info[]" value="0"
								{section name=it loop=$form.select_language_info}
								{if ('0' == $form.select_language_info[it])}checked{/if}
								{/section}
								/>日本語
								<input type="checkbox" name="select_language_info[]" id="select_language_info[]" value="2"
								{section name=it loop=$form.select_language_info}
								{if ('2' == $form.select_language_info[it])}checked{/if}
								{/section}
								/>日本語・英語両方
								<input type="checkbox" name="select_language_info[]" id="select_language_info[]" value="1"
								{section name=it loop=$form.select_language_info}
								{if ('1' == $form.select_language_info[it])}checked{/if}
								{/section}
								/>英語
							</td>
						</tr>

						<tr>
							<td nowrap>見本市番号</td>
							<!-- 見本市番号 -->
							<td nowrap>
								<input type="text" name="mihon_no_from" id="mihon_no_from" value="{$form.mihon_no_from}" size=20 />～
								<input type="text" name="mihon_no_to" id="mihon_no_to" value="{$form.mihon_no_to}" size=20 />
								<select name="mihon_no_cond" id="mihon_no_cond">
									<option value="10" {if ('10' == $form.mihon_no_cond || '' == $form.mihon_no_cond)}selected{/if}>範囲</option>
									<option value="11" {if ('11' == $form.mihon_no_cond)}selected{/if}>範囲外</option>
									<option value="1" {if ('1' == $form.mihon_no_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.mihon_no_cond)}selected{/if}>不一致</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap rowspan="2">見本市名</td>
							<!-- 見本市名(日) -->
							<!-- 見本市名(英) -->
							<td nowrap>日：
								<input type="text" name="fair_title_jp" id="fair_title_jp" value="{$form.fair_title_jp}" size="50" />
								<select name="fair_title_jp_cond" id="fair_title_jp_cond">
									<option value="1" {if ('1' == $form.fair_title_jp_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.fair_title_jp_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.fair_title_jp_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.fair_title_jp_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.fair_title_jp_cond || '' == $form.fair_title_jp_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.fair_title_jp_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>英：
								<input type="text" name="fair_title_en" id="fair_title_en" value="{$form.fair_title_en}" size="50" />
								<select name="fair_title_en_cond" id="fair_title_en_cond">
									<option value="1" {if ('1' == $form.fair_title_en_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.fair_title_en_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.fair_title_en_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.fair_title_en_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.fair_title_en_cond || '' == $form.fair_title_en_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.fair_title_en_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>見本市略称</td>
							<!-- 見本市略称(英) -->
							<td nowrap>
								<input type="abbrev_title" name="abbrev_title" id="abbrev_title" value="{$form.abbrev_title}" size="50" />
								<select name="abbrev_title_cond" id="abbrev_title_cond">
									<option value="1" {if ('1' == $form.abbrev_title_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.abbrev_title_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.abbrev_title_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.abbrev_title_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.abbrev_title_cond || '' == $form.abbrev_title_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.abbrev_title_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>見本市URL</td>
							<!-- 見本市ＵＲＬ -->
							<td nowrap>
								<input type="text" name="fair_url" id="fair_url" value="{$form.fair_url}" size="50" />
								<select name="fair_url_cond" id="fair_url_cond">
									<option value="1" {if ('1' == $form.fair_url_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.fair_url_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.fair_url_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.fair_url_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.fair_url_cond || '' == $form.fair_url_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.fair_url_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap rowspan="2">キャッチフレーズ</td>
							<!-- キャッチフレーズ(日) -->
							<!-- キャッチフレーズ(英) -->
							<td nowrap>日：
								<input type="text" name="profile_jp" id="profile_jp" value="{$form.profile_jp}" size="50" />
								<select name="profile_jp_cond" id="profile_jp_cond">
									<option value="1" {if ('1' == $form.profile_jp_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.profile_jp_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.profile_jp_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.profile_jp_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.profile_jp_cond || '' == $form.profile_jp_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.profile_jp_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>英：
								<input type="text" name="profile_en" id="profile_en" value="{$form.profile_en}" size="50" />
								<select name="profile_en_cond" id="profile_en_cond">
									<option value="1" {if ('1' == $form.profile_en_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.profile_en_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.profile_en_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.profile_en_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.profile_en_cond || '' == $form.profile_en_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.profile_en_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap rowspan="2">ＰＲ・紹介文</td>
							<!-- ＰＲ・紹介文(日) -->
							<!-- ＰＲ・紹介文(英) -->
							<td nowrap>日：
								<input type="text" name="detailed_information_jp" id="detailed_information_jp" value="{$form.detailed_information_jp}" size="50" />
								<select name="detailed_information_jp_cond" id="detailed_information_jp_cond">
									<option value="1" {if ('1' == $form.detailed_information_jp_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.detailed_information_jp_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.detailed_information_jp_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.detailed_information_jp_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.detailed_information_jp_cond || '' == $form.detailed_information_jp_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.detailed_information_jp_cond)}selected{/if}>含まず</option>
									{*<option value="9" {if ('9' == $form.detailed_information_jp_cond)}selected{/if}>一致(全)</option>
									<option value="10" {if ('10' == $form.detailed_information_jp_cond)}selected{/if}>前一致(全)</option>
									<option value="11" {if ('11' == $form.detailed_information_jp_cond)}selected{/if}>含む(全)</option>*}
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>英：
								<input type="text" name="detailed_information_en" id="detailed_information_en" value="{$form.detailed_information_en}" size="50" />
								<select name="detailed_information_en_cond" id="detailed_information_en_cond">
									<option value="1" {if ('1' == $form.detailed_information_en_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.detailed_information_en_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.detailed_information_en_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.detailed_information_en_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.detailed_information_en_cond || '' == $form.detailed_information_en_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.detailed_information_en_cond)}selected{/if}>含まず</option>
									{*<option value="9" {if ('9' == $form.detailed_information_en_cond)}selected{/if}>一致(全)</option>
									<option value="10" {if ('10' == $form.detailed_information_en_cond)}selected{/if}>前一致(全)</option>
									<option value="11" {if ('11' == $form.detailed_information_en_cond)}selected{/if}>含む(全)</option>*}
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap>会期</td>
							<!-- 開始年月 -->
							<!-- 開始日 -->
							<!-- 終了年月 -->
							<!-- 終了日 -->
							<td nowrap>
								<input type="text" name="date_from_yyyy" id="date_from_yyyy" value="{$form.date_from_yyyy}" maxlength="4" size="4" />年
								<input type="text" name="date_from_mm" id="date_from_mm" value="{$form.date_from_mm}" maxlength="2" size="2" />月
								<input type="text" name="date_from_dd" id="date_from_dd" value="{$form.date_from_dd}" maxlength="2" size="2" />日から&nbsp;
								<input type="text" name="date_to_yyyy" id="date_to_yyyy" value="{$form.date_to_yyyy}" maxlength="4" size="4" />年
								<input type="text" name="date_to_mm" id="date_to_mm" value="{$form.date_to_mm}" maxlength="2" size="2" />月
								<input type="text" name="date_to_dd" id="date_to_dd" value="{$form.date_to_dd}" maxlength="2" size="2" />日まで<br/>
								<font size="-1">■例：2002年8月1日の場合には半角数字で、2002 08 01 と入力してください。</font><br/><br/>
								<font size="-1">※会期未定を検索する場合、「会期未定検索する」にチェックをつけてください。</font><br/>
								<input type="checkbox" name="kaiki_mitei" id="kaiki_mitei" value="1" {if ('1' == $kaiki_mitei)}checked{/if} />会期未定検索する
							</td>
						</tr>

						<tr>
							<td nowrap>開催頻度</td>
							<!-- 開催頻度(日) -->
							<!-- 開催頻度(英) -->
							<td nowrap>
							<table>
								{section name=it loop=$app.frequency}
								{if (0 == (($smarty.section.it.index) % 5))}
								<tr>
								{/if}
									<td><input type="checkbox" name="frequency[]" id="frequency[]" value="{$app.frequency[it].kbn_2}"
									{section name=it2 loop=$form.frequency}
									{if ($form.frequency[it2] == $app.frequency[it].kbn_2)}checked{/if}
									{/section}
									/>{$app.frequency[it].discription_jp}</td>
								{if (0 == (($smarty.section.it.index + 1) % 5))}
								</tr>
								{/if}
								{/section}
							</table>
							</td>
						</tr>

						<tr>
							<td nowrap>業種</td>
							<!-- 業種大分類(日) -->
							<td nowrap>
								1.大分類
								<select name="main_industory" id="main_industory" style="width:200px;" onchange="set_sub_industory()">
									<option value="" {if ('' == $form.main_industory)}selected{/if}>すべて</option>
									{section name=it loop=$app.main_industory}
									<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory == $app.main_industory[it].kbn_2)}selected{/if} />{$app.main_industory[it].discription_jp}</option>
									{/section}
								</select>
								<br>
								2.小分類
								<select name="sub_industory" id="sub_industory" style="width:200px;" onchange="save_sub_industory()">
									<option value="" {if ('' == $form.sub_industory)}selected{/if}>すべて</option>
								</select>
								<br>
								<font size="-1">■ 1.大分類→2.小分類 の順に選択。</font>
							</td>
						</tr>

						<tr>
							<td nowrap rowspan="2">出品物</td>
							<!-- 出品物(日) -->
							<!-- 出品物(英) -->
							<td nowrap>日：
								<input type="text" name="exhibits_jp" id="exhibits_jp" value="{$form.exhibits_jp}" size="50" />
								<select name="exhibits_jp_cond" id="exhibits_jp_cond">
									<option value="1" {if ('1' == $form.exhibits_jp_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.exhibits_jp_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.exhibits_jp_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.exhibits_jp_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.exhibits_jp_cond || '' == $form.exhibits_jp_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.exhibits_jp_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>英：
								<input type="text" name="exhibits_en" id="exhibits_en" value="{$form.exhibits_en}" size="50" />
								<select name="exhibits_en_cond" id="exhibits_en">
									<option value="1" {if ('1' == $form.exhibits_en_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.exhibits_en_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.exhibits_en_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.exhibits_en_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.exhibits_en_cond || '' == $form.exhibits_en_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.exhibits_en_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap>開催地</td>
							<!-- 開催地域(日) -->
							<!-- 開催地域(英) -->
							<!-- 開催国(日) -->
							<!-- 開催国(英) -->
							<!-- 開催都市(日) -->
							<!-- 開催都市(英) -->
							<!-- その他の都市(日) -->
							<!-- その他の都市(英) -->
							<td nowrap>
								<table>
									<tr>
										<td>1.地域</td>
										<td>
											<select name="region" id="region" style="width:200px;" onchange="set_country()">
												{section name=it loop=$app.region}
												<option value="{$app.region[it].kbn_2}" {if ($form.region == $app.region[it].kbn_2)}selected{/if}>{$app.region[it].discription_jp}</option>
												{/section}
											</select>
										</td>
									</tr>
									<tr>
										<td>2.国・地域</td>
										<td>
											<select name="country" id="country" style="width:200px;" onchange="save_country()">
												{section name=it loop=$app.country}
												<option value="{$app.country[it].kbn_3}" {if ($form.country == $app.country[it].kbn_3)}selected{/if}>{$app.country[it].discription_jp}</option>
												{/section}
											</select>
										</td>
									</tr>
									<tr>
										<td>3.<a href="javascript:open_select_city('{$config.url}')">都市を選択</a></td>
										<td>
											<input type="text" name="city_name" id="city_name" size="35" value="{$form.city_name}" readonly />
										</td>
									</tr>
									<tr>
										<td rowspan="2">その他</td>
										<td>日：
											<input type="text" name="other_city_jp" id="other_city_jp" value="{$form.other_city_jp}" size="50" />
											<select name="other_city_jp_cond" id="other_city_jp_cond">
												<option value="1" {if ('1' == $form.other_city_jp_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.other_city_jp_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.other_city_jp_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.other_city_jp_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.other_city_jp_cond || '' == $form.other_city_jp_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.other_city_jp_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>英：
											<input type="text" name="other_city_en" id="other_city_en" value="{$form.other_city_en}" size="50" />
											<select name="other_city_en_cond" id="other_city_en_cond">
												<option value="1" {if ('1' == $form.other_city_en_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.other_city_en_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.other_city_en_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.other_city_en_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.other_city_en_cond || '' == $form.other_city_en_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.other_city_en_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
								</table> <font size="-1">■ 1.地域→2.国→3.都市 の順に選択。</font>
							</td>
						</tr>

						<tr>
							<td nowrap rowspan="2">会場名</td>
							<!-- 会場名(日) -->
							<!-- 会場名(英) -->
							<td nowrap>日：
								<input type="text" name="venue_jp" id="venue_jp" value="{$form.venue_jp}" size="50" />
								<select name="venue_jp_cond" id="venue_jp_cond">
									<option value="1" {if ('1' == $form.venue_jp_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.venue_jp_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.venue_jp_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.venue_jp_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.venue_jp_cond || '' == $form.venue_jp_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.venue_jp_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>英：
								<input type="text" name="venue_en" id="venue_en" value="{$form.venue_en}" size="50" />
								<select name="venue_en_cond" id="venue_en_cond">
									<option value="1" {if ('1' == $form.venue_en_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.venue_en_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.venue_en_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.venue_en_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.venue_en_cond || '' == $form.venue_en_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.venue_en_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap>開催予定規模</td>
							<!-- 開催予定規模 -->
							<td nowrap>
								<input type="text" name="gross_floor_area_from" id="gross_floor_area_from" value="{$form.gross_floor_area_from}" size=20>～<input type="text" name="gross_floor_area_to" id="gross_floor_area_to" value="{$form.gross_floor_area_to}" size=20>sq.m.
								<select name="gross_floor_area_cond" id ="gross_floor_area_cond">
									<option value="10" {if ('10' == $form.gross_floor_area_cond || '' == $form.gross_floor_area_cond)}selected{/if}>範囲</option>
									<option value="11" {if ('11' == $form.gross_floor_area_cond)}selected{/if}>範囲外</option>
									<option value="1" {if ('1' == $form.gross_floor_area_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.gross_floor_area_cond)}selected{/if}>不一致</option>
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap>入場資格</td>
							<!-- 入場資格(日) -->
							<!-- 入場資格(英) -->
							<td nowrap>
								{section name=it loop=$app.open_to}
								<input type="checkbox" name="open_to[]" id="open_to[]" value="{$app.open_to[it].kbn_2}"
								{section name=it2 loop=$form.open_to}
								{if ($app.open_to[it].kbn_2 == $form.open_to[it2])}checked{/if}
								{/section}
								/>{$app.open_to[it].discription_jp}
								{/section}
							</td>
						</tr>

						<tr>
							<td nowrap>チケットの入手方法</td>
							<!-- チケットの入手方法(日) -->
							<!-- チケットの入手方法(英) -->
							<!-- その他のチケットの入手方法(日) -->
							<!-- その他のチケットの入手方法(英) -->
							<td nowrap>

								<table>
									<tr>
										<td><input type="checkbox" name="admission_ticket_1" id="admission_ticket_1" value="1" {if ("1" == $form.admission_ticket_1)}checked{/if} />登録の必要なし</td>
										<td><input type="checkbox" name="admission_ticket_2" id="admission_ticket_2" value="1" {if ("1" == $form.admission_ticket_2)}checked{/if} />WEBからの事前登録</td>
									</tr>
									<tr>
										<td><input type="checkbox" name="admission_ticket_3" id="admission_ticket_3" value="1" {if ("1" == $form.admission_ticket_3)}checked{/if} />主催者・日本の照会先へ問い合わせ</td>
										<td><input type="checkbox" name="admission_ticket_4" id="admission_ticket_4" value="1" {if ("1" == $form.admission_ticket_4)}checked{/if} />当日会場で入手</td>
									</tr>
								</table>
								<table>
									<tr>
										<td rowspan="2"><input type="checkbox" name="admission_ticket_5" id="admission_ticket_5" value="1" {if ("1" == $form.admission_ticket_5)}checked{/if} /></td>
										<td>その他
											<input type="text" name="other_admission_ticket_jp" id="other_admission_ticket_jp" value="{$form.other_admission_ticket_jp}" size="50" />
											<select name="other_admission_ticket_jp_cond" id="other_admission_ticket_jp"/>
												<option value="1" {if ('1' == $form.other_admission_ticket_jp_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.other_admission_ticket_jp_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.other_admission_ticket_jp_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.other_admission_ticket_jp_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.other_admission_ticket_jp_cond || '' == $form.other_admission_ticket_jp_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.other_admission_ticket_jp_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>Others
											<input type="text" name="other_admission_ticket_en" id="other_admission_ticket_en" value="{$form.other_admission_ticket_en}" size="50" />
											<select name="other_admission_ticket_en_cond" id="other_admission_ticket_en_cond"/>
												<option value="1" {if ('1' == $form.other_admission_ticket_en_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.other_admission_ticket_en_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.other_admission_ticket_en_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.other_admission_ticket_en_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.other_admission_ticket_en_cond || '' == $form.other_admission_ticket_en_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.other_admission_ticket_en_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td nowrap>過去の実績</td>
							<!-- 実績年 -->
							<!-- 総入場者数(人) -->
							<!-- 海外からの入場者数(人) -->
							<!-- 総出典者数(社) -->
							<!-- 海外からの出典者数(社) -->
							<!-- 開催規模 -->
							<td nowrap>
								<table border="0">
									<tr>
										<td>年実績（西暦４桁）</td>
										<td>
											<input type="text" name="year_of_the_trade_fair" id="year_of_the_trade_fair" value="{$form.year_of_the_trade_fair}" size="50" />
											<select name="year_of_the_trade_fair_cond" id="year_of_the_trade_fair_cond">
												<option value="1" {if ('1' == $form.year_of_the_trade_fair_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.year_of_the_trade_fair_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.year_of_the_trade_fair_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.year_of_the_trade_fair_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.year_of_the_trade_fair_cond || '' == $form.year_of_the_trade_fair_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.year_of_the_trade_fair_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>入場者数</td>
										<td>
											<input type="text" name="total_number_of_visitor_from" id="total_number_of_visitor_from" value="{$form.total_number_of_visitor_from}" size="20" />～<input type="text" name="total_number_of_visitor_to" id="total_number_of_visitor_to" value="{$form.total_number_of_visitor_to}" size="20" />
											<select name="total_number_of_visitor_cond" id="total_number_of_visitor_cond">
												<option value="10" {if ('10' == $form.total_number_of_visitor_cond || '' == $form.total_number_of_visitor_cond)}selected{/if}>範囲</option>
												<option value="11" {if ('11' == $form.total_number_of_visitor_cond)}selected{/if}>範囲外</option>
												<option value="1" {if ('1' == $form.total_number_of_visitor_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.total_number_of_visitor_cond)}selected{/if}>不一致</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>（うち海外から</td>
										<td>
											<input type="text" name="number_of_foreign_visitor_from" id="number_of_foreign_visitor_form" value="{$form.number_of_foreign_visitor_from}" size="20" />～<input type="text" name="number_of_foreign_visitor_to" id="number_of_foreign_visitor_to" value="{$form.number_of_foreign_visitor_to}" size="20" />
											<select name="number_of_foreign_visitor_cond" id="number_of_foreign_visitor_cond">
												<option value="10" {if ('10' == $form.number_of_foreign_visitor_cond || '' == $form.number_of_foreign_visitor_cond)}selected{/if}>範囲</option>
												<option value="11" {if ('11' == $form.number_of_foreign_visitor_cond)}selected{/if}>範囲外</option>
												<option value="1" {if ('1' == $form.number_of_foreign_visitor_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.number_of_foreign_visitor_cond)}selected{/if}>不一致</option>
											</select>）
										</td>
									</tr>
									<tr>
										<td>出展社数</td>
										<td>
											<input type="text" name="total_number_of_exhibitors_from" id="total_number_of_exhibitors_from" value="{$form.total_number_of_exhibitors_from}" size=20>～<input type="text" name="total_number_of_exhibitors_to" id="total_number_of_exhibitors_to" value="{$form.total_number_of_exhibitors_to}" size="20" />
											<select name="total_number_of_exhibitors_cond" id="total_number_of_exhibitors_cond">
												<option value="10" {if ('10' == $form.total_number_of_exhibitors_cond || '' == $form.total_number_of_exhibitors_cond)}selected{/if}>範囲</option>
												<option value="11" {if ('11' == $form.total_number_of_exhibitors_cond)}selected{/if}>範囲外</option>
												<option value="1" {if ('1' == $form.total_number_of_exhibitors_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.total_number_of_exhibitors_cond)}selected{/if}>不一致</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>（うち海外から</td>
										<td>
											<input type="text" name="number_of_foreign_exhibitors_from" id="number_of_foreign_exhibitors_from" value="{$form.number_of_foreign_exhibitors_from}" size=20>～<input type="text" name="number_of_foreign_exhibitors_to" id="number_of_foreign_exhibitors_to" value="{$form.number_of_foreign_exhibitors_to}" size=20>
											<select name="number_of_foreign_exhibitors_cond" id="number_of_foreign_exhibitors_cond">
												<option value="10" {if ('10' == $form.number_of_foreign_exhibitors_cond || '' == $form.number_of_foreign_exhibitors_cond)}selected{/if}>範囲</option>
												<option value="11" {if ('11' == $form.number_of_foreign_exhibitors_cond)}selected{/if}>範囲外</option>
												<option value="1" {if ('1' == $form.number_of_foreign_exhibitors_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.number_of_foreign_exhibitors_cond)}selected{/if}>不一致</option>
											</select>）
										</td>
									</tr>
									<tr>
										<td>開催規模</td>
										<td>
											<input type="text" name="net_square_meters" id="net_square_meters" value="{$form.net_square_meters}" size="50" />sq.m.
											<select name="net_square_meters_cond" id="net_square_meters_cond">
												<option value="1" {if ('1' == $form.net_square_meters_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.net_square_meters_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.net_square_meters_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.net_square_meters_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.net_square_meters_cond || '' == $form.net_square_meters_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.net_square_meters_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>認証機関</td>
										<td>
											<input type="text" name="spare_field1" id="spare_field1" value="{$form.spare_field1}" size="50" />
											<select name="spare_field1_cond" id="spare_field1_cond">
												<option value="1" {if ('1' == $form.spare_field1_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.spare_field1_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.spare_field1_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.spare_field1_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.spare_field1_cond || '' == $form.spare_field1_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.spare_field1_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td nowrap>主催者・問合せ先</td>
							<!-- 問合わせ先・運営機関名(日) -->
							<!-- 問合わせ先・運営機関名(英) -->
							<!-- 問合わせ先・運営機関ＴＥＬ -->
							<!-- 問合わせ先・運営機関ＦＡＸ -->
							<!-- 問合わせ先・運営機関Ｅ－ＭＡＩＬ -->
							<td nowrap>
								<table border="0">
									<tr>
										<td nowrap rowspan="2">名称</td>
										<td nowrap colspan="2">日：
										<input type="text" name="organizer_jp" id="organizer_jp" value="{$form.organizer_jp}" size="50" />
											<select name="organizer_jp_cond" id="organizer_jp_cond">
												<option value="1" {if ('1' == $form.organizer_jp_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.organizer_jp_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.organizer_jp_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.organizer_jp_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.organizer_jp_cond || '' == $form.organizer_jp_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.organizer_jp_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap colspan="2">英：
											<input type="text" name="organizer_en" id="organizer_en" value="{$form.organizer_en}" size="50" />
											<select name="organizer_en_cond" id="organizer_en_cond">
												<option value="1" {if ('1' == $form.organizer_en_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.organizer_en_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.organizer_en_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.organizer_en_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.organizer_en_cond || '' == $form.organizer_en_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.organizer_en_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap>ＴＥＬ</td>
										<td>
											<input type="text" name="organizer_tel" id="organizer_tel" value="{$form.organizer_tel}" size="50" />
											<select name="organizer_tel_cond" id="organizer_tel_cond">
												<option value="1" {if ('1' == $form.organizer_tel_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.organizer_tel_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.organizer_tel_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.organizer_tel_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.organizer_tel_cond || '' == $form.organizer_tel_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.organizer_tel_cond)}selected{/if}>含まず</option>
											</select>
										</td>
										<td>（半角数字）</td>
									</tr>
									<tr>
										<td nowrap>ＦＡＸ</td>
										<td>
											<input type="text" name="organizer_fax" id="organizer_fax" value="{$form.organizer_fax}" size="50" />
											<select name="organizer_fax_cond" id="organizer_fax_cond">
												<option value="1" {if ('1' == $form.organizer_fax_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.organizer_fax_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.organizer_fax_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.organizer_fax_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.organizer_fax_cond || '' == $form.organizer_fax_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.organizer_fax_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap>Ｅ－Ｍａｉｌ</td>
										<td>
											<input type="text" name="organizer_email" id="organizer_email" value="{$form.organizer_email}" size="50" />
											<select name="organizer_email_cond" id="organizer_email_cond">
												<option value="1" {if ('1' == $form.organizer_email_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.organizer_email_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.organizer_email_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.organizer_email_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.organizer_email_cond || '' == $form.organizer_email_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.organizer_email_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td nowrap>日本国内の照会先</td>
							<!-- 在日代理店名(日) -->
							<!-- 在日代理店名(英) -->
							<!-- 在日代理店ＴＥＬ -->
							<!-- 在日代理店ＦＡＸ -->
							<!-- 在日代理店Ｅ－ＭＡＩＬ -->
							<td nowrap>
								<table border="0">
									<tr>
										<td nowrap rowspan="2">名称</td>
										<td nowrap colspan="2">日：
											<input type="text" name="agency_in_japan_jp" id="agency_in_japan_jp" value="{$form.agency_in_japan_jp}" size="50" />
											<select name="agency_in_japan_jp_cond" id="agency_in_japan_jp_cond">
												<option value="1" {if ('1' == $form.agency_in_japan_jp_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.agency_in_japan_jp_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.agency_in_japan_jp_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.agency_in_japan_jp_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.agency_in_japan_jp_cond || '' == $form.agency_in_japan_jp_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.agency_in_japan_jp_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap colspan="2">英：
											<input type="text" name="agency_in_japan_en" id="agency_in_japan_en" value="{$form.agency_in_japan_en}" size="50" />
											<select name="agency_in_japan_en_cond" id="agency_in_japan_en_cond">
												<option value="1" {if ('1' == $form.agency_in_japan_en_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.agency_in_japan_en_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.agency_in_japan_en_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.agency_in_japan_en_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.agency_in_japan_en_cond || '' == $form.agency_in_japan_en_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.agency_in_japan_en_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap>ＴＥＬ</td>
										<td>
											<input type="text" name="agency_in_japan_tel" id="agency_in_japan_tel" value="{$form.agency_in_japan_tel}" size="50" />
											<select name="agency_in_japan_tel_cond" id="agency_in_japan_tel">
												<option value="1" {if ('1' == $form.agency_in_japan_tel_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.agency_in_japan_tel_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.agency_in_japan_tel_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.agency_in_japan_tel_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.agency_in_japan_tel_cond || '' == $form.agency_in_japan_tel_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.agency_in_japan_tel_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap>ＦＡＸ</td>
										<td>
											<input type="text" name="agency_in_japan_fax" id="agency_in_japan_fax" value="{$form.agency_in_japan_fax}" size="50" />
											<select name="agency_in_japan_fax_cond" id="agency_in_japan_fax">
												<option value="1" {if ('1' == $form.agency_in_japan_fax_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.agency_in_japan_fax_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.agency_in_japan_fax_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.agency_in_japan_fax_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.agency_in_japan_fax_cond || '' == $form.agency_in_japan_fax_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.agency_in_japan_fax_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap>Ｅ－Ｍａｉｌ</td>
										<td>
											<input type="text" name="agency_in_japan_email" id="agency_in_japan_email" value="{$form.agency_in_japan_email}" size="50" />
											<select name="agency_in_japan_email_cond" id="agency_in_japan_email_cond">
												<option value="1" {if ('1' == $form.agency_in_japan_email_cond)}selected{/if}>一致</option>
												<option value="2" {if ('2' == $form.agency_in_japan_email_cond)}selected{/if}>不一致</option>
												<option value="3" {if ('3' == $form.agency_in_japan_email_cond)}selected{/if}>前一致</option>
												<option value="4" {if ('4' == $form.agency_in_japan_email_cond)}selected{/if}>前不一</option>
												<option value="5" {if ('5' == $form.agency_in_japan_email_cond || '' == $form.agency_in_japan_email_cond)}selected{/if}>含む</option>
												<option value="6" {if ('6' == $form.agency_in_japan_email_cond)}selected{/if}>含まず</option>
											</select>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td nowrap>見本市レポート／URL</td>
							<!-- 駐在員レポート／リンク -->
							<td nowrap>
								<input type="text" name="report_link" id="report_link" value="{$form.report_link}" size="50" />
								<select name="report_link_cond" id="report_link_cond">
									<option value="1" {if ('1' == $form.report_link_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.report_link_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.report_link_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.report_link_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.report_link_cond || '' == $form.report_link_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.report_link_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
{*
						<tr>
							<td nowrap>世界の展示会場／URL</td>
							<!-- 展示会場／リンク -->
							<td nowrap>
								<input type="text" name="venue_link" id="venue_link" value="{$form.venue_link}" size="50" />
								<select name="venue_link_cond" id="venue_link_cond">
									<option value="1" {if ('1' == $form.venue_link_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.venue_link_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.venue_link_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.venue_link_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.venue_link_cond || '' == $form.venue_link_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.venue_link_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
*}
						<tr>
							<td nowrap>展示会に係わる画像(3点)</td>
							<!-- 展示会に係わる画像(3点) -->
							<td nowrap>
{*
								<input type="text" name="photos" id="photos" value="{$form.photos}" size="50" />
*}
								<select name="photos_cond" id="photos_cond">
									<option value="" {if ('' == $form.photos_cond)}selected{/if}>両方</option>
{*
									<option value="1" {if ('1' == $form.photos_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.photos_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.photos_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.photos_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.photos_cond || '' == $form.photos_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.photos_cond)}selected{/if}>含まず</option>
*}
									<option value="12" {if ('12' == $form.photos_cond)}selected{/if}>有り</option>
									<option value="13" {if ('13' == $form.photos_cond)}selected{/if}>無し</option>
{*
									<option value="7" {if ('7' == $form.photos_cond)}selected{/if}>一致(全)</option>
									<option value="8" {if ('8' == $form.photos_cond)}selected{/if}>前一致(全)</option>
									<option value="9" {if ('9' == $form.photos_cond)}selected{/if}>含む(全)</option>
*}
								</select>
							</td>
						</tr>

						<tr>
							<td nowrap>システム管理者備考欄</td>
							<!-- システム管理者備考欄 -->
							<td nowrap>
								<input type="text" name="note_for_system_manager" id="note_for_system_manager" value="{$form.note_for_system_manager}" size="50" />
								<select name="note_for_system_manager_cond" id="note_for_system_manager_cond">
									<option value="1" {if ('1' == $form.note_for_system_manager_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.note_for_system_manager_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.note_for_system_manager_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.note_for_system_manager_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.note_for_system_manager_cond || '' == $form.note_for_system_manager_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.note_for_system_manager_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>データ管理者備考欄</td>
							<!-- データ管理者備考欄 -->
							<td nowrap>
								<input type="text" name="note_for_data_manager" id="note_for_data_manager" value="{$form.note_for_data_manager}" size="50" />
								<select name="note_for_data_manager_cond" id="note_for_data_manager_cond">
									<option value="1" {if ('1' == $form.note_for_data_manager_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.note_for_data_manager_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.note_for_data_manager_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.note_for_data_manager_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.note_for_data_manager_cond || '' == $form.note_for_data_manager_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.note_for_data_manager_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
						<tr>
							<td nowrap>登録カテゴリ</td>
							<!-- 登録カテゴリ -->
							<td nowrap>
								<input type="checkbox" name="regist_category[]" id="regist_category[]" value="0"
								{section name=it loop=$form.regist_category}
								{if ('0' == $form.regist_category[it])}checked{/if}
								{/section}
								/>ユーザによる登録（新規/コピー登録）
								<input type="checkbox" name="regist_category[]" id="regist_category[]" value="1"
								{section name=it loop=$form.regist_category}
								{if ('1' == $form.regist_category[it])}checked{/if}
								{/section}
								/>運営委託先/管理者による登録<br />
								<input type="checkbox" name="regist_category[]" id="regist_category[]" value="2"
								{section name=it loop=$form.regist_category}
								{if ('2' == $form.regist_category[it])}checked{/if}
								{/section}
								/>新規発掘登録
								<input type="checkbox" name="regist_category[]" id="regist_category[]" value="9"
								{section name=it loop=$form.regist_category}
								{if ('9' == $form.regist_category[it])}checked{/if}
								{/section}
								/>その他
							</td>
						</tr>
						<tr>
							<td nowrap>削除フラグ</td>
							<!-- 削除フラグ -->
							<td nowrap>
								{if ('' == $form.del_flg)}
									{if count($errors)}
										<input type="checkbox" name="del_flg[]" id="del_flg[]" value="0" />未削除
										<input type="checkbox" name="del_flg[]" id="del_flg[]" value="1" />削除済
									{else}
										<input type="checkbox" name="del_flg[]" id="del_flg[]" value="0" checked />未削除
										<input type="checkbox" name="del_flg[]" id="del_flg[]" value="1" />削除済
									{/if}
								{else}
									<input type="checkbox" name="del_flg[]" id="del_flg[]" value="0"
										{section name=it loop=$form.del_flg}
										{if ('0' == $form.del_flg[it] && '' != $form.del_flg[it])}checked{/if}
										{/section}
									/>未削除
									<input type="checkbox" name="del_flg[]" id="del_flg[]" value="1"
										{section name=it loop=$form.del_flg}
										{if ('1' == $form.del_flg[it] && '' != $form.del_flg[it])}checked{/if}
										{/section}
									/>削除済
								{/if}
							</td>
						</tr>
						<tr>
							<td nowrap>JECC認証フラグ</td>
							<!-- JECC認証フラグ -->
							<td nowrap>
								{if ('' == $form.jecc_flag)}
									<input type="checkbox" name="jecc_flag[]" id="jecc_flag[]" value="0" />未認証
									<input type="checkbox" name="jecc_flag[]" id="jecc_flag[]" value="1" />認証
								{else}
									<input type="checkbox" name="jecc_flag[]" id="jecc_flag[]" value="0"
										{section name=it loop=$form.jecc_flag}
										{if ('0' == $form.jecc_flag[it] && '' != $form.jecc_flag[it])}checked{/if}
										{/section}
									/>未認証
									<input type="checkbox" name="jecc_flag[]" id="jecc_flag[]" value="1"
										{section name=it loop=$form.jecc_flag}
										{if ('1' == $form.jecc_flag[it] && '' != $form.jecc_flag[it])}checked{/if}
										{/section}
									/>認証
								{/if}
							</td>
						</tr>

						<tr>
							<td nowrap>JECC認証年月日</td>
							<!-- JECC認証年月日 -->
							<td nowrap>
								<input type="text" name="jecc_date_y_from" id="jecc_date_y_from" value="{$form.jecc_date_y_from}" maxlength="4" size="4" />年
								<input type="text" name="jecc_date_m_from" id="jecc_date_m_from" value="{$form.jecc_date_m_from}" maxlength="2" size="2" />月
								<input type="text" name="jecc_date_d_from" id="jecc_date_d_from" value="{$form.jecc_date_d_from}" maxlength="2" size="2" />日から&nbsp;
								<input type="text" name="jecc_date_y_to" id="jecc_date_y_to" value="{$form.jecc_date_y_to}" maxlength="4" size="4" />年
								<input type="text" name="jecc_date_m_to" id="jecc_date_m_to" value="{$form.jecc_date_m_to}" maxlength="2" size="2" />月
								<input type="text" name="jecc_date_d_to" id="jecc_date_d_to" value="{$form.jecc_date_d_to}" maxlength="2" size="2" />日まで
							</td>
						</tr>

						<tr>
							<td nowrap>JETRO出展支援フラグ</td>
							<!-- JETRO出展支援フラグ -->
							<td nowrap>
								{if ('' == $form.exhibit_support_flag)}
									<input type="checkbox" name="exhibit_support_flag[]" id="exhibit_support_flag[]" value="0" />無
									<input type="checkbox" name="exhibit_support_flag[]" id="exhibit_support_flag[]" value="1" />有
								{else}
									<input type="checkbox" name="exhibit_support_flag[]" id="exhibit_support_flag[]" value="0"
										{section name=it loop=$form.exhibit_support_flag}
										{if ('0' == $form.exhibit_support_flag[it] && '' != $form.exhibit_support_flag[it])}checked{/if}
										{/section}
									/>無
									<input type="checkbox" name="exhibit_support_flag[]" id="exhibit_support_flag[]" value="1"
										{section name=it loop=$form.exhibit_support_flag}
										{if ('1' == $form.exhibit_support_flag[it] && '' != $form.exhibit_support_flag[it])}checked{/if}
										{/section}
									/>有
								{/if}
							</td>
						</tr>
						<tr>
							<td nowrap>JETRO出展支援URL</td>
							<!-- JETRO出展支援URL -->
							<td nowrap>
								<input type="text" name="jetro_suport_url" id="jetro_suport_url" value="{$form.jetro_suport_url}" size="50" />
								<select name="jetro_suport_url_cond" id="jetro_suport_url_cond">
									<option value="1" {if ('1' == $form.jetro_suport_url_cond)}selected{/if}>一致</option>
									<option value="2" {if ('2' == $form.jetro_suport_url_cond)}selected{/if}>不一致</option>
									<option value="3" {if ('3' == $form.jetro_suport_url_cond)}selected{/if}>前一致</option>
									<option value="4" {if ('4' == $form.jetro_suport_url_cond)}selected{/if}>前不一</option>
									<option value="5" {if ('5' == $form.jetro_suport_url_cond || '' == $form.jetro_suport_url_cond)}selected{/if}>含む</option>
									<option value="6" {if ('6' == $form.jetro_suport_url_cond)}selected{/if}>含まず</option>
								</select>
							</td>
						</tr>
					</table>
					<hr />
					集計条件設定<br>
					<font size="2">・上記検索条件と、下記集計条件を元に集計します。</font>
					<table>
						<tr>
							<td>条件1：
								<select name="summary_key1" id="summary_key1">
									<option value="" {if ('' == form.summary_key1)}selected{/if}>ソートなし</option>
									<option value="0" {if ('0' == form.summary_key1)}selected{/if}>ユーザID</option>
									<option value="1" {if ('1' == form.summary_key1)}selected{/if}>Webページの表示／非表示</option>
									<option value="2" {if ('2' == form.summary_key1)}selected{/if}>承認フラグ</option>
									<option value="3" {if ('3' == form.summary_key1)}selected{/if}>否認コメント</option>
									<option value="4" {if ('4' == form.summary_key1)}selected{/if}>メール送信フラグ</option>
									<option value="5" {if ('5' == form.summary_key1)}selected{/if}>ユーザ使用言語フラグ</option>
									<option value="6" {if ('6' == form.summary_key1)}selected{/if}>Eメール</option>
									<option value="7" {if ('7' == form.summary_key1)}selected{/if}>申請年月日</option>
									<option value="8" {if ('8' == form.summary_key1)}selected{/if}>登録日(承認日)</option>
									<option value="9" {if ('9' == form.summary_key1)}selected{/if}>言語選択情報</option>
									<option value="10" {if ('10' == form.summary_key1)}selected{/if}>見本市番号</option>
									<option value="11" {if ('11' == form.summary_key1)}selected{/if}>見本市名(日)</option>
									<option value="12" {if ('12' == form.summary_key1)}selected{/if}>見本市名(英)</option>
									<option value="13" {if ('13' == form.summary_key1)}selected{/if}>見本市略称</option>
									<option value="14" {if ('14' == form.summary_key1)}selected{/if}>見本市URL</option>
									<option value="15" {if ('15' == form.summary_key1)}selected{/if}>キャッチフレーズ(日)</option>
									<option value="16" {if ('16' == form.summary_key1)}selected{/if}>キャッチフレーズ(英)</option>
									<option value="17" {if ('17' == form.summary_key1)}selected{/if}>ＰＲ・紹介文(日)</option>
									<option value="18" {if ('18' == form.summary_key1)}selected{/if}>ＰＲ・紹介文(英)</option>
									<option value="19" {if ('19' == form.summary_key1)}selected{/if}>会期開始年</option>
									<option value="20" {if ('20' == form.summary_key1)}selected{/if}>会期開始月</option>
									<option value="21" {if ('21' == form.summary_key1)}selected{/if}>会期開始日</option>
									<option value="22" {if ('22' == form.summary_key1)}selected{/if}>会期終了年</option>
									<option value="23" {if ('23' == form.summary_key1)}selected{/if}>会期終了月</option>
									<option value="24" {if ('24' == form.summary_key1)}selected{/if}>会期終了日</option>
									<option value="25" {if ('25' == form.summary_key1)}selected{/if}>開催頻度</option>
									<option value="26" {if ('26' == form.summary_key1)}selected{/if}>業種大分類</option>
									<option value="27" {if ('27' == form.summary_key1)}selected{/if}>業種小分類</option>
									<option value="28" {if ('28' == form.summary_key1)}selected{/if}>出品物(日)</option>
									<option value="29" {if ('29' == form.summary_key1)}selected{/if}>出品物(英)</option>
									<option value="30" {if ('30' == form.summary_key1)}selected{/if}>開催地地域</option>
									<option value="31" {if ('31' == form.summary_key1)}selected{/if}>開催地国地域</option>
									<option value="32" {if ('32' == form.summary_key1)}selected{/if}>開催地都市</option>
									<option value="33" {if ('33' == form.summary_key1)}selected{/if}>開催地その他(日)</option>
									<option value="34" {if ('34' == form.summary_key1)}selected{/if}>開催地その他(英)</option>
									<option value="35" {if ('35' == form.summary_key1)}selected{/if}>会場名(日)</option>
									<option value="36" {if ('36' == form.summary_key1)}selected{/if}>会場名(英)</option>
									<option value="37" {if ('37' == form.summary_key1)}selected{/if}>開催予定規模</option>
									<option value="38" {if ('38' == form.summary_key1)}selected{/if}>入場資格</option>
									<option value="39" {if ('39' == form.summary_key1)}selected{/if}>チケットの入手方法</option>
									<option value="40" {if ('40' == form.summary_key1)}selected{/if}>チケットの入手方法その他(日)</option>
									<option value="41" {if ('41' == form.summary_key1)}selected{/if}>チケットの入手方法Others(英)</option>
									<option value="42" {if ('42' == form.summary_key1)}selected{/if}>過去の実績年実績</option>
									<option value="43" {if ('43' == form.summary_key1)}selected{/if}>過去の実績来場者数</option>
									<option value="44" {if ('44' == form.summary_key1)}selected{/if}>過去の実績海外来場者数</option>
									<option value="45" {if ('45' == form.summary_key1)}selected{/if}>過去の実績出展社数</option>
									<option value="46" {if ('46' == form.summary_key1)}selected{/if}>過去の実績海外出展社数</option>
									<option value="47" {if ('47' == form.summary_key1)}selected{/if}>過去の実績開催規模</option>
									<option value="48" {if ('48' == form.summary_key1)}selected{/if}>過去の実績認証機関</option>
									<option value="49" {if ('49' == form.summary_key1)}selected{/if}>主催者・問合せ先名称(日)</option>
									<option value="50" {if ('50' == form.summary_key1)}selected{/if}>主催者・問合せ先名称(英)</option>
									<option value="51" {if ('51' == form.summary_key1)}selected{/if}>主催者・問合せ先TEL</option>
									<option value="52" {if ('52' == form.summary_key1)}selected{/if}>主催者・問合せ先FAX</option>
									<option value="53" {if ('53' == form.summary_key1)}selected{/if}>主催者・問合せ先Email</option>
									<option value="54" {if ('54' == form.summary_key1)}selected{/if}>主催者・問合せ先住所</option>
									<option value="55" {if ('55' == form.summary_key1)}selected{/if}>主催者・問合せ先担当部課</option>
									<option value="56" {if ('56' == form.summary_key1)}selected{/if}>主催者・問合せ先担当者</option>
									<option value="57" {if ('57' == form.summary_key1)}selected{/if}>日本国内の照会先名称(日)</option>
									<option value="58" {if ('58' == form.summary_key1)}selected{/if}>日本国内の照会先名称(英)</option>
									<option value="59" {if ('59' == form.summary_key1)}selected{/if}>日本国内の照会先TEL</option>
									<option value="60" {if ('60' == form.summary_key1)}selected{/if}>日本国内の照会先FAX</option>
									<option value="61" {if ('61' == form.summary_key1)}selected{/if}>日本国内の照会先Email</option>
									<option value="62" {if ('62' == form.summary_key1)}selected{/if}>日本国内の照会先住所</option>
									<option value="63" {if ('63' == form.summary_key1)}selected{/if}>日本国内の照会先担当部課</option>
									<option value="64" {if ('64' == form.summary_key1)}selected{/if}>日本国内の照会先担当者</option>
									<option value="65" {if ('65' == form.summary_key1)}selected{/if}>見本市レポートURL</option>
									<option value="66" {if ('66' == form.summary_key1)}selected{/if}>展示会に係わる画像名称1</option>
									<option value="67" {if ('67' == form.summary_key1)}selected{/if}>展示会に係わる画像名称2</option>
									<option value="68" {if ('68' == form.summary_key1)}selected{/if}>展示会に係わる画像名称3</option>
									<option value="69" {if ('69' == form.summary_key1)}selected{/if}>システム管理者備考欄</option>
									<option value="70" {if ('70' == form.summary_key1)}selected{/if}>データ管理者備考欄</option>
									<option value="71" {if ('71' == form.summary_key1)}selected{/if}>登録カテゴリ</option>
									<option value="72" {if ('72' == form.summary_key1)}selected{/if}>削除フラグ</option>
									<option value="73" {if ('73' == form.summary_key1)}selected{/if}>JECC認証フラグ</option>
									<option value="74" {if ('74' == form.summary_key1)}selected{/if}>JECC認証年月日</option>
									<option value="75" {if ('75' == form.summary_key1)}selected{/if}>JETRO出展支援URL</option>
									<option value="76" {if ('76' == form.summary_key1)}selected{/if}>JETRO出展支援フラグ</option>
									<option value="77" {if ('77' == form.summary_key1)}selected{/if}>登録者ID</option>
									<option value="78" {if ('78' == form.summary_key1)}selected{/if}>更新者ID</option>
								</select>
							</td>
							<td>
								<input type="radio" name="summary_key1_sort_cond" id="summary_key1_sort_cond" value="0" {if ('0' == $form.summary_key1_sort_cond || '' == $form.summary_key1_sort_cond)}checked{/if}/>昇順
								<input type="radio" name="summary_key1_sort_cond" id="summary_key1_sort_cond" value="1" {if ('1' == $form.summary_key1_sort_cond)}checked{/if}/>降順
							</td>
						</tr>
						<tr>
							<td>条件2：
								<select name="summary_key2" id="summary_key2">
									<option value="" {if ('' == form.summary_key2)}selected{/if}>ソートなし</option>
									<option value="0" {if ('0' == form.summary_key2)}selected{/if}>ユーザID</option>
									<option value="1" {if ('1' == form.summary_key2)}selected{/if}>Webページの表示／非表示</option>
									<option value="2" {if ('2' == form.summary_key2)}selected{/if}>承認フラグ</option>
									<option value="3" {if ('3' == form.summary_key2)}selected{/if}>否認コメント</option>
									<option value="4" {if ('4' == form.summary_key2)}selected{/if}>メール送信フラグ</option>
									<option value="5" {if ('5' == form.summary_key2)}selected{/if}>ユーザ使用言語フラグ</option>
									<option value="6" {if ('6' == form.summary_key2)}selected{/if}>Eメール</option>
									<option value="7" {if ('7' == form.summary_key2)}selected{/if}>申請年月日</option>
									<option value="8" {if ('8' == form.summary_key2)}selected{/if}>登録日(承認日)</option>
									<option value="9" {if ('9' == form.summary_key2)}selected{/if}>言語選択情報</option>
									<option value="10" {if ('10' == form.summary_key2)}selected{/if}>見本市番号</option>
									<option value="11" {if ('11' == form.summary_key2)}selected{/if}>見本市名(日)</option>
									<option value="12" {if ('12' == form.summary_key2)}selected{/if}>見本市名(英)</option>
									<option value="13" {if ('13' == form.summary_key2)}selected{/if}>見本市略称</option>
									<option value="14" {if ('14' == form.summary_key2)}selected{/if}>見本市URL</option>
									<option value="15" {if ('15' == form.summary_key2)}selected{/if}>キャッチフレーズ(日)</option>
									<option value="16" {if ('16' == form.summary_key2)}selected{/if}>キャッチフレーズ(英)</option>
									<option value="17" {if ('17' == form.summary_key2)}selected{/if}>ＰＲ・紹介文(日)</option>
									<option value="18" {if ('18' == form.summary_key2)}selected{/if}>ＰＲ・紹介文(英)</option>
									<option value="19" {if ('19' == form.summary_key2)}selected{/if}>会期開始年</option>
									<option value="20" {if ('20' == form.summary_key2)}selected{/if}>会期開始月</option>
									<option value="21" {if ('21' == form.summary_key2)}selected{/if}>会期開始日</option>
									<option value="22" {if ('22' == form.summary_key2)}selected{/if}>会期終了年</option>
									<option value="23" {if ('23' == form.summary_key2)}selected{/if}>会期終了月</option>
									<option value="24" {if ('24' == form.summary_key2)}selected{/if}>会期終了日</option>
									<option value="25" {if ('25' == form.summary_key2)}selected{/if}>開催頻度</option>
									<option value="26" {if ('26' == form.summary_key2)}selected{/if}>業種大分類</option>
									<option value="27" {if ('27' == form.summary_key2)}selected{/if}>業種小分類</option>
									<option value="28" {if ('28' == form.summary_key2)}selected{/if}>出品物(日)</option>
									<option value="29" {if ('29' == form.summary_key2)}selected{/if}>出品物(英)</option>
									<option value="30" {if ('30' == form.summary_key2)}selected{/if}>開催地地域</option>
									<option value="31" {if ('31' == form.summary_key2)}selected{/if}>開催地国地域</option>
									<option value="32" {if ('32' == form.summary_key2)}selected{/if}>開催地都市</option>
									<option value="33" {if ('33' == form.summary_key2)}selected{/if}>開催地その他(日)</option>
									<option value="34" {if ('34' == form.summary_key2)}selected{/if}>開催地その他(英)</option>
									<option value="35" {if ('35' == form.summary_key2)}selected{/if}>会場名(日)</option>
									<option value="36" {if ('36' == form.summary_key2)}selected{/if}>会場名(英)</option>
									<option value="37" {if ('37' == form.summary_key2)}selected{/if}>開催予定規模</option>
									<option value="38" {if ('38' == form.summary_key2)}selected{/if}>入場資格</option>
									<option value="39" {if ('39' == form.summary_key2)}selected{/if}>チケットの入手方法</option>
									<option value="40" {if ('40' == form.summary_key2)}selected{/if}>チケットの入手方法その他(日)</option>
									<option value="41" {if ('41' == form.summary_key2)}selected{/if}>チケットの入手方法Others(英)</option>
									<option value="42" {if ('42' == form.summary_key2)}selected{/if}>過去の実績年実績</option>
									<option value="43" {if ('43' == form.summary_key2)}selected{/if}>過去の実績来場者数</option>
									<option value="44" {if ('44' == form.summary_key2)}selected{/if}>過去の実績海外来場者数</option>
									<option value="45" {if ('45' == form.summary_key2)}selected{/if}>過去の実績出展社数</option>
									<option value="46" {if ('46' == form.summary_key2)}selected{/if}>過去の実績海外出展社数</option>
									<option value="47" {if ('47' == form.summary_key2)}selected{/if}>過去の実績開催規模</option>
									<option value="48" {if ('48' == form.summary_key2)}selected{/if}>過去の実績認証機関</option>
									<option value="49" {if ('49' == form.summary_key2)}selected{/if}>主催者・問合せ先名称(日)</option>
									<option value="50" {if ('50' == form.summary_key2)}selected{/if}>主催者・問合せ先名称(英)</option>
									<option value="51" {if ('51' == form.summary_key2)}selected{/if}>主催者・問合せ先TEL</option>
									<option value="52" {if ('52' == form.summary_key2)}selected{/if}>主催者・問合せ先FAX</option>
									<option value="53" {if ('53' == form.summary_key2)}selected{/if}>主催者・問合せ先Email</option>
									<option value="54" {if ('54' == form.summary_key2)}selected{/if}>主催者・問合せ先住所</option>
									<option value="55" {if ('55' == form.summary_key2)}selected{/if}>主催者・問合せ先担当部課</option>
									<option value="56" {if ('56' == form.summary_key2)}selected{/if}>主催者・問合せ先担当者</option>
									<option value="57" {if ('57' == form.summary_key2)}selected{/if}>日本国内の照会先名称(日)</option>
									<option value="58" {if ('58' == form.summary_key2)}selected{/if}>日本国内の照会先名称(英)</option>
									<option value="59" {if ('59' == form.summary_key2)}selected{/if}>日本国内の照会先TEL</option>
									<option value="60" {if ('60' == form.summary_key2)}selected{/if}>日本国内の照会先FAX</option>
									<option value="61" {if ('61' == form.summary_key2)}selected{/if}>日本国内の照会先Email</option>
									<option value="62" {if ('62' == form.summary_key2)}selected{/if}>日本国内の照会先住所</option>
									<option value="63" {if ('63' == form.summary_key2)}selected{/if}>日本国内の照会先担当部課</option>
									<option value="64" {if ('64' == form.summary_key2)}selected{/if}>日本国内の照会先担当者</option>
									<option value="65" {if ('65' == form.summary_key2)}selected{/if}>見本市レポートURL</option>
									<option value="66" {if ('66' == form.summary_key2)}selected{/if}>展示会に係わる画像名称1</option>
									<option value="67" {if ('67' == form.summary_key2)}selected{/if}>展示会に係わる画像名称2</option>
									<option value="68" {if ('68' == form.summary_key2)}selected{/if}>展示会に係わる画像名称3</option>
									<option value="69" {if ('69' == form.summary_key2)}selected{/if}>システム管理者備考欄</option>
									<option value="70" {if ('70' == form.summary_key2)}selected{/if}>データ管理者備考欄</option>
									<option value="71" {if ('71' == form.summary_key2)}selected{/if}>登録カテゴリ</option>
									<option value="72" {if ('72' == form.summary_key2)}selected{/if}>削除フラグ</option>
									<option value="73" {if ('73' == form.summary_key2)}selected{/if}>JECC認証フラグ</option>
									<option value="74" {if ('74' == form.summary_key2)}selected{/if}>JECC認証年月日</option>
									<option value="75" {if ('75' == form.summary_key2)}selected{/if}>JETRO出展支援URL</option>
									<option value="76" {if ('76' == form.summary_key2)}selected{/if}>JETRO出展支援フラグ</option>
									<option value="77" {if ('77' == form.summary_key2)}selected{/if}>登録者ID</option>
									<option value="78" {if ('78' == form.summary_key2)}selected{/if}>更新者ID</option>
								</select>
							</td>
							<td>
								<input type="radio" name="summary_key2_sort_cond" id="summary_key2_sort_cond" value="0" {if ('0' == $form.summary_key2_sort_cond || '' == $form.summary_key2_sort_cond)}checked{/if}/>昇順
								<input type="radio" name="summary_key2_sort_cond" id="summary_key2_sort_cond" value="1" {if ('1' == $form.summary_key2_sort_cond)}checked{/if}/>降順
							</td>
						</tr>
						<tr>
							<td>条件3：
								<select name="summary_key3" id="summary_key3">
									<option value="" {if ('' == form.summary_key3)}selected{/if}>ソートなし</option>
									<option value="0" {if ('0' == form.summary_key3)}selected{/if}>ユーザID</option>
									<option value="1" {if ('1' == form.summary_key3)}selected{/if}>Webページの表示／非表示</option>
									<option value="2" {if ('2' == form.summary_key3)}selected{/if}>承認フラグ</option>
									<option value="3" {if ('3' == form.summary_key3)}selected{/if}>否認コメント</option>
									<option value="4" {if ('4' == form.summary_key3)}selected{/if}>メール送信フラグ</option>
									<option value="5" {if ('5' == form.summary_key3)}selected{/if}>ユーザ使用言語フラグ</option>
									<option value="6" {if ('6' == form.summary_key3)}selected{/if}>Eメール</option>
									<option value="7" {if ('7' == form.summary_key3)}selected{/if}>申請年月日</option>
									<option value="8" {if ('8' == form.summary_key3)}selected{/if}>登録日(承認日)</option>
									<option value="9" {if ('9' == form.summary_key3)}selected{/if}>言語選択情報</option>
									<option value="10" {if ('10' == form.summary_key3)}selected{/if}>見本市番号</option>
									<option value="11" {if ('11' == form.summary_key3)}selected{/if}>見本市名(日)</option>
									<option value="12" {if ('12' == form.summary_key3)}selected{/if}>見本市名(英)</option>
									<option value="13" {if ('13' == form.summary_key3)}selected{/if}>見本市略称</option>
									<option value="14" {if ('14' == form.summary_key3)}selected{/if}>見本市URL</option>
									<option value="15" {if ('15' == form.summary_key3)}selected{/if}>キャッチフレーズ(日)</option>
									<option value="16" {if ('16' == form.summary_key3)}selected{/if}>キャッチフレーズ(英)</option>
									<option value="17" {if ('17' == form.summary_key3)}selected{/if}>ＰＲ・紹介文(日)</option>
									<option value="18" {if ('18' == form.summary_key3)}selected{/if}>ＰＲ・紹介文(英)</option>
									<option value="19" {if ('19' == form.summary_key3)}selected{/if}>会期開始年</option>
									<option value="20" {if ('20' == form.summary_key3)}selected{/if}>会期開始月</option>
									<option value="21" {if ('21' == form.summary_key3)}selected{/if}>会期開始日</option>
									<option value="22" {if ('22' == form.summary_key3)}selected{/if}>会期終了年</option>
									<option value="23" {if ('23' == form.summary_key3)}selected{/if}>会期終了月</option>
									<option value="24" {if ('24' == form.summary_key3)}selected{/if}>会期終了日</option>
									<option value="25" {if ('25' == form.summary_key3)}selected{/if}>開催頻度</option>
									<option value="26" {if ('26' == form.summary_key3)}selected{/if}>業種大分類</option>
									<option value="27" {if ('27' == form.summary_key3)}selected{/if}>業種小分類</option>
									<option value="28" {if ('28' == form.summary_key3)}selected{/if}>出品物(日)</option>
									<option value="29" {if ('29' == form.summary_key3)}selected{/if}>出品物(英)</option>
									<option value="30" {if ('30' == form.summary_key3)}selected{/if}>開催地地域</option>
									<option value="31" {if ('31' == form.summary_key3)}selected{/if}>開催地国地域</option>
									<option value="32" {if ('32' == form.summary_key3)}selected{/if}>開催地都市</option>
									<option value="33" {if ('33' == form.summary_key3)}selected{/if}>開催地その他(日)</option>
									<option value="34" {if ('34' == form.summary_key3)}selected{/if}>開催地その他(英)</option>
									<option value="35" {if ('35' == form.summary_key3)}selected{/if}>会場名(日)</option>
									<option value="36" {if ('36' == form.summary_key3)}selected{/if}>会場名(英)</option>
									<option value="37" {if ('37' == form.summary_key3)}selected{/if}>開催予定規模</option>
									<option value="38" {if ('38' == form.summary_key3)}selected{/if}>入場資格</option>
									<option value="39" {if ('39' == form.summary_key3)}selected{/if}>チケットの入手方法</option>
									<option value="40" {if ('40' == form.summary_key3)}selected{/if}>チケットの入手方法その他(日)</option>
									<option value="41" {if ('41' == form.summary_key3)}selected{/if}>チケットの入手方法Others(英)</option>
									<option value="42" {if ('42' == form.summary_key3)}selected{/if}>過去の実績年実績</option>
									<option value="43" {if ('43' == form.summary_key3)}selected{/if}>過去の実績来場者数</option>
									<option value="44" {if ('44' == form.summary_key3)}selected{/if}>過去の実績海外来場者数</option>
									<option value="45" {if ('45' == form.summary_key3)}selected{/if}>過去の実績出展社数</option>
									<option value="46" {if ('46' == form.summary_key3)}selected{/if}>過去の実績海外出展社数</option>
									<option value="47" {if ('47' == form.summary_key3)}selected{/if}>過去の実績開催規模</option>
									<option value="48" {if ('48' == form.summary_key3)}selected{/if}>過去の実績認証機関</option>
									<option value="49" {if ('49' == form.summary_key3)}selected{/if}>主催者・問合せ先名称(日)</option>
									<option value="50" {if ('50' == form.summary_key3)}selected{/if}>主催者・問合せ先名称(英)</option>
									<option value="51" {if ('51' == form.summary_key3)}selected{/if}>主催者・問合せ先TEL</option>
									<option value="52" {if ('52' == form.summary_key3)}selected{/if}>主催者・問合せ先FAX</option>
									<option value="53" {if ('53' == form.summary_key3)}selected{/if}>主催者・問合せ先Email</option>
									<option value="54" {if ('54' == form.summary_key3)}selected{/if}>主催者・問合せ先住所</option>
									<option value="55" {if ('55' == form.summary_key3)}selected{/if}>主催者・問合せ先担当部課</option>
									<option value="56" {if ('56' == form.summary_key3)}selected{/if}>主催者・問合せ先担当者</option>
									<option value="57" {if ('57' == form.summary_key3)}selected{/if}>日本国内の照会先名称(日)</option>
									<option value="58" {if ('58' == form.summary_key3)}selected{/if}>日本国内の照会先名称(英)</option>
									<option value="59" {if ('59' == form.summary_key3)}selected{/if}>日本国内の照会先TEL</option>
									<option value="60" {if ('60' == form.summary_key3)}selected{/if}>日本国内の照会先FAX</option>
									<option value="61" {if ('61' == form.summary_key3)}selected{/if}>日本国内の照会先Email</option>
									<option value="62" {if ('62' == form.summary_key3)}selected{/if}>日本国内の照会先住所</option>
									<option value="63" {if ('63' == form.summary_key3)}selected{/if}>日本国内の照会先担当部課</option>
									<option value="64" {if ('64' == form.summary_key3)}selected{/if}>日本国内の照会先担当者</option>
									<option value="65" {if ('65' == form.summary_key3)}selected{/if}>見本市レポートURL</option>
									<option value="66" {if ('66' == form.summary_key3)}selected{/if}>展示会に係わる画像名称1</option>
									<option value="67" {if ('67' == form.summary_key3)}selected{/if}>展示会に係わる画像名称2</option>
									<option value="68" {if ('68' == form.summary_key3)}selected{/if}>展示会に係わる画像名称3</option>
									<option value="69" {if ('69' == form.summary_key3)}selected{/if}>システム管理者備考欄</option>
									<option value="70" {if ('70' == form.summary_key3)}selected{/if}>データ管理者備考欄</option>
									<option value="71" {if ('71' == form.summary_key3)}selected{/if}>登録カテゴリ</option>
									<option value="72" {if ('72' == form.summary_key3)}selected{/if}>削除フラグ</option>
									<option value="73" {if ('73' == form.summary_key3)}selected{/if}>JECC認証フラグ</option>
									<option value="74" {if ('74' == form.summary_key3)}selected{/if}>JECC認証年月日</option>
									<option value="75" {if ('75' == form.summary_key3)}selected{/if}>JETRO出展支援URL</option>
									<option value="76" {if ('76' == form.summary_key3)}selected{/if}>JETRO出展支援フラグ</option>
									<option value="77" {if ('77' == form.summary_key3)}selected{/if}>登録者ID</option>
									<option value="78" {if ('78' == form.summary_key3)}selected{/if}>更新者ID</option>
								</select>
							</td>
							<td>
								<input type="radio" name="summary_key3_sort_cond" id="summary_key3_sort_cond" value="0" {if ('0' == $form.summary_key3_sort_cond || '' == $form.summary_key3_sort_cond)}checked{/if}/>昇順
								<input type="radio" name="summary_key3_sort_cond" id="summary_key3_sort_cond" value="1" {if ('1' == $form.summary_key3_sort_cond)}checked{/if}/>降順
							</td>
						</tr>
						<tr>
							<td>条件4：
								<select name="summary_key4" id="summary_key4">
									<option value="" {if ('' == form.summary_key4)}selected{/if}>ソートなし</option>
									<option value="0" {if ('0' == form.summary_key4)}selected{/if}>ユーザID</option>
									<option value="1" {if ('1' == form.summary_key4)}selected{/if}>Webページの表示／非表示</option>
									<option value="2" {if ('2' == form.summary_key4)}selected{/if}>承認フラグ</option>
									<option value="3" {if ('3' == form.summary_key4)}selected{/if}>否認コメント</option>
									<option value="4" {if ('4' == form.summary_key4)}selected{/if}>メール送信フラグ</option>
									<option value="5" {if ('5' == form.summary_key4)}selected{/if}>ユーザ使用言語フラグ</option>
									<option value="6" {if ('6' == form.summary_key4)}selected{/if}>Eメール</option>
									<option value="7" {if ('7' == form.summary_key4)}selected{/if}>申請年月日</option>
									<option value="8" {if ('8' == form.summary_key4)}selected{/if}>登録日(承認日)</option>
									<option value="9" {if ('9' == form.summary_key4)}selected{/if}>言語選択情報</option>
									<option value="10" {if ('10' == form.summary_key4)}selected{/if}>見本市番号</option>
									<option value="11" {if ('11' == form.summary_key4)}selected{/if}>見本市名(日)</option>
									<option value="12" {if ('12' == form.summary_key4)}selected{/if}>見本市名(英)</option>
									<option value="13" {if ('13' == form.summary_key4)}selected{/if}>見本市略称</option>
									<option value="14" {if ('14' == form.summary_key4)}selected{/if}>見本市URL</option>
									<option value="15" {if ('15' == form.summary_key4)}selected{/if}>キャッチフレーズ(日)</option>
									<option value="16" {if ('16' == form.summary_key4)}selected{/if}>キャッチフレーズ(英)</option>
									<option value="17" {if ('17' == form.summary_key4)}selected{/if}>ＰＲ・紹介文(日)</option>
									<option value="18" {if ('18' == form.summary_key4)}selected{/if}>ＰＲ・紹介文(英)</option>
									<option value="19" {if ('19' == form.summary_key4)}selected{/if}>会期開始年</option>
									<option value="20" {if ('20' == form.summary_key4)}selected{/if}>会期開始月</option>
									<option value="21" {if ('21' == form.summary_key4)}selected{/if}>会期開始日</option>
									<option value="22" {if ('22' == form.summary_key4)}selected{/if}>会期終了年</option>
									<option value="23" {if ('23' == form.summary_key4)}selected{/if}>会期終了月</option>
									<option value="24" {if ('24' == form.summary_key4)}selected{/if}>会期終了日</option>
									<option value="25" {if ('25' == form.summary_key4)}selected{/if}>開催頻度</option>
									<option value="26" {if ('26' == form.summary_key4)}selected{/if}>業種大分類</option>
									<option value="27" {if ('27' == form.summary_key4)}selected{/if}>業種小分類</option>
									<option value="28" {if ('28' == form.summary_key4)}selected{/if}>出品物(日)</option>
									<option value="29" {if ('29' == form.summary_key4)}selected{/if}>出品物(英)</option>
									<option value="30" {if ('30' == form.summary_key4)}selected{/if}>開催地地域</option>
									<option value="31" {if ('31' == form.summary_key4)}selected{/if}>開催地国地域</option>
									<option value="32" {if ('32' == form.summary_key4)}selected{/if}>開催地都市</option>
									<option value="33" {if ('33' == form.summary_key4)}selected{/if}>開催地その他(日)</option>
									<option value="34" {if ('34' == form.summary_key4)}selected{/if}>開催地その他(英)</option>
									<option value="35" {if ('35' == form.summary_key4)}selected{/if}>会場名(日)</option>
									<option value="36" {if ('36' == form.summary_key4)}selected{/if}>会場名(英)</option>
									<option value="37" {if ('37' == form.summary_key4)}selected{/if}>開催予定規模</option>
									<option value="38" {if ('38' == form.summary_key4)}selected{/if}>入場資格</option>
									<option value="39" {if ('39' == form.summary_key4)}selected{/if}>チケットの入手方法</option>
									<option value="40" {if ('40' == form.summary_key4)}selected{/if}>チケットの入手方法その他(日)</option>
									<option value="41" {if ('41' == form.summary_key4)}selected{/if}>チケットの入手方法Others(英)</option>
									<option value="42" {if ('42' == form.summary_key4)}selected{/if}>過去の実績年実績</option>
									<option value="43" {if ('43' == form.summary_key4)}selected{/if}>過去の実績来場者数</option>
									<option value="44" {if ('44' == form.summary_key4)}selected{/if}>過去の実績海外来場者数</option>
									<option value="45" {if ('45' == form.summary_key4)}selected{/if}>過去の実績出展社数</option>
									<option value="46" {if ('46' == form.summary_key4)}selected{/if}>過去の実績海外出展社数</option>
									<option value="47" {if ('47' == form.summary_key4)}selected{/if}>過去の実績開催規模</option>
									<option value="48" {if ('48' == form.summary_key4)}selected{/if}>過去の実績認証機関</option>
									<option value="49" {if ('49' == form.summary_key4)}selected{/if}>主催者・問合せ先名称(日)</option>
									<option value="50" {if ('50' == form.summary_key4)}selected{/if}>主催者・問合せ先名称(英)</option>
									<option value="51" {if ('51' == form.summary_key4)}selected{/if}>主催者・問合せ先TEL</option>
									<option value="52" {if ('52' == form.summary_key4)}selected{/if}>主催者・問合せ先FAX</option>
									<option value="53" {if ('53' == form.summary_key4)}selected{/if}>主催者・問合せ先Email</option>
									<option value="54" {if ('54' == form.summary_key4)}selected{/if}>主催者・問合せ先住所</option>
									<option value="55" {if ('55' == form.summary_key4)}selected{/if}>主催者・問合せ先担当部課</option>
									<option value="56" {if ('56' == form.summary_key4)}selected{/if}>主催者・問合せ先担当者</option>
									<option value="57" {if ('57' == form.summary_key4)}selected{/if}>日本国内の照会先名称(日)</option>
									<option value="58" {if ('58' == form.summary_key4)}selected{/if}>日本国内の照会先名称(英)</option>
									<option value="59" {if ('59' == form.summary_key4)}selected{/if}>日本国内の照会先TEL</option>
									<option value="60" {if ('60' == form.summary_key4)}selected{/if}>日本国内の照会先FAX</option>
									<option value="61" {if ('61' == form.summary_key4)}selected{/if}>日本国内の照会先Email</option>
									<option value="62" {if ('62' == form.summary_key4)}selected{/if}>日本国内の照会先住所</option>
									<option value="63" {if ('63' == form.summary_key4)}selected{/if}>日本国内の照会先担当部課</option>
									<option value="64" {if ('64' == form.summary_key4)}selected{/if}>日本国内の照会先担当者</option>
									<option value="65" {if ('65' == form.summary_key4)}selected{/if}>見本市レポートURL</option>
									<option value="66" {if ('66' == form.summary_key4)}selected{/if}>展示会に係わる画像名称1</option>
									<option value="67" {if ('67' == form.summary_key4)}selected{/if}>展示会に係わる画像名称2</option>
									<option value="68" {if ('68' == form.summary_key4)}selected{/if}>展示会に係わる画像名称3</option>
									<option value="69" {if ('69' == form.summary_key4)}selected{/if}>システム管理者備考欄</option>
									<option value="70" {if ('70' == form.summary_key4)}selected{/if}>データ管理者備考欄</option>
									<option value="71" {if ('71' == form.summary_key4)}selected{/if}>登録カテゴリ</option>
									<option value="72" {if ('72' == form.summary_key4)}selected{/if}>削除フラグ</option>
									<option value="73" {if ('73' == form.summary_key4)}selected{/if}>JECC認証フラグ</option>
									<option value="74" {if ('74' == form.summary_key4)}selected{/if}>JECC認証年月日</option>
									<option value="75" {if ('75' == form.summary_key4)}selected{/if}>JETRO出展支援URL</option>
									<option value="76" {if ('76' == form.summary_key4)}selected{/if}>JETRO出展支援フラグ</option>
									<option value="77" {if ('77' == form.summary_key4)}selected{/if}>登録者ID</option>
									<option value="78" {if ('78' == form.summary_key4)}selected{/if}>更新者ID</option>
								</select>
							</td>
							<td>
								<input type="radio" name="summary_key4_sort_cond" id="summary_key4_sort_cond" value="0" {if ('0' == $form.summary_key4_sort_cond || '' == $form.summary_key4_sort_cond)}checked{/if}/>昇順
								<input type="radio" name="summary_key4_sort_cond" id="summary_key4_sort_cond" value="1" {if ('1' == $form.summary_key4_sort_cond)}checked{/if}/>降順
							</td>
						</tr>
						<tr>
							<td>条件5：
								<select name="summary_key5" id="summary_key5">
									<option value="" {if ('' == form.summary_key5)}selected{/if}>ソートなし</option>
									<option value="0" {if ('0' == form.summary_key5)}selected{/if}>ユーザID</option>
									<option value="1" {if ('1' == form.summary_key5)}selected{/if}>Webページの表示／非表示</option>
									<option value="2" {if ('2' == form.summary_key5)}selected{/if}>承認フラグ</option>
									<option value="3" {if ('3' == form.summary_key5)}selected{/if}>否認コメント</option>
									<option value="4" {if ('4' == form.summary_key5)}selected{/if}>メール送信フラグ</option>
									<option value="5" {if ('5' == form.summary_key5)}selected{/if}>ユーザ使用言語フラグ</option>
									<option value="6" {if ('6' == form.summary_key5)}selected{/if}>Eメール</option>
									<option value="7" {if ('7' == form.summary_key5)}selected{/if}>申請年月日</option>
									<option value="8" {if ('8' == form.summary_key5)}selected{/if}>登録日(承認日)</option>
									<option value="9" {if ('9' == form.summary_key5)}selected{/if}>言語選択情報</option>
									<option value="10" {if ('10' == form.summary_key5)}selected{/if}>見本市番号</option>
									<option value="11" {if ('11' == form.summary_key5)}selected{/if}>見本市名(日)</option>
									<option value="12" {if ('12' == form.summary_key5)}selected{/if}>見本市名(英)</option>
									<option value="13" {if ('13' == form.summary_key5)}selected{/if}>見本市略称</option>
									<option value="14" {if ('14' == form.summary_key5)}selected{/if}>見本市URL</option>
									<option value="15" {if ('15' == form.summary_key5)}selected{/if}>キャッチフレーズ(日)</option>
									<option value="16" {if ('16' == form.summary_key5)}selected{/if}>キャッチフレーズ(英)</option>
									<option value="17" {if ('17' == form.summary_key5)}selected{/if}>ＰＲ・紹介文(日)</option>
									<option value="18" {if ('18' == form.summary_key5)}selected{/if}>ＰＲ・紹介文(英)</option>
									<option value="19" {if ('19' == form.summary_key5)}selected{/if}>会期開始年</option>
									<option value="20" {if ('20' == form.summary_key5)}selected{/if}>会期開始月</option>
									<option value="21" {if ('21' == form.summary_key5)}selected{/if}>会期開始日</option>
									<option value="22" {if ('22' == form.summary_key5)}selected{/if}>会期終了年</option>
									<option value="23" {if ('23' == form.summary_key5)}selected{/if}>会期終了月</option>
									<option value="24" {if ('24' == form.summary_key5)}selected{/if}>会期終了日</option>
									<option value="25" {if ('25' == form.summary_key5)}selected{/if}>開催頻度</option>
									<option value="26" {if ('26' == form.summary_key5)}selected{/if}>業種大分類</option>
									<option value="27" {if ('27' == form.summary_key5)}selected{/if}>業種小分類</option>
									<option value="28" {if ('28' == form.summary_key5)}selected{/if}>出品物(日)</option>
									<option value="29" {if ('29' == form.summary_key5)}selected{/if}>出品物(英)</option>
									<option value="30" {if ('30' == form.summary_key5)}selected{/if}>開催地地域</option>
									<option value="31" {if ('31' == form.summary_key5)}selected{/if}>開催地国地域</option>
									<option value="32" {if ('32' == form.summary_key5)}selected{/if}>開催地都市</option>
									<option value="33" {if ('33' == form.summary_key5)}selected{/if}>開催地その他(日)</option>
									<option value="34" {if ('34' == form.summary_key5)}selected{/if}>開催地その他(英)</option>
									<option value="35" {if ('35' == form.summary_key5)}selected{/if}>会場名(日)</option>
									<option value="36" {if ('36' == form.summary_key5)}selected{/if}>会場名(英)</option>
									<option value="37" {if ('37' == form.summary_key5)}selected{/if}>開催予定規模</option>
									<option value="38" {if ('38' == form.summary_key5)}selected{/if}>入場資格</option>
									<option value="39" {if ('39' == form.summary_key5)}selected{/if}>チケットの入手方法</option>
									<option value="40" {if ('40' == form.summary_key5)}selected{/if}>チケットの入手方法その他(日)</option>
									<option value="41" {if ('41' == form.summary_key5)}selected{/if}>チケットの入手方法Others(英)</option>
									<option value="42" {if ('42' == form.summary_key5)}selected{/if}>過去の実績年実績</option>
									<option value="43" {if ('43' == form.summary_key5)}selected{/if}>過去の実績来場者数</option>
									<option value="44" {if ('44' == form.summary_key5)}selected{/if}>過去の実績海外来場者数</option>
									<option value="45" {if ('45' == form.summary_key5)}selected{/if}>過去の実績出展社数</option>
									<option value="46" {if ('46' == form.summary_key5)}selected{/if}>過去の実績海外出展社数</option>
									<option value="47" {if ('47' == form.summary_key5)}selected{/if}>過去の実績開催規模</option>
									<option value="48" {if ('48' == form.summary_key5)}selected{/if}>過去の実績認証機関</option>
									<option value="49" {if ('49' == form.summary_key5)}selected{/if}>主催者・問合せ先名称(日)</option>
									<option value="50" {if ('50' == form.summary_key5)}selected{/if}>主催者・問合せ先名称(英)</option>
									<option value="51" {if ('51' == form.summary_key5)}selected{/if}>主催者・問合せ先TEL</option>
									<option value="52" {if ('52' == form.summary_key5)}selected{/if}>主催者・問合せ先FAX</option>
									<option value="53" {if ('53' == form.summary_key5)}selected{/if}>主催者・問合せ先Email</option>
									<option value="54" {if ('54' == form.summary_key5)}selected{/if}>主催者・問合せ先住所</option>
									<option value="55" {if ('55' == form.summary_key5)}selected{/if}>主催者・問合せ先担当部課</option>
									<option value="56" {if ('56' == form.summary_key5)}selected{/if}>主催者・問合せ先担当者</option>
									<option value="57" {if ('57' == form.summary_key5)}selected{/if}>日本国内の照会先名称(日)</option>
									<option value="58" {if ('58' == form.summary_key5)}selected{/if}>日本国内の照会先名称(英)</option>
									<option value="59" {if ('59' == form.summary_key5)}selected{/if}>日本国内の照会先TEL</option>
									<option value="60" {if ('60' == form.summary_key5)}selected{/if}>日本国内の照会先FAX</option>
									<option value="61" {if ('61' == form.summary_key5)}selected{/if}>日本国内の照会先Email</option>
									<option value="62" {if ('62' == form.summary_key5)}selected{/if}>日本国内の照会先住所</option>
									<option value="63" {if ('63' == form.summary_key5)}selected{/if}>日本国内の照会先担当部課</option>
									<option value="64" {if ('64' == form.summary_key5)}selected{/if}>日本国内の照会先担当者</option>
									<option value="65" {if ('65' == form.summary_key5)}selected{/if}>見本市レポートURL</option>
									<option value="66" {if ('66' == form.summary_key5)}selected{/if}>展示会に係わる画像名称1</option>
									<option value="67" {if ('67' == form.summary_key5)}selected{/if}>展示会に係わる画像名称2</option>
									<option value="68" {if ('68' == form.summary_key5)}selected{/if}>展示会に係わる画像名称3</option>
									<option value="69" {if ('69' == form.summary_key5)}selected{/if}>システム管理者備考欄</option>
									<option value="70" {if ('70' == form.summary_key5)}selected{/if}>データ管理者備考欄</option>
									<option value="71" {if ('71' == form.summary_key5)}selected{/if}>登録カテゴリ</option>
									<option value="72" {if ('72' == form.summary_key5)}selected{/if}>削除フラグ</option>
									<option value="73" {if ('73' == form.summary_key5)}selected{/if}>JECC認証フラグ</option>
									<option value="74" {if ('74' == form.summary_key5)}selected{/if}>JECC認証年月日</option>
									<option value="75" {if ('75' == form.summary_key5)}selected{/if}>JETRO出展支援URL</option>
									<option value="76" {if ('76' == form.summary_key5)}selected{/if}>JETRO出展支援フラグ</option>
									<option value="77" {if ('77' == form.summary_key5)}selected{/if}>登録者ID</option>
									<option value="78" {if ('78' == form.summary_key5)}selected{/if}>更新者ID</option>
								</select>
							</td>
							<td>
								<input type="radio" name="summary_key5_sort_cond" id="summary_key5_sort_cond" value="0" {if ('0' == $form.summary_key5_sort_cond || '' == $form.summary_key5_sort_cond)}checked{/if}/>昇順
								<input type="radio" name="summary_key5_sort_cond" id="summary_key5_sort_cond" value="1" {if ('1' == $form.summary_key5_sort_cond)}checked{/if}/>降順
							</td>
						</tr>
					</table>
					<table>
						<font size="2"><br>期間項目&nbsp;追加集計条件</font>
						<tr>
							<td>
								<select name="summary_value" id="summary_value">
									<option value="" {if ('' == $form.summary_value)}selected{/if}>ソートなし</option>
									<option value="79" {if ('79' == $form.summary_value)}selected{/if}>削除日時</option>
									<option value="80" {if ('80' == $form.summary_value)}selected{/if}>登録日</option>
									<option value="81" {if ('81' == $form.summary_value)}selected{/if}>更新日</option>
								</select>
							</td>
							<td>
								<input type="text" name="summary_value_from_yyyy" id="summary_value_from_yyyy" value="{$form.summary_value_from_yyyy}" maxlength="4" size="4" />年
								<input type="text" name="summary_value_from_mm" id="summary_value_from_mm" value="{$form.summary_value_from_mm}" maxlength="2" size="2" />月
								<input type="text" name="summary_value_from_dd" id="summary_value_from_dd" value="{$form.summary_value_from_dd}" maxlength="2" size="2" />日から&nbsp;
								<input type="text" name="summary_value_to_yyyy" id="summary_value_to_yyyy" value="{$form.summary_value_to_yyyy}" maxlength="4" size="4" />年
								<input type="text" name="summary_value_to_mm" id="summary_value_to_mm" value="{$form.summary_value_to_mm}" maxlength="2" size="2" />月
								<input type="text" name="summary_value_to_dd" id="summary_value_to_dd" value="{$form.summary_value_to_dd}" maxlength="2" size="2" />日まで
							</td>
							<td>
								<select name=summary_value_hani_cond id ="summary_value_hani_cond">
									<option value="10" {if ('10' == $form.summary_value_hani_cond || '' == $form.summary_value_hani_cond)}selected{/if}>範囲</option>
									<option value="11" {if ('11' == $form.summary_value_hani_cond)}selected{/if}>範囲外</option>
								</select>
							</td>
							<td>
								<input type="radio" name="summary_value_sort_cond" id="summary_value_sort_cond" value="0" {if ('0' == $form.summary_value_sort_cond || '' == $form.summary_value_sort_cond)}checked{/if}/>昇順
								<input type="radio" name="summary_value_sort_cond" id="summary_value_sort_cond" value="1" {if ('1' == $form.summary_value_sort_cond)}checked{/if}/>降順
							</td>
						</tr>
					</table>
					<hr/>
					<input type="button" value="検索実行" onclick="search()" />
					<input type="button" value="集計実行" onclick="summary()" />
					<input type="reset" value="リセット" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
