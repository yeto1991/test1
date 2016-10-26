<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<form name="form_search" id="form_search" method="post" action="">
<input type="hidden" name="action_admin_setVenue" id="action_admin_setVenue" value="dummy"/>
<input type="hidden" name="type" id="type" value="1" />
<table>
<tr>
	<td>文書番号</td><td><input type="text" name="doc_no" id="doc_no" value="{$form.doc_no}"/></td>
</tr>
</table>
<input type="submit" value="検索" />
</form>

<table border="1">
<tr>
	<td rowspan="3">見本市</td><td><a href="{{$config.url}}?action_admin_fairDetail=true&type=a&mihon_no={$app.mihon_no}" target="_blank">{$app.mihon_no}</a></td>
</tr>
<tr>
	<td>{$app.fair_title_jp}</td>
</tr>
<tr>
	<td>{$app.fair_title_en}</td>
</tr>
</table>

<form name="form_regist" id="form_regist" method="post" action="">
<input type="hidden" name="action_admin_setVenue" id="action_admin_setVenue" value="dummy" />
<input type="hidden" name="mihon_no" id="mihon_no" value="{$app.mihon_no}" />
<input type="hidden" name="regist" id="regist" value="1" />
開催地
<table border="1">
<tr>
	<td>地域</td><td><input type="text" name="region" id="region" value="{$form.region}"/></td>
</tr>
<tr>
	<td>国</td><td><input type="text" name="country" id="country" value="{$form.country}"/></td>
</tr>
<tr>
	<td>都市</td><td><input type="text" name="city" id="city" value="{$form.city}"/></td>
</tr>
<tr>
	<td>その他（日）</td><td><input type="text" name="other_city_jp" id="other_city_jp" value="{$form.other_city_jp}"/></td>
</tr>
<tr>
	<td>その他（英）</td><td><input type="text" name="other_city_en" id="other_city_en" value="{$form.other_city_en}"/></td>
</tr>
<tr>
</tr>
</table>
<input type="submit" value="登録" />
</form>

</body>
</html>
