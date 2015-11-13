<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="include_common_head.tpl"}
<meta name="Keywords" content="見本市,展示会,商談会,見本市　検索,展示会　検索,世界の見本市,世界の展示会,{$app.fair_detail.exhibits_jp|replace:'&lt;br/&gt;':''}, {$app.fair_detail.keyword}" />
<title>
	{if ('' != $app.fair_detail.abbrev_title)}
		{$app.fair_detail.abbrev_title} - {$app.fair_detail.fair_title_jp} - 世界の見本市・展示会 - ジェトロ
	{else}
		{$app.fair_detail.fair_title_jp} - 世界の見本市・展示会 - ジェトロ
	{/if}
</title>
{include file="jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C layout-ja" id="PageTop" oncontextmenu="return false;" oncopy="return false;">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul class="clearfix">
					<li><a href="http://www.jetro.go.jp/indexj.html"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">世界の見本市・展示会情報（J-messe）</a></li>
					{if (''!= $app.fair_detail.abbrev_title)}
						<li>{$app.fair_detail.abbrev_title|mb_truncate:15:'...'} ({$app.fair_detail.fair_title_jp|mb_truncate:15:'...'})</li>
					{else}
						<li>{$app.fair_detail.fair_title_jp|mb_truncate:15:'...'}</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('' != $app.fair_detail.abbrev_title)}
					<h1>{$app.fair_detail.fair_title_jp}<br/>({$app.fair_detail.abbrev_title})</h1>
				{else}
					<h1>{$app.fair_detail.fair_title_jp}</h1>
				{/if}
			</div>
			<div class="elem_paragraph">
				<h3>{$app.fair_detail.profile_jp|replace:"&lt;br/&gt;":"<br/>"}</h3>
			</div>
			{if ('2' == $app.fair_detail.jecc_flag)}
				<div class="elem_pic">
					<div class="right elem_pic_pad">
						<img src="http://www.jetro.go.jp/library/j-messe/images/JECC_UFI_Logo.jpg" alt="new_JECC" />
						<p class="pic_caption">
							<a href="http://www.jetro.go.jp/j-messe/jecc/" />展示会認証制度について</a>
						</p>
					</div>
				</div>
			{/if}
			{if ('1' == $app.fair_detail.jecc_flag)}
				<div class="elem_pic">
					<div class="right elem_pic_pad">
						<img src="http://www.jetro.go.jp/library/j-messe/images/approved_exhibition.jpg" alt="old_JECC" />
						<p class="pic_caption">
							<a href="http://www.jetro.go.jp/j-messe/jecc/" />展示会認証制度について</a>
						</p>
					</div>
				</div>
			{/if}
			{if ('' != $app.fair_detail.fair_url)}
				<div class="elem_heading_lv3">
					<h3><a class="link_blank" target="_blank" href="{$app.fair_detail.fair_url}">公式ウェブサイト</a></h3>
				</div>
			{/if}
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text">
						<div class="elem_table_basic">
							<table class="var_there_boder var_base_color elem_table_basic">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tbody>
									<tr>
										<th>会期</th>
										<td>{$app.fair_detail.date_from_yyyy}年{$app.fair_detail.date_from_mm}月{$app.fair_detail.date_from_dd}日 ～ {$app.fair_detail.date_to_yyyy}年{$app.fair_detail.date_to_mm}月{$app.fair_detail.date_to_dd}日</td>
									</tr>
									<tr>
										<th>開催地</th>
										<td>
											{if ('' != $app.fair_detail.flag_image)}
											<img src="{$config.flag_path}{$app.fair_detail.flag_image}" class="flag">
											{/if}
											{if ('' != $app.fair_detail.other_city_jp)}
											{$app.fair_detail.other_city_jp} /
											{/if}
											{if ('' != $app.fair_detail.city_name)}
											<a href="{$config.url_pub}?action_fairList=true&type=v2&v_2={$app.fair_detail.region}&v_3={$app.fair_detail.country}&v_4={$app.fair_detail.city}">{$app.fair_detail.city_name}</a> /
											{/if}
											<a href="{$config.url_pub}?action_fairList=true&type=v2&v_2={$app.fair_detail.region}&v_3={$app.fair_detail.country}">{$app.fair_detail.country_name}</a> /
											<a href="{$config.url_pub}?action_fairList=true&type=v1&v_2={$app.fair_detail.region}">{$app.fair_detail.region_name}</a>
										</td>
									</tr>
									<tr>
										<th>会場</th>
										<td>
										{if ('' != $app.fair_detail.venue_url)}
											<a target="_blank" href="{$app.fair_detail.venue_url}">{$app.fair_detail.venue_jp}</a><br />
										{else}
											{$app.fair_detail.venue_jp}<br />
										{/if}
											<div style="padding-left: 15px;">
												{if ('' != $app.fair_detail.gross_floor_area && 0 <$app.fair_detail.gross_floor_area)}
												展示面積(Net)：{$app.fair_detail.gross_floor_area|number_format} sq.m.<br />
												{/if}
											</div>
										</td>
									</tr>
									<tr>
										<th>取扱品目</th>
										<td>{$app.fair_detail.exhibits_jp|replace:"&lt;br/&gt;":"<br/>"}</td>
									</tr>
									<tr>
										<th>ご来場の方へ</th>

										<td>
											入場資格:{$app.fair_detail.open_to_name}<br />
											{if ('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_4 || '' != $app.fair_detail.other_admission_ticket_jp)}
											入場方法:
												{if ('1' == $app.fair_detail.admission_ticket_1)}
												登録の必要なし
												{/if}
												{if ('1' == $app.fair_detail.admission_ticket_1 && '1' == $app.fair_detail.admission_ticket_2)}
												/
												{/if}
												{if ('1' == $app.fair_detail.admission_ticket_2)}
												公式ウェブサイトからの事前登録
												{/if}
												{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2) && '1' == $app.fair_detail.admission_ticket_4)}
												/
												{/if}
{*
												{if ('1' == $app.fair_detail.admission_ticket_3)}
												主催者もしくは日本国内の連絡先への問い合わせ
												{/if}
												{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3) && '1' == $app.fair_detail.admission_ticket_4)}
												/
												{/if}
