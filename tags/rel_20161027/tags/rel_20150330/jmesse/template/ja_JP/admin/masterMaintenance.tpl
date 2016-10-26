<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script type="text/javascript" src="{$config.css_js_base}js/jquery.js"></script>
<title>Master Maintenance</title>
</head>
<body>
<h1>JM_CODE_M 管理画面</h1>
<hr/>
<form name="form_search" id="form_search" method="post" action="">
<input type="hidden" name="action_admin_masterMaintenance" id="action_admin_masterMaintenance" value="dummy" />
<input type="hidden" name="mode" id="mode" value="0" />
区分１：<input type="text" name="kbn_1" id="kbn_1" value="{$form.kbn_1}" size="3" maxlength="3"/>
区分２：<input type="text" name="kbn_2" id="kbn_2" value="{$form.kbn_2}" size="3" maxlength="3" />
区分３：<input type="text" name="kbn_3" id="kbn_3" value="{$form.kbn_3}" size="3" maxlength="3" />
区分４：<input type="text" name="kbn_4" id="kbn_4" value="{$form.kbn_4}" size="3" maxlength="3" />
<input type="button" name="btn_search" id="btn_search" value="検索" />
<input type="button" name="btn_list" id="btn_list" value="一覧表示" />
</form>
※区分１は「001:開催頻度」、「002:業種分類」、「003:開催地」、「004:入場資格」です。<br/>
※レコードが存在しない場合、新規登録モードとなります。
<hr/>

{if '1'==$app.mode}
<b>更新モード</b><br/><br/>
{elseif '2'==$app.mode}
<b>新規登録モード</b><br/><br/>
{elseif '3'==$app.mode}
<b>一覧</b>(全{$app.total}件)<br/><br/>
{/if}

<form name="form_regist" id="form_regist" method="post" action="">
<input type="hidden" name="action_admin_masterMaintenance" id="action_admin_masterMaintenance" value="dummy" />
<input type="hidden" name="mode" id="mode_save" value="{$app.mode}" />
<input type="hidden" name="kbn_1" id="kbn_1_save" value="{$form.kbn_1}" />
<input type="hidden" name="kbn_2" id="kbn_2_save" value="{$form.kbn_2}" />
<input type="hidden" name="kbn_3" id="kbn_3_save" value="{$form.kbn_3}" />
<input type="hidden" name="kbn_4" id="kbn_4_save" value="{$form.kbn_4}" />

{if '3'==$app.mode}
<table border="1">
<tr>
	<th>区分１</th>
	<th>区分２</th>
	<th>区分３</th>
	<th>区分４</th>
	<th>内容(日本語)</th>
	<th>内容(英語)</th>
	<th>編集</th>
</tr>
{section name=it loop=$app.list}
<tr>
	<td>{$app.list[it].kbn_1}</td>
	<td>{$app.list[it].kbn_2}</td>
	<td>{$app.list[it].kbn_3}</td>
	<td>{$app.list[it].kbn_4}</td>
	<td>{$app.list[it].discription_jp}</td>
	<td>{$app.list[it].discription_en}</td>
	<td><input type="button" name="btn_edit" id="btn_}edit" value="編集" onclick="javascript:do_edit('{$app.list[it].kbn_1}', '{$app.list[it].kbn_2}', '{$app.list[it].kbn_3}', '{$app.list[it].kbn_4}');" /></td>
</tr>
{/section}
</table>
{elseif '0'!=$app.mode  && ''!=$app.mode}
<table border="1">
<tr>
	<th>区分１</th>
	<th>区分２</th>
	<th>区分３</th>
	<th>区分４</th>
</tr>
<tr>
	<td>{$form.kbn_1}</td>
	<td>{$form.kbn_2}</td>
	<td>{$form.kbn_3}</td>
	<td>{$form.kbn_4}</td>
</tr>
</table>
<br/>

<table border="1">
<tr>
	<th>項目名</th>
	<th>サイズ</th>
	<th>値</th>
	<th style="width:300px">備考</th>
