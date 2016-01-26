<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
{if ("regist" == $form.mode)}
	<title>User Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ("change" == $form.mode)}
	<title>User Editing - Online Trade Fair Database (J-messe) - JETRO</title>
{else}
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
					<li><a href="/en/"><img alt="home" src="/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					{if ("regist" == $form.mode)}
						<li>User Registration Complete</li>
					{elseif ("change" == $form.mode)}
						<li><a href="{$config.url}?action_user_top=true">Administration Menus</a></li>
						<li>User Editing Complete</li>
					{else}
						<li>User Deleting Complete</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ("regist" == $form.mode)}
					<h1>User Registration</h1>
				{/if}
				{if ("change" == $form.mode)}
					<h1>Edit User Information</h1>
				{/if}
				{if ("delete" == $form.mode)}
					<h1>Withdrawal of User Registration</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="/library/en/database/j-messe/images/db/user04.jpg" alt="usercomplete" />
				</div>
			</div>
			<div class="elem_paragraph">
				{if ("regist" == $form.mode)}
					<p class="text">
						Your user registration has been completed.<br />We have sent an automatic confirmation email to {$session.email2} .<br />
						If you don't receive the email within minutes, please check whether you have registered your email address correctly.
					</p>
				{/if}
				{if ("change" == $form.mode)}
					<p class="text">
						Your user information has been updated. <br />
						We have sent an automatic confirmation email to {$session.email2} .<br />
						If you don't receive the email within minutes, please check whether you have registered your email address correctly.
					</p>
				{/if}
				{if ("delete" == $form.mode)}
					<p class="text">
						Your registration has been withdrawn.
					</p>
				{/if}
			</div>
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							<h2></h2>
						</div>
						<div class="elem_paragraph">
							<div class="elem_linkBox_list">
								{if ("delete" != $form.mode)}
									<ul>
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_enFairRegistStep1=true" class="var_small"><span>Registration of New Trade Fair Info</span></a>
											</div>
										</li>
									</ul>
									Click to go to the trade fair registration page.<br /><br />
									<ul>
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_enTop=true" class="var_small"><span>Administration Menus for Organizers</span></a>
											</div>
										</li>
									</ul>
									To the user menu page.<br /><br />
								{else}
									<ul>
										<li>
											<div class="linkBox">
												<a href="{$config.url_pub}" class="var_small"><span>Top page</span></a>
											</div>
										</li>
									</ul>
									To the top page.
								{/if}
							</div>
						</div>
					</div>
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
