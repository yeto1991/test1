<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<title>Administration Menus for Organizers - Online Trade Fair Database (J-messe) - JETRO</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="http://www.jetro.go.jp/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li>Administration Menus</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>Administration Menus for Organizers</h1>
			</div>
			<hr />
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							<h2>Management of Trade Fair Information</h2>
						</div>
						<div class="elem_paragraph">
							<div class="elem_linkBox_list">
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_enFairRegistStep1=true" class="var_small"><span>New registration</span></a>
										</div>
									</li>
								</ul>
								Click the button above to register your new trade fair information.<br /><br />
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_enFairList=true" class="var_small"><span>Edit/delete</span></a>
										</div>
									</li>
								</ul>
								Click the button above to access the list of your registered trade fair information.<br /><br />
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_enFairCopyList=true" class="var_small"><span>Copying registered information</span></a>
										</div>
									</li>
								</ul>
								Click the button above to register your new trade fair information by Copying and editing your existing record.
							</div>
						</div>
					</div>
				</div>
			</div>
			<br /><br />
			<hr />
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							<h2>Management of User's Information</h2>
						</div>
						<div class="elem_paragraph">
							<div class="elem_linkBox_list">
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_enUserChange=true&mode=change&user_id={$session.user_id}" class="var_small"><span>Change user's information</span></a>
										</div>
									</li>
								</ul>
								Click the button above to change your e-mail, pass words, address, and other information.<br /><br />
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_enUserChangeDo=true&mode=change&delFlg=1&user_id={$session.user_id}" class="var_small"><span>Delete user's information</span></a>
										</div>
									</li>
								</ul>
								Click the button above to delete all of your registration account (user's information).
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
