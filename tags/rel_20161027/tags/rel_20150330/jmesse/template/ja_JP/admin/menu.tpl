<div id="menu">
<font size="2">
<br/>
{if ("1" == $session.auth_user)}
<b>ユーザ情報</b><br />
・<a href="?action_admin_userRegist=true">ユーザ登録</a><br/>
・<a href="?action_admin_userSearch=true">ユーザ検索</a><br/>
・<a href="?action_admin_userTransferList=true">見本市未移譲ユーザ一覧表示</a><br/>
<br/>
{/if}
{if ("1" == $session.auth_fair)}
<b>展示会情報</b><br/>
総件数：{$app.fair_count}<br/>
一般公開件数：{$app.fair_count_front_fairs}<br/>
<br/>
・<a href="{$config.url}?action_admin_fairRegist=true">新規展示会登録</a><br/>
・<a href="{$config.url}?action_admin_fairSearch=true">展示会検索</a><br/>
・<a href="{$config.url}?action_admin_fairList=true&type=u">展示会未承認一覧表示</a><br/>
・<a href="{$config.url}?action_admin_fairList=true&type=d">展示会否認一覧表示</a><br/>
<br/>
{/if}
{* テキストエリアの改行コード *}
<textarea name="br" id="br" style="display:none;">

</textarea>
	</font>
</div>

