<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />

<!--テスト用-->
<base href="http://dev.jetro.go.jp" />
<!--/テスト用-->
<link href="/css/jp/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/j-messe/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/jp/printmedia.css" rel="stylesheet" type="text/css" media="print" />
{if ('1' == $form.print)}
<link href="/css/jp/print.css" rel="stylesheet" type="text/css" media="all" />
{/if}

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.tools.min.js"></script>
<script type="text/javascript" src="/j-messe/js/j-messe-form.js" charset="utf-8"></script>
<script type="text/javascript">
<!--
{literal}

	function init(select_language_info) {
		if ('2' == select_language_info) {
			var div = $("#engform").removeClass("regist_english");
		}
	}

	$(function(){
		$("#include_header").load("http://localhost/jmesse/www/header.html");
	});

	$(function(){
		$("#include_footer").load("http://localhost/jmesse/www/footer.html");
	});

	$(function(){
		$("#include_left_menu").load("http://localhost/jmesse/www/left_menu.html");
	});

	function next() {
		if (document.getElementById('select_language_info_0').checked) {
			document.getElementById('fair_title_en').value = '';
			document.getElementById('profile_en').value = '';
			document.getElementById('detailed_information_en').value = '';
			document.getElementById('exhibits_en').value = '';
			document.getElementById('other_city_en').value = '';
			document.getElementById('venue_en').value = '';
			document.getElementById('transportation_en').value = '';
			document.getElementById('other_admission_ticket_en').value = '';
			document.getElementById('organizer_en').value = '';
			document.getElementById('agency_in_japan_en').value = '';
			document.getElementById('spare_field1').value = '';
		}
		document.getElementById('form_fairRegistStep3').submit();
	}

{/literal}
// -->
</script>
<title>見本市登録 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
</head>

<body class="layout-LC highlight-match j-messe" onload="init('{$form.select_language_info}')">
	<!-- header -->
	<div id="include_header"></div>
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="/indexj.html">HOME</a></li>
			<li><a href="/database/">引き合い・展示会検索</a></li>
			<li><a href="/database/j-messe/">見本市・展示会データベース（J-messe）</a></li>
			<li><a href="/database/j-messe/tradefair/">世界の見本市・展示会</a></li>
			<li>見本市登録</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">

		<div class="area">

			<!-- left -->
			<div id="include_left_menu"></div>
			<!-- /left -->

			<!-- center -->
			<div id="center">
				<div id="main">
					<div class="bgbox_set">
						<div class="bgbox_base">
							<div class="h1">
								<h1>見本市・展示会データベース(J-messe)</h1>
							</div>
							<div class="h2">
								<h2>見本市登録</h2>
							</div>
							<div class="in_main">
								<h3 class="img t_center">
									<img src="/j-messe/images/db/fair04.jpg" alt="見本市登録　ステップ3">
								</h3>
								<p class="t_right">
									ユーザー：{$session.email}</a>
								</p>

								{* エラー表示 *}
								{if count($errors)}
								<p class="error-message" id="error-pagetop">入力に誤りがあります。ご確認ください。</p>
								{/if}

								<form name="form_fairRegistStep3" id="form_fairRegistStep3" method="post" action="">
									<input type="hidden" name="action_user_fairRegistDo" id="action_user_fairRegistDo" value="dummy" />
									<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
									{if ('c' == $form.mode || 'e' == $form.mode)}
									<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
									{/if}
									<table id="registration">
										<tr>
										<th class="item">見本市名</th>
										<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
										<td>
											<input type="text" value="{$form.fair_title_jp}" size="60" name="fair_title_jp" id="fair_title_jp" /><br />
											{if count($errors)}
												{foreach from=$errors item=error}
													{if $error|regex_replace:'/.*見本市名.*/i':'見本市名' eq '見本市名'}
													<span class="error-message">{$error}</span><br />
													{/if}
												{/foreach}
											{/if}
										</td>
										</tr>
									</table>
									<h4>英文情報 - 海外へ見本市をPRしませんか -</h4>
									<table id="registration">
										<tr>
											<th class="item">海外への紹介を希望しますか</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input name="select_language_info" id="select_language_info_2" value="2" type="radio" onclick="engform_on(this);" {if ('2' == $form.select_language_info)}checked{/if} />希望する&nbsp;
												<input name="select_language_info" id="select_language_info_0" value="0" type="radio" onclick="engform_off(this);" {if ('0' == $form.select_language_info || '' == $form.select_language_info)}checked{/if} />希望しない<br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*海外への紹介を希望しますか.*/i':'海外への紹介を希望しますか' eq '海外への紹介を希望しますか'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
											</td>
										</tr>
									</table>
									<div class="regist_english" id="engform">
										<table id="registration">
											<tr>
												<th class="item">Fair Title<br />見本市名
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<input type="text" value="{$form.fair_title_en}" size="50" name="fair_title_en" id="fair_title_en" /> <br />
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Title.*/i':'Title' eq 'Title'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
											<tr>
												<th class="item">Teaser Copy<br />キャッチフレーズ
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<textarea cols="60" rows="2" name="profile_en" id="profile_en">{$form.profile_en}</textarea><br/>
													500文字以内で簡潔に。<br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Teaser.*/i':'Teaser' eq 'Teaser'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
											<tr>
												<th class="item">Organizer's statement,special features. etc.<br />PR・紹介文
												</th>
												<th class="required"></th>
												<td>
													<textarea cols="60" rows="6" name="detailed_information_en" id="detailed_information_en">{$form.detailed_information_en}</textarea><br/>
													1000文字以内で。<br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Organizer.*/i':'Organizer' eq 'Organizer'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>

											<tr>
												<th class="item">Exhibits<br />出品物
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<textarea cols="60" rows="2" name="exhibits_en" id="exhibits_en">{$form.exhibits_en}</textarea><br/>
													300文字以内で。<br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Exhibits.*/i':'Exhibits' eq 'Exhibits'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
											<tr>
												<th class="item">City (other)<br />開催都市（その他）
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.other_city_en}" size="50" name="other_city_en" id="other_city_en" /><br />
												 	「開催都市」でその他にチェックをした方のみ入力してください。<br/>
												 	{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*City.*/i':'City' eq 'City'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												 </td>
											</tr>
											<tr>
												<th class="item">Venue<br />会場
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<input type="text" value="{$form.venue_en}" size="50" name="venue_en" id="venue_en" /><br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Venue.*/i':'Venue' eq 'Venue'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
{*
											<tr>
												<th class="item">Transportation<br />交通手段
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<input type="text" value="{$form.transportation_en}" size="50" name="transportation_en" id="transportation_en" /> <br />
													例：30 minutes by bus from xxx airport.<br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Transportation.*/i':'Transportation' eq 'Transportation'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
*}
											<tr>
												<th class="item">Admission ticket(other)<br />チケット入手法（その他)
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.other_admission_ticket_en}" size="50" name="other_admission_ticket_en" id="other_admission_ticket_en" /> <br />
													「チケットの入手方法」でその他にチェックをした方のみ入力してください。<br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*ticket.*/i':'ticket' eq 'ticket'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
{*
											<tr>
												<th class="item">Show Management<br />主催者
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<input type="text" value="{$form.organizer_en}" size="50" name="organizer_en" id="organizer_en" /><br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Management.*/i':'Management' eq 'Management'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
											<tr>
												<th class="item">Agency in Japan<br />日本国内の連絡先
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.agency_in_japan_en}" size="50" name="agency_in_japan_en" id="agency_in_japan_en" /><br />
													海外で開催される見本市で、日本国内に問合せ先がある場合のみ入力ください。<br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*Agency.*/i':'Agency' eq 'Agency'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
