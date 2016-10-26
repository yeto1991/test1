<!-- menu -->
<form name="form_enFairMenuDetail" id="form_enFairMenuDetail" method="post" action="">
<input type="hidden" name="action_enFairListSearch" id="action_enFairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="{$form.type}" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="i_2" id="i_2" value="{$form.i_2}" />
<input type="hidden" name="i_3" id="i_3" value="{$form.i_3}" />
<input type="hidden" name="v_2" id="v_2" value="{$form.v_2}" />
<input type="hidden" name="v_3" id="v_3" value="{$form.v_3}" />
<input type="hidden" name="v_4" id="v_4" value="{$form.v_4}" />
<input type="hidden" name="industory_selected" id="industory_selected" value="{$form.industory_selected}" />
<input type="hidden" name="venue_selected" id="venue_selected" value="{$form.venue_selected}" />
{section name=it loop=$form.check_main_industory}
<input type="hidden" name="check_main_industory[]" id="check_main_industory_{$smarty.section.it.index}" value="{$form.check_main_industory[it]}" />
{/section}
{section name=it loop=$form.check_sub_industory}
<input type="hidden" name="check_sub_industory[]" id="check_sub_industory_{$smarty.section.it.index}" value="{$form.check_sub_industory[it]}" />
{/section}
{section name=it loop=$form.check_region}
<input type="hidden" name="check_region[]" id="check_region_{$smarty.section.it.index}" value="{$form.check_region[it]}" />
{/section}
{section name=it loop=$form.check_region_country}
<input type="hidden" name="check_region_country[]" id="check_region_country_{$smarty.section.it.index}" value="{$form.check_region_country[it]}" />
{/section}
{section name=it loop=$form.check_country}
<input type="hidden" name="check_country[]" id="check_country_{$smarty.section.it.index}" value="{$form.check_country[it]}" />
{/section}
{section name=it loop=$form.check_city}
<input type="hidden" name="check_city[]" id="check_city_{$smarty.section.it.index}" value="{$form.check_city[it]}" />
{/section}

