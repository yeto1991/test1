<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />
{include file="user/header.tpl"}
<script type="text/javascript">
<!--
{literal}

	function init(select_language_info) {
		if ('2' == select_language_info) {
			var div = $("#engform").removeClass("regist_english");
		}
	}

{/literal}
// -->
</script>
{if ('' == $form.mode) || ('e' == $form.mode)}
<title>見本市登録 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
{elseif ('c' == $form.mode)}
<title>見本市修正 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
{/if}
</head>

<body class="layout-LC highlight-match j-messe" onload="init('{$form.select_language_info}')">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
			{if ('' == $form.mode) || ('e' == $form.mode)}
			<li><a href="{$config.url}?action_user_fairRegistStep1=true&back=1">見本市登録(step1)</a></li>
			<li><a href="{$config.url}?action_user_fairRegistStep2=true&back=1">見本市登録(step2)</a></li>
			<li>見本市登録(step3)</li>
			{elseif ('c' == $form.mode)}
			<li><a href="{$config.url}?action_user_fairRegistStep1=true&back=1">見本市修正(step1)</a></li>
			<li><a href="{$config.url}?action_user_fairRegistStep2=true&back=1">見本市修正(step2)</a></li>
			<li>見本市修正(step3)</li>
			{/if}
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
								<h1>見本市・展示会データベース(J-messe)</h1>
							</div>
							<div class="h2">
								{if ('' == $form.mode) || ('e' == $form.mode)}
								<h2>見本市登録</h2>
								{elseif ('c' == $form.mode)}
								<h2>見本市修正</h2>
								{/if}
							</div>
							<div class="in_main">
								<h3 class="img t_center">
									<img src="/j-messe/images/db/fair04.jpg" alt="見本市登録　ステップ3" />
								</h3>
								<p class="t_right">ユーザー：{$session.email}</p>

								{* エラー表示 *}
								{if count($errors)}
								<p class="error-message" id="error-pagetop">入力に誤りがあります。再度、入力ください。</p>
								{/if}

								<form name="form_fairRegistStep3" id="form_fairRegistStep3" method="post" action="">
									<input type="hidden" name="action_user_fairRegistDo" id="action_user_fairRegistDo" value="dummy" />
									<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
									{if ('c' == $form.mode || 'e' == $form.mode)}
									<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
									{/if}
									<table id="registration">
										{if is_error('fair_title_jp')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">見本市名</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input type="text" value="{$form.fair_title_jp}" size="60" name="fair_title_jp" id="fair_title_jp" maxlength="255" /><br />
												{if is_error('fair_title_jp')}
												<span class="error-message">{message name="fair_title_jp"}</span><br />
												{/if}
											</td>
										</tr>
									</table>

									<h4>英文情報 - 海外へ見本市をPRしませんか -</h4>
									<table id="registration">
										{if is_error('select_language_info')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">海外への紹介を希望しますか</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<input name="select_language_info" id="select_language_info_2" value="2" type="radio" onclick="engform_on(this);" {if ('2' == $form.select_language_info)}checked{/if} />希望する&nbsp;
												<input name="select_language_info" id="select_language_info_0" value="0" type="radio" onclick="engform_off(this);" {if ('0' == $form.select_language_info || '' == $form.select_language_info)}checked{/if} />希望しない<br/>
												{if is_error('select_language_info')}
												<span class="error-message">{message name="select_language_info"}</span><br />
												{/if}
											</td>
										</tr>
									</table>
									<div class="regist_english" id="engform">
										<table id="registration">
											{if is_error('fair_title_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Fair Title<br />見本市名
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<input type="text" value="{$form.fair_title_en}" size="50" name="fair_title_en" id="fair_title_en" maxlength="255" /> <br />
													{if is_error('fair_title_en')}
													<span class="error-message">{message name="fair_title_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('profile_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Teaser Copy<br />キャッチフレーズ
												</th>
												<th class="required"></th>
												<td>
													<textarea cols="60" rows="2" name="profile_en" id="profile_en">{$form.profile_en}</textarea><br/>
													500文字以内で簡潔に。<br/>
													{if is_error('profile_en')}
													<span class="error-message">{message name="profile_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('organizer_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Name of the organizer<br />主催者 名称
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<input type="text" value="{$form.organizer_en}" size="50" name="organizer_en" id="organizer_en" maxlength="500" /><br/>
													{if is_error('organizer_en')}
													<span class="error-message">{message name="organizer_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('agency_in_japan_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">The representative office, person or agency in Japan<br />日本国内の連絡先 名称
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.agency_in_japan_en}" size="50" name="agency_in_japan_en" id="agency_in_japan_en" maxlength="255" /><br />
													海外で開催される見本市で、日本国内に問合せ先がある場合のみ入力ください。<br/>
													{if is_error('agency_in_japan_en')}
													<span class="error-message">{message name="agency_in_japan_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('detailed_information_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Organizer's statement,special features. etc.<br />PR・紹介文
												</th>
												<th class="required"></th>
												<td>
													<textarea cols="60" rows="6" name="detailed_information_en" id="detailed_information_en">{$form.detailed_information_en}</textarea><br/>
													1000文字以内で。<br/>
													{if is_error('detailed_information_en')}
													<span class="error-message">{message name="detailed_information_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('exhibits_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Exhibits<br />出品物
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<textarea cols="60" rows="2" name="exhibits_en" id="exhibits_en">{$form.exhibits_en}</textarea><br/>
													300文字以内で。<br/>
													{if is_error('exhibits_en')}
													<span class="error-message">{message name="exhibits_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('other_city_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">City (other)<br />開催都市（その他）
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.other_city_en}" size="50" name="other_city_en" id="other_city_en" maxlength="100" /><br />
												 	「開催都市」でその他にチェックをした方のみ入力してください。<br/>
													{if is_error('other_city_en')}
													<span class="error-message">{message name="other_city_en"}</span><br />
													{/if}
												 </td>
											</tr>

											{if is_error('venue_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Venue<br />会場
												</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>
													<input type="text" value="{$form.venue_en}" size="50" name="venue_en" id="venue_en" maxlength="255" /><br/>
													{if is_error('venue_en')}
													<span class="error-message">{message name="venue_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('other_admission_ticket_en')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Method of admission(other)<br />入場方法（その他)
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.other_admission_ticket_en}" size="50" name="other_admission_ticket_en" id="other_admission_ticket_en" maxlength="500" /> <br />
													「入場方法」でその他にチェックをした方のみ入力してください。<br/>
													{if is_error('other_admission_ticket_en')}
													<span class="error-message">{message name="other_admission_ticket_en"}</span><br />
													{/if}
												</td>
											</tr>

											{if is_error('spare_field1')}
											<tr class="errorcheck">
											{else}
											<tr>
											{/if}
												<th class="item">Details of last fair audited by<br />承認機関
												</th>
												<th class="required"></th>
												<td>
													<input type="text" value="{$form.spare_field1}" size="50" name="spare_field1" id="spare_field1" maxlength="255" /><br />
													「過去の実績」について承認機関がある場合は入力してください。<br />
													例：FKM, OJS<br/>
													{if is_error('spare_field1')}
													<span class="error-message">{message name="spare_field1"}</span><br />
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
