<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<script type="text/javascript">
<!--
{literal}
	function del() {
		// 選択チェック
		var check_mihon_no = document.getElementsByName('check_mihon_no[]');
		var i = 0;
		var cnt = 0;
		for (i = 0; i < check_mihon_no.length; i++) {
			if (check_mihon_no[i].checked) {
				cnt++;
			}
		}
		if (0 == cnt) {
			window.alert('Please select.');
			return;
		}

		if (!window.confirm('Do you delete the selected fairs？')) {
			return;
		}
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_user_enFairListDel';
		action.id = 'action_user_enFairListDel';
		action.value = 'dummy';
		document.getElementById('form_user_enFairList').appendChild(action);
		document.getElementById('form_user_enFairList').submit();
	}
{/literal}
-->
</script>
<title>Trade Fair List - Online Trade Fair Database (J-messe) - JETRO</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/en/"><img alt="home" src="/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
					<li>Trade Fair List</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>Trade Fair List</h1>
			</div>

			<div class="elem_paragraph">
				<p class="text right">user：{$session.email}</p>
			</div>

			<div class="elem_paragraph">
				<p class="text">
					If you need to confirm/edit details of your registered fairs, click on the fair title.<br />
					You can modify or delete the information of future trade fairs only.<br />
					<font color="red">To update the registered information of your trade fair in line with the upcoming event, use the "<a href="{$config.url}?action_user_enFairCopyList=true">Copying registered information</a>" page.</font>
				</p>
			</div>
			<form name="form_user_enFairList" id="form_user_enFairList" method="post" action="">
				<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
				<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
				Results：{$app.my_fair_info_list_count}
				{section name=it loop=$app.my_fair_info_list}
					<div class="elem_table_basic">
						<table class="var_there_boder var_base_color elem_table_basic">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th class="bg_gray_lv2">
										{if ('1' == $app.my_fair_info_list[it].fair_start_past_flag)}
											<input type="checkbox" name="check_mihon_no[]" id="check_mihon_no[]" value="{$app.my_fair_info_list[it].mihon_no}">
										{/if}
										Fair title(English)</th>
									<td><a href="{$config.url}?action_user_enFairDetail=true&mode=d&mihon_no={$app.my_fair_info_list[it].mihon_no}">{$app.my_fair_info_list[it].fair_title_en}</a></td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">Period</th>
									<td>{$app.my_fair_info_list[it].date_from_format} to {$app.my_fair_info_list[it].date_to_format}</td></tr>
								<tr>
									<th class="bg_gray_lv2">Location/Venue</th>
									<td>{if $app.my_fair_info_list[it].city_name_en == ""}Other({$app.my_fair_info_list[it].other_city_en}){else}{$app.my_fair_info_list[it].city_name_en}{/if} / {$app.my_fair_info_list[it].country_name_en} / {$app.my_fair_info_list[it].region_name_en}</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">Main industries <br />covered</th>
									<td>
										{$app.my_fair_info_list[it].main_indust_name1_en}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name1_en}
										{if $app.my_fair_info_list[it].main_indust_name2_en != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name2_en}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name2_en}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name3 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name3_en}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name3_en}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name4 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name4_en}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name4_en}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name5 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name5_en}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name5_en}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name6 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name6_en}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name6_en}
										{/if}
									</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">Products covered</th>
									<td>{$app.my_fair_info_list[it].exhibits_en|replace:'&lt;br/&gt;':'<br/>'}</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">Approval status <br />(by JETRO)</th>
									<td>
										{if $app.my_fair_info_list[it].confirm_flag == "0"}Awaiting approval{/if}
										{if $app.my_fair_info_list[it].confirm_flag == "1"}Approved{/if}
										{if $app.my_fair_info_list[it].confirm_flag == "2"}Rejected{/if}
									</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">Date of last update</th>
									<td>
										{if $app.my_fair_info_list[it].update_date == ""}
											{$app.my_fair_info_list[it].regist_date}
										{else}
											{$app.my_fair_info_list[it].update_date}
										{/if}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				{/section}
				{if $app.my_fair_info_list_count != "0"}
					<table width="100%">
						<tr>
							<td><input type="button" value="Delete" onclick="del()" /></td>
						</tr>
					</table>
				{/if}
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