</tr>
<tr>
	<td>内容(日本語)</td>
	<td>255文字まで</td>
	<td>
		<input type="text" name="discription_jp" id="discription_jp" value="{$form.discription_jp}" size="30" maxlength="255" />
		<input type="button" name="clr_discription_jp" id="clr_discription_jp" value="クリア" />
	</td>
	<td>
	</td>
</tr>
<tr>
	<td>内容(英語)</td>
	<td>255文字まで</td>
	<td>
		<input type="text" name="discription_en" id="discription_en" value="{$form.discription_en}"  size="30" maxlength="255" />
		<input type="button" name="clr_discription_en" id="clr_discription_en" value="クリア" />
	</td>
	<td></td>
</tr>
<tr>
	<td>表示コード</td>
	<td>10文字まで</td>
	<td>
		<input type="text" name="disp_cd" id="disp_cd" value="{$form.disp_cd}" size="30" maxlength="10" />
		<input type="button" name="clr_disp_cd" id="clr_disp_cd" value="クリア" />
	</td>
	<td>※区分1='003'(開催地)の場合、展示会一覧(業種別)の地域選択条件に表示する国を設定(0:非表示、1:表示)。</td>
</tr>
<tr>
	<td>表示順</td>
	<td>INT型</td>
	<td>
		<input type="text" name="disp_num" id="disp_num" value="{$form.disp_num}" size="30" maxlength="11" />
		<input type="button" name="clr_disp_num" id="clr_disp_num" value="クリア" />
	</td>
	<td></td>
</tr>
<tr>
	<td>予備1</td>
	<td>10文字まで</td>
	<td>
		<input type="text" name="reserve_1" id="reserve_1" value="{$form.reserve_1}" size="30" maxlength="10" />
		<input type="button" name="clr_reserve_1" id="clr_reserve_1" value="クリア" />
	</td>
	<td>※区分1='003'(開催地)の場合、ISO 3166-1 alpha-2：ラテン文字2文字による国名コードを設定。</td>
</tr>
<tr>
	<td>予備2</td>
	<td>10文字まで</td>
	<td>
		<input type="text" name="reserve_2" id="reserve_2" value="{$form.reserve_2}" size="30" maxlength="10" />
		<input type="button" name="clr_reserve_2" id="clr_reserve_2" value="クリア" />
	</td>
	<td></td>
</tr>
<tr>
	<td>予備3</td>
	<td>10文字まで</td>
	<td>
		<input type="text" name="reserve_3" id="reserve_3" value="{$form.reserve_3}" size="30" maxlength="10" />
		<input type="button" name="clr_reserve_3" id="clr_reserve_3" value="クリア" />
	</td>
	<td></td>
</tr>
<tr>
	<td>予備4</td>
	<td>255文字まで</td>
	<td>
		<input type="text" name="reserve_4" id="reserve_4" value="{$form.reserve_4}" size="30" maxlength="255" />
		<input type="button" name="clr_reserve_4" id="clr_reserve_4" value="クリア" />
	</td>
	<td>※区分1='003'(開催地)の場合、国旗画像ファイル名を設定。</td>
</tr>
<tr>
	<td>予備5</td>
	<td>255文字まで</td>
	<td>
		<input type="text" name="reserve_5" id="reserve_5" value="{$form.reserve_5}" size="30" maxlength="255" />
		<input type="button" name="clr_reserve_5" id="clr_reserve_5" value="クリア" />
	</td>
	<td></td>
</tr>
<tr>
	<td>予備6</td>
	<td>255文字まで</td>
	<td>
		<input type="text" name="reserve_6" id="reserve_6" value="{$form.reserve_6}" size="30" maxlength="255" />
		<input type="button" name="clr_reserve_6" id="clr_reserve_6" value="クリア" />
	</td>
	<td></td>
</tr>
{if '1'==$app.mode}
<tr>
	<td>削除</td>
	<td colspan="3">
		<input type="checkbox" name="del" id="del" value="1" />※入力項目に関係なく物理削除する
	</td>
