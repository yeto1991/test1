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
	function init() {
		// 展示会に係わる画像(3点)
		document.getElementById('photos_name_1').value = '';
		document.getElementById('photos_name_2').value = '';
		document.getElementById('photos_name_3').value = '';
	}

	/**
	 * 展示会に係わる画像(3点)関連。
	 */
	function delete_photos_list() {
		if (window.confirm('Do you delete the selected photos？')) {
			var delfiletag;
			for (var i = document.getElementById('photos_list').length - 1; i >= 0; i--) {
				if (document.getElementById('photos_list').options[i].selected) {
					delfiletag = document.createElement('input');
					delfiletag.type = 'hidden';
					delfiletag.name = 'del_photos_name[]';
					delfiletag.id = 'del_photos_name[]';
					delfiletag.value = document.getElementById('photos_list').options[i].value;
					document.getElementById('form_enFairRegistStep2').appendChild(delfiletag);
					document.getElementById('photos_list').remove(i);
				}
			}
		}
	}

	function add_photos(photos) {
		var path = document.getElementById(photos).value;
		if ('' == path) {
			return;
		}

		var paths = path.split('\\');
		if (1 == paths.length) {
			paths = path.split('/');
		}
		var filename = paths[paths.length - 1];

		for (i = 0; i < document.getElementById('photos_list').length; i++) {
			if (filename == document.getElementById('photos_list').options[i].value) {
				window.alert('same photo file name can not regist.');
				return;
			}
		}
		if (3 <= document.getElementById('photos_list').length) {
			window.alert('photo can regist up to 3 photos.');
			return;
		}

		var op = document.createElement('option');
		op.value = filename;
		op.innerHTML = filename;
		document.getElementById('photos_list').appendChild(op);
	}

	// submit
	function next() {
		// 展示会に係わる画像(3点)ウイルスチェック判定
		var path_1 = document.getElementById('photos_1').value;
		var path_2 = document.getElementById('photos_2').value;
		var path_3 = document.getElementById('photos_3').value;
		if ('' != path_1 || '' != path_2 || '' != path_3) {
			for (var i = 0; i < document.getElementsByName('virus_check').length; i++) {
				if (document.getElementsByName('virus_check')[i].checked && '0' == document.getElementsByName('virus_check')[i].value) {
					window.alert('please virus check your selected photos for registing');
					return;
				}
			}
		}

		// 展示会に係わる画像(3点)
		for (i = 0; i < document.getElementById('photos_list').length; i++) {
			no = i + 1;
			document.getElementById('photos_name_' + String(no)).value = document.getElementById('photos_list').options[i].value;
		}
		document.getElementById('form_enFairRegistStep2').submit();
	}

{/literal}
//-->
</script>
{if ('' == $form.mode) || ('e' == $form.mode)}
<title>Fair Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ('c' == $form.mode)}
<title>User Editing - Online Trade Fair Database (J-messe) - JETRO</title>
{/if}
</head>

