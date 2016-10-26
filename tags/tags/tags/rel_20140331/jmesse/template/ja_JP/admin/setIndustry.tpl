<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="{$config.css_js_base}js/jquery.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselect.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselectforjson.js"></script>
<title>業種設定画面</title>
</head>
<body>
<h1>業種設定画面</h1>
<hr/>

<form name="form_search" id="form_search" method="post" action="">
<input type="hidden" name="action_admin_setIndustry" id="action_admin_setIndustry" value="dummy" />
<input type="hidden" name="regist" id="regist" value="" />
見本市番号
<input type="text" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
<input type="button" name="btn_search" id="btn_search" value="検索" />
</form>

{* エラー表示 *}
{if count($errors)}
<ul>
	{foreach from=$errors item=error}
	<li><font color="#ff0000">{$error}</font></li>
	{/foreach}
</ul>
{/if}
<hr/>

{if ('' != $form.mihon_no && !count($errors))}
<form name="form_regist" id="form_regist" method="post" action="">
<input type="hidden" name="action_admin_setIndustry" id="action_admin_setIndustry" value="dummy" />
<input type="hidden" name="regist" id="regist" value="1" />
<input type="hidden" name="mihon_no" id="mihon_no_save" value="{$form.mihon_no}" />

<table border="1" style="width:550px">
<tr>
	<th style="width:115px">見本市名(日)</th>
	<td><span id="title_jp">{$app.fair_title_jp}</span></td>
</tr>
<tr>
	<th>見本市名(英)</th>
	<td><span id="title_en">{$app.fair_title_en}</span></td>
</tr>
</table>
<br/>
<table border="1" style="width:550px">
<tr>
	<th></th>
	<th style="width:170px;">大分類</th>
	<th style="width:300px;">小分類</th>
</tr>

<tr>
	<td>業種(1)</td>
	<td>
		<select name="main_industory_1" id="main_industory_1">
			<option value="">...</option>
			{section name=it loop=$app.main_industory}
			<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory_1 == $app.main_industory[it].kbn_2)}selected{/if}>{$app.main_industory[it].discription_jp}</option>
			{/section}
		</select>
		(<span id="mi_1">{$form.main_industory_1}</span>)
	</td>
	<td>
		<select name="sub_industory_1" id="sub_industory_1" style="width:250px;">
		</select>
		(<span id="si_1">{$form.sub_industory_1}</span>)
	</td>
</tr>

<tr>
	<td>業種(2)</td>
	<td>
		<select name="main_industory_2" id="main_industory_2">
			<option value="">...</option>
			{section name=it loop=$app.main_industory}
			<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory_2 == $app.main_industory[it].kbn_2)}selected{/if}>{$app.main_industory[it].discription_jp}</option>
			{/section}
		</select>
		(<span id="mi_2">{$form.main_industory_2}</span>)
	</td>
	<td>
		<select name="sub_industory_2" id="sub_industory_2" style="width:250px;">
		</select>
		(<span id="si_2">{$form.sub_industory_2}</span>)
	</td>
</tr>

<tr>
	<td>業種(3)</td>
	<td>
		<select name="main_industory_3" id="main_industory_3">
			<option value="">...</option>
			{section name=it loop=$app.main_industory}
			<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory_3 == $app.main_industory[it].kbn_2)}selected{/if}>{$app.main_industory[it].discription_jp}</option>
			{/section}
		</select>
		(<span id="mi_3">{$form.main_industory_3}</span>)
	</td>
	<td>
		<select name="sub_industory_3" id="sub_industory_3" style="width:250px;">
		</select>
		(<span id="si_3">{$form.sub_industory_3}</span>)
	</td>
</tr>

<tr>
	<td>業種(4)</td>
	<td>
		<select name="main_industory_4" id="main_industory_4">
			<option value="">...</option>
			{section name=it loop=$app.main_industory}
			<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory_4 == $app.main_industory[it].kbn_2)}selected{/if}>{$app.main_industory[it].discription_jp}</option>
			{/section}
		</select>
		(<span id="mi_4">{$form.main_industory_4}</span>)
	</td>
	<td>
		<select name="sub_industory_4" id="sub_industory_4" style="width:250px;">
		</select>
		(<span id="si_4">{$form.sub_industory_4}</span>)
	</td>
</tr>

