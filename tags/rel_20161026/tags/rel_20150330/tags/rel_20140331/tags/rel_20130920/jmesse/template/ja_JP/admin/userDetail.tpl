<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザ管理</title>
</head>
<body>
<form name="form_admin_userDetail" id="form_admin_userDetail" method="POST" action=""  enctype="multipart/form-data">
<input type="hidden" name="action_admin_userChange" id="action_admin_userChange" value="dummy">
<!-- ユーザID -->
<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
<!-- 登録モード -->
<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
	<table style="width:100%;">
		<tr>
			<td valign="top" style="width:200px;">{include file="admin/menu.tpl"}</td>
			<td>
				<div style="text-align:center">
					<font size=5><b>ユーザ管理</b></font>
				</div>
				<hr>
				<div align="center">ユーザ詳細</div>
				<div align="center">
					<table>
						<tr>
							<td>
								<div align="left">
									{if $app.from_page_flg == '1'}
										<input type="button" value="展示会詳細に戻る" onclick="history.back()"><br>
									{else}
										<input type="button" value="ユーザ一覧に戻る" onclick="history.back()"><br>
									{/if}
								</div>
							</td>
						</tr>
						<tr style="word-break: break-all;">
							<td>
								<table border=1 style="width:100%; font-size:15px;table-layout:fixed">
									<tr>
										<th nowrap style="text-align:left">Eメール</th>
										<td width="500" style="text-align:left">{$form.email}</td>
									</tr>
									<tr>
										<th nowrap style="text-align:left">パスワード</th>
										<td width="500" style="text-align:left">{$form.password}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>会社名</th>
										<td width="500" style="text-align:left">{$form.companyNm}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>部署名</th>
										<td width="500" style="text-align:left">{$form.divisionDeptNm}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>氏名</th>
										<td width="500" style="text-align:left">{$form.userNm}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>性別</th>
										<td width="500" style="text-align:left">
											{if $form.genderCd == "0"}男性{/if}
											{if $form.genderCd == "1"}女性{/if}
											{if $form.genderCd == "2"}不明{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>郵便番号</th>
										<td width="500" style="text-align:left">{$form.postCode}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>住所</th>
										<td width="500" style="text-align:left">{$form.address}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>TEL</th>
										<td width="500" style="text-align:left">{$form.tel}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>FAX</th>
										<td width="500" style="text-align:left">{$form.fax}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>URL</th>
										<td width="500" style="text-align:left">{$form.url}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>ユーザ使用言語</th>
										<td width="500" style="text-align:left">
											{if $form.useLanguageCd == "0"}日本語{/if}
											{if $form.useLanguageCd == "1"}英語{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>登録結果通知</th>
										<td width="500" style="text-align:left">
											{if $form.registResultNoticeCd == "0"}メール送信する{/if}
											{if $form.registResultNoticeCd == "1"}メール送信しない{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>一般権限</th>
										<td width="500" style="text-align:left">
											{if $form.authGen == "0"}権限なし{/if}
											{if $form.authGen == "1"}権限あり{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>ユーザ管理権限</th>
										<td width="500" style="text-align:left">
											{if $form.authUser == "0"}権限なし{/if}
											{if $form.authUser == "1"}権限あり{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>展示会管理権限</th>
										<td width="500" style="text-align:left">
											{if $form.authFair == "0"}権限なし{/if}
											{if $form.authFair == "1"}権限あり{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>ID・パスワード通知メール</th>
										<td width="500" style="text-align:left">
											{if $form.idpassNoticeCd == "0"}日本語で送信{/if}
											{if $form.idpassNoticeCd == "1"}英語で送信{/if}
											{if $form.idpassNoticeCd == "2"}変更しない{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>削除フラグ</th>
										<td width="500" style="text-align:left">
											{if $form.delFlg == "0"}未削除{/if}
											{if $form.delFlg == "1"}削除済{/if}
										</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>登録</th>
										<td width="500" style="text-align:left">{$form.registDate}</td>
									</tr>
									<tr>
										<th nowrap style=text-align:left>更新</th>
										<td width="500" style="text-align:left">{$form.updateDate}</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<br><input type="submit" value="編集開始" />
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>

