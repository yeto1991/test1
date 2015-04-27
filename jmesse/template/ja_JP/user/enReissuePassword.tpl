<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<title>Password Confirmation - Online Trade Fair Database (J-messe) - JETRO</title>
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
					<li>Password Inquiries</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>Password Inquiries</h1>
			</div>
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							<h2></h2>
						</div>
						<div class="elem_paragraph">
							<p>Please enter your registered e-mail address and press the send button.</p>
							<form name="form_user_enReissuePassword" id="form_user_enReissuePassword" method="post" action="">
								<input type="hidden" name="action_user_enReissuePasswordDo" id="action_user_enReissuePasswordDo" value="dummy" />
								{* エラー表示 *}
								{if count($errors)}
								<p class="error-message" id="error-pagetop">The data you have entered is invalid. Please re-enter.</p>
								{/if}
								<div class="elem_table_basic">
									<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
										<tbody>
											<tr>
												<th class="bg_gray_lv1 nobdr">email</th>
												<td class="bg_gray_lv2">
													<div class="elem_custom_input pt0 pb0">
														<input type="text" name="email" id="email" size="60" value="{$form.email}" class="var_bg_white" />
														{if is_error('email')}
															<span class="error-message">{message name="email"}</span>
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
												<a href="" onclick="document.form_user_enReissuePassword.submit();return false;" class="var_small"><span>send</span></a>
											</div>
										</li>
									</ul>
								</div>
							</form>
							<!-- ** include START jetro_ssl_en **  -->
							{include file="user/jetro_ssl_en.tpl"}
							<!-- ** include END jetro_ssl_en **  -->
						</div>
					</div>
				</div>
			</div>
			<!-- **************** jmesse_faqlogin **************** -->
			{$app_ne.jmessefaqlogin}
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
