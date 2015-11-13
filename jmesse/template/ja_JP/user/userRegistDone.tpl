<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
{if ("regist" == $form.mode)}
	<title>ユーザー登録 - 世界の見本市・展示会 -ジェトロ</title>
{elseif ("change" == $form.mode)}
	<title>ユーザー修正 - 世界の見本市・展示会 -ジェトロ</title>
{else}
	<title>ユーザー削除 - 世界の見本市・展示会 -ジェトロ</title>
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
					<li><a href="http://www.jetro.go.jp/indexj.html"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">世界の見本市・展示会情報（J-messe）</a></li>
					{if ("regist" == $form.mode)}
						<li>ユーザー登録完了</li>
					{elseif ("change" == $form.mode)}
						<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
						<li>ユーザー修正完了</li>
					{else}
						<li>ユーザー削除完了</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ("regist" == $form.mode)}
					<h1>ユーザー登録</h1>
				{/if}
				{if ("change" == $form.mode)}
					<h1>ユーザー修正</h1>
				{/if}
				{if ("delete" == $form.mode)}
					<h1>ユーザー削除</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/j-messe/images/db/user04.jpg" alt="userFinish">
				</div>
			</div>
			<div class="elem_paragraph">
				{if ("regist" == $form.mode)}
					<p class="text">
						ユーザー登録が完了しました。ありがとうございました。<br />
						{$session.email2} 宛に「J-messe 見本市ユーザー登録完了のお知らせ」メールを送信しましたので、ご確認ください。<br />
						数分経ってもメールが届かない場合は、メールアドレスが正しいかどうかご確認をお願いします。
					</p>
				{/if}
				{if ("change" == $form.mode)}
					<p class="text">
						ユーザー修正が完了しました。ありがとうございました。<br />
						{$session.email2} 宛に「J-messe 見本市ユーザー更新完了のお知らせ」メールを送信しましたので、ご確認ください。<br />
						数分経ってもメールが届かない場合は、メールアドレスが正しいかどうかご確認をお願いします。
					</p>
				{/if}
				{if ("delete" == $form.mode)}
					<p class="text">
						ユーザー削除が完了しました（退会処理完了）。ありがとうございました。
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
												<a href="{$config.url}?action_user_fairRegistStep1=true" class="var_small"><span>続いて見本市を登録する</span></a>
											</div>
										</li>
									</ul>
									見本市新規登録ページを開きます。<br /><br />
									<ul>
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_top=true" class="var_small"><span>管理者メニューに戻る</span></a>
											</div>
										</li>
									</ul>
									管理者メニューページを開きます。<br /><br />
								{else}
									<ul>
										<li>
											<div class="linkBox">
												<a href="{$config.url_pub}" class="var_small"><span>トップページに戻る</span></a>
											</div>
										</li>
									</ul>
									「世界の見本市・展示会情報」のトップページに戻ります。
								{/if}
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
