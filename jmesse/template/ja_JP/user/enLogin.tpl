<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<title>User login - Online Trade Fair Database (J-messe) - JETRO</title>
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
					<li>User Login</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>User Login</h1>
			</div>
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							<h2></h2>
						</div>
						<div class="elem_paragraph">
							<p>User Login : For hosts of trade fairs to register event information</p>
							<form name="form_user_enLogin" id="form_user_enLogin" method="post" action="">
								<input type="hidden" name="action_user_enLoginDo" id="action_user_enLoginDo" value="dummy" />
								<input type="hidden" name="function" id="function" value="{$form.function}" />
								{* エラー表示 *}
								{if count($errors)}
									<p class="error-message" id="error-pagetop">The data you have entered is invalid. Please re-enter.</p>
								{/if}
								<div class="elem_table_basic">

									<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
										<tbody>
											<tr>
												<th class="bg_gray_lv1 nobdr">your email</th>
												<td class="bg_gray_lv2">
													<div class="elem_custom_input pt0 pb0">
														<input type="text" name="email" id="email" size="60" value="{$form.email}" class="var_bg_white" />
														{if is_error('email')}
															<span class="error-message">{message name="email"}</span>
														{/if}
													</div>
												</td>
											</tr>
											<tr>
												<th class="bg_gray_lv1 nobdr">Password</th>
												<td class="bg_gray_lv2">
													<div class="elem_custom_input pt0 pb0">
														<input type="password" name="password" id="password" size="60" value="" autocomplete="off" class="var_bg_white" />
														{if is_error('password')}
															<span class="error-message">{message name="password"}</span><br />
														{/if}
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="elem_linkBox_list">
									<ul>
										<li>
											<div class="linkBox">
												<a href="" onclick="document.form_user_enLogin.submit();return false;" class="var_small"><span>Login</span></a>
											</div>
										</li>
									</ul>
								</div>
							</form>
							<br /><br />
							<ul class="icon_arrow">
								<li>
									<strong>Forgot your password?</strong><br />
									<a href="{$config.url}?action_user_enReissuePassword=true" class="icon_arrow">Password Inquiries</a>
								</li>
								<li>
									<br />
								</li>
								<li>
									<strong>For first time users</strong><br />Click "User Registration" and register your information" <br />
									<a href="{$config.url}?action_user_enUserTerms=true">User Registration</a>
								</li>
							</ul>
							<!-- ** include START jetro_ssl_en **  -->
							{include file="user/jetro_ssl_en.tpl"}
							<!-- ** include END jetro_ssl_en **  -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
