<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />
{include file="user/enHeader.tpl"}
{if ("regist" == $form.mode)}
<title>User Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ("change" == $form.mode)}
<title>User Editing - Online Trade Fair Database (J-messe) - JETRO</title>
{else}
<title>User Deleting - Online Trade Fair Database (J-messe) - JETRO</title>
{/if}
</head>

<body class="layout-LC highlight-database j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			{if ("regist" == $form.mode)}
				<li><a href="{$config.url}?action_user_enUserRegist=true&back=1">User Registration</a></li>
				<li>User Registration Confirm</li>
			{elseif ("change" == $form.mode)}
				<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
				<li><a href="{$config.url}?action_user_enUserChange=true&user_id={$form.user_id}&mode={$form.mode}&back=1">User Editing</a></li>
				<li>User Editing Confirm</li>
			{else}
				<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
				<li>User Deleting Confirm</li>
			{/if}
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2">
				{if ("regist" == $form.mode)}
				<h2>User Registration</h2>
				{elseif ("change" == $form.mode)}
				<h2>Edit User Information</h2>
				{else}
				<h2>Withdrawal of User Registration</h2>
				{/if}
			</div>
			<div class="in_main" style="word-break: break-all;">
				<h3 class="img t_center"><img src="/en/database/j-messe/images/db/user03.jpg" alt="ユーザー登録情報確認" /></h3>
				{if ("delete" == $form.mode)}
				<p><font color="red">When you click “Finish,” all your registered information will be deleted.<br />
				Please consider carefully as the operation is undoable. </font></p>
				{elseif ("change" == $form.mode)}
				<p><font color="red">Check that all of the following information is correct, and then click “Finish.”<br />
				If you need to make a correction, click “Back.”</font></p>
				{else}
				<p>
				Check that all data you entered is correct and click “Register.”<br />
				If you need to make a correction, click “Back.”
				</p>
				{/if}
				<form name="form_user_enUserRegistDo" id="form_user_enUserRegistDo" method="post" action="">
					{uniqid}
					{if ("regist" == $form.mode)}
					<input type="hidden" name="action_user_enUserRegistDone" id="action_user_enUserRegistDone" value="dummy" />
					{else}
					<input type="hidden" name="action_user_enUserChangeDone" id="action_user_enUserChangeDone" value="dummy" />
					{/if}
					<!-- ユーザID -->
					<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
					<!-- 登録モード -->
					<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
					<!-- フォーム情報をhidden設定 -->
					<input type="hidden" name="email" id="email" value="{$form.email}" />
					<input type="hidden" name="password" id="password" value="{$form.password}" />
					<input type="hidden" name="companyNm" id="companyNm" value="{$form.companyNm}" />
					<input type="hidden" name="divisionDeptNm" id="divisionDeptNm" value="{$form.divisionDeptNm}" />
					<input type="hidden" name="userNm" id="userNm" value="{$form.userNm}" />
					<input type="hidden" name="genderCd" id="genderCd" value="{$form.genderCd}" />
					<input type="hidden" name="postCode" id="postCode" value="{$form.postCode}" />
					<input type="hidden" name="address" id="address" value="{$form.address}" />
					<input type="hidden" name="tel" id="tel" value="{$form.tel}" />
					<input type="hidden" name="fax" id="fax" value="{$form.fax}" />
					<input type="hidden" name="url" id="url" value="{$form.url}" />
					<input type="hidden" name="delFlg" id="delFlg" value="{$form.delFlg}" />
					<input type="hidden" name="emailCheckFlg" id="emailCheckFlg" value="{$form.emailCheckFlg}" />
					{* エラー表示 *}
					{if count($errors)}
					<ul>
						{foreach from=$errors item=error}
						<li><font color="#ff0000">{$error}</font></li>
						{/foreach}
					</ul>
					{/if}
					<h4>E-mail Account and Password</h4>
					<table id="registration">
						<tr>
							<th class="item">email</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>{$form.email}</td>
						</tr>
						<tr>
							<th class="item">password</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>●●●●●●●●</td>
						</tr>
					</table><br />
					<h4>Other User Information</h4>
					<table id="registration">
						<tr>
							<th class="item">Company name</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>{$form.companyNm}</td>
						</tr>
						<tr>
							<th class="item">Division/Dept name</th>
							<th class="required"></th>
							<td>{$form.divisionDeptNm}<br /></td>
						</tr>
						<tr>
							<th class="item">Your name</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>{$form.userNm}</td>
						</tr>
						<tr>
							<th class="item">Gender</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>
							{if $form.genderCd == "0"}Male{/if}
							{if $form.genderCd == "1"}Female{/if}
							</td>
						</tr>
						<tr>
							<th class="item">Post Code</th>
							<th class="required"></th>
							<td>{$form.postCode}</td>
						</tr>
						<tr>
							<th class="item">Address</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>{$form.address}</td>
						</tr>
						<tr>
							<th class="item">TEL</th>
							<th class="required"><img src="/en/database/j-messe/images/db/required.gif " height="18" width="40" /></th>
							<td>{$form.tel}</td>
						</tr>
						<tr>
							<th class="item">FAX</th>
							<th class="required"></th>
							<td>{$form.fax}</td>
						</tr>
						<tr>
							<th class="item">URL</th>
							<th class="required"></th>
							<td>{$form.url}</td>
						</tr>
						{if ("1" == $form.delFlg)}
						<tr>
							<th class="item">Withdrawal of Registration</th>
							<th class="required"></th>
							<td>I withdraw my registration.</td>
						</tr>
						{/if}
					</table>
					<!-- navi area-->
					<table width="100%">
						<tr>
							<td><img src="/en/database/j-messe/images/db/btn-back.gif" alt="back" width="110" height="37" class="over" onclick="history.back()"/></td>
							<td align="right"><input type="image" src="/en/database/j-messe/images/db/btn-finish.gif" alt="complete" class="over" /></td>
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
						<td>All your information submitted through this page is protected by SSL.</td>
					</tr>
				</table>
				<!-- /ssl area-->
			</div>
			<p class="totop">
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