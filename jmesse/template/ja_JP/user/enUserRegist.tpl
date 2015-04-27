<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
{if ("regist" == $form.mode)}
<title>User Registration - Online Trade Fair Database (J-messe) - JETRO</title>
{else}
<title>User Editing - Online Trade Fair Database (J-messe) - JETRO</title>
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
						<li>User Registration</li>
					{else}
						<li><a href="{$config.url}?action_user_enTop=true">Administration Menus</a></li>
						<li>User Editing</li>
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
				{else}
					<h1>Edit User Information</h1>
				{/if}
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img src="http://www.jetro.go.jp/library/en/database/j-messe/images/db/user02.jpg " alt=userenter" />
				</div>
			</div>
			<form name="form_user_enUserRegist" id="form_user_enUserRegist" method="post" action="">
				{if ("regist" == $form.mode)}
					<input type="hidden" name="action_user_enUserRegistDo" id="action_user_enUserRegistDo" value="dummy" />
				{else}
					<input type="hidden" name="action_user_enUserChangeDo" id="action_user_enUserChangeDo" value="dummy" />
				{/if}
				<input type="hidden" name="user_id" id="user_id" value="{$form.user_id}" />
				<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
				{* エラー表示 *}
				{if count($errors)}
					<p class="error-message" id="error-pagetop">The data you have entered is invalid. Please re-enter.</p>
				{/if}
				<div class="elem_table_basic">
					<div class="elem_table_heading">
						<p><strong>E-mail Account and Password</strong></p>
					</div>
					<div class="elem_paragraph">
						<p class="text">
							Please register your e-mail address and password to log into J-messe.<br />
							(※ All letters entered for e-mail registration will be automatically converted to lowercase.)
						</p>
					</div>
					<table id="registration" class="var_there_boder var_base_color elem_table_basic var_ptb8">
						<colgroup>
							<col width="15%">
							<col width="7%">
							<col width="78%">
						</colgroup>
						<tbody>
						{if is_error('email')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">email</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.email}" size="50" name="email" id="email" class="var_bg_white" />
									</div>
									{if is_error('email')}
										<span class="error-message">{message name="email"}</span>
									{/if}
								</td>
							</tr>
						{if is_error('email2')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">email(Confirm)</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.email2}" size="50" name="email2" id="email2" class="var_bg_white" />
									</div>
									{if is_error('email2')}
										<span class="error-message">{message name="email2"}</span><br />
									{/if}
									<strong>Re-enter the e-mail address for confirmation.</strong>
								</td>
							</tr>
						{if is_error('password')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">password</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="password" value="{$form.password}" size="20" name="password" id="password" autocomplete="off" class="var_bg_white" />
									</div>
									{if is_error('password')}
										<span class="error-message">{message name="password"}</span><br />
									{/if}
									<strong>Enter a login password with a combination of 4 to 8 single-byte letters and numbers.</strong>
								</td>
							</tr>
						{if is_error('password2')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">password(Confirm)</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="password" value="{$form.password2}" size="20" name="password2" id="password2" autocomplete="off" class="var_bg_white" />
									</div>
									{if is_error('password2')}
										<span class="error-message">{message name="password2"}</span><br />
									{/if}
									<strong>Re-enter the password for confirmation.</strong>
								</td>
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
						{if is_error('companyNm')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Company name</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.companyNm}" size="60" name="companyNm" id="companyNm" class="var_bg_white" />
									</div>
									{if is_error('companyNm')}
										<span class="error-message">{message name="companyNm"}</span>
									{/if}
								</td>
							</tr>
						{if is_error('divisionDeptNm')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Division/Dept name</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.divisionDeptNm}" size="60" name="divisionDeptNm" id="divisionDeptNm" class="var_bg_white" />
									</div>
									{if is_error('divisionDeptNm')}
											<span class="error-message">{message name="divisionDeptNm"}</span>
									{/if}
								</td>
							</tr>
						{if is_error('userNm')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Your name</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.userNm}" size="60" name="userNm" id="userNm" class="var_bg_white" />
									</div>
									{if is_error('userNm')}
										<span class="error-message">{message name="userNm"}</span><br />
									{/if}
								</td>
							</tr>
						{if is_error('genderCd')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Gender</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_form_list pt0 pb0">
										<ul class="liner">
											<li>
												<label>
													<input type="radio" name="genderCd" id="genderCd" value="0" {if $form.genderCd == "0" } checked {/if} />
													<span>Male</span>
												</label>
											</li>
											<li>
												<label>
													<input type="radio" name="genderCd" id="genderCd" value="1" {if $form.genderCd == "1" } checked {/if} />
													<span>Female</span>
												</label>
											</li>
										</ul>
									</div>
									{if is_error('genderCd')}
										<span class="error-message">{message name="genderCd"}</span>
									{/if}
								</td>
							</tr>
						{if is_error('postCode')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Post Code</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" maxlength="20" value="{$form.postCode}" size="10" name="postCode" id="postCode" class="var_bg_white" />(single-byte letters and numbers)
									</div>
									{if is_error('postCode')}
										<span class="error-message">{message name="postCode"}</span><br />
									{/if}
									Insert a hyphen between each group of numbers.(E.g. for an address in Japan: 123-4568)
								</td>
							</tr>
						{if is_error('address')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">Address</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.address}" size="80" name="address" id="address" class="var_bg_white" />
									</div>
									{if is_error('address')}
										<span class="error-message">{message name="address"}</span>
									{/if}
								</td>
							</tr>
						{if is_error('tel')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">TEL</th>
								<th class="bg_gray_lv1"><span class="cate">Required</span></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.tel}" size="30" name="tel" id="tel" class="var_bg_white" />(single-byte letters and numbers)
									</div>
									{if is_error('tel')}
										<span class="error-message">{message name="tel"}</span><br />
									{/if}
									Enter the numbers starting with a plus mark “+” followed by the country code. <br />
									Insert hyphens between each group of numbers.(E.g. for a phone number in Tokyo: +81-3-1234-5678)
								</td>
							</tr>
						{if is_error('fax')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">FAX</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.fax}" size="30" name="fax" id="fax" class="var_bg_white" />(single-byte letters and numbers)
									</div>
									{if is_error('fax')}
										<span class="error-message">{message name="fax"}</span><br />
									{/if}
									Enter the numbers starting with a plus mark “+” followed by the country code. <br />
									Insert hyphens between each group of numbers.(E.g. for a fax number in Tokyo: +81-3-1234-5678)
								</td>
							</tr>
						{if is_error('url')}
							<tr class="errorcheck">
						{else}
							<tr>
						{/if}
								<th class="bg_gray_lv1 nobdr">URL</th>
								<th class="bg_gray_lv1"></th>
								<td class="bg_gray_lv2">
									<div class="elem_custom_input pt0 pb0">
										<input type="text" value="{$form.url}" size="60" name="url" id="url" class="var_bg_white" />
									</div>
									{if is_error('url')}
										<span class="error-message">{message name="url"}</span><br />
									{/if}
									Enter the URL beginning with “http(s)://”.
								</td>
							</tr>
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
													<a href="{$config.url}?action_user_enUserTerms=true" class="var_small"><span class="left">Back</span></a>
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
													<a href="" onclick="document.form_user_enUserRegist.submit();return false;" class="var_small"><span>To Confirm</span></a>
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
