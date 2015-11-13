<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<script type="text/javascript">
<!--
{literal}

	function init(select_language_info, mode) {
		if ('2' == select_language_info) {
			var div = $("#engform").removeClass("regist_english");
		}

		// Changeモードと詳細表示以外では重複がある場合警告
		if ('c' != mode && 'd' != mode && 'p' != mode) {
			var msg = '';
	{/literal}
			{section name=it loop=$app.duplication_list}
			{if '' != $app.duplication_list[it].fair_title_en}
			msg += "　・{$app.duplication_list[it].fair_title_en}\n";
			{else}
			msg += "　・{$app.duplication_list[it].fair_title_jp}\n";
			{/if}
			{/section}
	{literal}
			if ('' != msg) {
				msg = "Please confirm this fair.(This fair's Date,Location and Industry is overlap.)\n\n" + msg;
				window.alert(msg);
			}
		}
	}

	function fair_delete(url, mihon_no, mode) {
		if (window.confirm('Do you delete the fair?')) {
			document.location.href = url + '?action_user_enFairDel=true&mihon_no=' + mihon_no + '&mode=' + mode;
		}
	}

{/literal}
//-->
</script>
{if ('' == $form.mode) || ('e' == $form.mode)}
<title>Fair Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ('c' == $form.mode)}
<title>Fair Editing - Online Trade Fair Database (J-messe) - JETRO</title>
{else}
<title>Fair Detail - Online Trade Fair Database (J-messe) - JETRO</title>
{/if}
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop" onload="init('{$form.select_language_info}', '{$from.mode}')">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="http://www.jetro.go.jp/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
					{if ('' == $form.mode) || ('e' == $form.mode)}
						<li><a href="{$config.url}?action_user_enFairRegistStep1=true&back=1">Fair Registration(step1)</a></li>
						<li><a href="{$config.url}?action_user_enFairRegistStep2=true&back=1">Fair Registration(step2)</a></li>
						<li>Fair Registration Confirm</li>
					{elseif ('c' == $form.mode)}
						<li><a href="{$config.url}?action_user_enFairRegistStep1=true&back=1">Fair Editing(step1)</a></li>
						<li><a href="{$config.url}?action_user_enFairRegistStep2=true&back=1">Fair Editing(step2)</a></li>
						<li>Fair Editing Confirm</li>
					{else}
						<li>Fair Detail</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

