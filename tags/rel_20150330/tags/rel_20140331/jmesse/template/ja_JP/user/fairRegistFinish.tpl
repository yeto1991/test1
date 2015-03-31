<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />
{include file="user/header.tpl"}
{if ('r' == $form.msg)}
<title>見本市登録 - 世界の見本市・展示会(J-messe) - ジェトロ</title>
{elseif ('c' == $form.msg)}
<title>見本市修正 - 世界の見本市・展示会(J-messe) - ジェトロ</title>
{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
<title>見本市削除 - 世界の見本市・展示会(J-messe) - ジェトロ</title>
{/if}
</head>

<body class="layout-LC highlight-match j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
{*
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
			{if ('r' == $form.msg)}
			<li><a href="/database/j-messe/tradefair/">見本市登録(step1)</a></li>
			<li><a href="/database/j-messe/tradefair/">見本市登録(step2)</a></li>
			<li><a href="/database/j-messe/tradefair/">見本市登録(step3)</a></li>
			<li><a href="/database/j-messe/tradefair/">見本市登録確認</a></li>
			<li>見本市登録完了</li>
			{elseif ('c' == $form.msg)}
			<li><a href="/database/j-messe/tradefair/">見本市修正(step1)</a></li>
			<li><a href="/database/j-messe/tradefair/">見本市修正(step2)</a></li>
			<li><a href="/database/j-messe/tradefair/">見本市修正(step3)</a></li>
			<li><a href="/database/j-messe/tradefair/">見本市修正確認</a></li>
			<li>見本市修正完了</li>
			{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
			<li><a href="/database/j-messe/tradefair/">見本市詳細(削除確認)</a></li>
			<li>見本市削除完了</li>
			{/if}
		</ul>
*}
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
								{if ('r' == $form.msg)}
								<h2>見本市登録</h2>
								{elseif ('c' == $form.msg)}
								<h2>見本市修正</h2>
								{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
								<h2>見本市削除</h2>
								{/if}
							</div>
							<div class="in_main">
								<h3 class="img t_center">
									<img src="/j-messe/images/db/fair06.jpg" alt="見本市登録完了" />
								</h3>
								{if ('r' == $form.msg)}
								<p>見本市の登録が完了しました。ありがとうございました。<br />{$session.email2} 宛に「J-messe 見本市登録申請受付のお知らせ」メールを送信しましたので、ご確認ください。<br />数分経ってもメールが届かない場合は、メールアドレスが正しいかどうかご確認をお願いします。</p>
								{elseif ('c' == $form.msg)}
								<p>見本市の修正が完了しました。ありがとうございました。<br />{$session.email2} 宛に「J-messe 見本市更新受付のお知らせ」メールを送信しましたので、ご確認ください。<br />数分経ってもメールが届かない場合は、メールアドレスが正しいかどうかご確認をお願いします。</p>
								{elseif ('ed' == $form.msg || 'cd' == $form.msg)}
								<p>見本市の削除が完了しました。ありがとうございました。</p>
								{/if}
								<div class="finish-navi">
									{if ('r' == $form.msg)}
										<div class="btn">
											<a href="{$config.url}?action_user_fairRegistStep1=true"><span class="title">続けて新規登録</span> <span class="description">見本市新規登録ページを開きます。</span></a>
										</div>
										<div class="btn">
											<a href="{$config.url}?action_user_fairCopyList=true"><span class="title">修正登録</span> <span class="description">見本市修正登録対象一覧ページを開きます。</span></a>
										</div>
										<div class="btn">
											<a href="{$config.url}?action_user_top=true"><span class="title">管理者メニューに戻る</span> <span class="description">管理者メニューページを開きます。</span></a>
										</div>
									{elseif ('c' == $form.msg)}
										<div class="btn">
											<a href="{$config.url}?action_user_fairList=true"><span class="title">登録済み見本市一覧に戻る</span> <span class="description">見本市一覧ページを開きます。</span></a>
										</div>
										<div class="btn">
											<a href="{$config.url}?action_user_top=true"><span class="title">管理者メニューに戻る</span> <span class="description">管理者メニューページを開きます。</span></a>
										</div>
									{elseif ('ed' == $form.msg)}
										<div class="btn">
											<a href="{$config.url}?action_user_fairList=true"><span class="title">登録済み見本市一覧に戻る</span> <span class="description">見本市一覧ページを開きます。</span></a>
										</div>
										<div class="btn">
											<a href="{$config.url}?action_user_top=true"><span class="title">管理者メニューに戻る</span> <span class="description">管理者メニューページを開きます。</span></a>
										</div>
									{elseif ('cd' == $form.msg)}
										<div class="btn">
											<a href="{$config.url}?action_user_fairCopyList=true"><span class="title">登録済み見本市修正登録一覧に戻る</span> <span class="description">見本市修正登録一覧ページを開きます。</span></a>
										</div>
										<div class="btn">
											<a href="{$config.url}?action_user_top=true"><span class="title">管理者メニューに戻る</span> <span class="description">管理者メニューページを開きます。</span></a>
										</div>
									{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
				<p class="totop">
{*
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistFinish=true&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
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