*}
											<tr>
												<th class="item">Details of last fair audited by<br />承認機関
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.spare_field1}" size="50" name="spare_field1" id="spare_field1" /><br />
													「過去の実績」について承認機関がある場合は入力してください。<br />
													例：FKM, OJS<br/>
													{if count($errors)}
														{foreach from=$errors item=error}
															{if $error|regex_replace:'/.*audited.*/i':'audited' eq 'audited'}
															<span class="error-message">{$error}</span><br />
															{/if}
														{/foreach}
													{/if}
												</td>
											</tr>
										</table>
									</div>
									<div class="line_dot">
										<hr />
									</div>
									<table width="100%">
										<tr>
											{if ('c' == $form.mode || 'e' == $form.mode)}
											<td width="250px"><a href="{$config.url}?action_user_fairRegistStep2=true&mode={$form.mode}&mihon_no={$form.mihon_no}&back=1"><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" /></a></td>
											{else}
											<td width="250px"><a href="{$config.url}?action_user_fairRegistStep2=true&back=1"><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" /></a></td>
											{/if}
											<td align="right"><input type="image" src="/j-messe/images/db/btn-confirm.gif" alt="確認画面へ" width="180" height="37" class="over" /></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
				<p class="totop">
					{if ('c' == $form.mode || 'e' == $form.mode)}
						{if ('1' == $form.back)}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep3=true&mode={$form.mode}&back=1&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{else}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep3=true&mode={$form.mode}&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{/if}
					{else}
						{if ('1' == $form.back)}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep3=true&back=1&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{else}
					<a href="javascript:window.open('{$config.url}?action_user_fairRegistStep3=true&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
						{/if}
					{/if}
					<a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /></a>
				</p>
			</div>
			<!-- /center -->

		</div>
	</div>
	<!-- /contents -->

	<!-- footer -->
	<div id="include_footer"></div>
	<!-- /footer -->

</body>
</html>
