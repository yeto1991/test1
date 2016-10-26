<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form name="form_errMail" id="form_errMail" method="post" action="">
		<input type="hidden" name="action_admin_errMailDownload" id="action_admin_errMailDownload" value="dummy" />
		<table style="width: 100%;">
			<tr>
				<td valign="top" style="width: 200px;">{include file="admin/menu.tpl"}</td>
				<td valign="top">
					<table>
						<tr>
							<td>
								<h3>検索条件</h3>
								{* エラー表示 *}
								{if count($errors)}
								<ul>
									{foreach from=$errors item=error}
									<li><font color="#ff0000">{$error}</font></li>
									{/foreach}
								</ul>
								{/if}

								<table border="1">
									<tr>
										<th>期間</th>
										<td>
											<input type="text" name="date_from_yyyy" id="date_from_yyyy" value="" size="4" maxlength="4" />年
											<input type="text" name="date_from_mm" id="date_from_mm" value="" size="2" maxlength="2" />月
											<input type="text" name="date_from_dd" id="date_from_dd" value="" size="2" maxlength="2" />日
											～
											<input type="text" name="date_to_yyyy" id="date_to_yyyy" value="" size="4" maxlength="4" />年
											<input type="text" name="date_to_mm" id="date_to_mm" value="" size="2" maxlength="2" />月
											<input type="text" name="date_to_dd" id="date_to_dd" value="" size="2" maxlength="2" />日
										</td>
									</tr>
									<tr>
										<th>メールアドレス</th>
										<td><input type="text" name="email" id="email" value="" size="70" maxlength="255" /></td>
									</tr>
									<tr>
										<th>エラー種別</th>
										<td>
											<input type="checkbox" name="address" id="address" value="0" checked />アドレス不正
											<input type="checkbox" name="server" id="server" value="1" checked />メールサーバ不正
											<input type="checkbox" name="other" id="other" value="2" />その他
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right">
								<input type="submit" value="　CSV出力　" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
