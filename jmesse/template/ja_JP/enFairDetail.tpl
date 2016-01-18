<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="include_common_head.tpl"}
<meta name="Keywords" content="trade fair database,trade show database,exhibition database,trade fair search,trade show search,exhibition search,trade show  Japan,trade fair  Japan,exhibition  Japan,trade fair worldwide,{$app.fair_detail.exhibits_en|replace:'&lt;br/&gt;':''}, {$app.fair_detail.keyword}" />
<title>
	{if ('' != $app.fair_detail.abbrev_title)}
		{$app.fair_detail.abbrev_title} - {$app.fair_detail.fair_title_en} - {$app.fair_detail.date_from_yyyy}/{$app.fair_detail.date_from_mm} - Online Trade Fair Database (J-messe) - JETRO
	{else}
		{$app.fair_detail.fair_title_en} - {$app.fair_detail.date_from_yyyy}/{$app.fair_detail.date_from_mm} - Online Trade Fair Database (J-messe) - JETRO
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
					<li><a href="/en/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/tradefair/">Trade Fairs held in Japan and the World</a></li>
					{if (''!= $app.fair_detail.abbrev_title)}
						<li>{$app.fair_detail.abbrev_title|mb_truncate:15:'...'} ({$app.fair_detail.fair_title_en|mb_truncate:15:'...'})</li>
					{else}
						<li>{$app.fair_detail.fair_title_en|mb_truncate:15:'...'}</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ('' != $app.fair_detail.abbrev_title)}
					<h1>{$app.fair_detail.fair_title_en}<br/>({$app.fair_detail.abbrev_title})</h1>
				{else}
					<h1>{$app.fair_detail.fair_title_en}</h1>
				{/if}
			</div>
			<div class="elem_paragraph">
				<h3>{$app.fair_detail.profile_en|replace:"&lt;br/&gt;":"<br/>"}</h3>
			</div>
			{if ('2' == $app.fair_detail.jecc_flag)}
				<div class="elem_pic">
					<div class="right elem_pic_pad">
						<img src="http://www.jetro.go.jp/library/j-messe/images/JECC_UFI_Logo.jpg" alt="new_JECC" />
						<p class="pic_caption">
							<a href="http://www.jetro.go.jp/en/database/j-messe/jecc/" />Third-party Certification System for Exhibition Statistics</a>
						</p>
					</div>
				</div>
			{/if}
			{if ('1' == $app.fair_detail.jecc_flag)}
				<div class="elem_pic">
					<div class="right elem_pic_pad">
						<img src="http://www.jetro.go.jp/library/j-messe/images/approved_exhibition.jpg" alt="old_JECC" />
						<p class="pic_caption">
							<a href="http://www.jetro.go.jp/en/database/j-messe/jecc/" />Third-party Certification System for Exhibition Statistics</a>
						</p>
					</div>
				</div>
			{/if}
			{if ('' != $app.fair_detail.fair_url)}
				<div class="elem_heading_lv3">
					<h3><a class="link_blank" target="_blank" href="{$app.fair_detail.fair_url}">To Official Web Site</a></h3>
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
										<th>Date</th>
										<td>{$app.fair_detail.date_from_format} to {$app.fair_detail.date_to_format}</td>
									</tr>
									<tr>
										<th>City / Country</th>
										<td>
											{if ('' != $app.fair_detail.flag_image)}
											<img src="{$config.flag_path}{$app.fair_detail.flag_image}" class="flag">
											{/if}
											{if ('' != $app.fair_detail.other_city_en)}
											{$app.fair_detail.other_city_en} /
											{/if}
											{if ('' != $app.fair_detail.city_name)}
											<a href="{$config.url_pub}?action_enFairList=true&type=v2&v_2={$app.fair_detail.region}&v_3={$app.fair_detail.country}&v_4={$app.fair_detail.city}">{$app.fair_detail.city_name}</a> /
											{/if}
											<a href="{$config.url_pub}?action_enFairList=true&type=v2&v_2={$app.fair_detail.region}&v_3={$app.fair_detail.country}">{$app.fair_detail.country_name}</a> /
											<a href="{$config.url_pub}?action_enFairList=true&type=v1&v_2={$app.fair_detail.region}">{$app.fair_detail.region_name}</a>
										</td>
									</tr>
									<tr>
										<th>Venue</th>
										<td>
										{if ('' != $app.fair_detail.venue_url)}
											<a target="_blank" href="{$app.fair_detail.venue_url}">{$app.fair_detail.venue_en}</a><br />
										{else}
											{$app.fair_detail.venue_en}<br />
										{/if}
											<div style="padding-left: 15px;">
											{if ('' != $app.fair_detail.gross_floor_area && 0 <$app.fair_detail.gross_floor_area)}
											Net square meters：{$app.fair_detail.gross_floor_area|number_format} sq.m.<br />
											{/if}
											</div>
										</td>
									</tr>
									<tr>
										<th>Exhibits</th>
										<td>{$app.fair_detail.exhibits_en|replace:"&lt;br/&gt;":"<br/>"}</td>
									</tr>
									<tr>
										<th>For Visitors</th>
										<td>
											Eligibility:{$app.fair_detail.open_to_name}<br />
											{if ('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_4 || '' != $app.fair_detail.other_admission_ticket_en)}
											Method of admission:
												{if ('1' == $app.fair_detail.admission_ticket_1)}
												Free
												{/if}
												{if ('1' == $app.fair_detail.admission_ticket_1 && '1' == $app.fair_detail.admission_ticket_2)}
												/
												{/if}
												{if ('1' == $app.fair_detail.admission_ticket_2)}
												Apply/register online
												{/if}
												{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2) && '1' == $app.fair_detail.admission_ticket_4)}
												/
												{/if}
{*
												{if ('1' == $app.fair_detail.admission_ticket_3)}
												Contact organizer/agency in Japan
												{/if}
												{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3) && '1' == $app.fair_detail.admission_ticket_4)}
												/
												{/if}
