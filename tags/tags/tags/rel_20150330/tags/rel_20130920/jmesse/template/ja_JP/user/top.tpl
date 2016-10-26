<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="">
{include file="user/header.tpl"}
<title>主催者向け管理メニュー - 世界の見本市・展示会 -ジェトロ</title>
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
			<li>管理者メニュー</li>
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
								<h2>主催者向け管理メニュー</h2>
							</div>

							<div class="in_main">

								<h3>見本市情報の管理</h3>

								<div class="finish-navi clearfix">
									<div class="btn nomp">
										<a href="{$config.url}?action_user_fairRegistStep1=true"><span class="title">新規登録</span> <span class="description">見本市新規登録ページを開きます。</span> </a>
									</div>
									<div class="btn nomp">
										<a href="{$config.url}?action_user_fairList=true"><span class="title">修正・削除</span> <span class="description">登録済みの見本市一覧が表示されます。</span> </a>
									</div>

									<div class="btn nomp">

										<a href="{$config.url}?action_user_fairCopyList=true"><span class="title">編集登録</span> <span class="description">過去に登録した見本市情報のコピーを作成し、それを編集して登録できます。</span> </a>
									</div>
								</div>

								<h3>ユーザー情報の管理</h3>
								<div class="finish-navi clearfix">
									<div class="btn nomp">
										<a href="{$config.url}?action_user_userChange=true&mode=change&user_id={$session.user_id}"><span class="title">ユーザー情報修正</span> <span class="description">Eメール・パスワード・住所等を変更します。</span> </a>
									</div>
									<div class="btn nomp">
										<a href="{$config.url}?action_user_userChangeDo=true&mode=change&delFlg=1&user_id={$session.user_id}"><span class="title">アカウントの削除</span> <span class="description">登録いただいたアカウント（ユーザー情報）を削除します。</span> </a>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<p class="totop">
					{* <a href="?print=1" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a> *}
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
