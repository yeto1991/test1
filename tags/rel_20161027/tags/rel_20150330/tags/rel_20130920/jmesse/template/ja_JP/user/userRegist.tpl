<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />
{include file="user/header.tpl"}
{if ("regist" == $form.mode)}
<title>ユーザー登録 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
{else}
<title>ユーザー修正 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
{/if}
</head>


<body class="layout-LC highlight-match j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			{if ("regist" == $form.mode)}
				<li>ユーザー登録</li>
			{else}
				<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
				<li>ユーザー修正</li>
			{/if}
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<div class="area">
			<!-- left -->
			{$app_ne.left_menu}
			<!-- /left -->
			<!-- center -->
			<div id="center">
				<div id="main">
					<div class="bgbox_set">
						<div class="bgbox_base">
							<div class="h1"><h1>見本市・展示会データベース</h1></div>
							<div class="h2">
								{if ("regist" == $form.mode)}
								<h2>ユーザー登録</h2>
								{else}
								<h2>ユーザー修正</h2>
								{/if}
							</div>
							<div class="in_main">
								<h3 class="img t_center"><img src="/j-messe/images/db/user02.jpg" alt="ユーザー情報入力" /></h3>
								<form name="form_user_userRegist" id="form_user_userRegist" method="post" action="">
									{if ("regist" == $form.mode)}
									<input type="hidden" name="action_user_userRegistDo" id="action_user_userRegistDo" value="dummy" />
									{else}
									<input type="hidden" name="action_user_userChangeDo" id="action_user_userChangeDo" value="dummy" />
									{/if}
									<!-- ユーザID -->
									<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
									<!-- 登録モード -->
									<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
									{* エラー表示 *}
									{if count($errors)}
									<p class="error-message" id="error-pagetop">入力に誤りがあります。再度、入力ください。</p>
									{/if}
									<h4>Eメールとパスワード</h4>
									<p class="nomargin">J-messe見本市登録をご利用いただくためのEメールとパスワードを設定してください。<br />
									（※入力されたEメールは小文字に変換されて登録されます。）</p>
									<table id="registration">
										{if is_error('email')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">Eメール </th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td><input type="text" value="{$form.email}" size="50" name="email" id="email" /><br />
											{if is_error('email')}
											<span class="error-message">{message name="email"}</span><br />
											{/if}
											</td>
										</tr>
										{if is_error('email2')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">Eメール（確認）</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td><input type="text" value="{$form.email2}" size="50" name="email2" id="email2" /><br />
											{if is_error('email2')}
											<span class="error-message">{message name="email2"}</span><br />
											{/if}
											<strong>確認のためもう一度Eメールを入力してください。</strong></td>
										</tr>
										{if is_error('password')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">パスワード</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td><input type="password" value="{$form.password}" size="20" name="password" id="password" autocomplete="off" /><br />
											{if is_error('password')}
											<span class="error-message">{message name="password"}</span><br />
											{/if}
											<strong>半角英数字4文字以上、8文字以内で入力して下さい。</strong></td>
										</tr>
										{if is_error('password2')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">パスワード（確認）</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td><input type="password" value="{$form.password2}" size="20" name="password2" id="password2" autocomplete="off" /><br />
											{if is_error('password2')}
											<span class="error-message">{message name="password2"}</span><br />
											{/if}
											<strong>確認のためもう一度パスワードを入力してください。</strong></td>
										</tr>
									</table><br />
									<h4>お客様情報入力</h4>
									<table id="registration">
										{if is_error('companyNm')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">会社名</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td><input type="text" value="{$form.companyNm}" size="60" name="companyNm" id="companyNm" /><br />
											{if is_error('companyNm')}
											<span class="error-message">{message name="companyNm"}</span><br />
											{/if}
											</td>
										</tr>
										{if is_error('divisionDeptNm')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">部署名</th>
											<th class="required"></th>
											<td><input type="text" value="{$form.divisionDeptNm}" size="60" name="divisionDeptNm" id="divisionDeptNm" /><br />
											{if is_error('divisionDeptNm')}
											<span class="error-message">{message name="divisionDeptNm"}</span><br />
											{/if}
											</td>
										</tr>
										{if is_error('userNm')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">お名前</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td><input type="text" value="{$form.userNm}" size="60" name="userNm" id="userNm" /><br />
											{if is_error('userNm')}
											<span class="error-message">{message name="userNm"}</span><br />
											{/if}
											</td>
										</tr>
										{if is_error('genderCd')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">性別</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
											<input type="radio" size="60" name="genderCd" id="genderCd" value="0" {if $form.genderCd == "0" } checked {/if} />男性
											<input type="radio" size="60" name="genderCd" id="genderCd" value="1" {if $form.genderCd == "1"} checked {/if} />女性<br />
											{if is_error('genderCd')}
											<span class="error-message">{message name="genderCd"}</span><br />
											{/if}
											</td>
										</tr>
										{if is_error('postCode')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">郵便番号</th>
											<th class="required"></th>
											<td>
											<input type="text" maxlength="20" value="{$form.postCode}" size="10" name="postCode" id="postCode" />（半角英数字)<br />
											{if is_error('postCode')}
											<span class="error-message">{message name="postCode"}</span><br />
											{/if}
											郵便番号はハイフン区切りで入力してください。例：123-4567
											</td>
										</tr>
										{if is_error('address')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">住所</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td><input type="text" value="{$form.address}" size="80" name="address" id="address" /><br />
											{if is_error('address')}
											<span class="error-message">{message name="address"}</span><br />
											{/if}
											</td>
										</tr>
										{if is_error('tel')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">TEL</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
											<input type="text" value="{$form.tel}" size="30" name="tel" id="tel" />（半角英数字)<br />
											{if is_error('tel')}
											<span class="error-message">{message name="tel"}</span><br />
											{/if}
											電話番号はハイフン区切りで国番号から入力してください。<br />
											例：東京の場合　+81-3-1234-5678
											</td>
										</tr>
										{if is_error('fax')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">FAX</th>
											<th class="required"></th>
											<td>
											<input type="text" value="{$form.fax}" size="30" name="fax" id="fax" />（半角英数字)<br />
											{if is_error('fax')}
											<span class="error-message">{message name="fax"}</span><br />
											{/if}
											FAX番号はハイフン区切りで国番号から入力してください。<br />
											例：東京の場合　+81-3-1234-5678</td>
										</tr>
										{if is_error('url')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">御社のウェブサイトURL</th>
											<th class="required"></th>
											<td><input type="text" value="{$form.url}" size="60" name="url" id="url" /><br />
											{if is_error('url')}
											<span class="error-message">{message name="url"}</span><br />
											{/if}
											URLはhttp(s):// から入力して下さい。
											</td>
										</tr>
										{*
										{if ("regist" != $form.mode)}
										<tr>
											<th class="item">退会希望</th>
											<th class="required"></th>
											<td><input type="checkbox" size="60" name="delFlg" id="delFlg" value="1" /> 退会を希望します。<br />
											※退会をご希望の方は、チェックをつけてください。<br />
											</td>
										</tr>
										{/if}
										*}
									</table>
									<!-- navi area-->
									<table width="100%">
										<tr>
											<td><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" onclick="history.back()"/></td>
											<td align="right"><input type="image" src="/j-messe/images/db/btn-confirm.gif" alt="確認画面へ"  class="over" /></td>
										</tr>
									</table>
								</form>
								<div class="line_dot"><hr /></div>
								<!-- /navi area-->
								<!-- ssl area-->
								<table id="ssl-content">
									<tr>
										<td>
											<!-- DigiCert Site Seal Code -->
											<div id="digicertsitesealcode" style="width: 100px; margin: 5px auto 5px auto;" align="center"><div id="DigiCertClickID_dQd81VoW" data-language="en_US"><a href="http://www.digicert.com/ssl.htm">SSL Certificate</a></div><script type="text/javascript">var __dcid = __dcid || [];__dcid.push(["DigiCertClickID_dQd81VoW", "7", "m", "black", "dQd81VoW"]);(function(){var cid=document.createElement("script");cid.async=true;cid.src="//seal.digicert.com/seals/cascade/seal.min.js";var s = document.getElementsByTagName("script");var ls = s[(s.length - 1)];ls.parentNode.insertBefore(cid, ls.nextSibling);}());</script></div>
										</td>
										<td>このページから送信される情報は、SSL暗号化通信により保護されています。</td>
									</tr>
								</table>
								<!-- /ssl area-->
							</div>
						</div>
					</div>
				</div>
				<p class="totop">
{*
						{if ("regist" == $form.mode)}
						<a href="javascript:window.open('{$config.url}?action_user_userRegist=true&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{else}
						<a href="javascript:window.open('{$config.url}?action_user_userChange=true&user_id={$form.user_id}&mode={$form.mode}&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{/if}
*}
					<a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /></a>
				</p>
			</div>
			<!-- /center -->
		</div>
	</div>
	<!-- /contents -->

	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->
</body>
</html>