*}
												{if ('1' == $app.fair_detail.admission_ticket_4)}
												Registration/tickets available at event
												{/if}
												{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_4) && '' != $app.fair_detail.other_admission_ticket_en)}
												/
												{/if}
												{if ('' != $app.fair_detail.other_admission_ticket_en)}
												Others:{$app.fair_detail.other_admission_ticket_en}
												{/if}
											{/if}
										<br/>For details, please contact the organizer directly.
										</td>
									</tr>
									<tr>
										<th>Organizer</th>
										<td>
											{$app.fair_detail.organizer_en}<br />
											{if ('1' == $app.fair_detail.select_language_info)}
												{if ('' != $app.fair_detail.organizer_addr)}
												Address : {$app.fair_detail.organizer_addr}<br/>
												{/if}
												{if ('' != $app.fair_detail.organizer_div)}
												Department : {$app.fair_detail.organizer_div}<br/>
												{/if}
												{if ('' != $app.fair_detail.organizer_pers)}
												Person : {$app.fair_detail.organizer_pers}<br/>
												{/if}
											{/if}
											TEL : {$app.fair_detail.organizer_tel}<br />
											{if ('' != $app.fair_detail.organizer_fax)}
											FAX : {$app.fair_detail.organizer_fax}<br />
											{/if}
											{if ('' != $app.fair_detail.organizer_email)}
											E-mail : <a href="mailto:{$app.fair_detail.organizer_email}">{$app.fair_detail.organizer_email}</a><br />
											{else}
												{if ('' != $app.fair_detail.inquiry_form_url)}
													Inquiry Form :<a class="link_blank" target="_blank" href="{$app.fair_detail.inquiry_form_url}">{$app.fair_detail.inquiry_form_url}</a><br />
												{/if}
											{/if}
										</td>
									</tr>
									{if ('' != $app.fair_detail.detailed_information_en|replace)}
									<tr>
										<th>PR</th>
										<td>{$app.fair_detail.detailed_information_en|replace:"&lt;br/&gt;":"<br/>"}</td>
									</tr>
									{/if}
									{if ('' != $app.fair_detail.agency_in_japan_en)
										|| ('' != $app.fair_detail.agency_in_japan_addr)
										|| ('' != $app.fair_detail.agency_in_japan_div)
										|| ('' != $app.fair_detail.agency_in_japan_pers)
										|| ('' != $app.fair_detail.agency_in_japan_tel)
										|| ('' != $app.fair_detail.agency_in_japan_fax)
										|| ('' != $app.fair_detail.agency_in_japan_email)
									}
									<tr>
										<th>The representative office, person or agency in Japan</th>
										<td>
											{if ('' != $app.fair_detail.agency_in_japan_en)}
											{$app.fair_detail.agency_in_japan_en}<br/>
											{/if}
											{if ('1' == $app.fair_detail.select_language_info)}
												{if ('' != $app.fair_detail.agency_in_japan_addr)}
												Address : {$app.fair_detail.agency_in_japan_addr}<br/>
												{/if}
												{if ('' != $app.fair_detail.agency_in_japan_div)}
												Department : {$app.fair_detail.agency_in_japan_div}<br/>
												{/if}
												{if ('' != $app.fair_detail.agency_in_japan_pers)}
												Person : {$app.fair_detail.agency_in_japan_pers}<br/>
												{/if}
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
										<th>Industry</th>
										<td>
											{if ('' != $app.fair_detail.main_industory_1 && '' != $app.fair_detail.sub_industory_1)}
											<a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$app.fair_detail.main_industory_1}&i_3={$app.fair_detail.sub_industory_1}">{$app.fair_detail.main_industory_name_1}／{$app.fair_detail.sub_industory_name_1}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_2 && '' != $app.fair_detail.sub_industory_2)}
											<a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$app.fair_detail.main_industory_2}&i_3={$app.fair_detail.sub_industory_2}">{$app.fair_detail.main_industory_name_2}／{$app.fair_detail.sub_industory_name_2}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_3 && '' != $app.fair_detail.sub_industory_3)}
											<a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$app.fair_detail.main_industory_3}&i_3={$app.fair_detail.sub_industory_3}">{$app.fair_detail.main_industory_name_3}／{$app.fair_detail.sub_industory_name_3}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_4 && '' != $app.fair_detail.sub_industory_4)}
											<a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$app.fair_detail.main_industory_4}&i_3={$app.fair_detail.sub_industory_4}">{$app.fair_detail.main_industory_name_4}／{$app.fair_detail.sub_industory_name_4}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_5 && '' != $app.fair_detail.sub_industory_5)}
											<a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$app.fair_detail.main_industory_5}&i_3={$app.fair_detail.sub_industory_5}">{$app.fair_detail.main_industory_name_5}／{$app.fair_detail.sub_industory_name_5}</a><br />
											{/if}
											{if ('' != $app.fair_detail.main_industory_6 && '' != $app.fair_detail.sub_industory_6)}
											<a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$app.fair_detail.main_industory_6}&i_3={$app.fair_detail.sub_industory_6}">{$app.fair_detail.main_industory_name_6}／{$app.fair_detail.sub_industory_name_6}</a><br />
											{/if}
										</td>
									</tr>
									{if ('' != $app.fair_detail.frequency)}
									<tr>
										<th>Frequency</th>
										<td>{$app.fair_detail.frequency_name}</td>
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
										<th>last fair information</th>
										<td>
											{if ('' != $app.fair_detail.year_of_the_trade_fair)}
											{$app.fair_detail.year_of_the_trade_fair} year<br />
											{/if}
											{if ('' != $app.fair_detail.total_number_of_visitor && 0 < $app.fair_detail.total_number_of_visitor)}
											Total number of visitors : {$app.fair_detail.total_number_of_visitor}
											{/if}
											{if ('' != $app.fair_detail.number_of_foreign_visitor && 0 < $app.fair_detail.number_of_foreign_visitor
												&& $app.fair_detail.number_of_foreign_visitor <= $app.fair_detail.total_number_of_visitor)}
													（including ：{$app.fair_detail.number_of_foreign_visitor} foreign visitors)
											{/if}
											{if (('' != $app.fair_detail.total_number_of_visitor && 0 < $app.fair_detail.total_number_of_visitor))
												|| (('' != $app.fair_detail.number_of_foreign_visitor && 0 < $app.fair_detail.number_of_foreign_visitor
														&& $app.fair_detail.number_of_foreign_visitor <= $app.fair_detail.total_number_of_visitor))}
												<br/>
											{/if}
											{if ('' != $app.fair_detail.total_number_of_exhibitors && 0 < $app.fair_detail.total_number_of_exhibitors)}
											Total number of exhibitors :{$app.fair_detail.total_number_of_exhibitors}
											{/if}
											{if ('' != $app.fair_detail.number_of_foreign_exhibitors && 0 < $app.fair_detail.number_of_foreign_exhibitors
												&& $app.fair_detail.number_of_foreign_exhibitors <= $app.fair_detail.total_number_of_exhibitors)}
													（including : {$app.fair_detail.number_of_foreign_exhibitors} foreign exhibitors)
											{/if}
											{if (('' != $app.fair_detail.total_number_of_exhibitors && 0 < $app.fair_detail.total_number_of_exhibitors))
												|| (('' != $app.fair_detail.number_of_foreign_exhibitors && 0 < $app.fair_detail.number_of_foreign_exhibitors
														&& $app.fair_detail.number_of_foreign_exhibitors <= $app.fair_detail.total_number_of_exhibitors))}
												<br/>
											{/if}
											{if ('' != $app.fair_detail.net_square_meters && 0 < $app.fair_detail.net_square_meters)}
											Net square meters : {$app.fair_detail.net_square_meters} sq.m.<br/>
											{/if}
											{if ('' != $app.fair_detail.spare_field1)}
											Data verified : {$app.fair_detail.spare_field1}<br/>
											{/if}
											The past records may include concurrent/joint exhibits.
										</td>
									</tr>
									{/if}
									{if ('' != $app.fair_detail.fair_url)}
									<tr>
										<th>Official website</th>
										<td>For more detailed information of the trade fair, please check <a target="_blank" href="{$app.fair_detail.fair_url}">the official website</a><img class="icon_external" src="/images/jp/icon-external.gif"> of the individual organizer.</td>
									</tr>
									{/if}
									<tr>
										<th>last update</th>
										<td>
											{if ('' != $app.fair_detail.update_date)}
												{$app.fair_detail.update_date}
											{else}
												{$app.fair_detail.regist_date}

											{/if}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="elem_column_block pt30">

						</div>
					</div>
					{if ('' != $app.fair_detail.photos_1 || '' != $app.fair_detail.photos_2 || '' != $app.fair_detail.photos_3)}
						<div class="box_pic">
							{if ('' != $app.fair_detail.photos_1)}
								<div class="elem_pic">
									<div class="elem_pic_pad">
										<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_1}" rel="prettyPhoto[gallery]"
											{if ('' != $app.fair_detail.abbrev_title)}
												title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_en})"
											{else}
												title="{$app.fair_detail.fair_title_en}"
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
												title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_en})"
											{else}
												title="{$app.fair_detail.fair_title_en}"
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
												title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_en})"
											{else}
												title="{$app.fair_detail.fair_title_en}"
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

