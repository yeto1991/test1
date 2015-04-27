<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
{if ("regist" == $form.mode)}
<title>User Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{elseif ("change" == $form.mode)}
<title>User Editing - Online Trade Fair Database (J-messe) - JETRO</title>
{else}
<title>User Deleting - Online Trade Fair Database (J-messe) - JETRO</title>
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
					<li><a href="http://www.jetro.go.jp/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					{if ("regist" == $form.mode)}
						<li><a href="{$config.url}?action_user_enUserRegist=true&back=1">User Registration</a></li>
						<li>User Registration Confirm</li>
					{elseif ("change" == $form.mode)}
						<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
						<li><a href="{$config.url}?action_user_enUserChange=true&user_id={$form.user_id}&mode={$form.mode}&back=1">User Editing</a></li>
						<li>User Editing Confirm</li>
					{else}
						<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
						<li>User Deleting Confirm</li>
					{/if}
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				{if ("regist" == $form.mode)}
					<h1>User Registration</h1>
				{elseif ("change" == $form.mode)}
					<h1>Edit User Information</h1>
				{else}
					<h1>Withdrawal of User Registration</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/en/database/j-messe/images/db/user03.jpg" alt="userconfirm" />
				</div>
			</div>
			<div class="elem_paragraph">
				{if ("delete" == $form.mode)}
					<p>
						<font color="red">
							When you click “Finish,” all your registered information will be deleted.<br />
							Please consider carefully as the operation is undoable.
						</font>
					</p>
				{else}
					<p>
						Check that all of the following information is correct, and then click “Finish.”<br />
						If you need to make a correction, click “Back.”
					</p>
				{/if}
			</div>
			<form name="form_user_enUserRegistDo" id="form_user_enUserRegistDo" method="post" action="">
				{uniqid}
				{if ("regist" == $form.mode)}
					<input type="hidden" name="action_user_enUserRegistDone" id="action_user_enUserRegistDone" value="dummy" />
				{else}
					<input type="hidden" name="action_user_enUserChangeDone" id="action_user_enUserChangeDone" value="dummy" />
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
						<p><strong>E-mail Account and Password</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">email</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.email}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">password</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">●●●●●●●●</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>Other User Information</strong></p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
							<tr>
								<th class="bg_gray_lv1 nobdr">Company name</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.companyNm}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Division/Dept name</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.divisionDeptNm}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Your name</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.userNm}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Gender</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									{if $form.genderCd == "0"}Male{/if}
									{if $form.genderCd == "1"}Female{/if}
								</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Post Code</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.postCode}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">Address</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.address}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">TEL</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">{$form.tel}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">FAX</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.fax}</td>
							</tr>
							<tr>
								<th class="bg_gray_lv1 nobdr">URL</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">{$form.url}</td>
							</tr>
						{if ("1" == $form.delFlg)}
							<tr>
								<th class="bg_gray_lv1 nobdr">Withdrawal of Registration</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">I withdraw my registration.</td>
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
													<a href="{$config.url}?action_user_enUserRegist=true&back=1"class="var_small"><span class="left">Back</span></a>
												{elseif ("change" == $form.mode)}
													<a href="{$config.url}?action_user_enUserChange=true&user_id={$form.user_id}&mode={$form.mode}&back=1" class="var_small"><span class="left">Back</span></a>
												{else}
													<a href="{$config.url}?action_user_enTop=true" class="var_small"><span class="left">Back</span></a>
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
													<a href="" onclick="document.form_user_enUserRegistDo.submit();return false;" class="var_small"><span>Finish</span></a>
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
			<!-- ** include START jetro_ssl_en **  -->
			{include file="user/jetro_ssl_en.tpl"}
			<!-- ** include END jetro_ssl_en **  -->
		</div>
	</div>
	<!-- **************** jetro_footer **************** -->
	{$app_ne.jetrofooter}
</body>
</html>
