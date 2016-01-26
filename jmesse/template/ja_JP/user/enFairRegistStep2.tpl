<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
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
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop" onload="init()">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/en/"><img alt="home" src="/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
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
					<img src="/library/en/database/j-messe/images/db/fair02.jpg" alt="enfairstep2" />
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
										<span class="error-message">{message name="fair_title_en"}</span><br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>Information from latest fair</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
						{if is_error('year_of_the_trade_fair')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">year</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<select name="year_of_the_trade_fair" size="1" id="year_of_the_trade_fair">
										<option value=""></option>
										{section name=it loop=$app.year_list}
										<option value="{$app.year_list[it]}" {if $app.year_list[it]==$form.year_of_the_trade_fair}selected{/if}>{$app.year_list[it]}</option>
										{/section}
									</select>
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
								<th class="bg_gray_lv1 nobdr">Total number of visitors</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_form_list pt0 pb0">
										<ul class="liner">
											<li>
												<div class="elem_custom_input pt0 pb0">
													<input type="text" value="{$form.total_number_of_visitor}" size="10" name="total_number_of_visitor" id="total_number_of_visitor" maxlength="10" class="var_bg_white var_size_short" />
												</div>
											</li>
											<li>
												<div class="elem_custom_input pt0 pb0">
													(including <input type="text" value="{$form.number_of_foreign_visitor}" size="10" name="number_of_foreign_visitor" id="number_of_foreign_visitor" maxlength="10" class="var_bg_white var_size_short" /> foreign visitors)<br />
												</div>
											</li>
										</ul>
										Enter only single-byte numbers with no commas.  E.g. 100
									</div>
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
								<th class="bg_gray_lv1 nobdr">Total number of exhibitors</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_form_list pt0 pb0">
										<ul class="liner">
											<li>
												<div class="elem_custom_input pt0 pb0">
													<input type="text" value="{$form.total_number_of_exhibitors}" size="10" name="total_number_of_exhibitors" id="total_number_of_exhibitors" maxlength="10" class="var_bg_white var_size_short" />
												</div>
											</li>
											<li>
												<div class="elem_custom_input pt0 pb0">
													<input type="text" value="{$form.number_of_foreign_exhibitors}" size="10" name="number_of_foreign_exhibitors" id="number_of_foreign_exhibitors" maxlength="10" class="var_bg_white var_size_short" />  foreign exhibitors)<br />
												</div>
											</li>
										</ul>
										Enter only single-byte numbers with no commas.  E.g. 100
									</div>
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
								<th class="bg_gray_lv1 nobdr">Net square meters</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.net_square_meters}" size="50" name="net_square_meters" id="net_square_meters" maxlength="50" class="var_bg_white var_size_middle" />sq.m.<br />
										Enter only single-byte numbers with no commas.  E.g. 100
									</div>
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
								<th class="bg_gray_lv1 nobdr">Data verified by</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.spare_field1}" size="50" name="spare_field1" id="spare_field1" maxlength="255" class="var_bg_white var_size_middle" /><br />
										Enter verifying authorities. E.g. FKM (the Society for Voluntary Control of Trade Fair and Exhibition Statistics) and UFI (the Global Association of the Exhibition Industry)
									</div>
									{if is_error('spare_field1')}
										<span class="error-message">{message name="spare_field1"}</span><br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>Catchphrase</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
						{if is_error('profile_en')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Catchphrase</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<textarea cols="60" rows="3" name="profile_en" id="profile_en" class="var_bg_white">{$form.profile_en}</textarea><br />
										Maximum of 150 letters
									</div>
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
								<th class="bg_gray_lv1 nobdr">Organizer's statement, special features. etc.</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<textarea cols="60" rows="5" name="detailed_information_en" id="detailed_information_en" class="var_bg_white">{$form.detailed_information_en}</textarea><br/>
										If there is a concurrent/joint exhibit, please fill it in here.  Maximum of 1000 letters
									</div>
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
								<th class="bg_gray_lv1 nobdr">Photos</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_linkBox_list">
										<input type="file" size="40" name="photos_1" id="photos_1" /> <input type="button" value="Regist" onclick="add_photos('photos_1')"/><br />
										<input type="file" size="40" name="photos_2" id="photos_2" /> <input type="button" value="Regist" onclick="add_photos('photos_2')"/><br />
										<input type="file" size="40" name="photos_3" id="photos_3" /> <input type="button" value="Regist" onclick="add_photos('photos_3')"/><br />
										* Follow the instructions shown below when uploading image files. Any image file not  meeting the requirements  will not  be registered correctly.<br/>
										・The image should be in a gif or jpeg format file within 600 (H) x 800 (W) pixels with a volume of 2MB or less<br/>
										・For file names, use alphanumeric characters (a-ｚ and 0-9) only.<br/>
									</div>
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
								<th class="bg_gray_lv1 nobdr">Search Keyword</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										You can set up to 5 keywords. Please place a comma (,) between keywords.<br />
										<input type="text" value="{$form.keyword}" size="60" name="keyword" id="keyword" maxlength="100" class="var_bg_white var_size_large" />
									</div>
									{if is_error('keyword')}
										<span class="error-message">{message name="keyword"}</span><br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>Organizer</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							{if is_error('organizer_en')}
								<tr class="errorcheck">
							{else}
								<tr>
							{/if}
									<th class="bg_gray_lv1 nobdr">Name of the organizer</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_custom_input pt0 pb0">
											Name:<input type="text" value="{$form.organizer_en}" size="60" name="organizer_en" id="organizer_en" maxlength="500" class="var_bg_white var_size_large" />
										</div>
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
									<th class="bg_gray_lv1 nobdr">Information of the organizer</th>
									<th class="bg_gray_lv1"><span class="cate">Required</span></th>
									<td class="bg_gray_lv2">
										<div class="elem_text_list_note">
											<table class="elem_text_list_note">
												<colgroup>
													<col width="12%">
													<col width="88%">
												</colgroup>
												<tbody>
													<tr>
														<th class="elem_text_list_note">Address</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.organizer_addr}" size="30" name="organizer_addr" id="organizer_addr" maxlength="255" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">Department</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.organizer_div}" size="30" name="organizer_div" id="organizer_div" maxlength="255" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">Person</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.organizer_pers}" size="30" name="organizer_pers" id="organizer_pers" maxlength="100" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note"><span class="cate">Required</span>TEL</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.organizer_tel}" size="30" name="organizer_tel" id="organizer_tel" maxlength="100" class="var_bg_white var_size_large" />
															</div>
															Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">FAX</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.organizer_fax}" size="30" name="organizer_fax" id="organizer_fax" maxlength="100" class="var_bg_white var_size_large" />
															</div>
															Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">Email</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.organizer_email}" size="60" name="organizer_email" id="organizer_email" maxlength="255" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
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
									<th class="bg_gray_lv1 nobdr">The representative office, person or agency in Japan</th>
									<th class="bg_gray_lv1"></th>
									<td class="bg_gray_lv2">
										<div class="elem_paragraph">
											<p class="text">Fill in information only if your exhibition will be held outside Japan and you have a representative office, agency or person in Japan for inquiries.</p>
										</div>
										<div class="elem_text_list_note">
											<table class="elem_text_list_note">
												<colgroup>
													<col width="12%">
													<col width="88%">
												</colgroup>
												<tbody>
													<tr>
														<th class="elem_text_list_note">Name</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.agency_in_japan_en}" size="60" name="agency_in_japan_en" id="agency_in_japan_en" maxlength="255" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">Address</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.agency_in_japan_addr}" size="30" name="agency_in_japan_addr" id="agency_in_japan_addr" maxlength="255" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">Department</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.agency_in_japan_div}" size="30" name="agency_in_japan_div" id="agency_in_japan_div" maxlength="255" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">Person</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.agency_in_japan_pers}" size="30" name="agency_in_japan_pers" id="agency_in_japan_pers" maxlength="100" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">TEL</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.agency_in_japan_tel}" size="30" name="agency_in_japan_tel" id="agency_in_japan_tel" maxlength="100" class="var_bg_white var_size_large" />
															</div>
															Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">FAX</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.agency_in_japan_fax}" size="30" name="agency_in_japan_fax" id="agency_in_japan_fax" maxlength="100" class="var_bg_white var_size_large" />
															</div>
															Enter the numbers starting with a plus mark “+” followed by the country code. Insert hyphens between each group of numbers. (E.g. for a phone number in Tokyo: +81-3-1234-5678)
														</td>
													</tr>
													<tr>
														<th class="elem_text_list_note">Email</th>
														<td class="elem_text_list_note">
															<div class="elem_custom_input pt0">
																<input type="text" value="{$form.agency_in_japan_email}" size="60" name="agency_in_japan_email" id="agency_in_japan_email" maxlength="255" class="var_bg_white var_size_large" />
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
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
						</tbody>
					</table>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
						{if ('c' == $form.mode || 'e' == $form.mode)}
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_enFairRegistStep1=true&mode={$form.mode}&mihon_no={$form.mihon_no}&back=1" class="var_small"><span class="left">Back</span></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
						{else}
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_enFairRegistStep1=true&back=1" class="var_small"><span class="left">Back</span></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
						{/if}
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<a href="javascript:next();" class="var_small"><span>Confirm</span></a>
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
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
