<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
{include file="user/enHeader.tpl"}
<title>User login - Online Trade Fair Database (J-messe) - JETRO</title>
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
			<li>User Login</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2"><h2>Trade Fairs held in Japan and the World </h2></div>
			<div class="in_main">
				<h3>User Login</h3>
				<div class="login">
					<p>User Login: For hosts of trade fairs to register event information</p>
					<form name="form_user_enLogin" id="form_user_enLogin" method="post" action="">
						<input type="hidden" name="action_user_enLoginDo" id="action_user_enLoginDo" value="dummy" />
						<input type="hidden" name="function" id="function" value="{$form.function}" />
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
									<th class="item">your email</th>
									<td>
										<input type="text" name="email" id="email" size="60" value="{$form.email}" /><br />
										{if is_error('email')}
										<span class="error-message">{message name="email"}</span><br />
										{/if}
									</td>
								</tr>
								{if is_error('password')}
								<tr class="errorcheck">
								{else}
								<tr>
								{/if}
									<th class="item">Password<br /></th>
									<td>
										<input type="password" name="password" id="password" size="60" value="" autocomplete="off" /><br />
										{if is_error('password')}
										<span class="error-message">{message name="password"}</span><br />
										{/if}
									</td>
								</tr>
							</tbody>
						</table>
						<p class="t_right"><input type="image" src="/en/database/j-messe/images/db/btn-login.gif" alt="Login"  class="over" width="180" height="37"  /></p>
					</form>
					<div class="line_dot"><hr /></div>
					<p><strong>Forgot your password?</strong><br />
					<a href="{$config.url}?action_user_enReissuePassword=true"  class="icon_arrow">Password Inquiries</a></p><br />
					<p><strong>For first time users</strong><br />Click “User Registration” and register your information<br />
					<a href="{$config.url}?action_user_enUserTerms=true">User Registration</a></p>
				</div>
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