{* 本番機では削除 *}
<base href="{$config.base}" />
{* /本番機では削除 *}
<link href="/css/jp/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/j-messe/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/jp/printmedia.css" rel="stylesheet" type="text/css" media="print" />
{if ('1' == $form.print)}
<link href="/css/jp/print.css" rel="stylesheet" type="text/css" media="all" />
{/if}

<script type="text/javascript" src="{$config.css_js_base}js/jquery.js"></script>
<script type="text/javascript" src="{$config.css_js_base}js/jquery/jquery.tools.min.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js/j-messe-form.js" charset="utf-8"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselectforjson.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselect.js"></script>
