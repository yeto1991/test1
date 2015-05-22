<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
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
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop" onload="init('{$form.select_language_info}', '{$from.mode}')">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="http://www.jetro.go.jp/indexj.html"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">見本市・展示会データベース（J-messe）</a></li>
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
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

{*
$form.mode
''  : 新規登録モードStep.3 → 確認画面 (→ 登録)
'c' : 修正モードStep.3     → 確認画面 (→ 更新)
'd' : My展示会一覧         → 詳細表示 (→ 修正モードStep.1)
'e' : 修正登録モードStep.3 → 確認画面 (→ 登録)
'p' : 修正登録一覧         → 詳細表示 (→ 修正登録モードStep.1)
*}
		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('' == $form.mode) || ('e' == $form.mode)}
					<h1>見本市登録確認</h1>
				{elseif ('c' == $form.mode)}
					<h1>見本市修正確認</h1>
				{else}
					<h1>見本市詳細</h1>
				{/if}
			</div>
		{if ('d' != $form.mode && 'p' != $form.mode)}
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/j-messe/images/db/fair05.jpg" alt="fairdetail">
				</div>
			</div>
		{/if}

			<div class="elem_paragraph">
				<p class="text right">ユーザー：{$session.email}</p>
			</div>

			<form name="form_user_fairDetail" id="form_user_fairDetail" method="post" action="" enctype="multipart/form-data">
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

				<div class="elem_paragraph">
					<p class="text">
						<font color="red">
							{if ('' == $form.mode)}
								見本市新規登録を行いますか？
							{elseif ('e' == $form.mode)}
								以下の見本市データをもとに、見本市新規登録を行いますか？
							{elseif ('c' == $form.mode)}
								以下の見本市データをもとに、見本市の修正を行いますか？
							{elseif ('d' == $form.mode)}
								{if ('0' != $app.fair_start_past_flag)}
									<p><font color="red">登録済みの見本市情報を次回開催の情報へ更新したい場合は、編集登録ページからお願いいたします。</font></p>
								{/if}
							{else}
							{/if}
						</font>
					</p>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
							{if ('' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairRegistStep3=true&back=1" class="var_small"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="" onclick="document.form_user_fairDetail.submit();return false;" class="var_small"><span>はい</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('e' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairRegistStep3=true&mode=e&mihon_no={$form.mihon_no}&back=1"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="" onclick="document.form_user_fairDetail.submit();return false;" class="var_small"><span>はい</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('c' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairRegistStep3=true&mode=c&mihon_no={$form.mihon_no}&back=1" class="var_small"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="" onclick="document.form_user_fairDetail.submit();return false;" class="var_small"><span>はい</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('d' == $form.mode)}
								{if ('0' == $app.fair_start_past_flag)}
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_fairList=true" class="var_small"><span class="left">戻る</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<div id="next_btn">
															<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}', '{$form.mode}')" class="var_small"><span>削除</span></a>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<div id="next_btn">
															<a href="{$config.url}?action_user_fairRegistStep1=true&mode=c&mihon_no={$form.mihon_no}" class="var_small"><span>編集</span></a>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								{else}
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_fairList=true" class="var_small"><span class="left">戻る</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul>
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_fairCopyList=true" class="var_small"><span>編集登録</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
								{/if}
							{elseif ('p' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairCopyList=true" class="var_small"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="{$config.url}?action_user_fairRegistStep1=true&mode=e&mihon_no={$form.mihon_no}" class="var_small"><span>修正登録</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{else}
							{/if}
						</div>
					</div>
				</p>
				<hr />
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>基本情報</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">見本市名</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.fair_title_jp}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">見本市略称</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.abbrev_title}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">見本市公式サイトURL</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.fair_url}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">会期</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.date_from_yyyy}年{$form.date_from_mm}月{$form.date_from_dd}日～{$form.date_to_yyyy}年{$form.date_to_mm}月{$form.date_to_dd}日</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">開催頻度</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$app.frequency_name.discription_jp}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>業種・取扱品目</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">業種</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
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
								<th class="bg_gray_lv1 nobdr">取扱品目</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">{$form.exhibits_jp|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>開催地・会場</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">開催地</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									{$app.region_name.discription_jp}/ {$app.country_name.discription_jp}
									{if ('' != $app.city_name)}
										/ {$app.city_name.discription_jp}
									{/if}
									{if ('' != $form.other_city_jp)}
										/ {$form.other_city_jp}
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">会場名</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.venue_jp}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">開催予定規模(Net)</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.gross_floor_area)}
										{$form.gross_floor_area} sq.m.
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">入場資格</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$app.open_to_name.discription_jp}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">入場方法</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('1' == $form.admission_ticket_1)}
										登録の必要なし<br />
									{/if}
									{if ('1' == $form.admission_ticket_2)}
										公式ウェブサイトからの事前登録<br />
									{/if}
{*
									{if ('1' == $form.admission_ticket_3)}
										主催者もしくは日本国内の連絡先への問い合わせ<br />
									{/if}
*}
									{if ('1' == $form.admission_ticket_4)}
										当日会場で登録もしくはチケット入手<br />
									{/if}
									{if ('1' == $form.admission_ticket_5)}
										その他 ({$form.other_admission_ticket_jp})<br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>過去の実績</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">対象年</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.year_of_the_trade_fair)}
										{$form.year_of_the_trade_fair}年
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">総来場者数</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.total_number_of_visitor || '' != $form.number_of_foreign_visitor)}
										{$form.total_number_of_visitor}人 うち海外から {$form.number_of_foreign_visitor}人
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">総出展社数</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.total_number_of_exhibitors || '' != $form.number_of_foreign_exhibitors)}
										{$form.total_number_of_exhibitors}社 うち海外から {$form.number_of_foreign_exhibitors}社
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">展示面積</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									{if ('' != $form.net_square_meters)}
										{$form.net_square_meters} sq.m.
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>PR・キャッチフレーズ</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">キャッチフレーズ</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">
									{$form.profile_jp|nl2br|replace:"&lt;br/&gt;":"<br/>"}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">PR・紹介文</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">
									{$form.detailed_information_jp|nl2br|replace:"&lt;br/&gt;":"<br/>"}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">見本市の紹介写真</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">
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
								<th class="bg_gray_lv1 nobdr">検索キーワード</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.keyword}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>主催者</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">名称</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.organizer_jp}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">連絡先</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									<strong>住所: </strong>{$form.organizer_addr}<br />
									<strong>担当部課: </strong>{$form.organizer_div}<br />
									<strong>担当者: </strong>{$form.organizer_pers}<br />
									<span class="cate">必須</span>TEL: </strong>{$form.organizer_tel}<br />
									<strong>FAX: </strong>{$form.organizer_fax}<br />
									<strong>Email: </strong>{$form.organizer_email}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">日本国内の連絡先</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<strong>海外で開催される見本市で、日本国内に問い合わせ先がある場合</strong><br />
									<strong>名称： </strong>{$form.agency_in_japan_jp}<br />
									<strong>住所: </strong>{$form.agency_in_japan_addr}<br />
									<strong>担当部課: </strong>{$form.agency_in_japan_div}<br />
									<strong>担当者: </strong>{$form.agency_in_japan_pers}<br />
									<strong>TEL: </strong>{$form.agency_in_japan_tel}<br />
									<strong>FAX: </strong>{$form.agency_in_japan_fax}<br />
									<strong>Email: </strong>{$form.agency_in_japan_email}
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>英文情報</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">海外への紹介を希望</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									{if ('2' == $form.select_language_info)}
									希望する
									{elseif ('0' == $form.select_language_info)}
									希望しない
									{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Fair Title<br />見本市名</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.fair_title_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Teaser Copy<br />キャッチフレーズ</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">{$form.profile_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Name of the organizer<br />主催者 名称</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.organizer_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">The representative office, person or agency in Japan<br />日本国内の連絡先 名称</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.agency_in_japan_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Organizer's statement,special features. etc.<br />PR・紹介文</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">{$form.detailed_information_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Exhibits<br />出品物</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2" style="word-break: break-all;">{$form.exhibits_en|nl2br|replace:"&lt;br/&gt;":"<br/>"}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">City (other)<br />開催都市（その他）</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.other_city_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">City (other)<br />会場</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.venue_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Method of admission(other)<br />入場方法（その他)</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.other_admission_ticket_en}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Details of last fair audited by<br />承認機関</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.spare_field1}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_paragraph">
					<p class="text">
						<font color="red">
							{if ('' == $form.mode)}
								見本市新規登録を行いますか？
							{elseif ('e' == $form.mode)}
								以下の見本市データをもとに、見本市新規登録を行いますか？
							{elseif ('c' == $form.mode)}
								以下の見本市データをもとに、見本市の修正を行いますか？
							{else}
							{/if}
						</font>
					</p>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
							{if ('' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairRegistStep3=true&back=1" class="var_small"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="" onclick="document.form_user_fairDetail.submit();return false;" class="var_small"><span>はい</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('e' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairRegistStep3=true&mode=e&mihon_no={$form.mihon_no}&back=1"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="" onclick="document.form_user_fairDetail.submit();return false;" class="var_small"><span>はい</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('c' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairRegistStep3=true&mode=c&mihon_no={$form.mihon_no}&back=1" class="var_small"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="" onclick="document.form_user_fairDetail.submit();return false;" class="var_small"><span>はい</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{elseif ('d' == $form.mode)}
								{if ('0' == $app.fair_start_past_flag)}
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_fairList=true" class="var_small"><span class="left">戻る</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<div id="next_btn">
															<a href="javascript:fair_delete('{$config.url}', '{$form.mihon_no}', '{$form.mode}')" class="var_small"><span>削除</span></a>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<div id="next_btn">
															<a href="{$config.url}?action_user_fairRegistStep1=true&mode=c&mihon_no={$form.mihon_no}" class="var_small"><span>編集</span></a>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div>
								{else}
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul class="var_large_pad">
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_fairList=true" class="var_small"><span class="left">戻る</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<div class="elem_content_divide_box">
										<div class="elem_linkBox_list">
											<ul>
												<li>
													<div class="linkBox">
														<a href="{$config.url}?action_user_fairCopyList=true" class="var_small"><span>編集登録</span></a>
													</div>
												</li>
											</ul>
										</div>
									</div>
								{/if}
							{elseif ('p' == $form.mode)}
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<a href="{$config.url}?action_user_fairCopyList=true" class="var_small"><span class="left">戻る</span></a>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="elem_content_divide_box">
									<div class="elem_linkBox_list">
										<ul class="var_large_pad">
											<li>
												<div class="linkBox">
													<div id="next_btn">
														<a href="{$config.url}?action_user_fairRegistStep1=true&mode=e&mihon_no={$form.mihon_no}" class="var_small"><span>修正登録</span></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							{else}
							{/if}
						</div>
					</div>
				</p>
				{* テキストエリアの改行コード *}
				<textarea name="br" id="br" style="display:none;"></textarea>
			</form>
			<!-- ** include START jetro_ssl_ja **  -->
			{include file="user/jetro_ssl_ja.tpl"}
			<!-- ** include END jetro_ssl_ja **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>

