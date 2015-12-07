<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<title>ユーザーログイン - 世界の見本市・展示会 -ジェトロ</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">世界の見本市・展示会情報（J-messe）</a></li>
					<li>ユーザーログイン</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>ユーザーログイン</h1>
			</div>
			<div class="elem_content_divide_block">
				<div class="color_base content_divide_col2 elem_content_divide_block_pad">
					<div class="elem_content_divide_box">
						<div class="elem_column_block">
							<div class="color_base elem_column_block_pad">
								<div class="box_text">
									<div class="elem_heading_lv3">
										<h3>ユーザーログイン</h3>
									</div>
									<div class="elem_paragraph">
										<p class="text">
											世界の見本市・展示会情報(J-messe)の主催者向け管理ページにログインします。
										</p>
									</div>
									<form name="form_user_login" id="form_user_login" method="post" action="">
										<input type="hidden" name="action_user_loginDo" id="action_user_loginDo" value="dummy" />
										<input type="hidden" name="function" id="function" value="{$form.function}" />
										{* エラー表示 *}
										{if count($errors)}
											<p class="error-message" id="error-pagetop">入力に誤りがあります。再度、入力ください。</p>
										{/if}
										<div class="elem_custom_input">
											<label>ユーザー名（メールアドレス） </label>
											<input type="text" name="email" id="email" value="{$form.email}" class="var_bg_white" />
											{if is_error('email')}
												<span class="error-message">{message name="email"}</span>
											{/if}
											<label class="pt10">パスワード</label>
											<input type="password" name="password" id="password" value="" autocomplete="off" class="var_bg_white" />
											{if is_error('password')}
												<span class="error-message">{message name="password"}</span><br />
											{/if}
										</div>
										<div class="elem_linkBox_list">
											<ul>
												<li>
													<div class="linkBox">
														<a href="" onclick="document.form_user_login.submit();return false;" class="var_small"><span>ログイン</span></a>
													</div>
												</li>
											</ul>
										</div>
										<div class="elem_separate">
											<hr />
										</div>
										<div class="elem_heading_lv4">
											<h4>パスワードを忘れた方</h4>
										</div>
										<div class="elem_text_list">
											<ul>
												<li><a href="{$config.url}?action_user_reissuePassword=true">パスワードお問い合わせ</a></li>
											</ul>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="elem_content_divide_box">
						<div class="elem_column_block"><div class="elem_column_block_pad">
							<div class="box_text">
								<div class="elem_heading_lv3">
									<h3>初めてご利用の方</h3>
								</div>
								<div class="elem_paragraph">
									<p class="text">
										貴方の主催する見本市・展示会を世界に向けてPR！<br />国内のみならず海外からの来場誘致、出展社募集のお役に立ちます。
									</p>
								</div>
								<div class="elem_paragraph">
									<p class="text">
										<span class="font_red">登録は無料。 </span>見本市主催者ご自身で、登録情報を更新・削除することも可能です。
										今後開催される見本市・展示会の広報手段として、ぜひご活用下さい。
									</p>
								</div>
								<div class="elem_paragraph">
									<p class="text">
										見本市登録をご利用いただく場合は、ユーザー登録をお願いします。
									</p>
								</div>
								<div class="elem_linkBox_list">
									<ul>
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_userTerms=true" class="var_small"><span>ユーザー登録</span></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ** include START jetro_ssl_ja **  -->
		{include file="user/jetro_ssl_ja.tpl"}
		<!-- ** include END jetro_ssl_ja **  -->
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>