<body class="layout-LC highlight-database j-messe" onload="init()">
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
			<li><a href="{$config.url}?action_user_enFairRegistStep1=true&back=1">Fair Registration(step1)</a></li>
			<li>Fair Registration(step2)</li>
			{elseif ('c' == $form.mode)}
			<li><a href="{$config.url}?action_user_enFairRegistStep1=true&back=1">Fair Editing(step1)</a></li>
			<li>Fair Editing(step2)</li>
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
					<img src="/en/database/j-messe/images/db/fair02.jpg" alt="見本市登録ステップ2" />
				</h3>
				<p>
					Please register trade fair information according to your official website.<br />
					JETRO may verify and revise the content of the registered information based on the official website prior to its publication.<br />
				</p>
				<p class="t_right">user：{$session.email}</p>

				{* エラー表示 *}
				{if count($errors)}
				<p class="error-message" id="error-pagetop">The data you have entered is invalid. Please re-enter.</p>
				{/if}

				<form name="form_enFairRegistStep2" id="form_enFairRegistStep2" method="post" action=""  enctype="multipart/form-data">
					<input type="hidden" name="action_user_enFairRegistDo" id="action_user_enFairRegistDo" value="dummy" />
					<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
					<input type="hidden" name="photos_name_1" id="photos_name_1" value="{$form.photos_name_1}" />
					<input type="hidden" name="photos_name_2" id="photos_name_2" value="{$form.photos_name_2}" />
					<input type="hidden" name="photos_name_3" id="photos_name_3" value="{$form.photos_name_3}" />
					<input type="hidden" name="del_photos_name[]" id="del_photos_name[]" value="" />
					{if ('c' == $form.mode || 'e' == $form.mode)}
					<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
					{/if}
					<table id="registration">
						{if is_error('fair_title_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Fair title</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<input type="text" value="{$form.fair_title_en}" size="60" name="fair_title_en" id="fair_title_en" maxlength="255" /><br/>
								{if is_error('fair_title_en')}
								<span class="error-message">{message name="fair_title_en"}</span><br />
								{/if}
							</td>
						</tr>
					</table>

					<h4>Information from latest fair</h4>
					<table id="registration">
						{if is_error('year_of_the_trade_fair')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">year</th>
							<th class="required"></th>
							<td><select name="year_of_the_trade_fair" size="1" id="year_of_the_trade_fair">
									<option value=""></option>
									{section name=it loop=$app.year_list}
									<option value="{$app.year_list[it]}" {if $app.year_list[it]==$form.year_of_the_trade_fair}selected{/if}>{$app.year_list[it]}</option>
									{/section}
								</select> Year<br/>
								{if is_error('year_of_the_trade_fair')}
								<span class="error-message">{message name="year_of_the_trade_fair"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('total_number_of_visitor') || is_error('number_of_foreign_visitor')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Total number of visitors</th>
							<th class="required"></th>
							<td>
								<input type="text" value="{$form.total_number_of_visitor}" size="10" name="total_number_of_visitor" id="total_number_of_visitor" maxlength="10" /> <strong> (including </strong><input type="text" value="{$form.number_of_foreign_visitor}" size="10" name="number_of_foreign_visitor" id="number_of_foreign_visitor" maxlength="10" /> <strong>  foreign visitors) </strong><br />
								Enter only single-byte numbers with no commas.  E.g. 100<br/>
								{if is_error('total_number_of_visitor')}
								<span class="error-message">{message name="total_number_of_visitor"}</span><br />
								{/if}
								{if is_error('number_of_foreign_visitor')}
								<span class="error-message">{message name="number_of_foreign_visitor"}</span><br />
								{/if}
							</td>
						</tr>
						{if is_error('total_number_of_exhibitors') || is_error('number_of_foreign_exhibitors')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Total number of exhibitors</th>
							<th class="required"></th>
							<td>
								<input type="text" value="{$form.total_number_of_exhibitors}" size="10" name="total_number_of_exhibitors" id="total_number_of_exhibitors" maxlength="10" /> <strong>(including </strong><input type="text" value="{$form.number_of_foreign_exhibitors}" size="10" name="number_of_foreign_exhibitors" id="number_of_foreign_exhibitors" maxlength="10" /> <strong>  foreign exhibitors) </strong><br />
								Enter only single-byte numbers with no commas.  E.g. 100<br/>
								{if is_error('total_number_of_exhibitors')}
								<span class="error-message">{message name="total_number_of_exhibitors"}</span><br />
								{/if}
								{if is_error('number_of_foreign_exhibitors')}
								<span class="error-message">{message name="number_of_foreign_exhibitors"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('net_square_meters')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Net square meters</th>
							<th class="required"></th>
							<td>
								<input type="text" value="{$form.net_square_meters}" size="50" name="net_square_meters" id="net_square_meters" maxlength="50" /> <strong>sq.m.</strong><br />
								Enter only single-byte numbers with no commas.  E.g. 100<br/>
								{if is_error('net_square_meters')}
								<span class="error-message">{message name="net_square_meters"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('spare_field1')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Data verified by</th>
							<th class="required"></th>
							<td>
								<input type="text" value="{$form.spare_field1}" size="50" name="spare_field1" id="spare_field1" maxlength="255" /><br />
								Enter verifying authorities. E.g. FKM (the Society for Voluntary Control of Trade Fair and Exhibition Statistics) and UFI (the Global Association of the Exhibition Industry)<br/>
								{if is_error('spare_field1')}
								<span class="error-message">{message name="spare_field1"}</span><br />
								{/if}
							</td>
						</tr>
					</table>

					<h4>Catchphrase</h4>
					<table id="registration">
						{if is_error('profile_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Catchphrase</th>
							<th class="required"></th>
							<td>
								<textarea cols="60" rows="2" name="profile_en" id="profile_en">{$form.profile_en}</textarea><br/>
							 	Maximum of 500 letters (about 70 words) <br/>
								{if is_error('profile_en')}
								<span class="error-message">{message name="profile_en"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('detailed_information_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Organizer's statement, special features. etc. </th>
							<th class="required"></th>
							<td>
								<textarea cols="60" rows="6" name="detailed_information_en" id="detailed_information_en">{$form.detailed_information_en}</textarea><br/>
								If there is a concurrent/joint exhibit, please fill it in here.  Maximum of 1000 letters (about 140 words) <br/>
								{if is_error('detailed_information_en')}
								<span class="error-message">{message name="detailed_information_en"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('photos_1') || is_error('photos_2') || is_error('photos_3')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Photos</th>
							<th class="required"></th>
							<td>
								<input type="file" size="40" name="photos_1" id="photos_1" /> <input type="button" value="Regist" onclick="add_photos('photos_1')"/><br />
								<input type="file" size="40" name="photos_2" id="photos_2" /> <input type="button" value="Regist" onclick="add_photos('photos_2')"/><br />
								<input type="file" size="40" name="photos_3" id="photos_3" /> <input type="button" value="Regist" onclick="add_photos('photos_3')"/><br />
								* Follow the instructions shown below when uploading image files. Any image file not  meeting the requirements  will not  be registered correctly.<br/>
								・The image should be in a gif or jpeg format file within 600 (H) x 800 (W) pixels with a volume of 2MB or less<br/>
								・For file names, use alphanumeric characters (a-ｚ and 0-9) only.<br/>
								<select name="photos_list" id="photos_list" size="3" style="width:200px">
									{if ('' != $form.photos_name_1) }
									<option value="{$form.photos_name_1}">{$form.photos_name_1}</option>
									{/if}
									{if ('' != $form.photos_name_2) }
									<option value="{$form.photos_name_2}">{$form.photos_name_2}</option>
									{/if}
									{if ('' != $form.photos_name_3) }
									<option value="{$form.photos_name_3}">{$form.photos_name_3}</option>
									{/if}
								</select><br/>
								<input type="button" value="Delete" onclick="delete_photos_list()" /><br/>
								{if count($errors)}
									{foreach from=$errors item=error}
										{if $error|regex_replace:'/.*Photos.*/i':'Photos' eq 'Photos'}
										<span class="error-message">{$error}</span><br />
										{/if}
									{/foreach}
								{/if}
								Have you scanned the uploaded image files for viruses?<br/>
								<input type="radio" name="virus_check" id="virus_check_y" value="1" />Yes
								<input type="radio" name="virus_check" id="virus_check_n" value="0" checked />No<br/>
								{if is_error('photos_1')}
								<span class="error-message">{message name="photos_1"}</span><br />
								{/if}
								{if is_error('photos_2')}
								<span class="error-message">{message name="photos_2"}</span><br />
								{/if}
								{if is_error('photos_3')}
								<span class="error-message">{message name="photos_3"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('keyword')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Search Keyword</th>
							<th class="required"></th>
							<td>
								You can set up to 5 keywords. Please place a comma (,) between keywords.<br />
								<input type="text" value="{$form.keyword}" size="60" name="keyword" id="keyword" maxlength="100" /><br/>
								{if is_error('keyword')}
								<span class="error-message">{message name="keyword"}</span><br />
								{/if}
							</td>
						</tr>
					</table>

					<h4>Organizer</h4>
					<table id="registration">
						{if is_error('organizer_en')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Name of the organizer</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								 Name: <input type="text" value="{$form.organizer_en}" size="60" name="organizer_en" id="organizer_en" maxlength="500" /><br/>
								{if is_error('organizer_en')}
								<span class="error-message">{message name="organizer_en"}</span><br />
								{/if}
							</td>
						</tr>

						{if is_error('organizer_addr') || is_error('organizer_div') || is_error('organizer_pers') || is_error('organizer_tel') || is_error('organizer_fax') || is_error('organizer_email')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">Information of the organizer</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
								<strong>Address: </strong><input type="text" value="{$form.organizer_addr}" size="30" name="organizer_addr" id="organizer_addr" maxlength="255" /><br />
								<strong>Department: </strong><input type="text" value="{$form.organizer_div}" size="30" name="organizer_div" id="organizer_div" maxlength="255" /><br />
								<strong>Person: </strong><input type="text" value="{$form.organizer_pers}" size="30" name="organizer_pers" id="organizer_pers" maxlength="100" /><br />
								<img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" />&nbsp;<strong>TEL: </strong><input type="text" value="{$form.organizer_tel}" size="30" name="organizer_tel" id="organizer_tel" maxlength="100" /><br />
								Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)<br />
								<strong>FAX: </strong><input type="text" value="{$form.organizer_fax}" size="30" name="organizer_fax" id="organizer_fax" maxlength="100" /><br />
								Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)<br />
								<strong>Email: </strong><input type="text" value="{$form.organizer_email}" size="60" name="organizer_email" id="organizer_email" maxlength="255" /><br />
								{if is_error('organizer_addr')}
								<span class="error-message">{message name="organizer_addr"}</span><br />
								{/if}
								{if is_error('organizer_div')}
								<span class="error-message">{message name="organizer_div"}</span><br />
								{/if}
								{if is_error('organizer_pers')}
								<span class="error-message">{message name="organizer_pers"}</span><br />
								{/if}
								{if is_error('organizer_tel')}
								<span class="error-message">{message name="organizer_tel"}</span><br />
								{/if}
								{if is_error('organizer_fax')}
								<span class="error-message">{message name="organizer_fax"}</span><br />
								{/if}
								{if is_error('organizer_email')}
								<span class="error-message">{message name="organizer_email"}</span><br />
								{/if}
							 </td>
						</tr>

						{if is_error('agency_in_japan_en') || is_error('agency_in_japan_addr') || is_error('agency_in_japan_div') || is_error('agency_in_japan_pers') || is_error('agency_in_japan_tel') || is_error('agency_in_japan_fax') || is_error('agency_in_japan_email')}
						<tr class="errorcheck">
						{else}
						<tr>
						{/if}
							<th class="item">The representative office, person or agency in Japan</th>
							<th class="required"></th>
							<td>
								<strong>Fill in information only if your exhibition will be held outside Japan and you have a representative office, agency or person in Japan for inquiries.</strong><br /><br />
								<strong>Name of representative office or agency in Japan: </strong><input type="text" value="{$form.agency_in_japan_en}" size="60" name="agency_in_japan_en" id="agency_in_japan_en" maxlength="100" /><br/>
								{if is_error('agency_in_japan_en')}
								<span class="error-message">{message name="agency_in_japan_en"}</span><br />
								{/if}
								<strong>Address of the office or agency: </strong><input type="text" value="{$form.agency_in_japan_addr}" size="30" name="agency_in_japan_addr" id="agency_in_japan_addr" maxlength="255" /><br />
								<strong>Department in charge: </strong><input type="text" value="{$form.agency_in_japan_div}" size="30" name="agency_in_japan_div" id="agency_in_japan_div" maxlength="255" /><br />
								<strong>Person in charge: </strong><input type="text" value="{$form.agency_in_japan_pers}" size="30" name="agency_in_japan_pers" id="agency_in_japan_pers" maxlength="100" /><br />
								<strong>TEL: </strong><input type="text" value="{$form.agency_in_japan_tel}" size="30" name="agency_in_japan_tel" id="agency_in_japan_tel" maxlength="100" /><br />
								Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)<br />
								<strong>FAX: </strong><input type="text" value="{$form.agency_in_japan_fax}" size="30" name="agency_in_japan_fax" id="agency_in_japan_fax" maxlength="100" /><br />
								Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)<br />
								<strong>Email: </strong><input type="text" value="{$form.agency_in_japan_email}" size="60" name="agency_in_japan_email" id="agency_in_japan_email" maxlength="255" /><br />
								{if is_error('agency_in_japan_en')}
								<span class="error-message">{message name="agency_in_japan_en"}</span><br />
								{/if}
								{if is_error('agency_in_japan_addr')}
								<span class="error-message">{message name="agency_in_japan_addr"}</span><br />
								{/if}
								{if is_error('agency_in_japan_div')}
								<span class="error-message">{message name="agency_in_japan_div"}</span><br />
								{/if}
								{if is_error('agency_in_japan_pers')}
								<span class="error-message">{message name="agency_in_japan_pers"}</span><br />
								{/if}
								{if is_error('agency_in_japan_tel')}
								<span class="error-message">{message name="agency_in_japan_tel"}</span><br />
								{/if}
								{if is_error('agency_in_japan_fax')}
								<span class="error-message">{message name="agency_in_japan_fax"}</span><br />
								{/if}
								{if is_error('agency_in_japan_email')}
								<span class="error-message">{message name="agency_in_japan_email"}</span><br />
								{/if}
							</td>
						</tr>
					</table>
					<div class="line_dot">
						<hr />
					</div>
					<table width="100%">
						<tr>
							{if ('c' == $form.mode || 'e' == $form.mode)}
							<td width="250px"><a href="{$config.url}?action_user_enFairRegistStep1=true&mode={$form.mode}&mihon_no={$form.mihon_no}&back=1"><img src="/en/database/j-messe/images/db/btn-back.gif" alt="back" width="110" height="37" class="over" /></a></td>
							{else}
							<td width="250px"><a href="{$config.url}?action_user_enFairRegistStep1=true&back=1"><img src="/en/database/j-messe/images/db/btn-back.gif" alt="back" width="110" height="37" class="over" /></a></td>
							{/if}
							<td align="right"><a href="javascript:next();"><img src="/en/database/j-messe/images/db/btn-confirm.gif" alt="Confirm" width="180" height="37" class="over" /></a></td>
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
	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->
</body>
</html>