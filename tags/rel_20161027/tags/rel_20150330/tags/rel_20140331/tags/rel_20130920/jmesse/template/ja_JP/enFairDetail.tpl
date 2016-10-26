<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="見本市、展示会、商談会、{$app.fair_detail.exhibits_en|replace:'&lt;br/&gt;':''}, {$app.fair_detail.keyword}" />
{include file="enHeader.tpl"}
<title>
{if ('' != $app.fair_detail.abbrev_title)}
{$app.fair_detail.abbrev_title} - {$app.fair_detail.fair_title_en} - Online Trade Fair Database (J-messe) - JETRO
{else}
{$app.fair_detail.fair_title_en} - Online Trade Fair Database (J-messe) - JETRO
{/if}
</title>
</head>

<body class="layout-LC highlight-database j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->
	<!-- bread -->
	<div id="bread">
		<ul class="clearfix">
			<li><a href="http://www.jetro.go.jp/">HOME</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
			<li><a href="http://www.jetro.go.jp/en/database/j-messe/tradefair/">Trade Fairs held in Japan and the World</a></li>
			{if (''!= $app.fair_detail.abbrev_title)}
			<li>{$app.fair_detail.abbrev_title|mb_truncate:15:'...'} ({$app.fair_detail.fair_title_en|mb_truncate:15:'...'})</li>
			{else}
			<li>{$app.fair_detail.fair_title_en|mb_truncate:15:'...'}</li>
			{/if}
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">
		<!-- main -->
		<div id="main">
			<h1>Online Trade Fair Database (J-messe)</h1>
			<div class="h2">
				<h2>Trade Fairs held in Japan and the World</h2>
			</div>
			<div class="in_main" style="word-break: break-all;">
				{if ('' != $app.fair_detail.abbrev_title)}
				<h3>{$app.fair_detail.abbrev_title}<br/>
				<span>{$app.fair_detail.fair_title_en}</span></h3>
				{else}
				<h3>{$app.fair_detail.fair_title_en}</h3>
				{/if}

				<p style="word-break: break-all;">{$app.fair_detail.profile_en|replace:"&lt;br/&gt;":"<br/>"}</p>

				<p class="t_right">
				{if ('1' == $app.fair_detail.jecc_flag)}
					<a href="http://www.jetro.go.jp/en/database/j-messe/jecc/" /><img src="/j-messe/images/approved_exhibition.jpg" alt="JECC"></a>
				{/if}
				{if ('' != $app.fair_detail.fair_url)}
					<a class="icon_arrow" target="_blank" href="{$app.fair_detail.fair_url}">official site</a><img class="icon_external" alt="他のサイトへ" src="/images/jp/icon-external.gif">
				{/if}
				</p>
				<!-- left -->

				<!-- left -->
				{if ('' != $app.fair_detail.photos_1 || '' != $app.fair_detail.photos_2 || '' != $app.fair_detail.photos_3)}
				<div class="left" id="detail">
				{else}
				<div class="left" id="detail-noimg">
				{/if}
					<table class="detail" style="word-break: break-all;">
						<tr>
							<th>Date</th>
							<td>{$app.fair_detail.date_from_format} to {$app.fair_detail.date_to_format}</td>
						</tr>
						<tr>
							<th>City / Country</th>
							<td>
								{if ('' != $app.fair_detail.flag_image)}
								<img src="{$config.flag_path}{$app.fair_detail.flag_image}" class="flag">
{*
								<img src="{$config.url_pub}{$config.flag_path}{$app.fair_detail.flag_image}" style="vertical-align: middle;">
*}
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
							{if ('' != $app.fair_detail.venue_url && '0' == $app.is_end)}
								<a target="_blank" href="{$app.fair_detail.venue_url}">{$app.fair_detail.venue_en}</a><br />
							{else}
								{$app.fair_detail.venue_en}<br />
							{/if}
								<div style="padding-left: 15px;">
								{if ('' != $app.fair_detail.gross_floor_area && 0 <$app.fair_detail.gross_floor_area)}
								Net square meters：{$app.fair_detail.gross_floor_area|number_format} sq.m.<br />
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
							<th>Exhibits</th>
							<td>{$app.fair_detail.exhibits_en|replace:"&lt;br/&gt;":"<br/>"}</td>
						</tr>
						<tr>
							<th>For Visitors</th>

							<td>
								Eligibility:{$app.fair_detail.open_to_name}<br />
								{if ('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3 || '1' == $app.fair_detail.admission_ticket_4 || '' != $app.fair_detail.other_admission_ticket_en)}
								Method of obtaining tickets:
									{if ('1' == $app.fair_detail.admission_ticket_1)}
									Free
									{/if}
									{if ('1' == $app.fair_detail.admission_ticket_1 && '1' == $app.fair_detail.admission_ticket_2)}
									/
									{/if}
									{if ('1' == $app.fair_detail.admission_ticket_2)}
									Apply/register online
									{/if}
									{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2) && '1' == $app.fair_detail.admission_ticket_3)}
									/
									{/if}
									{if ('1' == $app.fair_detail.admission_ticket_3)}
									Contact organizer/agency in Japan
									{/if}
									{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3) && '1' == $app.fair_detail.admission_ticket_4)}
									/
									{/if}
									{if ('1' == $app.fair_detail.admission_ticket_4)}
									Available at event
									{/if}
									{if (('1' == $app.fair_detail.admission_ticket_1 || '1' == $app.fair_detail.admission_ticket_2 || '1' == $app.fair_detail.admission_ticket_3 || '1' == $app.fair_detail.admission_ticket_4) && '' != $app.fair_detail.other_admission_ticket_en)}
									/
									{/if}
									{if ('' != $app.fair_detail.other_admission_ticket_en)}
									Other:{$app.fair_detail.other_admission_ticket_en}
									{/if}
								{/if}
							</td>
						</tr>
						<tr>
							<th>Organizer</th>
							<td>
								{$app.fair_detail.organizer_en}<br />
								{if ('' != $app.fair_detail.organizer_addr)}
								Address : {$app.fair_detail.organizer_addr}<br/>
								{/if}
								{if ('' != $app.fair_detail.organizer_div)}
								Department : {$app.fair_detail.organizer_div}<br/>
								{/if}
								{if ('' != $app.fair_detail.organizer_pers)}
								Person : {$app.fair_detail.organizer_pers}<br/>
								{/if}
								TEL : {$app.fair_detail.organizer_tel}<br />
								{if ('' != $app.fair_detail.organizer_fax)}
								FAX : {$app.fair_detail.organizer_fax}<br />
								{/if}
								{if ('' != $app.fair_detail.organizer_email)}
								E-mail : <a href="mailto:{$app.fair_detail.organizer_email}">{$app.fair_detail.organizer_email}</a><br />
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
								{if ('' != $app.fair_detail.agency_in_japan_addr)}
								Address : {$app.fair_detail.agency_in_japan_addr}<br/>
								{/if}
								{if ('' != $app.fair_detail.agency_in_japan_div)}
								Department : {$app.fair_detail.agency_in_japan_div}<br/>
								{/if}
								{if ('' != $app.fair_detail.agency_in_japan_pers)}
								Person : {$app.fair_detail.agency_in_japan_pers}<br/>
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
							<td>
								{$app.fair_detail.frequency_name}
							</td>
						</tr>
						{/if}

