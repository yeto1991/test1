<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
{literal}
	function search(url) {
		document.location.href = url + '?action_admin_fairSearch=true'
	}
	function download() {
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_admin_fairCheckListCsvDownload';
		action.id = 'action_admin_fairCheckListCsvDownload';
		action.value = 'dummy';
		document.getElementById('form_fairCheckList').appendChild(action);
		document.getElementById('form_fairCheckList').submit();
	}
	function openfairdetail(url, mihon_no, type) {
		window.open(url + '?action_admin_fairDetail=true&mode=fairchecklist&mihon_no=' + mihon_no + '&type=' + type);
	}
	function openfairurl(url) {
		window.open(url);
	}
	function openuserdetail(url, user_id) {
		window.open(url + '?action_admin_userDetail=true&mode=fairchecklist&user_id=' + user_id);
	}
{/literal}
</script>
<title>見本市ＤＢ 管理者用</title>
</head>
<body>
	<form name="form_fairCheckList" id="form_fairCheckList" method="POST" action="">
		<input type="hidden" name="type" id="type" value="{$app.type}" />
		<table>
			<tr>
				<td valign="top">
					<div align="center">
						<font size="5"><b>見本市ＤＢ 管理者用</b></font>
					</div>
					<hr />

					{* エラー表示 *}
					{if count($errors)}
					<ul>
						{foreach from=$errors item=error}
						<li><font color="#ff0000">{$error}</font></li>
						{/foreach}
					</ul>
					{/if}
					<div align="center">見本市登録チェックリスト画面</div>
					<input type="button" value="検索画面へ戻る" onclick="search('{$config.url}')" />
					<input type="button" value="ダウンロード" onclick="download()" /><br/>
					<hr />
					※<注意>「No.」または「Eメール(ID)」のリンククリックにより、遷移した別ウィンドウ画面上で作業完了した後は、別ウィンドウ自体を閉じてください。
					<hr />
					総件数：{$app.total}
					<table border="1">
						<tr>
							<th nowrap>No.</th>
							<th nowrap>見本市名</th>
							<th nowrap>見本市略称</th>
							<th nowrap>見本市URL</th>
							<th nowrap>会期開始日</th>
							<th nowrap>会期終了日</th>
							<th nowrap>開催地</th>
							<th nowrap>会場名</th>
							<th nowrap>Eメール（ID）</th>
							<th nowrap>主催者名</th>
							<th nowrap>主催者TEL</th>
							<th nowrap>主催者FAX</th>
							<th nowrap>主催者Eメール</th>
							<th nowrap>日本国内の連絡先名称(日)</th>
							<th nowrap>システム管理者備考欄</th>
							<th nowrap>申請年月日</th>
							<th nowrap>登録日</th>
							<th nowrap>否認コメント</th>
						</tr>

						{section name=it loop=$app.jm_fair_check_list}
						<tr>
							<td nowrap><a href="javascript:openfairdetail('{$config.url}', '{$app.jm_fair_check_list[it].mihon_no}', '{$form.type}');">{$app.jm_fair_check_list[it].mihon_no}</a></td>
							{if ('' != $app.jm_fair_check_list[it].fair_title_jp)}
								<td nowrap>{$app.jm_fair_check_list[it].fair_title_jp}</td>
							{else}
								<td nowrap>{$app.jm_fair_check_list[it].fair_title_en}</td>
							{/if}
							<td nowrap>{$app.jm_fair_check_list[it].abbrev_title}</td>
							<td nowrap><a href="javascript:openfairurl('{$app.jm_fair_check_list[it].fair_url}');">{$app.jm_fair_check_list[it].fair_url}</a></td>
							<td nowrap>{$app.jm_fair_check_list[it].date_from_yyyy}/{$app.jm_fair_check_list[it].date_from_mm}/{$app.jm_fair_check_list[it].date_from_dd}</td>
							<td nowrap>{$app.jm_fair_check_list[it].date_to_yyyy}/{$app.jm_fair_check_list[it].date_to_mm}/{$app.jm_fair_check_list[it].date_to_dd}</td>
							<td nowrap>
								{$app.jm_fair_check_list[it].region_name}<br/>
								{$app.jm_fair_check_list[it].country_name}<br/>
								{$app.jm_fair_check_list[it].city_name}<br/>
								{if ('' != $app.jm_fair_check_list[it].other_city_jp)}
									{$app.jm_fair_check_list[it].other_city_jp}</td>
								{else}
									{$app.jm_fair_check_list[it].other_city_en}</td>
								{/if}
							{if ('' != $app.jm_fair_check_list[it].venue_jp)}
								<td nowrap>{$app.jm_fair_check_list[it].venue_jp}</td>
							{else}
								<td nowrap>{$app.jm_fair_check_list[it].venue_en}</td>
							{/if}
							<td nowrap><a href="javascript:openuserdetail('{$config.url}', '{$app.jm_fair_check_list[it].user_id}');">{$app.jm_fair_check_list[it].email}</a></td>
							{if ('' != $app.jm_fair_check_list[it].organizer_jp)}
								<td nowrap>{$app.jm_fair_check_list[it].organizer_jp}</td>
							{else}
								<td nowrap>{$app.jm_fair_check_list[it].organizer_en}</td>
							{/if}
							<td nowrap>{$app.jm_fair_check_list[it].organizer_tel}</td>
							<td nowrap>{$app.jm_fair_check_list[it].organizer_fax}</td>
							<td nowrap>{$app.jm_fair_check_list[it].organizer_email}</td>
							<td nowrap>{$app.jm_fair_check_list[it].agency_in_japan_jp}</td>
							<td nowrap>{$app.jm_fair_check_list[it].note_for_system_manager}</td>
							<td nowrap>{$app.jm_fair_check_list[it].date_of_application}</td>
							<td nowrap>{$app.jm_fair_check_list[it].date_of_registration}</td>
							<td nowrap>{$app.jm_fair_check_list[it].negate_comment}</td>
						</tr>
						{/section}
					</table>
					<hr />
					<input type="button" value="検索画面へ戻る" onclick="search('{$config.url}')" />
					<input type="button" value="ダウンロード" onclick="download()" /><br/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
