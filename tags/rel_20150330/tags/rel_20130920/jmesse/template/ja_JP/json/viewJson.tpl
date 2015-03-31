<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
{if 'menu'==$app.mode}
<ul>
<li>地域毎件数情報</li>
	<ul>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r_jp">日本語</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r_en">英語</a></li>
	</ul>
<li>業種（大分類）毎件数情報</li>
	<ul>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=i_jp">日本語</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=i_en">英語</a></li>
	</ul>
<li>業種（大分類）毎件数情報(2列)</li>
	<ul>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=i2_jp">日本語</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=i2_en">英語</a></li>
	</ul>
<li>新着見本市情報</li>
	<ul>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=n_jp">日本語</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=n_en">英語</a></li>
	</ul>
<li>月刊ランキング情報</li>
	<ul>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r1_jp">先月のランキング(日本語/国内)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r2_jp">2ヵ月前のランキング(日本語/国内)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r3_jp">3ヵ月前のランキング(日本語/国内)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r4_jp">先月のランキング(日本語/海外)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r5_jp">2ヵ月前のランキング(日本語/海外)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r6_jp">3ヵ月前のランキング(日本語/海外)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r1_en">先月のランキング(英語/国内)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r2_en">2ヵ月前のランキング(英語/国内)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r3_en">3ヵ月前のランキング(英語/国内)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r4_en">先月のランキング(英語/海外)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r5_en">2ヵ月前のランキング(英語/海外)</a></li>
	<li><a href="{config.url_pub}?action_json_viewJson=true&f=r6_en">3ヵ月前のランキング(英語/海外)</a></li>
	</ul>
</ul>
{else}
{section name="it" loop=$app.list}
[{$smarty.section.it.index}]<br/>
<table border="1">
	{section name="it2" loop=$app.list[it]}
	<tr>
		<td>{$app.list[it][it2].col}</td>
		<td>{$app.list[it][it2].value}</td>
	</tr>
	{/section}
</table>
<br/>
{/section}
{/if}
</body>
</html>