{*
						{if ('1' == $app.fair_detail.exhibit_support_flag)}
						<tr>
							<th>JETRO<br></>SUPPORT</th>
							<td>
								<a href="{$app.fair_detail.jetro_suport_url}">JETRO's EVENTS Information～Exhibition</a>
							</td>
						</tr>
						{/if}
*}
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
								{if ('' != $app.fair_detail.number_of_foreign_visitor && 0 < $app.fair_detail.number_of_foreign_visitor)}
								（including ：{$app.fair_detail.number_of_foreign_visitor} foreign visitors)
								{/if}
								<br/>
								{if ('' != $app.fair_detail.total_number_of_exhibitors && 0 < $app.fair_detail.total_number_of_exhibitors)}
								Total number of exhibitors : {$app.fair_detail.total_number_of_exhibitors}
								{/if}
								{if ('' != $app.fair_detail.number_of_foreign_exhibitors && 0 < $app.fair_detail.number_of_foreign_exhibitors)}
								（including : {$app.fair_detail.number_of_foreign_exhibitors} foreign exhibitors)
								{/if}
								<br/>
								{if ('' != $app.fair_detail.net_square_meters && 0 < $app.fair_detail.net_square_meters)}
								Net square meters : {$app.fair_detail.net_square_meters} sq.m.<br/>
								{/if}
								{if ('' != $app.fair_detail.spare_field1)}
								Data verified : {$app.fair_detail.spare_field1}<br/>
								{/if}
							</td>
						</tr>
						{/if}
{*
						{if ('' != $app.fair_detail.keyword)}
						<tr>
							<th>Keyword</th>
							<td>{$app.fair_detail.keyword}</td>
						</tr>
						{/if}
*}
						<tr>
							<th>last update</th>
							<td>
								{if ('' != $app.fair_detail.update_date)}
									{$app.fair_detail.update_date}
{*
									{$app.fair_detail.update_date|date_format:"%e-%b-%Y"}
*}
								{else}
									{$app.fair_detail.regist_date}
{*
									{$app.fair_detail.regist_date|date_format:"%e-%b-%Y"}
*}
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
					title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_en})"
					{else}
					title="{$app.fair_detail.fair_title_en}"
					{/if}
					>
						<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_1}" width="200px" alt="" />
					</a>
					{/if}
					{if ('' != $app.fair_detail.photos_2)}
					<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_2}" rel="prettyPhoto[gallery]"
					{if ('' != $app.fair_detail.abbrev_title)}
					title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_en})"
					{else}
					title="{$app.fair_detail.fair_title_en}"
					{/if}
					>
						<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_2}" width="200px" alt="" />
					</a>
					{/if}
					{if ('' != $app.fair_detail.photos_3)}
					<a href="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_3}" rel="prettyPhoto[gallery]"
					{if ('' != $app.fair_detail.abbrev_title)}
					title="{$app.fair_detail.abbrev_title} ({$app.fair_detail.fair_title_en})"
					{else}
					title="{$app.fair_detail.fair_title_en}"
					{/if}
					>
						<img src="{$config.url_pub}{$config.img_path}{$app.photos_dir}/{$app.fair_detail.mihon_no}/{$app.fair_detail.photos_3}" width="200px" alt="" />
					</a>
					{/if}
				</div>
				{/if}
{*
				<br class="clr" />
				<div class="frame_gray inside terms_use">
				<p>掲載の見本市情報は主催者により変更、延期、中止されることがあります。詳細については直接各主催者のサイト等を確認願います。<br />詳しくは<a href="/j-messe/tradefair/terms.html">見本市・展示会情報のご利用について</a>を参照ください。</p>
				</div>
*}
			</div>
			<p class="totop">
				<a href="javascript:window.open('{$config.url_pub}tradefair_en/{$app.fair_detail.mihon_no}/print/1/', 'print')" target="print"><img src="/images/en/btn-print.gif" alt="Print" height="14" width="46" /></a>
				<a href="javascript:window.scrollTo(0, 0);"><img src="/images/en/totop.gif" alt="Return to PAGETOP" width="103" height="14" /></a>
			</p>
		</div>
		<!-- /main -->
		<!-- submenu -->
		<div id="submenu">
			<div class="submenu_box">
				<div class="submenu_box_inside">
					<p class="menu_title"><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database</a></p>
					<div class="menu_content">
						<ul>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/industry/">By Industry</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/country/">By Country</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/tradefair/">Trade Fair Search</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/new-additions/">Recently Added</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/ranking/">Monthly Ranking</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/center/">Major Exhibition Sites</a></li>
							<li><a href="http://www.jetro.go.jp/en/database/j-messe/links/">Related Links</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="direct_inquiries">
				<div id="direct_inquiries_inside">
					<p><strong>For Organaizers</strong><br />
						Register Your Trade Show <strong class="red">For Free</strong>!</p>
					<p><a href="https://www.jetro.go.jp/j-messe/?action_user_enLogin=true"><img src="/en/database/j-messe/images/btn_registration.gif" width="138" height="63" /></a></p>
				</div>
			</div>
			<div id="direct_inquiries">
				<div id="direct_inquiries_inside">
					<p>Please direct inquiries or comments to</p>
					<p>Trade Fair Planning Division</p>
					<ul>
						<li><a href="javascript:jetro_open_win600('https://www.jetro.go.jp/form/fm/faa/inquiry_en');" class="icon_arrow">Inquiry form</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /submenu -->
	</div>
	<!-- /contents -->
	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->
</body>
</html>
