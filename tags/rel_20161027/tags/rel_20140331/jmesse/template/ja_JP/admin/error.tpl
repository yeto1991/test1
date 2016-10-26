<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error page</title>
</head>
<body>
	<div align="center">
		<font size=5><b>System error</b></font>
		<hr />
	</div>
	<ul>
		{if count($errors)}
		{foreach from=$errors item=error}
		<li><font color="#ff0000">{$error}</font></li>
		{/foreach}
		{/if}
	</ul>
</body>
</html>
