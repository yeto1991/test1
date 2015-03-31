<!-- menu -->
<form name="form_enFairMenuIndusory" id="form_enFairMenuIndusory" method="post" action="">
<input type="hidden" name="action_enFairListSearch" id="action_enFairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="{$form.type}" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="i_2" id="i_2" value="{$form.i_2}" />
<input type="hidden" name="i_3" id="i_3" value="{$form.i_3}" />

<div id="breakdown" class="right">
	<h4>Refine the Search</h4>
		<p>
			{section name=it loop=$app.sub_industory_cnt}
			<input type="checkbox" name="check_sub_industory[]" id="check_sub_industory_{$app.sub_industory_cnt[it].kbn_3}" value="{$app.sub_industory_cnt[it].kbn_3}"
				{if (0 == $app.sub_industory_cnt[it].fair_cnt)}
			disabled
				{else}
					{section name=it2 loop=$form.check_sub_industory}
						{if ($form.check_sub_industory[it2] == $app.sub_industory_cnt[it].kbn_3)}
			checked
						{/if}
					{/section}
				{/if}
			/>
				{if (0 == $app.sub_industory_cnt[it].fair_cnt)}
			{$app.sub_industory_cnt[it].discription_en} ({$app.sub_industory_cnt[it].fair_cnt})
				{else}
					{if ($form.i_3 == $app.sub_industory_cnt[it].kbn_3)}
			<b>{$app.sub_industory_cnt[it].discription_en} ({$app.sub_industory_cnt[it].fair_cnt})</b>
					{else}
			<a href="{$config.url_pub}?action_enFairList=true&type=i1&i_2={$form.i_2}&i_3={$app.sub_industory_cnt[it].kbn_3}">
			{$app.sub_industory_cnt[it].discription_en} ({$app.sub_industory_cnt[it].fair_cnt})
			</a>
					{/if}
				{/if}
			<br/>
			{/section}
		</p>


		<p>
			<strong>Area/Country/City</strong>
		</p>
		<div class="area_breakdown">
			{section name=it loop=$app.region_cnt}
			{if (0 == $smarty.section.it.index%2)}
			<div class="area0">
			{else}
			<div class="area1">
			{/if}
				<p>
					<input type="checkbox" name="check_region[]" id="check_region_{$app.region_cnt[it].kbn_2}" value="{$app.region_cnt[it].kbn_2}"
					{section name=it3 loop=$form.check_region}
						{if ($form.check_region[it3] == $app.region_cnt[it].kbn_2)}
						checked
						{/if}
					{/section}
					/>{$app.region_cnt[it].discription_en}
					({$app.region_cnt[it].fair_cnt})
				</p>
				<div>
					<p>
						{section name=it2 loop=$app.country_disp_cnt}
						{if ($app.region_cnt[it].kbn_2 == $app.country_disp_cnt[it2].kbn_2)}
						<input type="checkbox" name="check_region_country[]" id="check_region_country_{$app.country_disp_cnt[it2].region_country}" value="{$app.country_disp_cnt[it2].region_country}"
						{section name=it3 loop=$form.check_region_country}
							{if ($form.check_region_country[it3] == $app.country_disp_cnt[it2].region_country)}
							checked
							{/if}
						{/section}
						/>{$app.country_disp_cnt[it2].discription_en}
						{/if}
						{/section}
					</p>

					{if (0 < $app.region_cnt[it].cnt)}
					<p>
						<img width="11" height="11" alt="open" src="/images/jp/btn-white-collapsed.gif">
						<a href="#" onclick="return toggle_cy_en(this)" title="open">Others</a><br />
						<span class="close">
						{section name=it2 loop=$app.country_close_cnt}
						{if ($app.region_cnt[it].kbn_2 == $app.country_close_cnt[it2].kbn_2)}
						<input type="checkbox" name="check_region_country[]" id="check_region_country_{$app.country_close_cnt[it2].region_country}" value="{$app.country_close_cnt[it2].region_country}"
						{section name=it3 loop=$form.check_region_country}
							{if ($form.check_region_country[it3] == $app.country_close_cnt[it2].region_country)}
								checked
							{/if}
						{/section}
						/>{$app.country_close_cnt[it2].discription_en}
						{/if}
						{/section}
						</span>
					</p>
					{/if}
				</div>
			</div>
			{/section}

		</div>

	<p>
		<strong>Date</strong><br />
		<input type="radio" name="year" id="year_u" value="u" {if ('u' == $form.year || '' == $form.year)}checked{/if}>Upcoming Trade Fairs View All<br />
		<input type="radio" name="year" id="year_a" value="a" {if ('a' == $form.year)}checked{/if}>Including Past Trade Fairs View All
	</p>

	<p>
		<strong>Keywords</strong><br /> Please create a one-byte space between keywords (trade fair name, exhibit name, etc.)
	</p>
	<input type="text" name="keyword" id="keyword" value="{$form.keyword}" size="38" />
	</p>

	<p class="narrow_btn">
		<a href="javascript:search('form_enFairMenuIndusory');"><img width="93" height="34" alt="Refine" src="/en/database/j-messe/images/db/btn-narrow.gif" class="over"></a>
		<a href="javascript:resetAll();" class="icon_arrow reset">All Clear</a>
	</p>
</div>
</form>
<!-- /menu -->
