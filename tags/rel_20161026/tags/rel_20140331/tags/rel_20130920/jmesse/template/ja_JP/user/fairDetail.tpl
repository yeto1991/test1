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

	function init(select_language_info, mode) {
		if ('2' == select_language_info) {
			var div = $("#engform").removeClass("regist_english");
		}

		// Changeモードと詳細表示以外では重複がある場合警告
		if ('c' != mode && 'd' != mode && 'p' != mode) {
			var msg = '';
{/literal}
			{section name=it loop=$app.duplication_list}
			{if '' != $app.duplication_list[it].fair_title_jp}
			msg += "　・{$app.duplication_list[it].fair_title_jp}\n";
			{else}
			msg += "　・{$app.duplication_list[it].fair_title_en}\n";
			{/if}
			{/section}
{literal}
			if ('' != msg) {
				msg = "下記の展示会と会期、開催地、業種が重複しています。\nご確認下さい。\n\n" + msg;
				window.alert(msg);
			}
		}
	}

	function fair_delete(url, mihon_no, mode) {
		if (window.confirm('削除します。よろしいですか？')) {
			document.location.href = url + '?action_user_fairDel=true&mihon_no=' + mihon_no + '&mode=' + mode;
		}
	}

{/literal}
//-->
</script>
{if ('' == $form.mode) || ('e' == $form.mode)}
<title>見本市登録 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
{elseif ('c' == $form.mode)}
<title>見本市修正 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
{else}
<title>見本市詳細 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
{/if}
</head>

