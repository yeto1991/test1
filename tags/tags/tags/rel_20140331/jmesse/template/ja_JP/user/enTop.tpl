<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />
{include file="user/enHeader.tpl"}
<title>Administration Menus for Organizers - Online Trade Fair Database (J-messe) - JETRO</title>
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
			<li>Administration Menus</li>
		</ul>
	</div>
	<!-- /bread -->
	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2">
				<h2>Administration Menus for Organizers</h2>
			</div>
			<div class="in_main">
				<h3>Management of Trade Fair Information</h3>
				<div class="finish-navi clearfix">
					<div class="btn nomp">
						<a href="{$config.url}?action_user_enFairRegistStep1=true"><span class="title">New registration</span>
						<span class="description">Click the link above to register your new trade fair information.</span></a>
					</div>
					<div class="btn nomp">
						<a href="{$config.url}?action_user_enFairList=true"><span class="title">Edit/delete</span>
						<span class="description">Click the link above to access the list of your registered trade fair information.</span></a>
					</div>

					<div class="btn nomp">
						<a href="{$config.url}?action_user_enFairCopyList=true"><span class="title">Coping registered information</span>
						<span class="description">Click the link above to register your new trade fair information by coping and editing your existing record.</span></a>
					</div>
				</div>
				<h3>Management of User's Information</h3>
				<div class="finish-navi clearfix">
					<div class="btn nomp">
						<a href="{$config.url}?action_user_enUserChange=true&mode=change&user_id={$session.user_id}"><span class="title">Change user's information</span>
						<span class="description">Click the link above to change your e-mail, pass words, address, and other information.</span></a>
					</div>
					<div class="btn nomp">
						<a href="{$config.url}?action_user_enUserChangeDo=true&mode=change&delFlg=1&user_id={$session.user_id}"><span class="title">Delete user's information</span>
						<span class="description">Click the link above to delete all of your registration account (user's information).</span></a>
					</div>
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