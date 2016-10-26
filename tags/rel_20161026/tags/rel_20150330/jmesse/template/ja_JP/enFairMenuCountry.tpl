<!-- menu -->
<form name="form_enFairMenuCountry" id="form_enFairMenuCountry" method="post" action="">
<input type="hidden" name="action_enFairListSearch" id="action_enFairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="{$form.type}" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="v_2" id="v_2" value="{$form.v_2}" />
<input type="hidden" name="v_3" id="v_3" value="{$form.v_3}" />
<input type="hidden" name="v_4" id="v_4" value="{$form.v_4}" />

<div id="breakdown" class="right">
	<h4>Refine the Search</h4>
	<p>
		{section name=it loop=$app.city_cnt}
		<input type="checkbox" name="check_city[]" id="check_city_{$app.city_cnt[it].kbn_4}" value="{$app.city_cnt[it].kbn_4}"
			{if (0 == $app.city_cnt[it].fair_cnt)}
		disabled
			{else}
				{section name=it2 loop=$form.check_city}
					{if ($form.check_city[it2] == $app.city_cnt[it].kbn_4)}
		checked
					{/if}
				{/section}
			{/if}
		/>
			{if (0 == $app.city_cnt[it].fair_cnt)}
		{$app.city_cnt[it].discription_en} ({$app.city_cnt[it].fair_cnt})
			{else}
				{if $form.v_4 == $app.city_cnt[it].kbn_4}
		<b>{$app.city_cnt[it].discription_en} ({$app.city_cnt[it].fair_cnt})</b>
				{else}
		<a href="{$config.url_pub}?action_enFairList=true&type=v2&v_2={$form.v_2}&v_3={$form.v_3}&v_4={$app.city_cnt[it].kbn_4}">
		{$app.city_cnt[it].discription_en} ({$app.city_cnt[it].fair_cnt})</a>
				{/if}
			{/if}
		<br/>
		{/section}
	</p>

	<p>
		<strong>Industry</strong><br />
		{section name=it loop=$app.main_industory_cnt}
		<input type="checkbox" name="check_main_industory[]" id="check_main_industory_{$app.main_industory_cnt[it].kbn_2}" value="{$app.main_industory_cnt[it].kbn_2}"
			{if (0 == $app.main_industory_cnt[it].fair_cnt)}
				disabled
			{else}
			{section name=it2 loop=$form.check_main_industory}
				{if ($app.main_industory_cnt[it].kbn_2 == $form.check_main_industory[it2])}
					checked
				{/if}
			{/section}
			{/if} />
			{$app.main_industory_cnt[it].discription_en}
			({$app.main_industory_cnt[it].fair_cnt})
			<br />
		{/section}
	</p>


	<p>
		<strong>Date</strong><br />
		<input type="radio" name="year" id="year_u" value="u" {if ('u' == $form.year || '' == $form.year)}checked{/if}>Upcoming Trade Fairs View All<br />
		<input type="radio" name="year" id="year_a" value="a" {if ('a' == $form.year)}checked{/if}>Including Past Trade Fairs View All
	</p>

	<p>
		<strong>Keyword</strong><br /> Please create a one-byte space between keywords (trade fair name, exhibit name, etc.)
	</p>
	<input type="text" name="keyword" id="keyword" value="{$form.keyword}" size="38" />
	</p>

	<p class="narrow_btn">
		<a href="javascript:search('form_enFairMenuCountry');"><img width="93" height="34" alt="Refine" src="/en/database/j-messe/images/db/btn-narrow.gif" class="over"></a>
		<a href="javascript:resetAll();" class="icon_arrow reset">All Clear</a>
	</p>
</div>
</form>
<!-- /menu -->
