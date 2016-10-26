<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="">
{include file="user/header.tpl"}
<title>ユーザーログイン - 世界の見本市・展示会 -ジェトロ</title>
</head>

<body class="layout-LC highlight-match j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			<li>ユーザログイン</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">

		<div class="area">
			<!-- left -->
			{$app_ne.left_menu}
			<!-- /left -->

			<!-- center -->
			<div id="center">
				<div id="main">
					<div class="bgbox_set">
						<div class="bgbox_base">

							<div class="h1">
								<h1>見本市・展示会データベース</h1>
							</div>

							<div class="h2">
								<h2>主催者向け見本市登録</h2>
							</div>

							<div class="in_main">

								<div class="left" style="width: 360px;">

									<p>世界の見本市・展示会データベース(J-messe)の主催者向け管理ページにログインします。</p>

									<div class="login">
										<form name="form_user_login" id="form_user_login" method="post" action="">

											<input type="hidden" name="action_user_loginDo" id="action_user_loginDo" value="dummy" />
											<input type="hidden" name="function" id="function" value="{$form.function}" />

											{* エラー表示 *}
											{if count($errors)}
											<p class="error-message" id="error-pagetop">入力に誤りがあります。再度、入力ください。</p>
											{/if}

											<table id="registration">
												<tbody>
													{if is_error('email')}
													<tr class="errorcheck">
													{else}
													<tr>
													{/if}
														<th class="item">ユーザー名<br />（メールアドレス）
														</th>
														<td>
															<input type="text" name="email" id="email" size="26" value="{$form.email}" /><br/>
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
														<th class="item">パスワード<br />
														</th>
														<td>
															<input type="password" name="password" id="password" size="26" value="" autocomplete="off" /><br/>
															{if is_error('password')}
															<span class="error-message">{message name="password"}</span><br />
															{/if}
														</td>
													</tr>

												</tbody>
											</table>
											<p class="t_right">
												<input type="image" src="/j-messe/images/db/btn-login.gif" alt="ログイン" class="over" width="180" height="37" />
											</p>
										</form>
										<div class="line_dot">
											<hr />
										</div>
										<p>
											<strong>パスワードを忘れた方</strong><br /> <a href="{$config.url}?action_user_reissuePassword=true" class="icon_arrow">パスワードお問い合わせ</a>
										</p>

									</div>
								</div>

								<div class="right" style="width: 360px;">

									<div class="entry">
										<h3>初めてご利用の方</h3>

										<p>
											<strong>貴方の主催する見本市・展示会を世界に向けてPR！<br /> 国内のみならず海外からの来場誘致、出展者募集のお役に立ちます。
											</strong>
										</p>
										<p>
											<strong><span class="red">登録は無料。</span> </strong>見本市主催者ご自身で、登録情報を更新・削除することも可能です。今後開催される見本市・展示会の広報手段として、ぜひご活用下さい。
										</p>


										<p class="clearfix">
											見本市登録をご利用いただく場合は、ユーザー登録をお願いします。<br /> <a href="{$config.url}?action_user_userTerms=true"><img class="over imgright" src="/j-messe/images/db/btn-user-regist.gif" /> </a>
										</p>

									</div>
								</div>


							</div>
						</div>
					</div>

				</div>
				<p class="totop">
{*
					<a href="javascript:window.open('{$config.url}?action_user_login=true&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
*}
					<a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /></a>
				</p>
			</div>
			<!-- /center -->
		</div>
	</div>
	<!-- /contents -->
	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->

</body>
</html>
