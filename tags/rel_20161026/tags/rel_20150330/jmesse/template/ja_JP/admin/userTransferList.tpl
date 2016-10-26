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

	$(document).ready(function() {
		//「全選択」リンク押下時
		$('#all_select').click(function(e) {
			$('.target').each(function() {
				$(this).attr("checked", "checked");
			});
		});
		// 「全選択解除」リンク押下時
		$('#all_deselect').click(function(e) {
			$('.target').each(function() {
				$(this).removeAttr('checked');
			});
		});
	});


	function transfer() {
		// 選択チェック
		var check_user_id = document.getElementsByName('check_user_id[]');
		var i = 0;
		var cnt = 0;
		for (i = 0; i < check_user_id.length; i++) {
			if (check_user_id[i].checked) {
				cnt++;
			}
		}
		if (0 == cnt) {
			window.alert('選択して下さい。');
			return;
		}
		if (!window.confirm('選択したユーザの保有する全見本市情報を移譲しますか？\n（一括更新されますので、選択ミスをしないようご注意ください。）')) {
			return;
		}
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_admin_userTransferAct';
		action.id = 'action_admin_userTransferAct';
		action.value = 'dummy';
		document.getElementById('form_userTransferList').appendChild(action);
		document.getElementById('form_userTransferList').submit();
	}

{/literal}
-->
</script>
<title>見本市ＤＢ 管理者用</title>
</head>
<body>
	<form name="form_userTransferList" id="form_userTransferList" method="POST" action="">
		<input type="hidden" name="type" id="type" value="{$app.type}" />
		<table style="width: 100%;">
			<tr>
				<td valign="top" style="width: 200px;">{include file="admin/menu.tpl"}</td>
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
					<div align="center">
						見本市未移譲ユーザ一覧画面<br />
						<font size="2" color="red">【注意】複数名、複数ブラウザ、複数タブ画面での同時使用（実行）はお控えください。</font>
					</div>
					<div>
						<font size="5"><b>移譲先ユーザ情報</b></font>
					</div>
					<table border="1">
						<tr>
							<th nowrap>ユーザID</th>
							<th nowrap>氏名</th>
							<th nowrap>Eメール</th>
						</tr>
						{section name=it loop=$app.jm_user_transfer_info}
							<tr>
								<td align="center">{$app.jm_user_transfer_info[it].user_id}</td>
								<td>{$app.jm_user_transfer_info[it].user_nm}</td>
								<td>{$app.jm_user_transfer_info[it].email}</td>
							</tr>
						{/section}
					</table>
					<br />
					<a href="javascript:void(0)" id="all_select">全選択</a>&nbsp;&nbsp;
					<a href="javascript:void(0)" id="all_deselect">全選択解除</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="移譲実行" onclick="transfer()" /><br />
					<hr />
					<table border="1">
						<tr>
							<th nowrap>選択</th>
							<th nowrap>ユーザID</th>
							<th nowrap>氏名</th>
							<th nowrap>Eメール</th>
							<th nowrap>保有見本市件数</th>
						</tr>
						{section name=it loop=$app.jm_user_transfer_list}
							<tr>
								<td><input type="checkbox" name="check_user_id[]" id="check_user_id[]" class="target" value="{$app.jm_user_transfer_list[it].user_id}"></td>
								<td align="center">{$app.jm_user_transfer_list[it].user_id}</td>
								<td>{$app.jm_user_transfer_list[it].user_nm}</td>
								<td>{$app.jm_user_transfer_list[it].email}</td>
								<td align="center">{$app.jm_user_transfer_list[it].fair_cnt}</td>
							</tr>
						{/section}
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