<tr>
	<td>業種(5)</td>
	<td>
		<select name="main_industory_5" id="main_industory_5">
			<option value="">...</option>
			{section name=it loop=$app.main_industory}
			<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory_5 == $app.main_industory[it].kbn_2)}selected{/if}>{$app.main_industory[it].discription_jp}</option>
			{/section}
		</select>
		(<span id="mi_5">{$form.main_industory_5}</span>)
	</td>
	<td>
		<select name="sub_industory_5" id="sub_industory_5" style="width:250px;">
		</select>
		(<span id="si_5">{$form.sub_industory_5}</span>)
	</td>
</tr>

<tr>
	<td>業種(6)</td>
	<td>
		<select name="main_industory_6" id="main_industory_6">
			<option value="">...</option>
			{section name=it loop=$app.main_industory}
			<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory_6 == $app.main_industory[it].kbn_2)}selected{/if}>{$app.main_industory[it].discription_jp}</option>
			{/section}
		</select>
		(<span id="mi_6">{$form.main_industory_6}</span>)
	</td>
	<td>
		<select name="sub_industory_6" id="sub_industory_6" style="width:250px;">
		</select>
		(<span id="si_6">{$form.sub_industory_6}</span>)
	</td>
</tr>
</table>
※空欄はnullが設定されます。<br/>
※重複チェックは行いません。<br/>
※業種(1)は必須です。<br/>
※そのまま登録されるので、途中の空欄は無い方が安全です。<br/>
※「更新」後は元に戻せません。<br/>
<input type="button" name="btn_regist" id="btn_regist" value="更新" />
<input type="button" name="btn_reset" id="btn_reset" value="元に戻す" />
</form>
{/if}

