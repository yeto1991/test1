<!-- menu -->
<form name="form_enFairMenuRegion" id="form_enFairMenuRegion" method="post" action="">
<input type="hidden" name="action_enFairListSearch" id="action_enFairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="{$form.type}" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="v_2" id="v_2" value="{$form.v_2}" />
<div class="right_box elem_content_divide_box">
	<div class="elem_column_block">
		<div class="color_base elem_column_block_pad">
			<div class="elem_heading_lv3"><h3>Refine the Search</h3></div>
			<div class="elem_heading_lv4"><h4>Country</h4></div>
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
						{$app.country_cnt[it].discription_en} ({$app.country_cnt[it].fair_cnt})
					{else}
						<a href="{$config.url_pub}?action_enFairList=true&type=v2&v_2={$form.v_2}&v_3={$app.country_cnt[it].kbn_3}" />{$app.country_cnt[it].discription_en} ({$app.country_cnt[it].fair_cnt})</a>
					{/if}
					<br />
				{/section}
			</p>
			<div class="elem_heading_lv4"><h4>Industry</h4></div>
			<p>
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
						{/if}
					 />
					{$app.main_industory_cnt[it].discription_en}({$app.main_industory_cnt[it].fair_cnt})<br />
				{/section}
			</p>
			<div class="elem_heading_lv4"><h4>Date</h4></div>
			<p>
				<input type="radio" name="year" id="year_u" value="u" {if ('u' == $form.year || '' == $form.year)}checked{/if}>Upcoming Trade Fairs View All<br />
				<input type="radio" name="year" id="year_a" value="a" {if ('a' == $form.year)}checked{/if}>Including Past Trade Fairs View All
			</p>
			<div class="elem_heading_lv4"><h4>Keywords</h4></div>
			<p>
				Please create a one-byte space between keywords (trade fair name, exhibit name, etc.)<br />
				<input type="text" name="keyword" id="keyword" value="{$form.keyword}" size="38" />
			</p>
			<div class="elem_linkBox_list">
				<ul>
					<li>
						<div class="linkBox">
							<a href="javascript:search('form_enFairMenuRegion');" class="var_small"><span>Narrow</span></a>
						</div>
					</li>
					<li>
						<div class="linkBox">
							<a href="javascript:resetAll();" class="var_gray var_small"><span>Clear All</span></a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</form>
<!-- /menu -->