<body class="layout-LC highlight-match j-messe" onload="init('{$form.select_language_info}', '{$from.mode}')">
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
			<li><a href="{$config.url}?action_user_fairRegistStep3=true&back=1">見本市登録(step3)</a></li>
			<li>見本市登録確認</li>
			{elseif ('c' == $form.mode)}
			<li><a href="{$config.url}?action_user_fairRegistStep1=true&back=1">見本市修正(step1)</a></li>
			<li><a href="{$config.url}?action_user_fairRegistStep2=true&back=1">見本市修正(step2)</a></li>
			<li><a href="{$config.url}?action_user_fairRegistStep3=true&back=1">見本市修正(step3)</a></li>
			<li>見本市修正確認</li>
			{else}
			<li>見本市詳細</li>
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
								<h1>見本市・展示会データベース</h1>
							</div>
							<div class="h2">
{*
$form.mode
''  : 新規登録モードStep.3 → 確認画面 (→ 登録)
'c' : 修正モードStep.3     → 確認画面 (→ 更新)
'd' : My展示会一覧         → 詳細表示 (→ 修正モードStep.1)
'e' : 修正登録モードStep.3 → 確認画面 (→ 登録)
'p' : 修正登録一覧         → 詳細表示 (→ 修正登録モードStep.1)
*}
								{if ('' == $form.mode) || ('e' == $form.mode)}
								<h2>見本市登録</h2>
								{elseif ('c' == $form.mode)}
								<h2>見本市修正</h2>
								{else}
								<h2>見本市詳細</h2>
								{/if}
							</div>

							<form name="form_user_fairDetail" id="form_user_fairDetail" method="post" action="" >
								{uniqid}
								{if ('d' == $form.mode)}
								<input type="hidden" name="action_user_fairChangeStep1" id="action_user_fairChangeStep1" value="dummy" />
								<input type="hidden" name="mode" id="mode" value="c" />
								{elseif ('p' == $form.mode)}
								<input type="hidden" name="action_user_fairChangeStep1" id="action_user_fairChangeStep1" value="dummy" />
								<input type="hidden" name="mode" id="mode" value="e" />
								{else}
								<input type="hidden" name="action_user_fairRegistDone" id="action_user_fairRegistDone" value="dummy" />
								<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
									{if ('c' == $form.mode || 'e' == $form.mode)}
								<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
									{/if}
								{/if}
								<input type="hidden" name="" mihon_no"" id="mihon_no" value="{$form.mihon_no}" />

								<div class="in_main">
									{if ('d' != $form.mode && 'p' != $form.mode)}
									<h3 class="img t_center">
										<img src="/j-messe/images/db/fair05.jpg" alt="見本市登録　ステップ4">
									</h3>
									{/if}

										<p class="t_right">ユーザー：{$session.email}</p>

										{if ('' == $form.mode)}
										<p><strong><span class="red">見本市新規登録を行いますか？</span></strong></p>
										<p>
											<a href="{$config.url}?action_user_fairRegistStep3=true&back=1"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
											<input type="image" width="110" height="37" class="over" alt="はい" src="/j-messe/images/db/btn-yes.gif" />
										</p>
										{elseif ('e' == $form.mode)}
										<p><strong><span class="red">以下の見本市データをもとに、見本市新規登録を行いますか？</span></strong></p>
										<p>
											<a href="{$config.url}?action_user_fairRegistStep3=true&mode=e&mihon_no={$form.mihon_no}&back=1"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
											<input type="image" width="110" height="37" class="over" alt="はい" src="/j-messe/images/db/btn-yes.gif" />
										</p>
										{elseif ('c' == $form.mode)}
										<p><strong><span class="red">以下の見本市データをもとに、見本市の修正を行いますか？</span></strong></p>
										<p>
											<a href="{$config.url}?action_user_fairRegistStep3=true&mode=c&mihon_no={$form.mihon_no}&back=1"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
											<input type="image" width="110" height="37" class="over" alt="はい" src="/j-messe/images/db/btn-yes.gif" />
										</p>
										{elseif ('d' == $form.mode)}
										<p></p>
										<p>
											<a href="{$config.url}?action_user_fairList=true"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
											削除<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}', '{$form.mode}')"><img src="/j-messe/images/db/btn-yes.gif" alt="削除" class="over" /></a>
											修正<a href="{$config.url}?action_user_fairRegistStep1=true&mode=c&mihon_no={$form.mihon_no}"><img src="/j-messe/images/db/btn-yes.gif" alt="編集" class="over" /></a>
										</p>
										{elseif ('p' == $form.mode)}
										<p></p>
										<p>
											<a href="{$config.url}?action_user_fairCopyList=true"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
											削除<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}', '{$form.mode}')"><img src="/j-messe/images/db/btn-yes.gif" alt="削除" class="over" /></a>
											修正登録<a href="{$config.url}?action_user_fairRegistStep1=true&mode=e&mihon_no={$form.mihon_no}"><img src="/j-messe/images/db/btn-yes.gif" alt="編集" class="over" /></a>
										</p>
										{else}
										{/if}

										<div class="line_dot">
											<hr />
										</div>
								</div>

								<div class="in_main" style="word-break: break-all;">
									<h4>基本情報</h4>
									<table id="registration">
										<tr>
											<th class="item">見本市名</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>{$form.fair_title_jp}</td>
										</tr>
										<tr>
											<th class="item">見本市略称</th>
											<th class="required"></th>
											<td>{$form.abbrev_title}</td>
										</tr>
										<tr>
											<th class="item">見本市公式サイトURL</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>{$form.fair_url}</td>
										</tr>
										<tr>
											<th class="item">会期</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>{$form.date_from_yyyy}年{$form.date_from_mm}月{$form.date_from_dd}日～{$form.date_to_yyyy}年{$form.date_to_mm}月{$form.date_to_dd}日</td>
										</tr>
										<tr>
											<th class="item">開催頻度</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>{$app.frequency_name.discription_jp}</td>
										</tr>
									</table>
									<h4>業種・取扱品目</h4>
									<table id="registration">
										<tr>
											<th class="item">業種</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												{$form.main_industory_name_1}/{$form.sub_industory_name_1}<br />
												{if ('' != $form.main_industory_name_2)}
												{$form.main_industory_name_2}/{$form.sub_industory_name_2}<br />
												{/if}
												{if ('' != $form.main_industory_name_3)}
												{$form.main_industory_name_3}/{$form.sub_industory_name_3}<br />
												{/if}
												{if ('' != $form.main_industory_name_4)}
												{$form.main_industory_name_4}/{$form.sub_industory_name_4}<br />
												{/if}
												{if ('' != $form.main_industory_name_5)}
												{$form.main_industory_name_5}/{$form.sub_industory_name_5}<br />
												{/if}
												{if ('' != $form.main_industory_name_6)}
												{$form.main_industory_name_6}/{$form.sub_industory_name_6}<br />
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">取扱品目</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td style="word-break: break-all;">{$form.exhibits_jp|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
										</tr>
									</table>
									<h4>開催地・会場</h4>
									<table id="registration">
										<tr>
											<th class="item">開催地</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												{$app.region_name.discription_jp}
												/ {$app.country_name.discription_jp}
												{if ('' != $app.city_name)}
												/ {$app.city_name.discription_jp}
												{/if}
												{if ('' != $form.other_city_jp)}
												/ {$form.other_city_jp}
												{/if}
											<br /></td>
										</tr>
										<tr>
											<th class="item">会場名</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>{$form.venue_jp}</td>
										</tr>
										<tr>
											<th class="item">同展示会で使用する面積</th>
											<th class="required"></th>
											<td>
											{if ('' != $form.gross_floor_area)}
												{$form.gross_floor_area} sq.m.
											{/if}
											</td>
										</tr>
										<tr>
											<th class="item">入場資格</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>{$app.open_to_name.discription_jp}</td>
										</tr>
										<tr>
											<th class="item">チケットの入手方法</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												{if ('1' == $form.admission_ticket_1)}
												登録の必要なし<br />
												{/if}
												{if ('1' == $form.admission_ticket_2)}
												WEBからの事前登録<br />
												{/if}
												{if ('1' == $form.admission_ticket_3)}
												主催者・日本の照会先へ問い合わせ<br />
												{/if}
												{if ('1' == $form.admission_ticket_4)}
												当日会場で入手<br />
												{/if}
												{if ('1' == $form.admission_ticket_5)}
												その他 ({$form.other_admission_ticket_jp})<br />
												{/if}
											</td>
										</tr>
									</table>
									<h4>過去の実績</h4>
									<table id="registration">
										<tr>
											<th class="item">対象年</th>
											<th class="required"></th>
											<td>
												{if ('' != $form.year_of_the_trade_fair)}
												{$form.year_of_the_trade_fair}年
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">総来場者数</th>
											<th class="required"></th>
											<td>
												{if ('' != $form.total_number_of_visitor || '' != $form.number_of_foreign_visitor)}
												{$form.total_number_of_visitor}人 うち海外から {$form.number_of_foreign_visitor}人
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">総出展社数</th>
											<th class="required"></th>
											<td>
												{if ('' != $form.total_number_of_exhibitors || '' != $form.number_of_foreign_exhibitors)}
												{$form.total_number_of_exhibitors}社 うち海外から {$form.number_of_foreign_exhibitors}社
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">展示面積</th>
											<th class="required"></th>
											<td>
												{if ('' != $form.net_square_meters)}
												{$form.net_square_meters} sq.m.
												{/if}
											</td>
										</tr>
									</table>
									<h4>PR・キャッチフレーズ</h4>
									<table id="registration">
										<tr>
											<th class="item">キャッチフレーズ</th>
											<th class="required"></th>
											<td style="word-break: break-all;">{$form.profile_jp|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
										</tr>
										<tr>
											<th class="item">PR・紹介文</th>
											<th class="required"></th>
											<td style="word-break: break-all;">{$form.detailed_information_jp|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
										</tr>
										<tr>
											<th class="item">見本市の紹介写真</th>
											<th class="required"></th>
											<td>
												{section name=it loop=$session.display_photos_path}
													画像({$session.display_photos_no[it]})：{$session.display_photos_name[it]}<br />
													<img src="{$config.url}{$session.display_photos_path[it]}" alt="{$session.display_photos_name[it]}" width="150" /><br /><br />
												{/section}
												{if ('' == $form.mode) || ('c' == $form.mode) || ('e' == $form.mode)}
													選択した画像ファイルが正常に表示されていない場合は、正常に登録されません。<br />
													正常に表示されていない場合は登録Step2画面に戻り、画像ファイルに関する注意点をご確認の上、画像を再選択してください。<br />
												{/if}
											</td>
										</tr>
										<tr>
											<th class="item">検索キーワード</th>
											<th class="required"></th>
											<td>{$form.keyword}</td>
										</tr>
									</table>
									<h4>主催者</h4>
									<table id="registration">
										<tr>
											<th class="item">主催者</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<strong>名称: </strong>{$form.organizer_jp}<br />
											</td>
										</tr>
										<tr>
											<th class="item">主催者連絡先</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<strong>住所: </strong>{$form.organizer_addr}<br />
												<strong>担当部課: </strong>{$form.organizer_div}<br />
												<strong>担当者: </strong>{$form.organizer_pers}<br />
												<img src="/j-messe/images/db/required.gif" height="18" width="30" /><strong>TEL: </strong>{$form.organizer_tel}<br />
												<strong>FAX: </strong>{$form.organizer_fax}<br />
												<strong>Email: </strong>{$form.organizer_email}<br />
											</td>
										</tr>
										<tr>
											<th class="item">日本国内の照会先</th>
											<th class="required"></th>
											<td>
												<strong>海外で開催される見本市で、日本国内に問い合わせ先がある場合</strong><br />
												<strong>名称： </strong>{$form.agency_in_japan_jp}<br />
												<strong>住所: </strong>{$form.agency_in_japan_addr}<br />
												<strong>担当部課: </strong>{$form.agency_in_japan_div}<br />
												<strong>担当者: </strong>{$form.agency_in_japan_pers}<br />
												<strong>TEL: </strong>{$form.agency_in_japan_tel}<br />
												<strong>FAX: </strong>{$form.agency_in_japan_fax}<br />
												<strong>Email: </strong>{$form.agency_in_japan_email}<br />
											</td>
										</tr>
									</table>
									<h4>英文情報</h4>
									<table id="registration">
										<tr>
											<th class="item">海外への紹介を希望</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												{if ('2' == $form.select_language_info)}
												希望する
												{elseif ('0' == $form.select_language_info)}
												希望しない
												{/if}
											</td>
										</tr>
									</table>
									<div class="regist_english" id="engform">
										<table id="registration">
											<tr>
												<th class="item">Fair Title<br />見本市名</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>{$form.fair_title_en}</td>
											</tr>
											<tr>
												<th class="item">Teaser Copy<br />キャッチフレーズ</th>
												<th class="required"></th>
												<td style="word-break: break-all;">{$form.profile_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
											</tr>
											<tr>
												<th class="item">Name of the organizer<br />主催者 名称</th>
												<th class="required"></th>
												<td>{$form.organizer_en}</td>
											</tr>
											<tr>
												<th class="item">The representative office, person or agency in Japan<br />日本国内の連絡先 名称</th>
												<th class="required"></th>
												<td>{$form.agency_in_japan_en}</td>
											</tr>
											<tr>
												<th class="item">Organizer's statement,special features. etc.<br />PR・紹介文</th>
												<th class="required"></th>
												<td style="word-break: break-all;">{$form.detailed_information_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
											</tr>
											<tr>
												<th class="item">Exhibits<br />出品物</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td style="word-break: break-all;">{$form.exhibits_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
											</tr>
											<tr>
												<th class="item">City (other)<br />開催都市（その他）</th>
												<th class="required"></th>
												<td>{$form.other_city_en}</td>
											</tr>
											<tr>
												<th class="item">Venue<br />会場</th>
												<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
												<td>{$form.venue_en}</td>
											</tr>
											<tr>
												<th class="item">Admission ticket(other)<br />チケット入手法（その他)</th>
												<th class="required"></th>
												<td>{$form.other_admission_ticket_en}</td>
											</tr>
											<tr>
												<th class="item">Details of last fair audited by<br />承認機関</th>
												<th class="required"></th>
												<td>{$form.spare_field1}</td>
											</tr>
										</table>
									</div>
									<div class="line_dot">
										<hr />
									</div>
								</div>
								<div class="in_main">
									{if ('' == $form.mode)}
									<p><strong><span class="red">見本市新規登録を行いますか？</span></strong></p>
									<p>
										<a href="{$config.url}?action_user_fairRegistStep3=true&back=1"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
										<input type="image" width="110" height="37" class="over" alt="はい" src="/j-messe/images/db/btn-yes.gif" />
									</p>
									{elseif ('e' == $form.mode)}
									<p><strong><span class="red">以下の見本市データをもとに、見本市新規登録を行いますか？</span></strong></p>
									<p>
										<a href="{$config.url}?action_user_fairRegistStep3=true&mode=e&mihon_no={$form.mihon_no}&back=1"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
										<input type="image" width="110" height="37" class="over" alt="はい" src="/j-messe/images/db/btn-yes.gif" />
									</p>
									{elseif ('c' == $form.mode)}
									<p><strong><span class="red">以下の見本市データをもとに、見本市の修正を行いますか？</span></strong></p>
									<p>
										<a href="{$config.url}?action_user_fairRegistStep3=true&mode=c&mihon_no={$form.mihon_no}&back=1"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
										<input type="image" width="110" height="37" class="over" alt="はい" src="/j-messe/images/db/btn-yes.gif" />
									</p>
									{elseif ('d' == $form.mode)}
									<p></p>
									<p>
										<a href="{$config.url}?action_user_fairList=true"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
										削除<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}, '{$form.mode}')"><img src="/j-messe/images/db/btn-yes.gif" alt="削除" class="over" /></a>
										修正<a href="{$config.url}?action_user_fairRegistStep1=true&mode=c&mihon_no={$form.mihon_no}"><img src="/j-messe/images/db/btn-yes.gif" alt="編集" class="over" /></a>
									</p>
									{elseif ('p' == $form.mode)}
									<p></p>
									<p>
										<a href="{$config.url}?action_user_fairCopyList=true"><img width="110" height="37" class="over" alt="戻る" src="/j-messe/images/db/btn-back.gif" /></a>
										削除<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}, '{$form.mode}')"><img src="/j-messe/images/db/btn-yes.gif" alt="削除" class="over" /></a>
										修正登録<a href="{$config.url}?action_user_fairRegistStep1=true&mode=e&mihon_no={$form.mihon_no}"><img src="/j-messe/images/db/btn-yes.gif" alt="編集" class="over" /></a>
									</p>
									{else}
									{/if}
								</div>
{* テキストエリアの改行コード *}
								<textarea name="br" id="br" style="display:none;">

								</textarea>
								</form>
							</div>
						</div>
					</div>
				</div>
				<p class="totop">
				 	{if ('d' == $form.mode || 'p' == $form.mode)}
				 	<a href="javascript:window.open('{$config.url}?action_user_fairDetail=true&mode={$form.mode}&mihon_no={$form.mihon_no}&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
				 	{/if}
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
