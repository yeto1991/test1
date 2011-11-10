<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />

<title>Expobioenergia 11 - Online Trade Fair Database (J-messe) - JETRO</title>

<!--テスト用-->
<base href="http://produce.jetro.go.jp" />
<!--/テスト用-->
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<link href="/css/en/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/en/database/j-messe/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/en/printmedia.css" rel="stylesheet" type="text/css" media="print" />
<!--以下のCSSは最終的に削除します-->
<link href="/css/en/parts/newmodule.css" rel="stylesheet" type="text/css" media="all" />
<!--/-->

<script type="text/javascript">
<!--
{literal}

	$(function(){
		$("#include_header").load("http://localhost/jmesse/www/enHeader.html");
	});

	$(function(){
		$("#include_footer").load("http://localhost/jmesse/www/enFooter.html");
	});

	$(function(){
		$("#include_left_menu").load("http://localhost/jmesse/www/enLeft_menu.html");
	});

{/literal}
//-->
</script>
</head>

<body class="layout-LC highlight-database j-messe">
	<!-- header -->
	<div id="include_header"></div>
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<!--
		<ul class="clearfix">
			<li><a href="/">HOME</a></li>
			<li><a href="/en/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			<li><a href="/en/j-messe/tradefair/">Trade Fairs held in Japan and the World</a></li>
			<li>Expobioenergia 11</li>
		</ul>
		 -->
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2"><h2>Trade Fairs held in Japan and the World </h2></div>
			<div class="in_main">
				<p>ご登録いただいているメールアドレスを入力してください。</p>
				<div class="login">
					<form name="form_user_enReissuePassword" id="form_user_enReissuePassword" method="post" action="">
						<input type="hidden" name="action_user_enReissuePasswordDo" id="action_user_enReissuePasswordDo" value="dummy" />
						{* エラー表示 *}
						{if count($errors)}
						<p class="error-message" id="error-pagetop">入力に誤りがあります。ご確認ください。</p>
						{/if}
						<table id="registration">
							<tbody>
								{if is_error('email')}
								<tr class="errorcheck">
								{else}
								<tr>
								{/if}
									<th class="item">ご登録メールアドレス</th>
									<td><input name="email" id="email" size="60" type="text" value="{form.email}"><br>
									{if is_error('email')}
									<span class="error-message">{message name="email"}</span><br />
									{/if}
									</td>
								</tr>
							</tbody>
						</table>
						<p class="t_right"><input type="image" src="/j-messe/images/db/btn-send.gif"" alt="送信"  class="over" width="110" height="37"  /></p>
					</form>
				</div>
			</div>
			<p class="totop">
				<!-- <a href="?print=1" target="print"><img src="/images/en/btn-print.gif" alt="Print" width="46" height="14" /></a>  -->
				<a href="javascript:window.scrollTo(0, 0);"><img src="/images/en/totop.gif" alt="Return to PAGETOP" width="103" height="14" /></a>
			</p>
		</div>
		<!-- /main -->
		<!-- submenu -->
		<div id="include_left_menu"></div>
		<!-- /submenu -->
	</div>
	<!-- /contents -->
	<!-- footer -->
	<div id="include_footer" ></div>
	<!-- /footer -->
</body>
</html>