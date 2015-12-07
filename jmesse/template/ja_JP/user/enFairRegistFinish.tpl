<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
{if ('r' == $form.msg)}
<title>Fair Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ('c' == $form.msg)}
<title>User Editing - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
<title>User Deleting - Online Trade Fair Database (J-messe) - JETRO</title>
{/if}
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/en/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('r' == $form.msg)}
					<h1>New Fair Registration</h1>
				{elseif ('c' == $form.msg)}
					<h1>Fair Editing</h1>
				{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
					<h1>Fair Deleting</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/en/database/j-messe/images/db/fair05.jpg" alt="enfairFinish" />
				</div>
			</div>

			<div class="elem_paragraph">
				{if ('r' == $form.msg)}
					<p class="text">Your registration has been completed.<br />We have sent an automatic confirmation email to {$session.email2} .<br />If you don't receive the email within minutes, please check whether you have registered your email address correctly.</p>
				{elseif ('c' == $form.msg)}
					<p class="text">Your information has been updated.<br />We have sent an automati  confirmation email to {$session.email2} .<br />If you don't receive the email within minutes, please check whether you have registered your email address correctly.</p>
				{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
					<p class="text">Your deleting has been completed.</p>
				{/if}
			</div>
			<div class="elem_paragraph">
				<div class="elem_linkBox_list">
					{if ('r' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enFairRegistStep1=true" class="var_small"><span>New Fair Registration</span></a>
								</div>
							</li>
						</ul>
						To new fair registration page.<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enFairCopyList=true" class="var_small"><span>Copying registered information</span></a>
								</div>
							</li>
						</ul>
						To fair list page for coping.<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enTop=true" class="var_small"><span>Administration Menus for Organizers</span></a>
								</div>
							</li>
						</ul>
						To the user menu page.
					{elseif ('c' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enFairList=true" class="var_small"><span>Edit/delete</span></a>
								</div>
							</li>
						</ul>
						To fair list page.<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enTop=true" class="var_small"><span>Administration Menus for Organizers</span></a>
								</div>
							</li>
						</ul>
						To the user menu page.
					{elseif ('ed' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enFairList=true" class="var_small"><span>Edit/delete</span></a>
								</div>
							</li>
						</ul>
						To fair list page.<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enTop=true" class="var_small"><span>Administration Menus for Organizers</span></a>
								</div>
							</li>
						</ul>
						To the user menu page.
					{elseif ('cd' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enFairCopyList=true" class="var_small"><span>Copying registered information</span></a>
								</div>
							</li>
						</ul>
						To fair list page for coping.<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_enTop=true" class="var_small"><span>Administration Menus for Organizers</span></a>
								</div>
							</li>
						</ul>
						To the user menu page.
					{else}
					{/if}
				</div>
			</div>
			<!-- ** include START jetro_ssl_en **  -->
			{include file="user/jetro_ssl_en.tpl"}
			<!-- ** include END jetro_ssl_en **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
