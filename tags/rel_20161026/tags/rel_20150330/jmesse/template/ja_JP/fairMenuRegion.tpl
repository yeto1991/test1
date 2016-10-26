<!-- menu -->
<form name="form_fairMenuRegion" id="form_fairMenuRegion" method="post" action="">
<input type="hidden" name="action_fairListSearch" id="action_fairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="{$form.type}" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="v_2" id="v_2" value="{$form.v_2}" />
<div id="breakdown" class="right">
	<h4>絞り込む</h4>
	<p>
		{section name=it loop=$app.country_cnt}
		<input type="checkbox" name="check_country[]" id="check_country_{$app.country_cnt[it].kbn_3}" value="{$app.country_cnt[it].kbn_3}"
			{if (0 == $app.country_cnt[it].fair_cnt)}
		disabled
			{else}
				{section name=it2 loop=$form.check_country}
					{if ($app.country_cnt[it].kbn_3 == $form.check_country[it2])}
		checked
					{/if}
				{/section}
			{/if}
		/>
			{if (0 == $app.country_cnt[it].fair_cnt)}
		{$app.country_cnt[it].discription_jp} ({$app.country_cnt[it].fair_cnt})
			{else}
		<a href="{$config.url_pub}?action_fairList=true&type=v2&v_2={$form.v_2}&v_3={$app.country_cnt[it].kbn_3}" />{$app.country_cnt[it].discription_jp} ({$app.country_cnt[it].fair_cnt})</a>
			{/if}
		<br />
		{/section}
	</p>

	<p>
		<strong>業種</strong><br />
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
			{$app.main_industory_cnt[it].discription_jp}
			({$app.main_industory_cnt[it].fair_cnt})
			<br />
		{/section}
	</p>


	<p>
		<strong>会期</strong><br />
		<input type="radio" name="year" id="year_u" value="u" {if ('u' == $form.year || '' == $form.year)}checked{/if}>これから開催のもの<br />
		<input type="radio" name="year" id="year_a" value="a" {if ('a' == $form.year)}checked{/if}>過去のものを含む
	</p>

	<p>
		<strong>キーワード</strong><br /> キーワード（展示会名、取扱品目など）ごとに半角スペースをご入力ください
	</p>
	<input type="text" name="keyword" id="keyword" value="{$form.keyword}" size="38" />
	</p>

	<p class="narrow_btn">
		<a href="javascript:search('form_fairMenuRegion');"><img width="93" height="34" alt="絞り込む" src="/j-messe/images/db/btn-narrow.gif" class="over"></a>
		<a href="javascript:resetAll();" class="icon_arrow reset">全て選択解除</a>
	</p>
</div>
</form>
<!-- /menu -->
