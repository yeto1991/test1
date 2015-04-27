<!-- menu -->
<form name="form_fairMenuRegion" id="form_fairMenuRegion" method="post" action="">
<input type="hidden" name="action_fairListSearch" id="action_fairListSearch" value="dummy" />
<input type="hidden" name="type" id="type" value="{$form.type}" />
<input type="hidden" name="detail" id="detail" value="1" />
<input type="hidden" name="v_2" id="v_2" value="{$form.v_2}" />
<div class="right_box elem_content_divide_box">
	<div class="elem_column_block">
		<div class="color_base elem_column_block_pad">
			<div class="elem_heading_lv3"><h3>絞り込む</h3></div>
			<div class="elem_heading_lv4"><h4>国</h4></div>
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
			<div class="elem_heading_lv4"><h4>業種</h4></div>
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
					{/if} />
					{$app.main_industory_cnt[it].discription_jp}({$app.main_industory_cnt[it].fair_cnt})<br />
				{/section}
			</p>
			<div class="elem_heading_lv4"><h4>会期</h4></div>
			<p>
				<input type="radio" name="year" id="year_u" value="u" {if ('u' == $form.year || '' == $form.year)}checked{/if}>これから開催のもの<br />
				<input type="radio" name="year" id="year_a" value="a" {if ('a' == $form.year)}checked{/if}>過去のものを含む
			</p>
			<div class="elem_heading_lv4"><h4>キーワード</h4></div>
			<p>
				キーワード（展示会名、取扱品目など）ごとに半角スペースをご入力ください<br />
				<input type="text" name="keyword" id="keyword" value="{$form.keyword}" size="38" />
			</p>
			<div class="elem_linkBox_list">
				<ul>
					<li>
						<div class="linkBox">
							<a href="javascript:search('form_fairMenuRegion');" class="var_small"><span>絞り込む</span></a>
						</div>
					</li>
					<li>
						<div class="linkBox">
							<a href="javascript:resetAll();" class="var_gray var_small"><span>全て選択解除</span></a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</form>
<!-- /menu -->
