<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
{literal}
<!--
	function set_city() {
		for (i = 0; i < document.getElementsByName('city').length; i++) {
			if ('0' == document.getElementById('use_language_flag').value) {
				window.opener.document.getElementById('city_jp').value = '';
				window.opener.document.getElementById('city_name_jp').value = '';
			} else if ('1' == document.getElementById('use_language_flag').value) {
				window.opener.document.getElementById('city_en').value = '';
				window.opener.document.getElementById('city_name_en').value = '';
			} else {
				window.opener.document.getElementById('city').value = '';
				window.opener.document.getElementById('city_name').value = '';
			}
			if (document.getElementsByName('city')[i].checked) {
				city = document.getElementsByName('city')[i].value.split(':');
				if ('0' == document.getElementById('use_language_flag').value) {
					window.opener.document.getElementById('city_jp').value = city[0];
					window.opener.document.getElementById('city_name_jp').value = city[1];
				} else if ('0' == document.getElementById('use_language_flag').value) {
					window.opener.document.getElementById('city_en').value = city[0];
					window.opener.document.getElementById('city_name_en').value = city[1];
				} else {
					window.opener.document.getElementById('city').value = city[0];
					window.opener.document.getElementById('city_name').value = city[1];
				}
				break;
			}
		}
		window.close();
	}
// -->
{/literal}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form name="form_selectCity" id="form_selectCity" method="post" action="">
		<input type="hidden" name="use_language_flag" id="use_language_flag" value="{$app.use_language_flag}" />
		<input type="button" value="決定" onclick="set_city()" />
		<input type="button" value="閉じる" onclick="window.close();" />
		<hr />
		<table border="1">
			{if "0" == $app.use_language_flag}
			{section name=it loop=$app.city}
			<tr>
				<td><input type="radio" name="city" id="city" value="{$app.city[it].kbn_4}:{$app.city[it].discription_jp}" /></td>
				<td>{$app.city[it].discription_jp}</td>
			</tr>
			{/section}
			{elseif "0" == $app.use_language_flag}
			{section name=it loop=$app.city}
			<tr>
				<td><input type="radio" name="city" id="city" value="{$app.city[it].kbn_4}:{$app.city[it].discription_en}" /></td>
				<td>{$app.city[it].discription_en}</td>
			</tr>
			{/section}
			{else}
			{section name=it loop=$app.city}
			<tr>
				<td><input type="radio" name="city" id="city" value="{$app.city[it].kbn_4}:{$app.city[it].discription_jp}" /></td>
				<td>{$app.city[it].discription_jp}</td>
			</tr>
			{/section}
			{/if}
		</table>
		<hr />
		<input type="button" value="決定" onclick="set_city()" />
		<input type="button" value="閉じる" onclick="window.close();" />
	</form>
</body>
</html>
