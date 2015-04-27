<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
{if ("regist" == $form.mode)}
<title>ユーザー登録 - 世界の見本市・展示会 -ジェトロ</title>
{elseif ("change" == $form.mode)}
<title>ユーザー修正 - 世界の見本市・展示会 -ジェトロ</title>
{else}
<title>ユーザー削除 - 世界の見本市・展示会 -ジェトロ</title>
{/if}
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="http://www.jetro.go.jp/indexj.html"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/j-messe">見本市・展示会データベース（J-messe）</a></li>
					{if ("regist" == $form.mode)}
						<li><a href="{$config.url}?action_user_userRegist=true&back=1">ユーザー登録</a></li>
						<li>ユーザー登録確認</li>
					{elseif ("change" == $form.mode)}
						<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
						<li><a href="{$config.url}?action_user_userChange=true&user_id={$form.user_id}&mode={$form.mode}&back=1">ユーザー修正</a></li>
						<li>ユーザー修正確認</li>
					{else}
						<li><a href="{$config.url}?action_user_top=true">管理者メニュー</a></li>
						<li>ユーザー削除確認</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ("regist" == $form.mode)}
					<h1>ユーザー登録</h1>
				{elseif ("change" == $form.mode)}
					<h1>ユーザー修正</h1>
				{else}
					<h1>ユーザー削除</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/j-messe/images/db/user03.jpg" alt="userConfirm" />
				</div>
			</div>
			<div class="elem_paragraph">
				{if ("delete" == $form.mode)}
					<p>
						<font color="red">
							「完了」ボタンをクリックすると、ユーザ情報が削除されます。<br />
							ユーザ情報は元に戻せませんので、削除してもよいか再度ご確認ください。
						</font>
					</p>
				{else}
					<p>
						以下の内容に間違いがないかご確認の上、「完了」ボタンをクリックしてください。<br />
						修正したい場合は「戻る」ボタンをクリックしてください。
					</p>
				{/if}
			</div>
			<form name="form_user_userRegistDo" id="form_user_userRegistDo" method="post" action="">
				{uniqid}
				{if ("regist" == $form.mode)}
				<input type="hidden" name="action_user_userRegistDone" id="action_user_userRegistDone" value="dummy" />
				{else}
				<input type="hidden" name="action_user_userChangeDone" id="action_user_userChangeDone" value="dummy" />
				{/if}
				<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
				<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
				<!-- フォーム情報をhidden設定 -->
				<input type="hidden" name="email" id="email" value="{$form.email}" />
				<input type="hidden" name="password" id="password" value="{$form.password}" />
				<input type="hidden" name="companyNm" id="companyNm" value="{$form.companyNm}" />
				<input type="hidden" name="divisionDeptNm" id="divisionDeptNm" value="{$form.divisionDeptNm}" />
				<input type="hidden" name="userNm" id="userNm" value="{$form.userNm}" />
				<input type="hidden" name="genderCd" id="genderCd" value="{$form.genderCd}" />
				<input type="hidden" name="postCode" id="postCode" value="{$form.postCode}" />
				<input type="hidden" name="address" id="address" value="{$form.address}" />
				<input type="hidden" name="tel" id="tel" value="{$form.tel}" />
				<input type="hidden" name="fax" id="fax" value="{$form.fax}" />
				<input type="hidden" name="url" id="url" value="{$form.url}" />
				<input type="hidden" name="delFlg" id="delFlg" value="{$form.delFlg}" />
				<input type="hidden" name="emailCheckFlg" id="emailCheckFlg" value="{$form.emailCheckFlg}" />
				{* エラー表示 *}
				{if count($errors)}
					<ul>
						{foreach from=$errors item=error}
							<li><font color="#ff0000">{$error}</font></li>
						{/foreach}
					</ul>
				{/if}
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>Eメールとパスワード</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">Eメール</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.email}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">パスワード</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">●●●●●●●●</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>お客様情報入力</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">会社名</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.companyNm}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">部署名</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.divisionDeptNm}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">お名前</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.userNm}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">性別</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">
									{if $form.genderCd == "0"}男性{/if}
									{if $form.genderCd == "1"}女性{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">郵便番号</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.postCode}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">住所</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.address}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">TEL</th>
								<th class="bg_gray_lv1"><span class="cate">必須</span></th>
								<td class="bg_gray_lv2">{$form.tel}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">FAX</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.fax}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">御社のウェブサイトURL</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.url}</td>
							</tr>
						{if ("1" == $form.delFlg)}
							<tr>
								<th class="bg_gray_lv1 nobdr">削除確認</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">削除します。</td>
							</tr>
						{/if}
						</tbody>
					</table>
				</div>
				<p class="t_center">
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												{if ("regist" == $form.mode)}
													<a href="{$config.url}?action_user_userRegist=true&back=1" class="var_small"><span class="left">戻る</span></a>
												{elseif ("change" == $form.mode)}
													<a href="{$config.url}?action_user_userChange=true&user_id={$form.user_id}&mode={$form.mode}&back=1" class="var_small"><span class="left">戻る</span></a>
												{else}
													<a href="{$config.url}?action_user_top=true" class="var_small"><span class="left">戻る</span></a>
												{/if}
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<div id="next_btn">
													<a href="" onclick="document.form_user_userRegistDo.submit();return false;" class="var_small"><span>完了</span></a>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</p>
			</form>
			<!-- ** include START jetro_ssl_ja **  -->
			{include file="user/jetro_ssl_ja.tpl"}
			<!-- ** include END jetro_ssl_ja **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