</tr>
{/if}
</table>

※空欄はnullが設定されます。<br/>
※内容(日本語・英語)は必須です。<br/>
※「更新」「登録」後は元に戻せません。<br/>

{if '1'==$app.mode}
<input type="button" name="btn_regist" id="btn_regist" value="更新" />
{elseif '2'==$app.mode}
<input type="button" name="btn_regist" id="btn_regist" value="登録" />
{/if}
<input type="button" name="btn_reset" id="btn_reset" value="元に戻す" />

{/if}
</form>

<script type="text/javascript">
{literal}
$(function(){
	$("#clr_discription_jp").click(function(){
		$("#discription_jp").val('');
	});
});
$(function(){
	$("#clr_discription_en").click(function(){
		$("#discription_en").val('');
	});
});
$(function(){
	$("#clr_disp_cd").click(function(){
		$("#disp_cd").val('');
	});
});
$(function(){
	$("#clr_disp_num").click(function(){
		$("#disp_num").val('');
	});
});
$(function(){
	$("#clr_reserve_1").click(function(){
		$("#reserve_1").val('');
	});
});
$(function(){
	$("#clr_reserve_2").click(function(){
		$("#reserve_2").val('');
	});
});
$(function(){
	$("#clr_reserve_3").click(function(){
		$("#reserve_3").val('');
	});
});
$(function(){
	$("#clr_reserve_4").click(function(){
		$("#reserve_4").val('');
	});
});
$(function(){
	$("#clr_reserve_5").click(function(){
		$("#reserve_5").val('');
	});
});
$(function(){
	$("#clr_reserve_6").click(function(){
		$("#reserve_6").val('');
	});
});
$(function(){
	$("#btn_reset").click(function(){
		if (!window.confirm('変更を破棄します。よろしいですか？')) {
			return false;
		}
		$("#kbn_1").val($("#kbn_1_save").val());
		$("#kbn_2").val($("#kbn_2_save").val());
		$("#kbn_3").val($("#kbn_3_save").val());
		$("#kbn_4").val($("#kbn_4_save").val());
		$("#form_search").submit();
	});
});
$(function(){
	$("#btn_search").click(function(){
		if ('' == $("#kbn_1").val() || '' == $("#kbn_2").val() || '' == $("#kbn_3").val() || '' == $("#kbn_4").val()) {
			window.alert("区分１～４は全て必須です。");
			return false;
		}
		$("#form_search").submit();
	});
});
$(function(){
	$("#btn_regist").click(function(){
		if ('' == $("#kbn_1").val() || '' == $("#kbn_2").val() || '' == $("#kbn_3").val() || '' == $("#kbn_4").val()) {
			window.alert("まず、検索して下さい。");
			return false;
		}
		if ('' == $("#discription_jp").val()) {
			window.alert("内容(日本語)は必須です。");
			return false;
		}
		if ('' == $("#discription_en").val()) {
			window.alert("内容(英語)は必須です。");
			return false;
		}
		if ('2' == $("#mode_save").val()) {
			if (!window.confirm('登録します。よろしいですか？')) {
				return false;
			}
		} else if ('1' == $("#del").attr('checked')) {
			if (!window.confirm('削除します。よろしいですか？')) {
				return false;
			}
		} else {
			if (!window.confirm('更新します。よろしいですか？')) {
				return false;
			}
		}
		$("#form_regist").submit();
	});
});
$(function(){
	$("#btn_list").click(function(){
		$("#kbn_1").val('');
		$("#kbn_2").val('');
		$("#kbn_3").val('');
		$("#kbn_4").val('');
		$("#mode").val('3');
		$("#form_search").submit();
	});
});
function do_edit(kbn_1, kbn_2, kbn_3, kbn_4) {
	$("#mode").val('0');
	$("#kbn_1").val(kbn_1);
	$("#kbn_2").val(kbn_2);
	$("#kbn_3").val(kbn_3);
	$("#kbn_4").val(kbn_4);
	$("#form_search").submit();
}
{/literal}
</script>
</body>
</html>
