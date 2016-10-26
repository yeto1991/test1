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

	function init() {
		// 展示会に係わる画像(3点)
		document.getElementById('photos_name_1').value = '';
		document.getElementById('photos_name_2').value = '';
		document.getElementById('photos_name_3').value = '';
	}

	/**
	 * 展示会に係わる画像(3点)関連。
	 */
	function delete_photos_list() {
		if (window.confirm('選択された画像ファイルを削除しますか？')) {
			var delfiletag;
			for (var i = document.getElementById('photos_list').length - 1; i >= 0; i--) {
				if (document.getElementById('photos_list').options[i].selected) {
					delfiletag = document.createElement('input');
					delfiletag.type = 'hidden';
					delfiletag.name = 'del_photos_name[]';
					delfiletag.id = 'del_photos_name[]';
					delfiletag.value = document.getElementById('photos_list').options[i].value;
					document.getElementById('form_fairRegistStep2').appendChild(delfiletag);
					document.getElementById('photos_list').remove(i);
				}
			}
		}
	}

	function add_photos(photos) {
		var path = document.getElementById(photos).value;
		if ('' == path) {
			return;
		}

		var paths = path.split('\\');
		if (1 == paths.length) {
			paths = path.split('/');
		}
		var filename = paths[paths.length - 1];

		for (i = 0; i < document.getElementById('photos_list').length; i++) {
			if (filename == document.getElementById('photos_list').options[i].value) {
				window.alert('画像ファイル名が重複しました。');
				return;
			}
		}
		if (3 <= document.getElementById('photos_list').length) {
			window.alert('画像ファイルの登録は3件までです。');
			return;
		}

		var op = document.createElement('option');
		op.value = filename;
		op.innerHTML = filename;
		document.getElementById('photos_list').appendChild(op);
	}

	// submit
	function next() {
		// 展示会に係わる画像(3点)ウイルスチェック判定
		var path_1 = document.getElementById('photos_1').value;
		var path_2 = document.getElementById('photos_2').value;
		var path_3 = document.getElementById('photos_3').value;
		if ('' != path_1 || '' != path_2 || '' != path_3) {
			for (var i = 0; i < document.getElementsByName('virus_check').length; i++) {
				if (document.getElementsByName('virus_check')[i].checked && '0' == document.getElementsByName('virus_check')[i].value) {
					window.alert('アップロードする画像ファイルのウイルスチェックを行なって下さい')
					return;
				}
			}
		}

		// 展示会に係わる画像(3点)
		for (i = 0; i < document.getElementById('photos_list').length; i++) {
			no = i + 1;
			document.getElementById('photos_name_' + String(no)).value = document.getElementById('photos_list').options[i].value;
		}
		document.getElementById('form_fairRegistStep2').submit();
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

<body class="layout-LC highlight-match j-messe" onload="init()">
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
			<li>見本市登録(step2)</li>
			{elseif ('c' == $form.mode)}
			<li><a href="{$config.url}?action_user_fairRegistStep1=true&back=1">見本市修正(step1)</a></li>
			<li>見本市修正(step2)</li>
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
								{if ('' == $form.mode) || ('e' == $form.mode)}
								<h2>見本市登録</h2>
								{elseif ('c' == $form.mode)}
								<h2>見本市修正</h2>
								{/if}
							</div>
							<div class="in_main">
								<h3 class="img t_center">
									<img src="/j-messe/images/db/fair03.jpg" alt="見本市登録　ステップ2" />
								</h3>
								<p>
									公式ウェブサイトの掲載内容に沿ったご登録をお願いいたします。<br />
									ジェトロは一般公開のための審査・承認時に、公式ウェブサイトに基づいて登録内容の修正を行うことがあります。<br />
								</p>
								<p class="t_right">ユーザー：{$session.email}</p>

								{* エラー表示 *}
								{if count($errors)}
								<p class="error-message" id="error-pagetop">入力に誤りがあります。再度、入力ください。</p>
								{/if}

								<form name="form_fairRegistStep2" id="form_fairRegistStep2" method="post" action=""  enctype="multipart/form-data">
									<input type="hidden" name="action_user_fairRegistStep3" id="action_user_fairRegistStep3" value="dummy" />
									<input type="hidden" name="mode" id="mode" value="{$form.mode}" />

									<input type="hidden" name="photos_name_1" id="photos_name_1" value="{$form.photos_name_1}" />
									<input type="hidden" name="photos_name_2" id="photos_name_2" value="{$form.photos_name_2}" />
									<input type="hidden" name="photos_name_3" id="photos_name_3" value="{$form.photos_name_3}" />
									<input type="hidden" name="del_photos_name[]" id="del_photos_name[]" value="" />
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
												<input type="text" value="{$form.fair_title_jp}" size="60" name="fair_title_jp" id="fair_title_jp" maxlength="255" /><br/>
												{if is_error('fair_title_jp')}
												<span class="error-message">{message name="fair_title_jp"}</span><br />
												{/if}
											</td>
										</tr>
									</table>


									<h4>過去の実績</h4>
									<table id="registration">
										{if is_error('year_of_the_trade_fair')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">対象年</th>
											<th class="required"></th>
											<td><select name="year_of_the_trade_fair" size="1" id="year_of_the_trade_fair">
													<option value=""></option>
													{section name=it loop=$app.year_list}
													<option value="{$app.year_list[it]}" {if $app.year_list[it]==$form.year_of_the_trade_fair}selected{/if}>{$app.year_list[it]}</option>
													{/section}
												</select> 年実績<br/>
												{if is_error('year_of_the_trade_fair')}
												<span class="error-message">{message name="year_of_the_trade_fair"}</span><br />
												{/if}
											</td>
										</tr>

										{if is_error('total_number_of_visitor') || is_error('number_of_foreign_visitor')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">総来場者数</th>
											<th class="required"></th>
											<td>
												<input type="text" value="{$form.total_number_of_visitor}" size="10" name="total_number_of_visitor" id="total_number_of_visitor" maxlength="10" /> <strong>人</strong> うち海外から <input type="text" value="{$form.number_of_foreign_visitor}" size="10" name="number_of_foreign_visitor" id="number_of_foreign_visitor" maxlength="10" /> <strong>人</strong><br />
												半角数字で入力して下さい。","(カンマ)は使用しないで下さい。例：1000<br/>
												{if is_error('total_number_of_visitor')}
												<span class="error-message">{message name="total_number_of_visitor"}</span><br />
												{/if}
												{if is_error('number_of_foreign_visitor')}
												<span class="error-message">{message name="number_of_foreign_visitor"}</span><br />
												{/if}
											</td>
										</tr>

										{if is_error('total_number_of_exhibitors') || is_error('number_of_foreign_exhibitors')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">総出社数</th>
											<th class="required"></th>
											<td>
												<input type="text" value="{$form.total_number_of_exhibitors}" size="10" name="total_number_of_exhibitors" id="total_number_of_exhibitors" maxlength="10" /> <strong>社</strong> うち海外から <input type="text" value="{$form.number_of_foreign_exhibitors}" size="10" name="number_of_foreign_exhibitors" id="number_of_foreign_exhibitors" maxlength="10" /> <strong>社</strong><br />
												半角数字で入力して下さい。","(カンマ)は使用しないで下さい。例：1000<br/>
												{if is_error('total_number_of_exhibitors')}
												<span class="error-message">{message name="total_number_of_exhibitors"}</span><br />
												{/if}
												{if is_error('number_of_foreign_exhibitors')}
												<span class="error-message">{message name="number_of_foreign_exhibitors"}</span><br />
												{/if}
											</td>
										</tr>

										{if is_error('net_square_meters')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">開催規模</th>
											<th class="required"></th>
											<td>
												<input type="text" value="{$form.net_square_meters}" size="50" name="net_square_meters" id="net_square_meters" maxlength="50" /> <strong>sq.m.</strong><br />
												半角数字のみ入力して下さい。","(カンマ)は使用しないで下さい。例：1000<br/>
												{if is_error('net_square_meters')}
												<span class="error-message">{message name="net_square_meters"}</span><br />
												{/if}
											</td>
										</tr>
									</table>

									<h4>PR・キャッチフレーズ</h4>
									<table id="registration">
										{if is_error('profile_jp')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">キャッチフレーズ</th>
											<th class="required"></th>
											<td>
												<textarea cols="60" rows="2" name="profile_jp" id="profile_jp">{$form.profile_jp}</textarea><br/>
											 	500文字以内で簡潔に。例：20年の歴史をもつ○○で最大の環境機器の展示会。<br/>
												{if is_error('profile_jp')}
												<span class="error-message">{message name="profile_jp"}</span><br />
												{/if}
											</td>
										</tr>

										{if is_error('detailed_information_jp')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">PR・紹介文</th>
											<th class="required"></th>
											<td>
												<textarea cols="60" rows="6" name="detailed_information_jp" id="detailed_information_jp">{$form.detailed_information_jp}</textarea><br/>
												同時開催/併催展がある場合にはこちらにご記入をお願いします。1000文字以内で。<br/>
												{if is_error('detailed_information_jp')}
												<span class="error-message">{message name="detailed_information_jp"}</span><br />
												{/if}
											</td>
										</tr>

										{if is_error('photos_1') || is_error('photos_2') || is_error('photos_3')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">見本市の紹介写真</th>
											<th class="required"></th>
											<td>
												<input type="file" size="40" name="photos_1" id="photos_1" /> <input type="button" value="登録" onclick="add_photos('photos_1')"/><br />
												<input type="file" size="40" name="photos_2" id="photos_2" /> <input type="button" value="登録" onclick="add_photos('photos_2')"/><br />
												<input type="file" size="40" name="photos_3" id="photos_3" /> <input type="button" value="登録" onclick="add_photos('photos_3')"/><br />
												※画像ファイルをアップロードする際は以下の点にご注意ください。条件を満たさない場合は、正常に登録されません。<br />
												・画像1ファイル辺り2MB以下、縦600×横800ピクセル以内のgifまたはjpegにしてください。<br />
												・またファイル名は、半角英数字(a～ｚ、0～9)のみご使用ください。<br />
												<select name="photos_list" id="photos_list" size="3" style="width:200px">
													{if ('' != $form.photos_name_1) }
													<option value="{$form.photos_name_1}">{$form.photos_name_1}</option>
													{/if}
													{if ('' != $form.photos_name_2) }
													<option value="{$form.photos_name_2}">{$form.photos_name_2}</option>
													{/if}
													{if ('' != $form.photos_name_3) }
													<option value="{$form.photos_name_3}">{$form.photos_name_3}</option>
													{/if}
												</select><br/>
												<input type="button" value="選択画像を削除" onclick="delete_photos_list()" /><br/>
												{if count($errors)}
													{foreach from=$errors item=error}
														{if $error|regex_replace:'/.*見本市の紹介写真.*/i':'見本市の紹介写真' eq '見本市の紹介写真'}
														<span class="error-message">{$error}</span><br />
														{/if}
													{/foreach}
												{/if}
												画像ファイルのウイルスチェックをしましたか？<br/>
												<input type="radio" name="virus_check" id="virus_check_y" value="1" />はい
												<input type="radio" name="virus_check" id="virus_check_n" value="0" checked />いいえ<br/>
												{if is_error('photos_1')}
												<span class="error-message">{message name="photos_1"}</span><br />
												{/if}
												{if is_error('photos_2')}
												<span class="error-message">{message name="photos_2"}</span><br />
												{/if}
												{if is_error('photos_3')}
												<span class="error-message">{message name="photos_3"}</span><br />
												{/if}
											</td>
										</tr>

										{if is_error('keyword')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">検索キーワード</th>
											<th class="required"></th>
											<td>
												複数指定が可能です(5つまで)。複数指定の際は、半角コンマ「,」で区切ってご入力ください。<br />
												<input type="text" value="{$form.keyword}" size="60" name="keyword" id="keyword" maxlength="100" /><br/>
												{if is_error('keyword')}
												<span class="error-message">{message name="keyword"}</span><br />
												{/if}
											</td>
										</tr>
									</table>

									<h4>主催者</h4>
									<table id="registration">
										{if is_error('organizer_jp')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">主催者</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<strong>名称: </strong><input type="text" value="{$form.organizer_jp}" size="60" name="organizer_jp" id="organizer_jp" maxlength="500" /><br/>
												{if is_error('organizer_jp')}
												<span class="error-message">{message name="organizer_jp"}</span><br />
												{/if}
											</td>
										</tr>
										{if is_error('organizer_addr') || is_error('organizer_div') || is_error('organizer_pers') || is_error('organizer_tel') || is_error('organizer_fax') || is_error('organizer_email')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">主催者連絡先</th>
											<th class="required"><img src="/j-messe/images/db/required.gif" height="18" width="30" /></th>
											<td>
												<strong>住所: </strong><input type="text" value="{$form.organizer_addr}" size="30" name="organizer_addr" id="organizer_addr" maxlength="255" /><br />
												<strong>担当部課: </strong><input type="text" value="{$form.organizer_div}" size="30" name="organizer_div" id="organizer_div" maxlength="255" /><br />
												<strong>担当者: </strong><input type="text" value="{$form.organizer_pers}" size="30" name="organizer_pers" id="organizer_pers" maxlength="100" /><br />
												<img src="/j-messe/images/db/required.gif" height="18" width="30" />&nbsp;<strong>TEL: </strong><input type="text" value="{$form.organizer_tel}" size="30" name="organizer_tel" id="organizer_tel" maxlength="100" /><br />
												<strong>FAX: </strong><input type="text" value="{$form.organizer_fax}" size="30" name="organizer_fax" id="organizer_fax" maxlength="100" /><br />
												電話番号はハイフン区切りで国番号から入力してください。（半角数字）<br />
												例：東京の場合 +81-3-1234-5678<br />
												<strong>Email: </strong><input type="text" value="{$form.organizer_email}" size="60" name="organizer_email" id="organizer_email" maxlength="255" /><br />
												{if is_error('organizer_addr')}
												<span class="error-message">{message name="organizer_addr"}</span><br />
												{/if}
												{if is_error('organizer_div')}
												<span class="error-message">{message name="organizer_div"}</span><br />
												{/if}
												{if is_error('organizer_pers')}
												<span class="error-message">{message name="organizer_pers"}</span><br />
												{/if}
												{if is_error('organizer_tel')}
												<span class="error-message">{message name="organizer_tel"}</span><br />
												{/if}
												{if is_error('organizer_fax')}
												<span class="error-message">{message name="organizer_fax"}</span><br />
												{/if}
												{if is_error('organizer_email')}
												<span class="error-message">{message name="organizer_email"}</span><br />
												{/if}
											 </td>
										</tr>
										{if is_error('agency_in_japan_jp') || is_error('agency_in_japan_en') || is_error('agency_in_japan_addr') || is_error('agency_in_japan_div') || is_error('agency_in_japan_pers') || is_error('agency_in_japan_tel') || is_error('agency_in_japan_fax') || is_error('agency_in_japan_email')}
										<tr class="errorcheck">
										{else}
										<tr>
										{/if}
											<th class="item">日本国内の連絡先</th>
											<th class="required"></th>
											<td>
												<strong>海外で開催される見本市で、日本国内に問い合わせ先がある場合</strong><br />
												<strong>名称: </strong><input type="text" value="{$form.agency_in_japan_jp}" size="60" name="agency_in_japan_jp" id="agency_in_japan_jp" maxlength="255" /><br />
												<strong>住所: </strong><input type="text" value="{$form.agency_in_japan_addr}" size="30" name="agency_in_japan_addr" id="agency_in_japan_addr" maxlength="255" /><br />
												<strong>担当部課: </strong><input type="text" value="{$form.agency_in_japan_div}" size="30" name="agency_in_japan_div" id="agency_in_japan_div" maxlength="255" /><br />
												<strong>担当者: </strong><input type="text" value="{$form.agency_in_japan_pers}" size="30" name="agency_in_japan_pers" id="agency_in_japan_pers" maxlength="100" /><br />
												<strong>TEL: </strong><input type="text" value="{$form.agency_in_japan_tel}" size="30" name="agency_in_japan_tel" id="agency_in_japan_tel" maxlength="100" /><br />
												<strong>FAX: </strong><input type="text" value="{$form.agency_in_japan_fax}" size="30" name="agency_in_japan_fax" id="agency_in_japan_fax" maxlength="100" /><br />
												電話番号はハイフン区切りで国番号から入力してください。（半角数字）<br />
												例：東京の場合 +81-3-1234-5678<br />
												<strong>Email: </strong><input type="text" value="{$form.agency_in_japan_email}" size="60" name="agency_in_japan_email" id="agency_in_japan_email" maxlength="255" /><br />
												{if is_error('agency_in_japan_jp')}
												<span class="error-message">{message name="agency_in_japan_jp"}</span><br />
												{/if}
												{if is_error('agency_in_japan_addr')}
												<span class="error-message">{message name="agency_in_japan_addr"}</span><br />
												{/if}
												{if is_error('agency_in_japan_div')}
												<span class="error-message">{message name="agency_in_japan_div"}</span><br />
												{/if}
												{if is_error('agency_in_japan_pers')}
												<span class="error-message">{message name="agency_in_japan_pers"}</span><br />
												{/if}
												{if is_error('agency_in_japan_tel')}
												<span class="error-message">{message name="agency_in_japan_tel"}</span><br />
												{/if}
												{if is_error('agency_in_japan_fax')}
												<span class="error-message">{message name="agency_in_japan_fax"}</span><br />
												{/if}
												{if is_error('agency_in_japan_email')}
												<span class="error-message">{message name="agency_in_japan_email"}</span><br />
												{/if}
											</td>
										</tr>
									</table>
									<div class="line_dot">
										<hr />
									</div>
									<table width="100%">
										<tr>
											{if ('c' == $form.mode || 'e' == $form.mode)}
											<td width="250px"><a href="{$config.url}?action_user_fairRegistStep1=true&mode={$form.mode}&mihon_no={$form.mihon_no}&back=1"><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" /></a></td>
											{else}
											<td width="250px"><a href="{$config.url}?action_user_fairRegistStep1=true&back=1"><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" /></a></td>
											{/if}
											<td align="right"><a href="javascript:next();"><img src="/j-messe/images/db/btn-next.gif" alt="次へ" width="180" height="37" class="over" /></a></td>
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