*}
												{if ('1' == $app.fair_detail.admission_ticket_4)}
												当日会場で登録もしくはチケット入手
												{/if}
												{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_4) && '' != $app.fair_detail.other_admission_ticket_jp)}
												/
												{/if}
												{if ('' != $app.fair_detail.other_admission_ticket_jp)}
												{$app.fair_detail.other_admission_ticket_jp}
												{/if}
											{/if}
										<br/>詳細は主催者へ直接お問い合わせください。
										</td>
									</tr>
									<tr>
										<th>主催者</th>
										<td>
											{$app.fair_detail.organizer_jp}<br />
											{if ('' != $app.fair_detail.organizer_addr)}
											住所 : {$app.fair_detail.organizer_addr}<br/>
											{/if}
											{if ('' != $app.fair_detail.organizer_div)}
											担当部課 : {$app.fair_detail.organizer_div}<br/>
											{/if}
											{if ('' != $app.fair_detail.organizer_pers)}
											担当者 : {$app.fair_detail.organizer_pers}<br/>
											{/if}
											TEL : {$app.fair_detail.organizer_tel}<br />
											{if ('' != $app.fair_detail.organizer_fax)}
											FAX : {$app.fair_detail.organizer_fax}<br />
											{/if}
											{if ('' != $app.fair_detail.organizer_email)}
											E-mail : <a href="mailto:{$app.fair_detail.organizer_email}">{$app.fair_detail.organizer_email}</a><br />
											{else}
												{if ('' != $app.fair_detail.inquiry_form_url)}
													問い合わせフォーム : <a class="link_blank" target="_blank" href="{$app.fair_detail.inquiry_form_url}">{$app.fair_detail.inquiry_form_url}</a><br />
												{/if}
											{/if}
											TEL・FAXは国際電話用の国番号から表示されています。<br />
											例 : 東京の場合 +81-3-1234-5678<br />
										</td>
									</tr>
									{if ('' != $app.fair_detail.detailed_information_jp|replace)}
									<tr>
										<th>主催者より</th>
										<td>{$app.fair_detail.detailed_information_jp|replace:"&lt;br/&gt;":"<br/>"}</td>
									</tr>
									{/if}
									{if ('' != $app.fair_detail.agency_in_japan_jp)
										|| ('' != $app.fair_detail.agency_in_japan_addr)
										|| ('' != $app.fair_detail.agency_in_japan_div)
										|| ('' != $app.fair_detail.agency_in_japan_pers)
										|| ('' != $app.fair_detail.agency_in_japan_tel)
										|| ('' != $app.fair_detail.agency_in_japan_fax)
										|| ('' != $app.fair_detail.agency_in_japan_email)
									}
									<tr>
										<th>日本国内の連絡先</th>
										<td>
											{if ('' != $app.fair_detail.agency_in_japan_jp)}
											{$app.fair_detail.agency_in_japan_jp}<br/>
											{/if}
											{if ('' != $app.fair_detail.agency_in_japan_addr)}
											住所 : {$app.fair_detail.agency_in_japan_addr}<br/>
											{/if}
											{if ('' != $app.fair_detail.agency_in_japan_div)}
											担当部課 : {$app.fair_detail.agency_in_japan_div}<br/>
											{/if}
											{if ('' != $app.fair_detail.agency_in_japan_pers)}
											担当者 : {$app.fair_detail.agency_in_japan_pers}<br/>
											{/if}
											{if ('' != $app.fair_detail.agency_in_japan_tel)}
											TEL : {$app.fair_detail.agency_in_japan_tel}<br/>
											{/if}
											{if ('' != $app.fair_detail.agency_in_japan_fax)}
											FAX : {$app.fair_detail.agency_in_japan_fax}<br/>
											{/if}
											{if ('' != $app.fair_detail.agency_in_japan_email)}
											E-mail : {$app.fair_detail.agency_in_japan_email}<br/>
											{/if}
										</td>
									</tr>
									{/if}
									<tr>
										<th>業種</th>

										<td>
											{if ('' != $app.fair_detail.main_industory_1 && '' != $app.fair_detail.sub_industory_1)}
											<a href="{$config.url_pub}?action_fairList=true&type=i1&i_2={$app.fair_detail.main_industory_1}&i_3={$app.fair_detail.sub_industory_1}">{$app.fair_detail.main_industory_name_1}／{$app.fair_detail.sub_industory_name_1}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_2 && '' != $app.fair_detail.sub_industory_2)}
											<a href="{$config.url_pub}?action_fairList=true&type=i1&i_2={$app.fair_detail.main_industory_2}&i_3={$app.fair_detail.sub_industory_2}">{$app.fair_detail.main_industory_name_2}／{$app.fair_detail.sub_industory_name_2}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_3 && '' != $app.fair_detail.sub_industory_3)}
											<a href="{$config.url_pub}?action_fairList=true&type=i1&i_2={$app.fair_detail.main_industory_3}&i_3={$app.fair_detail.sub_industory_3}">{$app.fair_detail.main_industory_name_3}／{$app.fair_detail.sub_industory_name_3}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_4 && '' != $app.fair_detail.sub_industory_4)}
											<a href="{$config.url_pub}?action_fairList=true&type=i1&i_2={$app.fair_detail.main_industory_4}&i_3={$app.fair_detail.sub_industory_4}">{$app.fair_detail.main_industory_name_4}／{$app.fair_detail.sub_industory_name_4}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_5 && '' != $app.fair_detail.sub_industory_5)}
											<a href="{$config.url_pub}?action_fairList=true&type=i1&i_2={$app.fair_detail.main_industory_5}&i_3={$app.fair_detail.sub_industory_5}">{$app.fair_detail.main_industory_name_5}／{$app.fair_detail.sub_industory_name_5}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_6 && '' != $app.fair_detail.sub_industory_6)}
											<a href="{$config.url_pub}?action_fairList=true&type=i1&i_2={$app.fair_detail.main_industory_6}&i_3={$app.fair_detail.sub_industory_6}">{$app.fair_detail.main_industory_name_6}／{$app.fair_detail.sub_industory_name_6}</a><br />
											{/if}
										</td>
									</tr>
									{if ('' != $app.fair_detail.frequency)}
									<tr>
										<th>開催頻度</th>
										<td>
											{$app.fair_detail.frequency_name}
										</td>
									</tr>
									{/if}
									{if ('1' == $app.fair_detail.exhibit_support_flag)}
									<tr>
										<th>JETRO出展支援</th>
										<td>
											<a href="{$app.fair_detail.jetro_suport_url}">ジェトロが出展支援を予定している展示会</a>
										</td>
									</tr>
									{/if}
									{if ('' != $app.fair_detail.year_of_the_trade_fair
										|| ('' != $app.fair_detail.total_number_of_visitor && 0 < $app.fair_detail.total_number_of_visitor))
										|| ('' != $app.fair_detail.number_of_foreign_visitor && 0 < $app.fair_detail.number_of_foreign_visitor)
										|| ('' != $app.fair_detail.total_number_of_exhibitors && 0 < $app.fair_detail.total_number_of_exhibitors)
										|| ('' != $app.fair_detail.number_of_foreign_exhibitors && 0 < $app.fair_detail.number_of_foreign_exhibitors)
										|| ('' != $app.fair_detail.net_square_meters && 0 < $app.fair_detail.net_square_meters)
										|| ('' != $app.fair_detail.spare_field1)
									}
									<tr>
										<th>過去の実績</th>
										<td>
											{if ('' != $app.fair_detail.year_of_the_trade_fair)}
											{$app.fair_detail.year_of_the_trade_fair}年実績<br />
											{/if}
											{if ('' != $app.fair_detail.total_number_of_visitor && 0 < $app.fair_detail.total_number_of_visitor)}
											来場者数 : {$app.fair_detail.total_number_of_visitor} 人
											{/if}
											{if ('' != $app.fair_detail.number_of_foreign_visitor && 0 < $app.fair_detail.number_of_foreign_visitor
												&& $app.fair_detail.number_of_foreign_visitor <= $app.fair_detail.total_number_of_visitor)}
													（うち海外から：{$app.fair_detail.number_of_foreign_visitor} 人）
											{/if}
											{if (('' != $app.fair_detail.total_number_of_visitor && 0 < $app.fair_detail.total_number_of_visitor))
												|| (('' != $app.fair_detail.number_of_foreign_visitor && 0 < $app.fair_detail.number_of_foreign_visitor
														&& $app.fair_detail.number_of_foreign_visitor <= $app.fair_detail.total_number_of_visitor))}
												<br/>
											{/if}
											{if ('' != $app.fair_detail.total_number_of_exhibitors && 0 < $app.fair_detail.total_number_of_exhibitors)}
											出展社数 : {$app.fair_detail.total_number_of_exhibitors} 社
											{/if}
											{if ('' != $app.fair_detail.number_of_foreign_exhibitors && 0 < $app.fair_detail.number_of_foreign_exhibitors
												&& $app.fair_detail.number_of_foreign_exhibitors <= $app.fair_detail.total_number_of_exhibitors)}
													（うち海外から : {$app.fair_detail.number_of_foreign_exhibitors} 社）
											{/if}
											{if (('' != $app.fair_detail.total_number_of_exhibitors && 0 < $app.fair_detail.total_number_of_exhibitors))
												|| (('' != $app.fair_detail.number_of_foreign_exhibitors && 0 < $app.fair_detail.number_of_foreign_exhibitors
														&& $app.fair_detail.number_of_foreign_exhibitors <= $app.fair_detail.total_number_of_exhibitors))}
												<br/>
											{/if}
											{if ('' != $app.fair_detail.net_square_meters && 0 < $app.fair_detail.net_square_meters)}
											展示面積 : {$app.fair_detail.net_square_meters} sq.m.<br/>
											{/if}
											{if ('' != $app.fair_detail.spare_field1)}
											承認機関 : {$app.fair_detail.spare_field1}<br/>
											{/if}
											過去の実績は同時開催/併催展を含む場合もあります。
										</td>
									</tr>
									{/if}
									{if ('' != $app.fair_detail.fair_url)}
									<tr>
										<th>公式ウェブサイト</th>
										<td>こちらの見本市・展示会のさらに詳しい情報は、主催者の<a target="_blank" href="{$app.fair_detail.fair_url}">公式ウェブサイト</a><img class="icon_external" alt="他のサイトへ" src="/images/jp/icon-external.gif">でご確認いただくことができます。</td>
									</tr>
									{/if}
									<tr>
										<th>最終更新日</th>
										<td>
											{if ('' != $app.fair_detail.update_date)}
												{$app.fair_detail.update_date|date_format:"%Y年 %m月 %d日"}
											{else}
												{$app.fair_detail.regist_date|date_format:"%Y年 %m月 %d日"}
											{/if}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="elem_column_block pt30">
							<div class="color_gray elem_column_block_pad">
								<div class="elem_paragraph">
									<p class="text">
										掲載の見本市情報は主催者により変更、延期、中止されることがあります。詳細については直接各主催者のサイト等を確認願います。<br />
										詳しくは<a href="/j-messe/tradefair/terms.html">見本市・展示会情報のご利用について</a>を参照ください。
									</p>
								</div>
							</div>
						</div>
					</div>
					{if ('' != $app.fair_detail.photos_1 || '' != $app.fair_detail.photos_2 || '' != $app.fair_detail.photos_3)}
						<div class="box_pic">
							{if ('' != $app.fair_detail.photos_1)}
								<div class="elem_pic">
									<div class="elem_pic_pad">
										<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_1}" rel="prettyPhoto[gallery]"
											{if ('' != $app.fair_detail.abbrev_title)}
												title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_jp})"
											{else}
												title="{$app.fair_detail.fair_title_jp}"
											{/if}
										>
											<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_1}" width="200px" alt="" />
										</a>
									</div>
								</div>
							{/if}
							{if ('' != $app.fair_detail.photos_2)}
								<div class="elem_pic">
									<div class="elem_pic_pad">
										<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_2}" rel="prettyPhoto[gallery]"
											{if ('' != $app.fair_detail.abbrev_title)}
												title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_jp})"
											{else}
												title="{$app.fair_detail.fair_title_jp}"
											{/if}
										>
											<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_2}" width="200px" alt="" />
										</a>
									</div>
								</div>
							{/if}
							{if ('' != $app.fair_detail.photos_3)}
								<div class="elem_pic">
									<div class="elem_pic_pad">
										<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_3}" rel="prettyPhoto[gallery]"
											{if ('' != $app.fair_detail.abbrev_title)}
												title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_jp})"
											{else}
												title="{$app.fair_detail.fair_title_jp}"
											{/if}
										>
											<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_3}" width="200px" alt="" />
										</a>
									</div>
								</div>
							{/if}
						</div>
					{/if}
				</div>
			</div>
			<!-- **************** jmesse_faqlogin **************** -->
			{$app_ne.jmessefaqlogin}
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
