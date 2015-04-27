<!-- menu -->
<form name="form_enFairMenuIndusory" id="form_enFairMenuIndusory" method="post" action="">
<input type="hidden" name="action_enFairListSearch" id="action_enFairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="{$form.type}" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="i_2" id="i_2" value="{$form.i_2}" />
<input type="hidden" name="i_3" id="i_3" value="{$form.i_3}" />
<div class="right_box elem_content_divide_box">
	<div class="elem_column_block">
		<div class="color_base elem_column_block_pad">
			<div class="elem_heading_lv3"><h3>Refine the Search</h3></div>
			<div class="elem_heading_lv4"><h4>Sub Industory</h4></div>
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
			<div class="elem_heading_lv4"><h4>Region/Country</h4></div>
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
								/>
								{$app.region_cnt[it].discription_en}({$app.region_cnt[it].fair_cnt})
							</p>
							<p>
								{section name=it2 loop=$app.country_disp_cnt}
									{if ($app.region_cnt[it].kbn_2 == $app.country_disp_cnt[it2].kbn_2)}
										<input type="checkbox" name="check_region_country[]" id="check_region_country_{$app.country_disp_cnt[it2].region_country}" value="{$app.country_disp_cnt[it2].region_country}"
											{section name=it3 loop=$form.check_region_country}
												{if ($form.check_region_country[it3] == $app.country_disp_cnt[it2].region_country)}
													checked
												{/if}
											{/section}
										/>
										{$app.country_disp_cnt[it2].discription_en}
									{/if}
								{/section}
							</p>
							{if (0 < $app.region_cnt[it].cnt)}
								<p>
									{section name=it2 loop=$app.country_close_cnt}
										{if ($app.region_cnt[it].kbn_2 == $app.country_close_cnt[it2].kbn_2)}
											<input type="checkbox" name="check_region_country[]" id="check_region_country_{$app.country_close_cnt[it2].region_country}" value="{$app.country_close_cnt[it2].region_country}"
											{section name=it3 loop=$form.check_region_country}
												{if ($form.check_region_country[it3] == $app.country_close_cnt[it2].region_country)}
													checked
												{/if}
											{/section}
											/>
											{$app.country_close_cnt[it2].discription_en}
										{/if}
									{/section}
								</p>
							{/if}
						</div>
						<br />
				{/section}
			</div>
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
							<a href="javascript:search('form_enFairMenuIndusory');" class="var_small"><span>Narrow</span></a>
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
