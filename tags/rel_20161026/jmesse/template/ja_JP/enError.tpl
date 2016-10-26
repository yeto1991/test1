<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="include_common_head.tpl"}
<title>System Error</title>
{include file="jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/en/"><img alt="home" src="/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li>System Error</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>System error</h1>
			</div>
			<div class="elem_pic_text_block">
				<div class="elem_pic_text_block_pad">
					<div class="box_text pr30" style="width:70%">
						<div class="elem_heading_lv2">
							<h2></h2>
						</div>
						<div class="elem_paragraph">
							{if count($errors)}
								<p>For the following reasons, can not display the page.</p>
								<ul>
									{foreach from=$errors item=error}
										<li>{$error}</li>
									{/foreach}
								</ul>
							{/if}
							<p>Close this trade fairs and exhibitions from the world's top database, please locate your pages.</p>
							<ul class="icon_arrow">
								<li><a href="/en/database/j-messe/">Back to Top Database of World Trade Fair.</a></li>
								<li><a href="/">English Back to top.</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- **************** jmesse_faqlogin **************** -->
			{$app_ne.jmessefaqlogin}
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
