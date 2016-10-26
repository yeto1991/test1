<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザ管理</title>
</head>
<body>
	<table style="width:100%;">
		<tr>
			<td valign="top" style="width:200px;">{include file="admin/menu.tpl"}</td>
			<td>
				<center>
					<font size=5><b>ユーザ管理</b></font>
				</center>
				<hr>
				<div align="center">ユーザ検索<br><br></div>
				<center>
					<table border=0>
						<tr>
							<td>
							<form name="form_admin_userSearch" id="form_admin_userSearch" method="POST" action="">
							<input type="hidden" name="action_admin_userList" id="action_admin_userList" value="dummy" />
								<div align="left">
									同じ項目に複数のキーワードを入力し検索する場合は、<br>半角スペースで区切るとAND検索ができます。<br>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<table border=1>
									<tr>
										<td nowrap style=text-align:left>Eメール</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchEmail" id="searchEmail" value="" size=50></input>
											<select name="searchConditionEmail" id="searchConditionEmail">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>パスワード</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchPassword" id="searchPassword" value="" size=50></input>
											<select name="searchConditionPassword" id="searchConditionPassword">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>会社名</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchCompanyNm" id="searchCompanyNm" value="" size=50></input>
											<select name="searchConditionCompanyNm" id="searchConditionCompanyNm">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>部署名</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchDivisionDeptNm" id="searchDivisionDeptNm" value="" size=50></input>
											<select name="searchConditionDivisionDeptNm" id="searchConditionDivisionDeptNm">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>氏名</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchUserNm" id="searchUserNm" value="" size=50></input>
											<select name="searchConditionUserNm" id="searchConditionUserNm">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>性別</td>
										<td nowrap style=text-align:left>
											<input type="checkbox" name="searchGenderCd0" id="searchGenderCd0" value="1">男性
											<input type="checkbox" name="searchGenderCd1" id="searchGenderCd1" value="1">女性
											<input type="checkbox" name="searchGenderCd2" id="searchGenderCd2" value="1">不明
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>郵便番号</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchPostCode" id="searchPostCode" value="" size=50></input>
											<select name="searchConditionPostCode" id="searchConditionPostCode">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>住所</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchAddress" id="searchAddress" value="" size=50></input>
											<select name="searchConditionAddress" id="searchConditionAddress">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>TEL</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchTel" id="searchTel" value="" size=50></input>
											<select name="searchConditionTel" id="searchConditionTel">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>FAX</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchFax" id="searchFax" value="" size=50></input>
											<select name="searchConditionFax" id="searchConditionFax">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>URL</td>
										<td nowrap style=text-align:left>
											<input type="text" name="searchUrl" id="searchUrl" value="" size=50></input>
											<select name="searchConditionUrl" id="searchConditionUrl">
												<option value="1">一致</option>
												<option value="2">不一致</option>
												<option value="3">前一致</option>
												<option value="4">前不一</option>
												<option selected value="5">含む</option>
												<option value="6">含まず</option>
											</select>
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>ユーザ使用言語</td>
										<td nowrap style=text-align:left>
											<input type="checkbox" name="searchUseLanguageCd0" id="searchUseLanguageCd0" value="1">日本語
											<input type="checkbox" name="searchUseLanguageCd1" id="searchUseLanguageCd1" value="1">英語
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>一般権限</td>
										<td nowrap style=text-align:left>
											<input type="checkbox" name="searchAuthGen1" id="searchAuthGen1" value="1">有
											<input type="checkbox" name="searchAuthGen0" id="searchAuthGen0" value="1">無
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>ユーザ管理権限</td>
										<td nowrap style=text-align:left>
											<input type="checkbox" name="searchAuthUser1" id="searchAuthUser1" value="1">有
											<input type="checkbox" name="searchAuthUser0" id="searchAuthUser0" value="1">無
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>展示会管理権限</td>
										<td nowrap style=text-align:left>
											<input type="checkbox" name="searchAuthFair1" id="searchAuthFair1" value="1">有
											<input type="checkbox" name="searchAuthFair0" id="searchAuthFair0" value="1">無
										</td>
									</tr>
									<tr>
										<td nowrap style=text-align:left>削除フラグ</td>
										<td nowrap style=text-align:left>
											<input type="checkbox" name="searchdelflg0" id="searchdelflg0" value="1">未削除
											<input type="checkbox" name="searchdelflg1" id="searchdelflg1" value="1">削除済
										</td>
									</tr>
								  </table>
							</td>
						</tr>
						<tr>
							<td>
								<div align="left"><br><input type="submit" value="検索"></div>
							</td>
						<tr>
					</table>
					</form>
		  		</center>
			</td>
		</tr>
	</table>
</body>
</html>
