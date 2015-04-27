<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
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
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop" onload="init('{$form.select_language_info}')">

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
					<li>見本市登録(step3)</li>
				{elseif ('c' == $form.mode)}
					<li><a href="{$config.url}?action_user_fairRegistStep1=true&back=1">見本市修正(step1)</a></li>
					<li><a href="{$config.url}?action_user_fairRegistStep2=true&back=1">見本市修正(step2)</a></li>
					<li>見本市修正(step3)</li>
				{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('' == $form.mode) || ('e' == $form.mode)}
					<h1>見本市登録</h1>
				{elseif ('c' == $form.mode)}
					<h1>見本市修正</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/j-messe/images/db/fair04.jpg" alt="fairstep3" />
				</div>
			</div>

			<div class="elem_paragraph">
				<p class="text right">ユーザー：{$session.email}</p>
			</div>

			<div class="elem_paragraph">
				<p class="text">
					公式ウェブサイトの掲載内容に沿ったご登録をお願いいたします。<br />
					ジェトロは一般公開のための審査・承認時に、公式ウェブサイトに基づいて登録内容の修正を行うことがあります。
				</p>
			</div>

			{* エラー表示 *}
			{if count($errors)}
				<p class="error-message" id="error-pagetop">入力に誤りがあります。再度、入力ください。</p>
			{/if}

			<form name="form_fairRegistStep3" id="form_fairRegistStep3" method="post" action="" enctype="multipart/form-data">
				<input type="hidden" name="action_user_fairRegistDo" id="action_user_fairRegistDo" value="dummy" />
				<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
				{if ('c' == $form.mode || 'e' == $form.mode)}
				<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
				{/if}
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
						{if is_error('fair_title_jp')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">見本市名</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.fair_title_jp}" size="60" name="fair_title_jp" id="fair_title_jp" maxlength="255" class="var_bg_white" />
									</div>
									{if is_error('fair_title_jp')}
										<span class="error-message">{message name="fair_title_jp"}</span><br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>英文情報 - 海外へ見本市をPRしませんか -</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
						{if is_error('select_language_info')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">海外への紹介を希望しますか</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									<input name="select_language_info" id="select_language_info_2" value="2" type="radio" onclick="engform_on(this);" {if ('2' == $form.select_language_info)}checked{/if} />希望する&nbsp;
									<input name="select_language_info" id="select_language_info_0" value="0" type="radio" onclick="engform_off(this);" {if ('0' == $form.select_language_info || '' == $form.select_language_info)}checked{/if} />希望しない<br/>
									{if is_error('select_language_info')}
										<span class="error-message">{message name="select_language_info"}</span><br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<font color="red">※「希望しない」選択の場合には下記各項目への入力は不要です。</font><br />
				<div class="regist_english" id="engform">
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
						{if is_error('fair_title_en')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Fair Title<br />見本市名</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.fair_title_en}" size="60" name="fair_title_en" id="fair_title_en" maxlength="255" class="var_bg_white" />
									</div>
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
								<th class="bg_gray_lv1 nobdr">Teaser Copy<br />キャッチフレーズ</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
									<div class="elem_custom_input pt0 pb0">
										<textarea cols="60" rows="3" name="profile_en" id="profile_en" class="var_bg_white">{$form.profile_en}</textarea>
										<br/>500文字以内で簡潔に。
									</div>
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
								<th class="bg_gray_lv1 nobdr">Name of the organizer<br />主催者 名称</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.organizer_en}" size="50" name="organizer_en" id="organizer_en" maxlength="500" class="var_bg_white" />
									</div>
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
								<th class="bg_gray_lv1 nobdr">The representative office, person or agency in Japan<br />日本国内の連絡先 名称</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.agency_in_japan_en}" size="50" name="agency_in_japan_en" id="agency_in_japan_en" maxlength="255" class="var_bg_white" />
										<br />海外で開催される見本市で、日本国内に問合せ先がある場合のみ入力ください。
									</div>
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
								<th class="bg_gray_lv1 nobdr">Organizer's statement,special features. etc.<br />PR・紹介文</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
									<div class="elem_custom_input pt0 pb0">
										<textarea cols="60" rows="6" name="detailed_information_en" id="detailed_information_en" class="var_bg_white">{$form.detailed_information_en}</textarea><br />
										<br/>1000文字以内で。
									</div>
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
								<th class="bg_gray_lv1 nobdr">Exhibits<br />出品物</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
									<div class="elem_custom_input pt0 pb0">
										<textarea cols="60" rows="2" name="exhibits_en" id="exhibits_en" class="var_bg_white">{$form.exhibits_en}</textarea><br />
										<br/>300文字以内で。
									</div>
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
								<th class="bg_gray_lv1 nobdr">City (other)<br />開催都市（その他）</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.other_city_en}" size="50" name="other_city_en" id="other_city_en" maxlength="100" class="var_bg_white" />
										<br />「開催都市」でその他にチェックをした方のみ入力してください。
									</div>
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
								<th class="bg_gray_lv1 nobdr">Venue<br />会場</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.venue_en}" size="50" name="venue_en" id="venue_en" maxlength="255" class="var_bg_white" />
										<br />「開催都市」でその他にチェックをした方のみ入力してください。
									</div>
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
								<th class="bg_gray_lv1 nobdr">Method of admission(other)<br />入場方法（その他)</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.other_admission_ticket_en}" size="50" name="other_admission_ticket_en" id="other_admission_ticket_en" maxlength="500" class="var_bg_white" />
										<br />「入場方法」でその他にチェックをした方のみ入力してください。
									</div>
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
								<th class="bg_gray_lv1 nobdr">Details of last fair audited by<br />承認機関</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.spare_field1}" size="50" name="spare_field1" id="spare_field1" maxlength="255" class="var_bg_white" />
										<br />「過去の実績」について承認機関がある場合は入力してください。例：FKM, OJS
									</div>
									{if is_error('spare_field1')}
										<span class="error-message">{message name="spare_field1"}</span><br />
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
						{if ('c' == $form.mode || 'e' == $form.mode)}
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_fairRegistStep2=true&mode={$form.mode}&mihon_no={$form.mihon_no}&back=1" class="var_small"><span class="left">戻る</span></a>
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
												<a href="{$config.url}?action_user_fairRegistStep2=true&back=1" class="var_small"><span class="left">戻る</span></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
						{/if}
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<a href="" onclick="document.form_fairRegistStep3.submit();return false;" class="var_small"><span>確認画面へ</span></a>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</p>
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