<script type="text/javascript">
{literal}
$(function(){
	$("document").ready(function(){
{/literal}
		var main_industory_1 = '{$form.main_industory_1}';
		var main_industory_2 = '{$form.main_industory_2}';
		var main_industory_3 = '{$form.main_industory_3}';
		var main_industory_4 = '{$form.main_industory_4}';
		var main_industory_5 = '{$form.main_industory_5}';
		var main_industory_6 = '{$form.main_industory_6}';
		var sub_industory_1 = '{$form.sub_industory_1}';
		var sub_industory_2 = '{$form.sub_industory_2}';
		var sub_industory_3 = '{$form.sub_industory_3}';
		var sub_industory_4 = '{$form.sub_industory_4}';
		var sub_industory_5 = '{$form.sub_industory_5}';
		var sub_industory_6 = '{$form.sub_industory_6}';
{literal}
		if ('' != main_industory_1) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_1+'&use_language_flag=0', '', '#sub_industory_1', sub_industory_1);
		}
		if ('' != main_industory_2) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_2+'&use_language_flag=0', '', '#sub_industory_2', sub_industory_2);
		}
		if ('' != main_industory_3) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_3+'&use_language_flag=0', '', '#sub_industory_3', sub_industory_3);
		}
		if ('' != main_industory_4) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_4+'&use_language_flag=0', '', '#sub_industory_4', sub_industory_4);
		}
		if ('' != main_industory_5) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_5+'&use_language_flag=0', '', '#sub_industory_5', sub_industory_5);
		}
		if ('' != main_industory_6) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_6+'&use_language_flag=0', '', '#sub_industory_6', sub_industory_6);
		}
	});
});
$(function(){
	$("#main_industory_1").change(function(){
		var main_industory_1 = $("#main_industory_1 option:selected").val();
		$("#mi_1").html(main_industory_1);
		if ('' != main_industory_1) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_1+'&use_language_flag=0', '', '#sub_industory_1', '');
		} else {
			$("#sub_industory_1").html('');
		}
		$("#si_1").empty();
	});
});
$(function(){
	$("#main_industory_2").change(function(){
		var main_industory_2 = $("#main_industory_2 option:selected").val();
		$("#mi_2").html(main_industory_2);
		if ('' != main_industory_2) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_2+'&use_language_flag=0', '', '#sub_industory_2', '');
		} else {
			$("#sub_industory_2").html('');
		}
		$("#si_2").html('');
	});
});
$(function(){
	$("#main_industory_3").change(function(){
		var main_industory_3 = $("#main_industory_3 option:selected").val();
		$("#mi_3").html(main_industory_3);
		if ('' != main_industory_3) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_3+'&use_language_flag=0', '', '#sub_industory_3', '');
		} else {
			$("#sub_industory_3").html('');
		}
		$("#si_3").html('');
	});
});
$(function(){
	$("#main_industory_4").change(function(){
		var main_industory_4 = $("#main_industory_4 option:selected").val();
		$("#mi_4").html(main_industory_4);
		if ('' != main_industory_4) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_4+'&use_language_flag=0', '', '#sub_industory_4', '');
		} else {
			$("#sub_industory_4").html('');
		}
		$("#si_4").html('');
	});
});
$(function(){
	$("#main_industory_5").change(function(){
		var main_industory_5 = $("#main_industory_5 option:selected").val();
		$("#mi_5").html(main_industory_5);
		if ('' != main_industory_5) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_5+'&use_language_flag=0', '', '#sub_industory_5', '');
		} else {
			$("#sub_industory_5").html('');
		}
		$("#si_5").html('');
	});
});
$(function(){
	$("#main_industory_6").change(function(){
		var main_industory_6 = $("#main_industory_6 option:selected").val();
		$("#mi_6").html(main_industory_6);
		if ('' != main_industory_6) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory_6+'&use_language_flag=0', '', '#sub_industory_6', '');
		} else {
			$("#sub_industory_6").html('');
		}
		$("#si_6").html('');
	});
});
$(function(){
	$("#sub_industory_1").change(function(){
		$("#si_1").html($("#sub_industory_1 option:selected").val());
	});
});
$(function(){
	$("#sub_industory_2").change(function(){
		$("#si_2").html($("#sub_industory_2 option:selected").val());
	});
});
$(function(){
	$("#sub_industory_3").change(function(){
		$("#si_3").html($("#sub_industory_3 option:selected").val());
	});
});
$(function(){
	$("#sub_industory_4").change(function(){
		$("#si_4").html($("#sub_industory_4 option:selected").val());
	});
});
$(function(){
	$("#sub_industory_5").change(function(){
		$("#si_5").html($("#sub_industory_5 option:selected").val());
	});
});
$(function(){
	$("#sub_industory_6").change(function(){
		$("#si_6").html($("#sub_industory_6 option:selected").val());
	});
});
$(function(){
	$("#btn_search").click(function(){
		if ('' == $("#mihon_no").val()) {
			window.alert("見本市番号は必須です。");
			return false;
		}
		$("#form_search").submit();
	});
});
$(function(){
	$("#btn_regist").click(function(){
		if ('' == $("#mihon_no_save").val()) {
			window.alert("まず、検索して下さい。");
			return false;
		}
		if ('' == $("#main_industory_1 option:selected").val() || '' == $("#sub_industory_1 option:selected").val()) {
			window.alert("業種(1)は必須です。");
			return false;
		}
		if ('' != $("#main_industory_2 option:selected").val() && '' == $("#sub_industory_2 option:selected").val()) {
			window.alert("業種(2)の小分類を選択して下さい。");
			return false;
		}
		if ('' != $("#main_industory_3 option:selected").val() && '' == $("#sub_industory_3 option:selected").val()) {
			window.alert("業種(3)の小分類を選択して下さい。");
			return false;
		}
		if ('' != $("#main_industory_4 option:selected").val() && '' == $("#sub_industory_4 option:selected").val()) {
			window.alert("業種(4)の小分類を選択して下さい。");
			return false;
		}
		if ('' != $("#main_industory_5 option:selected").val() && '' == $("#sub_industory_5 option:selected").val()) {
			window.alert("業種(5)の小分類を選択して下さい。");
			return false;
		}
		if ('' != $("#main_industory_6 option:selected").val() && '' == $("#sub_industory_6 option:selected").val()) {
			window.alert("業種(6)の小分類を選択して下さい。");
			return false;
		}
		if (!window.confirm('更新します。よろしいですか？')) {
			return false;
		}
		$("#form_regist").submit();
	});
});
$(function(){
	$("#btn_reset").click(function(){
		if (!window.confirm('変更を破棄します。よろしいですか？')) {
			return false;
		}
		$("#mihon_no").val($("#mihon_no_save").val());
		if ('' == $("#mihon_no").val()) {
			window.alert("見本市番号は必須です。");
			return false;
		}
		$("#form_search").submit();
	});
});
{/literal}
</script>

</body>
</html>
