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
</head>

<body class="layout-LC highlight-database j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<ul class="clearfix">
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
			<li>Trade Fair List</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2"><h2>Trade Fair List</h2></div>
			<div class="in_main">
				<p class="t_right">user：{$session.email}</p>
				{if $app.my_fair_info_list_count != "0"}
				<p>If you need to confirm/edit details of your registered fairs, click on the fair title.<br />
				If you need to delete a registered fair, check the box in front of “Fair title”, then click “Delete” at the bottom of this page.<br /></p>
				{/if}
				<form name="form_user_enFairList" id="form_user_enFairList" method="post" action="">
					<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
					<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
					{if $app.my_fair_info_list_count == "0"}
					<font size=2>Your fairs isn't exist.</font><br />
					{else}
					<font size=2>Results：{$app.my_fair_info_list_count}</font><br />
					{/if}
					<!-- 検索結果分 繰り返し処理 -->
					{section name=it loop=$app.my_fair_info_list}
					<table id="registration" style="word-break: break-all;">
						<tr>
							<th class="item"><input type="checkbox" name="check_mihon_no[]" id="check_mihon_no[]" value="{$app.my_fair_info_list[it].mihon_no}" /><font size="2">&nbsp;&nbsp;Fair title (English)</font></th>
							<td><a href="{$config.url}?action_user_enFairDetail=true&mode=d&mihon_no={$app.my_fair_info_list[it].mihon_no}"><font size="2">{$app.my_fair_info_list[it].fair_title_en}</font></a></td>
						</tr>
						<tr>
							<th class="item"><font size="2">Period</font></th>
							<td><font size="2">{$app.my_fair_info_list[it].date_from_format} to {$app.my_fair_info_list[it].date_to_format}</font></td>
						</tr>
						<tr>
							<th class="item"><font size="2">Location/Venue</font></th>
							<td><font size="2">{if $app.my_fair_info_list[it].city_name_en == ""}Other({$app.my_fair_info_list[it].other_city_en}){else}{$app.my_fair_info_list[it].city_name_en}{/if} / {$app.my_fair_info_list[it].country_name_en} / {$app.my_fair_info_list[it].region_name_en}</font></td>
						</tr>
						<tr>
							<th class="item"><font size="2">Main industries covered</font></th>
							<td><font size="2">
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
								</font>
							</td>
						</tr>
						<tr>
							<th class="item"><font size="2">Products covered</font></th>
							<td><font size="2">{$app.my_fair_info_list[it].exhibits_en|replace:'&lt;br/&gt;':'<br/>'}</font></td>
						</tr>
						<tr>
							<th class="item"><font size="2">Approval status (by JETRO)</font></th>
							<td>
								<font size="2">
								{if $app.my_fair_info_list[it].confirm_flag == "0"}Awaiting approval{/if}
								{if $app.my_fair_info_list[it].confirm_flag == "1"}Approved{/if}
								{if $app.my_fair_info_list[it].confirm_flag == "2"}Rejected{/if}
								</font>
							</td>
						</tr>
						<tr>
							<th class="item"><font size="2">Date of last update</font></th>
							<td>
								{if $app.my_fair_info_list[it].update_date == ""}
									<font size="2">{$app.my_fair_info_list[it].regist_date}</font>
{*
									<font size="2">{$app.my_fair_info_list[it].regist_date|date_format:"%e-%b-%Y"}</font>
*}
								{else}
									<font size="2">{$app.my_fair_info_list[it].update_date}</font>
{*
									<font size="2">{$app.my_fair_info_list[it].update_date|date_format:"%e-%b-%Y"}</font>
*}
								{/if}
							</td>
						</tr>
					</table>
					{/section}
					<!-- navi area-->
					{if $app.my_fair_info_list_count != "0"}
					<table width="100%">
						<tr>
							<td><input type="button" value="Delete" onclick="del()" /></td>
						</tr>
					</table>
					{/if}
				</form>
				<div class="line_dot"><hr /></div>
				<!-- /navi area-->
			</div>
			<p class="totop">
				<a href="javascript:window.open('{$config.url}?action_user_enFairList=true&print=1', 'print')" target="print"><img src="/images/en/btn-print.gif" alt="Print" height="14" width="46" /></a>
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