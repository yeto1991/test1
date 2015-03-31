<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">{literal}
	function init() {
	}
	function goto_page(url, type, page, index, sort, s1, s2, s3, s4, s5, sc1, sc2, sc3, sc4, sc5) {
		document.location.href = url + '?action_admin_fairList=true&type=' + type + '&page=' + page + '&index=' + index + '&sort=' + sort + '&sort_1=' + s1 + '&sort_2=' + s2 + '&sort_3=' + s3 + '&sort_4=' + s4 + '&sort_5=' + s5 + '&sort_cond_1=' + sc1 + '&sort_cond_2=' + sc2 + '&sort_cond_3=' + sc3 + '&sort_cond_4=' + sc4 + '&sort_cond_5=' + sc5;
	}
	function download() {
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_admin_fairCsvDownload';
		action.id = 'action_admin_fairCsvDownload';
		action.value = 'dummy';
		document.getElementById('form_fairList').appendChild(action);
		document.getElementById('form_fairList').submit();
	}
	function search(url) {
		document.location.href = url + '?action_admin_fairSearch=true'
	}
	function sorting() {
		document.getElementById('page').value = '1';
		document.getElementById('sort').value = '1';
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_admin_fairList';
		action.id = 'action_admin_fairList';
		action.value = 'dummy';
		document.getElementById('form_fairList').appendChild(action);
		document.getElementById('form_fairList').submit();
	}
	function del() {
		// 選択チェック
		var check_mihon_no = document.getElementsByName('check_mihon_no[]');
		var i = 0;
		var cnt = 0;
		for (i = 0; i < check_mihon_no.length; i++) {
			if (check_mihon_no[i].checked) {
				cnt++;
			}
		}
		if (0 == cnt) {
			window.alert('選択して下さい。');
			return;
		}

		if (!window.confirm('選択したデータを削除します。\nよろしいですか？')) {
			return;
		}
		action = document.createElement('input');
		action.type = 'hidden';
		action.name = 'action_admin_fairListDel';
		action.id = 'action_admin_fairListDel';
		action.value = 'dummy';
		document.getElementById('form_fairList').appendChild(action);
		document.getElementById('form_fairList').submit();
	}
{/literal}
</script>
<title>見本市ＤＢ 管理者用</title>
</head>
<body onload="init()">
	<form name="form_fairList" id="form_fairList" method="POST" action="">
		<input type="hidden" name="type" id="type" value="{$app.type}" />
		<input type="hidden" name="page" id="page" value="{$app.page}" />
		<input type="hidden" name="sort" id="sort" value="" />
		<input type="hidden" name="index" id="index" value="{$form.index}" />
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

					<div align="center">一覧画面</div>
					{if ('1' != $app.first_page)}
					<input type="button" value="前の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_prev}', '{$form.index}', '{$form.sort}', '{$form.sort_1}', '{$form.sort_2}', '{$form.sort_3}', '{$form.sort_4}', '{$form.sort_5}', '{$form.sort_cond_1}', '{$form.sort_cond_2}', '{$form.sort_cond_3}', '{$form.sort_cond_4}', '{$form.sort_cond_5}')" />
					{else}
					<input type="button" value="前の一覧" onclick="" disabled />
					{/if}
					{if ('1' != $app.last_page)}
					<input type="button" value="次の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_next}', '{$form.index}', '{$form.sort}', '{$form.sort_1}', '{$form.sort_2}', '{$form.sort_3}', '{$form.sort_4}', '{$form.sort_5}', '{$form.sort_cond_1}', '{$form.sort_cond_2}', '{$form.sort_cond_3}', '{$form.sort_cond_4}', '{$form.sort_cond_5}')" />
					{else}
					<input type="button" value="次の一覧" onclick="" disabled />
					{/if}
					<input type="button" value="ダウンロード" onclick="download()" />
					<input type="button" value="検索画面" onclick="search('{$config.url}')" /><br/>
					<input type="button" value="削除" onclick="del()" /> <small> 選択した文書に対して処理を実行します。</small>
					<hr /> {$app.total} 件中、{$app.begin} から {$app.limit} 件を表示

					<table border="1">
						<tr>
							<th nowrap>選択</th>
							<th nowrap>見本市番号</th>
							<th nowrap>見本市名</th>
							<th nowrap>見本市略称</th>
							<th nowrap>会期</th>
							<th nowrap>開催地</th>
							<th nowrap>Eメール</th>
							<th nowrap>申請年月日</th>
							<th nowrap>登録日(承認日)</th>
							<th nowrap>否認コメント</th>
						</tr>

						{section name=it loop=$app.jm_fair_list}
						<tr style="word-break: break-all;">
							<td align="center"><input type="checkbox" name="check_mihon_no[]" id="check_mihon_no[]" value="{$app.jm_fair_list[it].mihon_no}"></td>
							<td align="right">{$app.jm_fair_list[it].mihon_no}</td>
							{if ('' != $app.jm_fair_list[it].fair_title_jp)}
							<td><a href="{$config.url}?action_admin_fairDetail=true&mihon_no={$app.jm_fair_list[it].mihon_no}&type={$form.type}&page={$form.page}">{$app.jm_fair_list[it].fair_title_jp}</a></td>
							{else}
							<td><a href="{$config.url}?action_admin_fairDetail=true&mihon_no={$app.jm_fair_list[it].mihon_no}&type={$form.type}&page={$form.page}">{$app.jm_fair_list[it].fair_title_en}</a></td>
							{/if}
							<td><a href="{$config.url}?action_admin_fairDetail=true&mihon_no={$app.jm_fair_list[it].mihon_no}&type={$form.type}&page={$form.page}">{$app.jm_fair_list[it].abbrev_title}</a></td>
							<td nowrap>{$app.jm_fair_list[it].date_from_yyyy}/{$app.jm_fair_list[it].date_from_mm}/{$app.jm_fair_list[it].date_from_dd} - {$app.jm_fair_list[it].date_to_yyyy}/{$app.jm_fair_list[it].date_to_mm}/{$app.jm_fair_list[it].date_to_dd}</td>
							<td>{$app.jm_fair_list[it].region_name}/{$app.jm_fair_list[it].country_name}/{$app.jm_fair_list[it].city_name}/{$app.jm_fair_list[it].other_city_jp}</td>
							<td>{$app.jm_fair_list[it].email}</td>
							<td>{$app.jm_fair_list[it].date_of_application}</td>
							<td>{$app.jm_fair_list[it].date_of_registration}</td>
							<td>{$app.jm_fair_list[it].negate_comment}</td>
						</tr>
						{/section}

					</table>
					{$app.total} 件中、{$app.begin} から {$app.limit} 件を表示
					<hr />
					<dl>
						<dt>[現在のソート条件]
						<dd>ソート１：{$app.sort_1},{$app.sort_cond_1}
						<dd>ソート２：{$app.sort_2}{if ('' != $app.sort_2)},{$app.sort_cond_2}{/if}
						<dd>ソート３：{$app.sort_3}{if ('' != $app.sort_3)},{$app.sort_cond_3}{/if}
						<dd>ソート４：{$app.sort_4}{if ('' != $app.sort_4)},{$app.sort_cond_4}{/if}
						<dd>ソート５：{$app.sort_5}{if ('' != $app.sort_5)},{$app.sort_cond_5}{/if}
						<dd>
							<select name="sort_1" id="sort_1">
								<option value="" {if ('' == $form.sort_1)}selected{/if}>ソートなし</option>
								<option value="0" {if ('0' == $form.sort_1)}selected{/if}>見本市番号</option>
								<option value="1" {if ('1' == $form.sort_1)}selected{/if}>見本市名
								<option value="2" {if ('2' == $form.sort_1)}selected{/if}>見本市略称
								<option value="3" {if ('3' == $form.sort_1)}selected{/if}>会期
								<option value="4" {if ('4' == $form.sort_1)}selected{/if}>開催地
								<option value="5" {if ('5' == $form.sort_1)}selected{/if}>Eメール
								<option value="6" {if ('6' == $form.sort_1)}selected{/if}>申請年月日
								<option value="7" {if ('7' == $form.sort_1)}selected{/if}>登録日(承認日)
								<option value="8" {if ('8' == $form.sort_1)}selected{/if}>否認コメント
							</select>
							<input type="radio" name="sort_cond_1" id="sort_cond_1" value="0" {if ('0' == $form.sort_cond_1 || '' == $form.sort_cond_1)}checked{/if}/>昇順
							<input type="radio" name="sort_cond_1" id="sort_cond_1" value="1" {if ('1' == $form.sort_cond_1)}checked{/if}/>降順
						<dd>
							<select name="sort_2" id="sort_2">
								<option value="" {if ('' == $form.sort_2)}selected{/if}>ソートなし</option>
								<option value="0" {if ('0' == $form.sort_2)}selected{/if}>見本市番号</option>
								<option value="1" {if ('1' == $form.sort_2)}selected{/if}>見本市名
								<option value="2" {if ('2' == $form.sort_2)}selected{/if}>見本市略称
								<option value="3" {if ('3' == $form.sort_2)}selected{/if}>会期
								<option value="4" {if ('4' == $form.sort_2)}selected{/if}>開催地
								<option value="5" {if ('5' == $form.sort_2)}selected{/if}>Eメール
								<option value="6" {if ('6' == $form.sort_2)}selected{/if}>申請年月日
								<option value="7" {if ('7' == $form.sort_2)}selected{/if}>登録日(承認日)
								<option value="8" {if ('8' == $form.sort_2)}selected{/if}>否認コメント
							</select>
							<input type="radio" name="sort_cond_2" id="sort_cond_2" value="0" {if ('0' == $form.sort_cond_2 || '' == $form.sort_cond_2)}checked{/if}/>昇順
							<input type="radio" name="sort_cond_2" id="sort_cond_2" value="1" {if ('1' == $form.sort_cond_2)}checked{/if}/>降順
						<dd>
							<select name="sort_3" id="sort_3">
								<option value="" {if ('' == $form.sort_3)}selected{/if}>ソートなし</option>
								<option value="0" {if ('0' == $form.sort_3)}selected{/if}>見本市番号</option>
								<option value="1" {if ('1' == $form.sort_3)}selected{/if}>見本市名
								<option value="2" {if ('2' == $form.sort_3)}selected{/if}>見本市略称
								<option value="3" {if ('3' == $form.sort_3)}selected{/if}>会期
								<option value="4" {if ('4' == $form.sort_3)}selected{/if}>開催地
								<option value="5" {if ('5' == $form.sort_3)}selected{/if}>Eメール
								<option value="6" {if ('6' == $form.sort_3)}selected{/if}>申請年月日
								<option value="7" {if ('7' == $form.sort_3)}selected{/if}>登録日(承認日)
								<option value="8" {if ('8' == $form.sort_3)}selected{/if}>否認コメント
							</select>
							<input type="radio" name="sort_cond_3" id="sort_cond_3" value="0" {if ('0' == $form.sort_cond_3 || '' == $form.sort_cond_3)}checked{/if}/>昇順
							<input type="radio" name="sort_cond_3" id="sort_cond_3" value="1" {if ('1' == $form.sort_cond_3)}checked{/if}/>降順
						<dd>
							<select name="sort_4" id="sort_4">
								<option value="" {if ('' == $form.sort_4)}selected{/if}>ソートなし</option>
								<option value="0" {if ('0' == $form.sort_4)}selected{/if}>見本市番号</option>
								<option value="1" {if ('1' == $form.sort_4)}selected{/if}>見本市名
								<option value="2" {if ('2' == $form.sort_4)}selected{/if}>見本市略称
								<option value="3" {if ('3' == $form.sort_4)}selected{/if}>会期
								<option value="4" {if ('4' == $form.sort_4)}selected{/if}>開催地
								<option value="5" {if ('5' == $form.sort_4)}selected{/if}>Eメール
								<option value="6" {if ('6' == $form.sort_4)}selected{/if}>申請年月日
								<option value="7" {if ('7' == $form.sort_4)}selected{/if}>登録日(承認日)
								<option value="8" {if ('8' == $form.sort_4)}selected{/if}>否認コメント
							</select>
							<input type="radio" name="sort_cond_4" id="sort_cond_4" value="0" {if ('0' == $form.sort_cond_4 || '' == $form.sort_cond_4)}checked{/if}/>昇順
							<input type="radio" name="sort_cond_4" id="sort_cond_4" value="1" {if ('1' == $form.sort_cond_4)}checked{/if}/>降順
						<dd>
							<select name="sort_5" id="sort_5">
								<option value="" {if ('' == $form.sort_5)}selected{/if}>ソートなし</option>
								<option value="0" {if ('0' == $form.sort_5)}selected{/if}>見本市番号</option>
								<option value="1" {if ('1' == $form.sort_5)}selected{/if}>見本市名
								<option value="2" {if ('2' == $form.sort_5)}selected{/if}>見本市略称
								<option value="3" {if ('3' == $form.sort_5)}selected{/if}>会期
								<option value="4" {if ('4' == $form.sort_5)}selected{/if}>開催地
								<option value="5" {if ('5' == $form.sort_5)}selected{/if}>Eメール
								<option value="6" {if ('6' == $form.sort_5)}selected{/if}>申請年月日
								<option value="7" {if ('7' == $form.sort_5)}selected{/if}>登録日(承認日)
								<option value="8" {if ('8' == $form.sort_5)}selected{/if}>否認コメント
							</select>
							<input type="radio" name="sort_cond_5" id="sort_cond_5" value="0" {if ('0' == $form.sort_cond_5 || '' == $form.sort_cond_5)}checked{/if}/>昇順
							<input type="radio" name="sort_cond_5" id="sort_cond_5" value="1" {if ('1' == $form.sort_cond_5)}checked{/if}/>降順
						<dd>
							<input type="button" value="ソート" onclick="sorting()" />
							<input type="reset" value="リセット" />
					</dl>
					<hr />
					<input type="button" name="$DeleteDoc" value="削除" onClick="del()"> <small> 選択した文書に対して処理を実行します。</small><br />
					{if ('1' != $app.first_page)}
					<input type="button" value="前の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_prev}', '{$form.index}', '{$form.sort}', '{$form.sort_1}', '{$form.sort_2}', '{$form.sort_3}', '{$form.sort_4}', '{$form.sort_5}', '{$form.sort_cond_1}', '{$form.sort_cond_2}', '{$form.sort_cond_3}', '{$form.sort_cond_4}', '{$form.sort_cond_5}')" />
					{else}
					<input type="button" value="前の一覧" onclick="" disabled />
					{/if}
					{if ('1' != $app.last_page)}
					<input type="button" value="次の一覧" onclick="goto_page('{$config.url}','{$app.type}','{$app.page_next}', '{$form.index}', '{$form.sort}', '{$form.sort_1}', '{$form.sort_2}', '{$form.sort_3}', '{$form.sort_4}', '{$form.sort_5}', '{$form.sort_cond_1}', '{$form.sort_cond_2}', '{$form.sort_cond_3}', '{$form.sort_cond_4}', '{$form.sort_cond_5}')" />
					{else}
					<input type="button" value="次の一覧" onclick="" disabled />
					{/if}
					<input type="button" value="ダウンロード" onclick="download()" />
					<input type="button" value="検索画面" onclick="search('{$config.url}')" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
