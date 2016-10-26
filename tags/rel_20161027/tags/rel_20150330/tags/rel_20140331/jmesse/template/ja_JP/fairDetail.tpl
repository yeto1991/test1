<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="見本市、展示会、商談会、{$app.fair_detail.exhibits_jp|replace:'&lt;br/&gt;':''}, {$app.fair_detail.keyword}" />
{include file="header.tpl"}
<title>
{if ('' != $app.fair_detail.abbrev_title)}
{$app.fair_detail.abbrev_title} - {$app.fair_detail.fair_title_jp} - 世界の見本市・展示会 - ジェトロ
{else}
{$app.fair_detail.fair_title_jp} - 世界の見本市・展示会 - ジェトロ
{/if}
</title>
</head>


<body class="layout-LC highlight-match j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			<li><a href="{$config.url_pub}tradefair/">世界の見本市・展示会</a></li>
			{if (''!= $app.fair_detail.abbrev_title)}
			<li>{$app.fair_detail.abbrev_title|mb_truncate:15:'...'} ({$app.fair_detail.fair_title_jp|mb_truncate:15:'...'})</li>
			{else}
			<li>{$app.fair_detail.fair_title_jp|mb_truncate:15:'...'}</li>
			{/if}
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">

		<div class="area">

			<!-- left -->
			<div id="left">
				<div class="bgbox_set">
					<p id="title">
						<a href="http://www.jetro.go.jp/j-messe/">見本市・展示会データベース</a>
					</p>
					<div class="bgbox_base">
						<div class="bgbox_in">
							<div class="submenu no_border">
								<ul class="navi">
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/industry/">業種別に見る</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/country/">開催地別に見る</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/tradefair/">詳細検索</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/new-additions/">新着見本市</a></li>
									<li class="lv01_title"><a href="http://www.jetro.go.jp/j-messe/ranking/">月間ランキング</a></li>
								</ul>
								<ul class="navi">
									<li class="lv01_label">出展お役立ち情報</li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/j-messe/w-info/">見本市レポート</a></li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/services/tradefair/">出展支援</a></li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/j-messe/center/">世界の展示会場</a></li>
									<li class="lv02_title"><a href="http://www.jetro.go.jp/j-messe/business/">世界の見本市ビジネス動向</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="j-messe_left">
					<div class="wrap">
						<dl>
							<dt><img src="/j-messe/images/title-left-organizer.gif" alt="主催者様へ" width="150" height="32" /></dt>
							<dd>J-messeの「見本市・展示会データベース」に見本市の情報を登録できます。<br />
								<strong class="orange">登録は無料！</strong><br />
								ぜひご登録いただき、PRにご活用ください。<br />
								<a href="https://www.jetro.go.jp/j-messe/?action_user_login=true"><img src="/j-messe/images/btn_regist.gif" alt="見本市を登録する" width="140" height="63" class="padding_l05 margin_t10" /></a></dd>
						</dl>
					</div>
					<div class="wrap">
						<dl>
							<dt><img src="/j-messe/images/title-left-inquiry.gif" alt="お問い合わせ" width="150" height="26" /></dt>
							<dd>本コーナーに関するお問い合わせ・ご意見・ご感想はこちらまで<br />
								<a href="javascript:jetro_open_win600('https://www.jetro.go.jp/form5/pub/faa/inquiry_j');"><img src="/j-messe/images/btn_inquiry.gif" alt="お問い合わせフォーム" width="140" height="25" class="over padding_l05 margin_tb10" /></a><br />
								ジェトロ展示事業課<br />
								（TEL：03-3582-5541）</dd>
						</dl>
					</div>
				</div>
			</div>
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
								<h2>世界の見本市・展示会</h2>
							</div>

							<div class="in_main" style="word-break: break-all;">

								{if ('' != $app.fair_detail.abbrev_title)}
								<div class="h3">
								<h3>{$app.fair_detail.abbrev_title}<br/>
								<span>{$app.fair_detail.fair_title_jp}</span></h3>
								</div>
								{else}
								<h3>{$app.fair_detail.fair_title_jp}</h3>
								{/if}

								<p style="word-break: break-all;">{$app.fair_detail.profile_jp|replace:"&lt;br/&gt;":"<br/>"}</p>

								<p class="t_right">
								{if ('1' == $app.fair_detail.jecc_flag)}
									<a href="http://www.jetro.go.jp/j-messe/jecc/" /><img src="/j-messe/images/approved_exhibition.jpg" alt="JECC"></a>
								{/if}
								{if ('' != $app.fair_detail.fair_url)}
									<a class="icon_arrow" target="_blank" href="{$app.fair_detail.fair_url}"><b><font size="4">公式ウェブサイト</font></b></a><img class="icon_external" alt="他のサイトへ" src="/images/jp/icon-external.gif">
								{/if}
								</p>
								<!-- left -->
								{if ('' != $app.fair_detail.photos_1 || '' != $app.fair_detail.photos_2 || '' != $app.fair_detail.photos_3)}
								<div class="left" id="detail">
								{else}
								<div class="left" id="detail-noimg">
								{/if}
									<table class="detail" style="word-break: break-all;">
										<tr>
											<th>会期</th>
											<td>{$app.fair_detail.date_from_yyyy}年{$app.fair_detail.date_from_mm}月{$app.fair_detail.date_from_dd}日 ～ {$app.fair_detail.date_to_yyyy}年{$app.fair_detail.date_to_mm}月{$app.fair_detail.date_to_dd}日</td>

										</tr>
										<tr>
											<th>開催地</th>
											<td>
												{if ('' != $app.fair_detail.flag_image)}
												<img src="{$config.flag_path}{$app.fair_detail.flag_image}" class="flag">
{*
												<img src="{$config.url_pub}{$config.flag_path}{$app.fair_detail.flag_image}" style="vertical-align: middle;">
*}
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
													展示面積：{$app.fair_detail.gross_floor_area|number_format} sq.m.<br />
													{/if}
{*
													{if ('' != $app.fair_detail.transportation_jp)}
													交通手段：{$app.fair_detail.transportation_jp}
													{/if}
*}
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
												{if ('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3 || '1' == $app.fair_detail.admission_ticket_4 || '' != $app.fair_detail.other_admission_ticket_jp)}
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
													{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2) && '1' == $app.fair_detail.admission_ticket_3)}
													/
													{/if}
													{if ('1' == $app.fair_detail.admission_ticket_3)}
													主催者もしくは日本国内の連絡先への問い合わせ
													{/if}
													{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3) && '1' == $app.fair_detail.admission_ticket_4)}
													/
													{/if}
													{if ('1' == $app.fair_detail.admission_ticket_4)}
													当日会場でチケット入手
													{/if}
													{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3 || '1' == $app.fair_detail.admission_ticket_4) && '' != $app.fair_detail.other_admission_ticket_jp)}
													/
													{/if}
													{if ('' != $app.fair_detail.other_admission_ticket_jp)}
													{$app.fair_detail.other_admission_ticket_jp}
													{/if}
												{/if}
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
{*
										{if ('' != $app.fair_detail.keyword)}
										<tr>
											<th>キーワード</th>
											<td>{$app.fair_detail.keyword}</td>
										</tr>
										{/if}
*}
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
									</table>

								</div>
								<!-- /result -->

								{if ('' != $app.fair_detail.photos_1 || '' != $app.fair_detail.photos_2 || '' != $app.fair_detail.photos_3)}
								<div id="picture" class="right">
									{if ('' != $app.fair_detail.photos_1)}
									<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_1}" rel="prettyPhoto[gallery]"
									{if ('' != $app.fair_detail.abbrev_title)}
									title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_jp})"
									{else}
									title="{$app.fair_detail.fair_title_jp}"
									{/if}
									>
										<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_1}" width="200px" alt="" />
									</a>
									{/if}
									{if ('' != $app.fair_detail.photos_2)}
									<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_2}" rel="prettyPhoto[gallery]"
									{if ('' != $app.fair_detail.abbrev_title)}
									title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_jp})"
									{else}
									title="{$app.fair_detail.fair_title_jp}"
									{/if}
									>
										<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_2}" width="200px" alt="" />
									</a>
									{/if}
									{if ('' != $app.fair_detail.photos_3)}
									<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_3}" rel="prettyPhoto[gallery]"
									{if ('' != $app.fair_detail.abbrev_title)}
									title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_jp})"
									{else}
									title="{$app.fair_detail.fair_title_jp}"
									{/if}
									>
										<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_3}" width="200px" alt="" />
									</a>
									{/if}
								</div>
								{/if}
								<br class="clr" />
								<div class="frame_gray inside terms_use">
								<p>
								掲載の見本市情報は主催者により変更、延期、中止されることがあります。詳細については直接各主催者のサイト等を確認願います。<br />
								詳しくは<a href="/j-messe/tradefair/terms.html">見本市・展示会情報のご利用について</a>を参照ください。
								</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<p class="totop">
					<a href="javascript:window.open('{$config.url_pub}tradefair/{$app.fair_detail.mihon_no}/print/1/', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /></a>
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