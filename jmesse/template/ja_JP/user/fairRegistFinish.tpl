<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
{if ('r' == $form.msg)}
<title>見本市登録 - 世界の見本市・展示会(J-messe) - ジェトロ</title>
{elseif ('c' == $form.msg)}
<title>見本市修正 - 世界の見本市・展示会(J-messe) - ジェトロ</title>
{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
<title>見本市削除 - 世界の見本市・展示会(J-messe) - ジェトロ</title>
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
					<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('r' == $form.msg)}
					<h1>見本市登録</h1>
				{elseif ('c' == $form.msg)}
					<h1>見本市修正</h1>
				{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
					<h1>見本市削除</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/j-messe/images/db/fair06.jpg" alt="fairFinish" />
				</div>
			</div>

			<div class="elem_paragraph">
				{if ('r' == $form.msg)}
					<p class="text">見本市の登録が完了しました。ありがとうございました。<br />{$session.email2} 宛に「J-messe 見本市登録申請受付のお知らせ」メールを送信しましたので、ご確認ください。<br />数分経ってもメールが届かない場合は、メールアドレスが正しいかどうかご確認をお願いします。</p>
				{elseif ('c' == $form.msg)}
					<p class="text">見本市の修正が完了しました。ありがとうございました。<br />{$session.email2} 宛に「J-messe 見本市更新受付のお知らせ」メールを送信しましたので、ご確認ください。<br />数分経ってもメールが届かない場合は、メールアドレスが正しいかどうかご確認をお願いします。</p>
				{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
					<p class="text">見本市の削除が完了しました。ありがとうございました。</p>
				{/if}
			</div>
			<div class="elem_paragraph">
				<div class="elem_linkBox_list">
					{if ('r' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_fairRegistStep1=true" class="var_small"><span>続けて新規登録</span></a>
								</div>
							</li>
						</ul>
						見本市新規登録ページを開きます。<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_fairCopyList=true" class="var_small"><span>修正登録</span></a>
								</div>
							</li>
						</ul>
						見本市修正登録対象一覧ページを開きます。<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_top=true" class="var_small"><span>管理者メニューに戻る</span></a>
								</div>
							</li>
						</ul>
						管理者メニューページを開きます。
					{elseif ('c' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_fairList=true" class="var_small"><span>登録済み見本市一覧に戻る</span></a>
								</div>
							</li>
						</ul>
						見本市一覧ページを開きます。<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_top=true" class="var_small"><span>管理者メニューに戻る</span></a>
								</div>
							</li>
						</ul>
						管理者メニューページを開きます。
					{elseif ('ed' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_fairList=true" class="var_small"><span>登録済み見本市一覧に戻る</span></a>
								</div>
							</li>
						</ul>
						見本市一覧ページを開きます。<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_top=true" class="var_small"><span>管理者メニューに戻る</span></a>
								</div>
							</li>
						</ul>
						管理者メニューページを開きます。
					{elseif ('cd' == $form.msg)}
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_fairCopyList=true" class="var_small"><span>登録済み見本市修正登録一覧に戻る</span></a>
								</div>
							</li>
						</ul>
						見本市修正登録一覧ページを開きます。<br /><br />
						<ul>
							<li>
								<div class="linkBox">
									<a href="{$config.url}?action_user_top=true" class="var_small"><span>管理者メニューに戻る</span></a>
								</div>
							</li>
						</ul>
						管理者メニューページを開きます。
					{else}
					{/if}
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
