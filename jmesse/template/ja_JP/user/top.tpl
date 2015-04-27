<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<title>主催者向け管理メニュー - 世界の見本市・展示会 -ジェトロ</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="http://www.jetro.go.jp/indexj.html"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">見本市・展示会データベース（J-messe）</a></li>
					<li>主催者向け管理者メニュー</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>主催者向け管理者メニュー</h1>
			</div>
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							<h2>見本市情報の管理</h2>
						</div>
						<div class="elem_paragraph">
							<div class="elem_linkBox_list">
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_fairRegistStep1=true" class="var_small"><span>新規登録</span></a>
										</div>
									</li>
								</ul>
								見本市新規登録ページを開きます。<br /><br />
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_fairList=true" class="var_small"><span>修正/削除</span></a>
										</div>
									</li>
								</ul>
								登録済みの見本市一覧が表示されます。<br /><br />
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_fairCopyList=true" class="var_small"><span>編集登録</span></a>
										</div>
									</li>
								</ul>
								過去に登録した見本市情報のコピーを作成し、それを編集して登録できます。
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
							<h2>ユーザー情報の管理</h2>
						</div>
						<div class="elem_paragraph">
							<div class="elem_linkBox_list">
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_userChange=true&mode=change&user_id={$session.user_id}" class="var_small"><span>ユーザー情報修正</span></a>
										</div>
									</li>
								</ul>
								Eメール、パスワード、住所等を変更します。<br /><br />
								<ul>
									<li>
										<div class="linkBox">
											<a href="{$config.url}?action_user_userChangeDo=true&mode=change&delFlg=1&user_id={$session.user_id}" class="var_small"><span>アカウントの削除</span></a>
										</div>
									</li>
								</ul>
								登録いただいたアカウント（ユーザー情報）を削除します。
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ** include START jetro_ssl_ja **  -->
			{include file="user/jetro_ssl_ja.tpl"}
			<!-- ** include END jetro_ssl_ja **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
