<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="{$config.css_js_base}js/jquery.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselect.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselectforjson.js"></script>
<title>開催地設定画面</title>
</head>
<body>
<h1>開催地設定画面</h1>
<hr/>

<form name="form_search" id="form_search" method="post" action="">
<input type="hidden" name="action_admin_setKaisaichi" id="action_admin_setKaisaichi" value="dummy" />
<input type="hidden" name="regist" id="regist" value="" />
見本市番号
<input type="text" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
<input type="button" name="btn_search" id="btn_search" value="検索" />
</form>

{* エラー表示 *}
{if count($errors)}
<ul>
	{foreach from=$errors item=error}
	<li><font color="#ff0000">{$error}</font></li> {/foreach}
</ul>
{/if}
<hr />

{if ('' != $form.mihon_no && !count($errors))}
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

<form name="form_regist" id="form_regist" method="post" action="">
	<input type="hidden" name="action_admin_setKaisaichi" id="action_admin_setKaisaichi" value="dummy" />
	<input type="hidden" name="regist" id="regist" value="1" />
	<input type="hidden" name="mihon_no" id="mihon_no_save" value="{$form.mihon_no}" />
	<table border="1" style="width:550px">
		<tr>
			<td style="width:115px">地域</td>
			<td>
				<select name="region" id="region" style="width:210px;">
					<option value="">...</option>
					{section name=it loop=$app.region_list}
					<option value="{$app.region_list[it].kbn_2}" {if ($app.region_list[it].kbn_2 == $form.region)}selected{/if}>{$app.region_list[it].discription_jp}</option>
					{/section}
				</select>
				(<span id="re">{$form.region}</span>)
			</td>
		</tr>
		<tr>
			<td>国・地域</td>
			<td>
				<select name="country" id="country" style="width:210px;">
					<option value="">...</option>
				</select>
				(<span id="co">{$form.country}</span>)
			</td>
		</tr>
		<tr>
			<td>都市</td>
			<td>
				<select name="city" id="city" style="width:210px;">
					<option value="">...</option>
				</select>
				(<span id="ci">{$form.city}</span>)
			</td>
		</tr>
		<tr>
			<td style="width:115px">その他都市(日)</td>
			<td>
				<input type="text" name="other_city_jp" id="other_city_jp" value="{$form.other_city_jp}" maxlength="100" style="width:350px;"/>
				<input type="button" name="clr_other_city_jp" id="clr_other_city_jp" value="クリア" />
			</td>
		</tr>
		<tr>
			<td>その他都市(英)</td>
			<td>
				<input type="text" name="other_city_en" id="other_city_en" value="{$form.other_city_en}" maxlength="100" style="width:350px;"/>
				<input type="button" name="clr_other_city_en" id="clr_other_city_en" value="クリア" />
			</td>
		</tr>
	</table>
※「日本語ページ」「英語ページ」の判定は行いません。<br/>
　「その他都市」は「日・英」両方を入力することをお勧めします。<br/>
※「地域」「国・地域」は必須です。<br/>
※「都市」「その他都市(日・英)」のいずれかを選択、または、入力して下さい。<br/>
※空欄は「'':空文字」が設定されます。<br/>
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
		region = '{$form.region}';
		country = '{$form.country}';
		city = '{$form.city}';
{literal}
		if ('' != region) {
			dynamicpulldownlist('?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=0', '', '#country', country);
			if ('' != country) {
				dynamicpulldownlist('?action_json_getCity=true&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=0', '', '#city', city);
			}
		}
	});
});
$(function(){
	$("#region").change(function(){
		var region = $("#region option:selected").val();
		$("#re").html(region);
		if ('' != region) {
			dynamicpulldownlist('?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=0', '', '#country', null);
		} else {
			$("#country").html('<option value="">...</option>');
		}
		$("#co").html('');
		$("#city").html('<option value="">...</option>');
		$("#ci").html('');
	});
});
$(function(){
	$("#country").change(function(){
		var region = $("#region option:selected").val();
		var country = $("#country option:selected").val();
		$("#co").html(country);
		if ('' != country) {
			dynamicpulldownlist('?action_json_getCity=true&kbn_2='+region+'&kbn_3='+country+'&use_language_flag=0', '', '#city', null);
		} else {
			$("#city").html('<option value="">...</option>');
		}
		$("#ci").html('');
	});
});
$(function(){
	$("#city").change(function(){
		var city = $("#city option:selected").val();
		$("#ci").html(city);
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
		if ('' == $("#region option:selected").val()) {
			window.alert("地域は必須です。");
			return false;
		}
		if ('' == $("#country option:selected").val()) {
			window.alert("国・地域は必須です。");
			return false;
		}
		if ('' == $("#city option:selected").val() && '' == $("#other_city_jp").val() && '' == $("#other_city_en").val()) {
			window.alert("都市を選択するか、その他都市に入力して下さい。");
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
$(function(){
		$("#clr_other_city_jp").click(function(){
			$("#other_city_jp").val('');
		});
});
$(function(){
	$("#clr_other_city_en").click(function(){
		$("#other_city_en").val('');
	});
});
{/literal}
</script>
</body>
</html>
