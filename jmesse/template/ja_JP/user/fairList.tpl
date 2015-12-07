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
			window.alert('選択して下さい。');
			return;
		}

		if (!window.confirm('選択したデータを削除します。\nよろしいですか？')) {
			return;
		}
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_user_fairListDel';
		action.id = 'action_user_fairListDel';
		action.value = 'dummy';
		document.getElementById('form_user_fairList').appendChild(action);
		document.getElementById('form_user_fairList').submit();
	}
{/literal}
-->
</script>
<title>登録済み見本市一覧 - 世界の見本市・展示会 -ジェトロ</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">世界の見本市・展示会情報（J-messe）</a></li>
					<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
					<li>登録済み見本市一覧</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>登録済み見本市一覧</h1>
			</div>

			<div class="elem_paragraph">
				<p class="text right">ユーザー：{$session.email}</p>
			</div>

			<div class="elem_paragraph">
				<p class="text">
					詳細を確認したい場合は、見本市名リンクをクリックしてください。<br />
					これから開催される見本市情報のみ修正・削除ができます。<br />
					<font color="red">登録済みの見本市情報を次回開催の情報へ更新したい場合は「<a href="{$config.url}?action_user_fairCopyList=true">編集登録</a>」ページからお願いいたします。</font>
				</p>
			</div>
			<form name="form_user_fairList" id="form_user_fairList" method="post" action="">
				<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
				<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
				総件数：{$app.my_fair_info_list_count}件
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
										見本市名(日)</th>
									<td><a href="{$config.url}?action_user_fairDetail=true&mode=d&mihon_no={$app.my_fair_info_list[it].mihon_no}">{$app.my_fair_info_list[it].fair_title_jp}</a></td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">会期</th>
									<td>{$app.my_fair_info_list[it].date_from_yyyy}年{$app.my_fair_info_list[it].date_from_mm}月{$app.my_fair_info_list[it].date_from_dd}日～{$app.my_fair_info_list[it].date_to_yyyy}年{$app.my_fair_info_list[it].date_to_mm}月{$app.my_fair_info_list[it].date_to_dd}日</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">開催地</th>
									<td>{$app.my_fair_info_list[it].region_name}&nbsp;/&nbsp;{$app.my_fair_info_list[it].country_name}&nbsp;/&nbsp;{if $app.my_fair_info_list[it].city_name == ""}その他({$app.my_fair_info_list[it].other_city_jp}){else}{$app.my_fair_info_list[it].city_name}{/if}</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">業種</th>
									<td>
										{$app.my_fair_info_list[it].main_indust_name1}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name1}
										{if $app.my_fair_info_list[it].main_indust_name2 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name2}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name2}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name3 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name3}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name3}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name4 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name4}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name4}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name5 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name5}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name5}
										{/if}
										{if $app.my_fair_info_list[it].main_indust_name6 != ""}
											&nbsp;,&nbsp;{$app.my_fair_info_list[it].main_indust_name6}&nbsp;/&nbsp;{$app.my_fair_info_list[it].sub_indust_name6}
										{/if}
									</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">出品物</th>
									<td>{$app.my_fair_info_list[it].exhibits_jp|replace:'&lt;br/&gt;':'<br/>'}</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">承認ステータス</th>
									<td>
										{if $app.my_fair_info_list[it].confirm_flag == "0"}承認待ち{/if}
										{if $app.my_fair_info_list[it].confirm_flag == "1"}承認済み{/if}
										{if $app.my_fair_info_list[it].confirm_flag == "2"}否認{/if}
									</td>
								</tr>
								<tr>
									<th class="bg_gray_lv2">更新日</th>
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
							<td><input type="button" value="削除" onclick="del()" /></td>
						</tr>
					</table>
				{/if}
			</form>
			<!-- ** include START jetro_ssl_ja **  -->
			{include file="user/jetro_ssl_ja.tpl"}
			<!-- ** include END jetro_ssl_ja **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>