<div id="breakdown" class="right">
	<h4>Refine the Search</h4>
	{* エラー表示 *}
	{if count($errors)}
	<p class="error-message" id="error-pagetop">The data you have entered is invalid. Please re-enter.</p>
	{/if}
	<table class="detail">
		<tr>
			<th>Industry</th>
			<td>
				<div id="industory_disp">
					{section name=it loop=$app.industory_list}
						・{$app.industory_list[it]}<br/>
					{sectionelse}
						No selected<br/>
					{/section}
				</div>
				<button class="modalInputIndustory" rel="#prompt_industory">Change Industory</button>
			</td>
		</tr>
		<tr>
			<th>Location</th>
			<td>
				<div id="venue_disp">
					{section name=it loop=$app.vanue_list}
						・{$app.vanue_list[it]}<br/>
					{sectionelse}
						No selected<br/>
					{/section}
				</div>
				<button class="modalInputVenue" rel="#prompt_venue">Select Location</button>
			</td>
		</tr>
		<tr>
			<th>Date</th>
			<td>
				<input type="radio" name="year" id="year_u" value="u" {if ('u' == $form.year || '' == $form.year)}checked{/if} onclick="fSelectDisabled('u')"/>Upcoming Trade Fairs View All<br />
				<input type="radio" name="year" id="year_a" value="a" {if ('a' == $form.year)}checked{/if} onclick="fSelectDisabled('a')"/>Including Past Trade Fairs View All<br/>
				<input type="radio" name="year" id="year_e" value="e" {if ('e' == $form.year)}checked{/if} onclick="fSelectDisabled('e')"/>Select Date<br/>
				&nbsp;&nbsp;&nbsp;
				{if ('e' != $form.year)}
				<select name="date_from_yyyy" id="date_from_yyyy" disabled="disabled">
				{else}
				<select name="date_from_yyyy" id="date_from_yyyy">
				{/if}
					<option value=""></option>
					{section name=it loop=$app.year_list}
					<option value="{$app.year_list[it]}" {if ($app.year_list[it] == $form.date_from_yyyy)}selected{/if}>{$app.year_list[it]}</option>
					{/section}
				</select>/
				{if ('e' != $form.year)}
				<select name="date_from_mm" id="date_from_mm" disabled="disabled">
				{else}
				<select name="date_from_mm" id="date_from_mm">
				{/if}
					<option value=""></option>
					<option value="01" {if ('01' == $form.date_from_mm)}selected{/if}>Jan</option>
					<option value="02" {if ('02' == $form.date_from_mm)}selected{/if}>Feb</option>
					<option value="03" {if ('03' == $form.date_from_mm)}selected{/if}>Mar</option>
					<option value="04" {if ('04' == $form.date_from_mm)}selected{/if}>Apr</option>
					<option value="05" {if ('05' == $form.date_from_mm)}selected{/if}>May</option>
					<option value="06" {if ('06' == $form.date_from_mm)}selected{/if}>Jun</option>
					<option value="07" {if ('07' == $form.date_from_mm)}selected{/if}>Jul</option>
					<option value="08" {if ('08' == $form.date_from_mm)}selected{/if}>Aug</option>
					<option value="09" {if ('09' == $form.date_from_mm)}selected{/if}>Sep</option>
					<option value="10" {if ('10' == $form.date_from_mm)}selected{/if}>Oct</option>
					<option value="11" {if ('11' == $form.date_from_mm)}selected{/if}>Nov</option>
					<option value="12" {if ('12' == $form.date_from_mm)}selected{/if}>Dec</option>
				</select>～<br />
				&nbsp;&nbsp;&nbsp;
				{if ('e' != $form.year)}
				<select name="date_to_yyyy" id="date_to_yyyy" disabled="disabled">
				{else}
				<select name="date_to_yyyy" id="date_to_yyyy">
				{/if}
					<option value=""></option>
					{section name=it loop=$app.year_list}
					<option value="{$app.year_list[it]}" {if ($app.year_list[it] == $form.date_to_yyyy)}selected{/if}>{$app.year_list[it]}</option>
					{/section}
				</select>/
				{if ('e' != $form.year)}
				<select name="date_to_mm" id="date_to_mm" disabled="disabled">
				{else}
				<select name="date_to_mm" id="date_to_mm">
				{/if}
					<option value=""></option>
					<option value="01" {if ('01' == $form.date_from_mm)}selected{/if}>Jan</option>
					<option value="02" {if ('02' == $form.date_from_mm)}selected{/if}>Feb</option>
					<option value="03" {if ('03' == $form.date_from_mm)}selected{/if}>Mar</option>
					<option value="04" {if ('04' == $form.date_from_mm)}selected{/if}>Apr</option>
					<option value="05" {if ('05' == $form.date_from_mm)}selected{/if}>May</option>
					<option value="06" {if ('06' == $form.date_from_mm)}selected{/if}>Jun</option>
					<option value="07" {if ('07' == $form.date_from_mm)}selected{/if}>Jul</option>
					<option value="08" {if ('08' == $form.date_from_mm)}selected{/if}>Aug</option>
					<option value="09" {if ('09' == $form.date_from_mm)}selected{/if}>Sep</option>
					<option value="10" {if ('10' == $form.date_from_mm)}selected{/if}>Oct</option>
					<option value="11" {if ('11' == $form.date_from_mm)}selected{/if}>Nov</option>
					<option value="12" {if ('12' == $form.date_from_mm)}selected{/if}>Dec</option>
				</select><br/>
				{if is_error('date_from_yyyy')}
				<span class="error-message">{message name="date_from_yyyy"}</span><br />
				{/if}
				{if is_error('date_from_mm')}
				<span class="error-message">{message name="date_from_mm"}</span><br />
				{/if}
				{if is_error('date_to_yyyy')}
				<span class="error-message">{message name="date_to_yyyy"}</span><br />
				{/if}
				{if is_error('date_to_mm')}
				<span class="error-message">{message name="date_to_mm"}</span><br />
				{/if}
			</td>
		</tr>
		<tr>
			<th>Keywords</th>
			<td>
				Please create a one-byte space between keywords (trade fair name, exhibit name, etc.)<br />
				<input type="text" name="keyword" id="keyword" value="{$form.keyword}" size="30" />
			</td>
		</tr>
	</table>
	<a href="javascript:search('form_enFairMenuDetail');"><img width="93" height="34" alt="Refine" src="/en/database/j-messe/images/db/btn-narrow.gif" class="over"></a>

	<!-- 業種選択 -->
	<script type="text/javascript">
	{literal}
	$(document).ready(function() {
		var triggers = $(".modalInputIndustory").overlay({
			// some mask tweaks suitable for modal dialogs
			mask : {
				color : "#ebecff",
				loadSpeed : 200,
				opacity : 0.9
			},
			top : 20,
			fixed : false,
			close : null,
			closeOnClick : true
		});
		$("#fin_select_industory").click(function(e) {
			// get user input
			var input = $("#prompt_industory input:checkbox:checked").map(function() {
				return this.value;
			}).get();
			// close the overlay
			triggers.overlay().close();
			// 選択値の洗い替え
			$("#industory_disp").empty();
			var txt = "";
			var n = 1;
			for (i in input) {
				arry_item = input[i].split("_");
				txt += "・" + arry_item[2] + "/" + arry_item[3] + "<br/>";
			}
			$("#industory_disp").html(txt);
			$("#industory_selected").val("1");
		});
		$(".close").click(function(){
			triggers.overlay().close();
		});
	});
	{/literal}
	</script>
	<div class="modal" id="prompt_industory">
		<a class="close" id="btn_close"></a>
		<h2>
			Industry <span>you can select up to some Industrys.</span>
		</h2>
		<div class="industries clearfix">
			<div class="column">
				<h5>General Exhibition</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('001' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory_{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Fundamental Industries</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('002' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Building, Construction</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('003' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Machinery, Industrial Technology</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('004' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Information, Telecommunication</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('005' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>

			</div>

			<div class="column">
				<h5>Transportation, Logistics, Packaging</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('006' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>

				<h5>Medical Care, Health</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('007' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Services</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('010' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Others</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('012' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
			</div>

			<div class="column">
				<h5>Living</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('008' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Hobby, Education</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('009' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>
				<h5>Environment</h5>
				<ul>
					{section name=it loop=$app.main_sub_industory_list}
						{if ('011' == $app.main_sub_industory_list[it].kbn_2)}
					<li>
						<input type="checkbox" value="{$app.main_sub_industory_list[it].sub_industory_code}" name="check_main_sub_industory[]" id="check_main_sub_industory{$app.main_sub_industory_list[it].kbn_2}{$app.main_sub_industory_list[it].kbn_3}"
							{section name=it2 loop=$form.check_main_sub_industory}
								{if ($app.main_sub_industory_list[it].sub_industory_code == $form.check_main_sub_industory[it2])}
						checked
								{/if}
							{/section}
						/> {$app.main_sub_industory_list[it].sub_industory_name}
					</li>
						{/if}
					{/section}
				</ul>

			</div>
		</div>
		<div class="btn">
			<button type="button" id="fin_select_industory">OK</button>
			<button type="button" class="close">Cancel</button>
		</div>
		<br />
	</div>
	<!-- /業種選択 -->

	<!-- 開催地選択 -->
	<script type="text/javascript">
	{literal}
	$(document).ready(function() {
		var triggers = $(".modalInputVenue").overlay({
			// some mask tweaks suitable for modal dialogs
			mask : {
				color : '#ebecff',
				loadSpeed : 200,
				opacity : 0.9
			},
			top : 20,
			close : null,
			closeOnClick : true
		});
		$("#fin_select_venue").click(function(e) {
			// get user input
			var region = $("#select_region option:selected").val();
			var region_name = $("#select_region option:selected").text();
			var country = $("#select_country option:selected").val();
			var country_name = $("#select_country option:selected").text();
			var city = $("#select_city option:selected").val();
			var city_name = $("#select_city option:selected").text();
			// close the overlay
			triggers.overlay().close();
			// 設定
			$("#region").val(region);
			$("#country").val(country);
			$("#city").val(city);
			// 選択値の洗い替え
			$("#venue_disp").empty();
			var txt = "・" + region_name;
			if ("" != country_name) {
				txt += "/" + country_name;
				if ("" != city_name) {
					txt += "/" + city_name;
				}
			}
			$("#venue_disp").html(txt);
			$("#venue_selected").val("1");
		});
		$(".close").click(function(){
			triggers.overlay().close();
		});
	});

	function init(url, region, country, city) {
		if ("" != region) {
			dynamicpulldownlist(url+'?action_json_getCountry=true&search=1&kbn_2='+region+'&use_language_flag=1', '', '#select_country', country);
		}
		if ("" != country) {
			dynamicpulldownlist(url+'?action_json_getCity=true&search=1&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=1', '', '#select_city', city);
		}
	}

	function set_country(url) {
		var region = document.getElementById('select_region').options[document.getElementById('select_region').selectedIndex].value;
		if ('' == region) {
			clear_country();
		} else {
			dynamicpulldownlist(url+'?action_json_getCountry=true&search=1&kbn_2='+region+'&use_language_flag=1', '', '#select_country', null);
		}
		clear_city();
	}

	function set_city(url) {
		var region = document.getElementById('select_region').options[document.getElementById('select_region').selectedIndex].value;
		var country = document.getElementById('select_country').options[document.getElementById('select_country').selectedIndex].value;
		dynamicpulldownlist(url+'?action_json_getCity=true&search=1&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=1', '', '#select_city', null);
	}

	function clear_country() {
		var select_country = document.getElementById('select_country');
		for (var i = select_country.length -1; i >= 0 ; i--) {
			select_country.remove(i);
		}
		var op = document.createElement('option');
		op.value = '';
		op.innerHTML = 'ALL';
		document.getElementById('select_country').appendChild(op);

	}

	function clear_city() {
		var select_city = document.getElementById('select_city');
		for (var i = select_city.length -1; i >= 0 ; i--) {
			select_city.remove(i);
		}
		var op = document.createElement('option');
		op.value = '';
		op.innerHTML = 'ALL';
		document.getElementById('select_city').appendChild(op);

	}

	function fSelectDisabled(year){
		if(year == 'e'){
			document.forms["form_enFairMenuDetail"].elements["date_from_yyyy"].disabled=false;
			document.forms["form_enFairMenuDetail"].elements["date_from_mm"].disabled=false;
			document.forms["form_enFairMenuDetail"].elements["date_to_yyyy"].disabled=false;
			document.forms["form_enFairMenuDetail"].elements["date_to_mm"].disabled=false;
		}else{
			document.forms["form_enFairMenuDetail"].elements["date_from_yyyy"].disabled=true;
			document.forms["form_enFairMenuDetail"].elements["date_from_mm"].disabled=true;
			document.forms["form_enFairMenuDetail"].elements["date_to_yyyy"].disabled=true;
			document.forms["form_enFairMenuDetail"].elements["date_to_mm"].disabled=true;
		}
	}

	{/literal}
	</script>
	<div class="modal" id="prompt_venue">
		<a class="close" id="btn_close"></a>
		<h2>
			Select location<span>&nbsp;Please select it in order of the Region. the Country / Area, and the City.</span>
		</h2>
		<div class="venue clearfix">

		<table style="font-size:1.2em;">
			<tr>
				<th>Region</th>
				<td>
					<select name="select_region" id="select_region" onchange="set_country('{$config.url_pub}')" style="width:200px;">
						<option value="">ALL</option>
						{section name=it loop=$app.region_list}
						<option value="{$app.region_list[it].kbn_2}" {if $app.region_list[it].kbn_2 == $form.select_region}selected{/if}>{$app.region_list[it].discription_en}</option>
						{/section}
					</select>
				</td>
			</tr>
			<tr>
				<th>Country/Area</th>
				<td>
					<select name="select_country" id="select_country" onchange="set_city('{$config.url_pub}')" style="width:200px;">
						<option value="">ALL</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>City</th>
				<td>
					<select name="select_city" id="select_city" style="width:200px;">
						<option value="">ALL</option>
					</select>
				</td>
			</tr>
		</table>

		</div>
		<div class="btn">
			<button type="button" id="fin_select_venue">OK</button>
			<button type="button" class="close">Cancel</button>
		</div>
		<br />
	</div>
	<!-- /開催地選択 -->

</div>
</form>
<!-- /menu -->