{*
$form.mode
''  : 新規登録モードStep.3 → 確認画面 (→ 登録)
'c' : 修正モードStep.3     → 確認画面 (→ 更新)
'd' : My展示会一覧         → 詳細表示 (→ 修正モードStep.1)
'e' : 修正登録モードStep.3 → 確認画面 (→ 登録)
'p' : 修正登録一覧         → 詳細表示 (→ 修正登録モードStep.1)
*}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('' == $form.mode) || ('e' == $form.mode)}
					<h1>New Fair Registration</h1>
				{elseif ('c' == $form.mode)}
					<h1>Fair Editing</h1>
				{else}
					<h1>Details of Your Registered Fairs</h1>
				{/if}
			</div>
		{if ('d' != $form.mode && 'p' != $form.mode)}
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/en/database/j-messe/images/db/fair04.jpg" alt="userdetail" />
				</div>
			</div>
		{/if}

			<div class="elem_paragraph">
				<p class="text right">user：{$session.email}</p>
			</div>

			<form name="form_user_enFairDetail" id="form_user_enFairDetail" method="post" action="" enctype="multipart/form-data">
				{uniqid}
				{if ('d' == $form.mode)}
				<input type="hidden" name="action_user_enFairChangeStep1" id="action_user_enFairChangeStep1" value="dummy" />
				<input type="hidden" name="mode" id="mode" value="c" />
				{elseif ('p' == $form.mode)}
				<input type="hidden" name="action_user_enFairChangeStep1" id="action_user_enFairChangeStep1" value="dummy" />
				<input type="hidden" name="mode" id="mode" value="e" />
				{else}
				<input type="hidden" name="action_user_enFairRegistDone" id="action_user_enFairRegistDone" value="dummy" />
				<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
					{if ('c' == $form.mode || 'e' == $form.mode)}
				<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
					{/if}
				{/if}
				<input type="hidden" name="" mihon_no"" id="mihon_no" value="{$form.mihon_no}" />

				<div class="elem_paragraph">
					<p class="text">
						<font color="red">
							{if ('' == $form.mode)}
								Do you wish to register the trade fair information as follows?
							{elseif ('e' == $form.mode)}
								Do you wish to register the trade fair information as follows?
							{elseif ('c' == $form.mode)}
								Do you wish to edit the trade fair information as follows?
							{elseif ('d' == $form.mode)}
								{if ('0' != $app.fair_start_past_flag)}
									<p><font color="red">To update the registered information of your trade fair in line with the upcoming event, use the "Copying registered information" page.</font></p>
								{/if}
							{else}
							{/if}
						</font>
					</p>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
							{if ('' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairRegistStep2=true&back=1" class="var_small"><span class="left">Back</span></a>
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
														<a href="" onclick="document.form_user_enFairDetail.submit();return false;" class="var_small"><span>Yes</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('e' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairRegistStep2=true&mode=e&mihon_no={$form.mihon_no}&back=1"><span class="left">Back</span></a>
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
														<a href="" onclick="document.form_user_enFairDetail.submit();return false;" class="var_small"><span>Yes</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('c' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairRegistStep2=true&mode=c&mihon_no={$form.mihon_no}&back=1" class="var_small"><span class="left">Back</span></a>
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
														<a href="" onclick="document.form_user_enFairDetail.submit();return false;" class="var_small"><span>Yes</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('d' == $form.mode)}
								{if ('0' == $app.fair_start_past_flag)}
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_enFairList=true" class="var_small"><span class="left">Back</span></a>
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
															<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}', '{$form.mode}')" class="var_small"><span>Delete</span></a>
														</div>
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
															<a href="{$config.url}?action_user_enFairRegistStep1=true&mode=c&mihon_no={$form.mihon_no}" class="var_small"><span>Edit</span></a>
														</div>
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
														<a href="{$config.url}?action_user_enFairList=true" class="var_small"><span class="left">Back</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul>
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_enFairCopyList=true" class="var_small"><span>EditRegist</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
								{/if}
							{elseif ('p' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairCopyList=true" class="var_small"><span class="left">back</span></a>
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
														<a href="{$config.url}?action_user_enFairRegistStep1=true&mode=e&mihon_no={$form.mihon_no}" class="var_small"><span>EditRegist</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{else}
							{/if}
						</div>
					</div>
				</p>
				<hr />
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
							<tr>
								<th class="bg_gray_lv1 nobdr">Fair title</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.fair_title_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Fair title (abbreviation)</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.abbrev_title}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">URL</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.fair_url}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr"></th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.date_from_yyyy}/{$form.date_from_mm}/{$form.date_from_dd}～{$form.date_to_yyyy}/{$form.date_to_mm}/{$form.date_to_dd}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Frequency of exhibition</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$app.frequency_name.discription_en}</td>
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
							<tr>
								<th class="bg_gray_lv1 nobdr">Main/Sub Industry</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									{$form.main_industory_name_1}/{$form.sub_industory_name_1}<br />
									{if ('' != $form.main_industory_name_2)}
										{$form.main_industory_name_2}/{$form.sub_industory_name_2}<br />
									{/if}
									{if ('' != $form.main_industory_name_3)}
										{$form.main_industory_name_3}/{$form.sub_industory_name_3}<br />
									{/if}
									{if ('' != $form.main_industory_name_4)}
										{$form.main_industory_name_4}/{$form.sub_industory_name_4}<br />
									{/if}
									{if ('' != $form.main_industory_name_5)}
										{$form.main_industory_name_5}/{$form.sub_industory_name_5}<br />
									{/if}
									{if ('' != $form.main_industory_name_6)}
										{$form.main_industory_name_6}/{$form.sub_industory_name_6}<br />
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Exhibits</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">{$form.exhibits_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
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
							<tr>
								<th class="bg_gray_lv1 nobdr">Location</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									{$app.region_name.discription_en}/ {$app.country_name.discription_en}
									{if ('' != $app.city_name)}
										/ {$app.city_name.discription_en}
									{/if}
									{if ('' != $form.other_city_en)}
										/ {$form.other_city_en}
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Venue</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.venue_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Net square meters</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.gross_floor_area)}
										{$form.gross_floor_area} sq.m.
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Data verified by</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.spare_field1}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Eligibility</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$app.open_to_name.discription_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Method of admission</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('1' == $form.admission_ticket_1)}
										Free<br />
									{/if}
									{if ('1' == $form.admission_ticket_2)}
										Apply/register online<br />
									{/if}
{*
									{if ('1' == $form.admission_ticket_3)}
										Contact organizer/agency in Japan<br />
									{/if}
*}
									{if ('1' == $form.admission_ticket_4)}
										Registration/tickets available at event<br />
									{/if}
									{if ('1' == $form.admission_ticket_5)}
										Others ({$form.other_admission_ticket_en})<br />
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
							<tr>
								<th class="bg_gray_lv1 nobdr">year</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.year_of_the_trade_fair)}
										{$form.year_of_the_trade_fair}year
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Total number of visitors</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.total_number_of_visitor || '' != $form.number_of_foreign_visitor)}
										{$form.total_number_of_visitor} (including {$form.number_of_foreign_visitor} foreign visitors)
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Total number of exhibitors</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.total_number_of_exhibitors || '' != $form.number_of_foreign_exhibitors)}
										{$form.total_number_of_exhibitors} (including {$form.number_of_foreign_exhibitors} foreign exhibitors)
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Net square meters</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.net_square_meters)}
										{$form.net_square_meters} sq.m.
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
							<tr>
								<th class="bg_gray_lv1 nobdr">Catchphrase</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">
									{$form.profile_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">PR</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">
									{$form.detailed_information_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Photos</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">
									{section name=it loop=$session.display_photos_path}
										Photo({$session.display_photos_no[it]})：{$session.display_photos_name[it]}<br />
										<img src="{$config.url}{$session.display_photos_path[it]}" alt="{$session.display_photos_name[it]}" width="150" /><br /><br />
									{/section}
									{if ('' == $form.mode) || ('c' == $form.mode) || ('e' == $form.mode)}
									If the selected image file is not displayed correctly, it will not be registered correctly. <br />
									In that case, return to the Step 2 for registration, see the instructions regarding image files, and select an image  again.
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Search Keyword</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.keyword}</td>
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
							<tr>
								<th class="bg_gray_lv1 nobdr">Name of the organizer</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.organizer_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Information of the organizer</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<strong>Address: </strong>{$form.organizer_addr}<br />
									<strong>Department: </strong>{$form.organizer_div}<br />
									<strong>Person: </strong>{$form.organizer_pers}<br />
									<span class="cate">Required</span>TEL: </strong>{$form.organizer_tel}<br />
									<strong>FAX: </strong>{$form.organizer_fax}<br />
									<strong>Email: </strong>{$form.organizer_email}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">The representative office, person or agency in Japan</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<strong>Name of representative office or agency in Japan: </strong>{$form.agency_in_japan_en}<br />
									<strong>Address of the office or agency: </strong>{$form.agency_in_japan_addr}<br />
									<strong>Department in charge: </strong>{$form.agency_in_japan_div}<br />
									<strong>Person in charge: </strong>{$form.agency_in_japan_pers}<br />
									<strong>TEL: </strong>{$form.agency_in_japan_tel}<br />
									<strong>FAX: </strong>{$form.agency_in_japan_fax}<br />
									<strong>Email: </strong>{$form.agency_in_japan_email}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_paragraph">
					<p class="text">
						<font color="red">
							{if ('' == $form.mode)}
								Do you wish to register the trade fair information as follows?
							{elseif ('e' == $form.mode)}
								Do you wish to register the trade fair information as follows?
							{elseif ('c' == $form.mode)}
								Do you wish to edit the trade fair information as follows?
							{elseif ('d' == $form.mode)}
								{if ('0' != $app.fair_start_past_flag)}
									<p><font color="red">To update the registered information of your trade fair in line with the upcoming event, use the "Copying registered information" page.</font></p>
								{/if}
							{else}
							{/if}
						</font>
					</p>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
							{if ('' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairRegistStep2=true&back=1" class="var_small"><span class="left">Back</span></a>
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
														<a href="" onclick="document.form_user_enFairDetail.submit();return false;" class="var_small"><span>Yes</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('e' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairRegistStep2=true&mode=e&mihon_no={$form.mihon_no}&back=1"><span class="left">Back</span></a>
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
														<a href="" onclick="document.form_user_enFairDetail.submit();return false;" class="var_small"><span>Yes</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('c' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairRegistStep2=true&mode=c&mihon_no={$form.mihon_no}&back=1" class="var_small"><span class="left">Back</span></a>
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
														<a href="" onclick="document.form_user_enFairDetail.submit();return false;" class="var_small"><span>Yes</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('d' == $form.mode)}
								{if ('0' == $app.fair_start_past_flag)}
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_enFairList=true" class="var_small"><span class="left">Back</span></a>
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
															<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}', '{$form.mode}')" class="var_small"><span>Delete</span></a>
														</div>
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
															<a href="{$config.url}?action_user_enFairRegistStep1=true&mode=c&mihon_no={$form.mihon_no}" class="var_small"><span>Edit</span></a>
														</div>
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
														<a href="{$config.url}?action_user_enFairList=true" class="var_small"><span class="left">Back</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul>
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_enFairCopyList=true" class="var_small"><span>EditRegist</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
								{/if}
							{elseif ('p' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_enFairCopyList=true" class="var_small"><span class="left">back</span></a>
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
														<a href="{$config.url}?action_user_enFairRegistStep1=true&mode=e&mihon_no={$form.mihon_no}" class="var_small"><span>EditRegist</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{else}
							{/if}
						</div>
					</div>
				</p>
				{* テキストエリアの改行コード *}
				<textarea name="br" id="br" style="display:none;"></textarea>
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

