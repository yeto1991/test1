<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="trade fair registration,trade show registration,exhibition registration,expo registration,trade fair promotion,trade show promotion,exhibition promotion,expo promotion" />
{include file="user/enHeader.tpl"}
<title>Password Confirmation - Online Trade Fair Database (J-messe) - JETRO</title>
</head>

<body class="layout-LC highlight-database j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->
	<!-- bread -->
{*
	<div id="bread">
		<ul class="clearfix">
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			<li>Password Confirmation</li>
		</ul>
	</div>
*}
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2"><h2>Trade Fairs held in Japan and the World </h2></div>
			<div class="in_main">
				<h3>Password Inquiries</h3>
				<p>Please enter your registered e-mail address and press the send button.</p>
				<div class="login">
					<form name="form_user_enReissuePassword" id="form_user_enReissuePassword" method="post" action="">
						<input type="hidden" name="action_user_enReissuePasswordDo" id="action_user_enReissuePasswordDo" value="dummy" />
						{* エラー表示 *}
						{if count($errors)}
						<p class="error-message" id="error-pagetop">The data you have entered is invalid. Please re-enter.</p>
						{/if}
						<table id="registration">
							<tbody>
								{if is_error('email')}
								<tr class="errorcheck">
								{else}
								<tr>
								{/if}
									<th class="item">email</th>
									<td><input name="email" id="email" size="60" type="text" value="{form.email}" /><br />
									{if is_error('email')}
									<span class="error-message">{message name="email"}</span><br />
									{/if}
									</td>
								</tr>
							</tbody>
						</table>
						<p class="t_right"><input type="image" src="/en/database/j-messe/images/db/btn-send.gif" alt="send"  class="over" width="110" height="37"  /></p>
					</form>
				</div>
				<div class="line_dot"><hr /></div>
				<!-- ssl area-->
				<script language="JavaScript" src="https://www.jetro.go.jp/js/jetro_seal_en.js"></script>
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