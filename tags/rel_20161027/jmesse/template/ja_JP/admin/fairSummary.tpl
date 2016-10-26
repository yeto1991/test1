<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
<!--
{literal}
	function goto_page(url, type, page) {
		document.location.href = url + '?action_admin_fairSummary=true&type=' + type + '&page=' + page;
	}

	function goto_list(url, index) {
		document.location.href = url + '?action_admin_fairList=true&type=s&index=' + index;
	}
{/literal}
-->
</script>
<title>見本市ＤＢ 管理者用</title>
</head>
<body>
	<form name="form_fairSummary" id="form_fairSummary" method="post" action="">
		<input type="hidden" name="action_admin_fairList" id="action_admin_fairList" value="dummy">
		<input type="hidden" name="type" id="type" value="{$app.type}" />
		<input type="hidden" name="page" id="page" value="{$app.page}" />
		<table style="width: 100%;">
			<tr>
				<td valign="top" style="width: 200px;">{include file="admin/menu.tpl"}</td>
				<td valign="top">

					<div align="center">
						<font size="5"><b>見本市ＤＢ 管理者用</b></font>
					</div>
					<hr />

					{* エラー表示 *}
					{if count($errors)}
					<ul>
						{foreach from=$errors item=error}
						<li><font color="#ff0000">{$error}</font></li>
						{/foreach}
					</ul>
					{/if}

					<div align="center">集計画面</div>
					{if ('1' != $app.first_page)}
					<input type="button" value="前の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_prev}')" />
					{else}
					<input type="button" value="前の一覧" onclick="" disabled />
					{/if}
					{if ('1' != $app.last_page)}
					<input type="button" value="次の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_next}')" />
					{else}
					<input type="button" value="次の一覧" onclick="" disabled />
					{/if}
					<hr />
					{$app.total} 件中、{$app.begin} から {$app.limit} 件を表示
					<table border="1" width="100%" style="word-break: break-all;">
						<tr>
							{section name=it loop=$app.jm_fair_summary_column}
							<th nowrap>{$app.jm_fair_summary_column[it]}</th>
							{/section}
						</tr>
						{section name=it loop=$app.jm_fair_summary_list}
						<tr>
							{section name=it2 loop=$app.jm_fair_summary_list[it]}
								{if ('' != $app.jm_fair_summary_list[it][it2])}
									{if ($smarty.section.it2.index == $app.count_column)}
							<td align="right"><a href="javascript:goto_list('{$config.url}', '{$smarty.section.it.index}');">{$app.jm_fair_summary_list[it][it2]}</a></td>
									{else}
							<td>{$app.jm_fair_summary_list[it][it2]}</td>
									{/if}
								{else}
							<td>&nbsp;</td>
								{/if}
							{/section}
						</tr>
						{/section}
					</table>
					<hr/>
					{if ('1' != $app.first_page)}
					<input type="button" value="前の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_prev}')" />
					{else}
					<input type="button" value="前の一覧" onclick="" disabled />
					{/if}
					{if ('1' != $app.last_page)}
					<input type="button" value="次の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_next}')" />
					{else}
					<input type="button" value="次の一覧" onclick="" disabled />
					{/if}
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
