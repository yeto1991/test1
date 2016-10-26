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
{*
		<ul>
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			{if ("regist" == $form.mode)}
				<li><a href="/database/j-messe/tradefair/">User Registration</a></li>
				<li><a href="/database/j-messe/tradefair/">User Registration Confirm</a></li>
				<li>User Registration Complete</li>
			{elseif ("change" == $form.mode)}
				<li><a href="/database/j-messe/tradefair/">My Menu</a></li>
				<li><a href="/database/j-messe/tradefair/">User Editing</a></li>
				<li><a href="/database/j-messe/tradefair/">User Editing Confirm</a></li>
				<li>User Editing Complete</li>
			{else}
				<li><a href="/database/j-messe/tradefair/">My Menu</a></li>
				<li><a href="/database/j-messe/tradefair/">User Editing</a></li>
				<li><a href="/database/j-messe/tradefair/">User Deleting Confirm</a></li>
				<li>User Deleting Complete</li>
			{/if}
		</ul>
*}
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
				{/if}
				{if ("change" == $form.mode)}
				<h2>Edit User Information</h2>
				{/if}
				{if ("delete" == $form.mode)}
				<h2>Withdrawal of User Registration</h2>
				{/if}
			</div>
			<div class="in_main">
				<h3 class="img t_center"><img src="/en/database/j-messe/images/db/user04.jpg" alt="ユーザー登録完了" /></h3>
				{if ("regist" == $form.mode)}
				<p>Your user registration has been completed.<br />We have sent an automatic confirmation email to {$session.email2} .<br />If you don't receive the email within minutes, please check whether you have registered your email address correctly.</p>
				{/if}
				{if ("change" == $form.mode)}
				<p>Your user information has been updated. <br />We have sent an automatic confirmation email to {$session.email2} .<br />If you don't receive the email within minutes, please check whether you have registered your email address correctly.</p>
				{/if}
				{if ("delete" == $form.mode)}
				<p>Your registration has been withdrawn.</p>
				{/if}
				<div class="finish-navi">
					{if ("delete" != $form.mode)}
						<div class="btn">
							<a href="{$config.url}?action_user_enFairRegistStep1=true" ><span class="title">Registration of New Trade Fair Info</span>
							<span class="description">Click to go to the trade fair registration page.</span></a>
						</div>
						<div class="btn">
							<a href="{$config.url}?action_user_enTop=true"><span class="title">Administration Menus for Organizers</span>
							<span class="description">To the user menu page</span></a>
						</div>
					{else}
						<div class="btn">
							<a href="/en/database/j-messe/" ><span class="title">Top page</span>
							<span class="description">To the top page.</span></a>
						</div>
					{/if}
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