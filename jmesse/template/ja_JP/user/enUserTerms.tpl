<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
{$app_ne.headtagu}
{include file="user/include_common_head.tpl"}
<script type="text/javascript">
<!--
{literal}
	function agreecheck(url) {
		flag = document.userTermForm.agreement.checked;
		if(flag) {
			location.href = url + '?action_user_enUserRegist=true';
			return;
		}
		window.alert("To go to the page of User Registration is required the agreement of this terms of Use.");
	}
{/literal}
-->
</script>
<title>Terms of Use - Online Trade Fair Database (J-messe) - JETRO</title>
{include file="user/jetro_gtm_snippet.tpl"}
</head>
<body class="layout-C" id="PageTop">

	<!-- **************** jetro_header **************** -->
	{$app_ne.jetroheader}

	<div id="area_content_wrap">
		<div id="elem_topic_path">
			<div id="elem_topic_path_pad">
				<ul>
					<li><a href="/en/"><img alt="home" src="http://www.jetro.go.jp/images/en/new/content_images/icon/icon_home.gif" /></a></li>
					<li><a href="http://www.jetro.go.jp/en/database/j-messe/">Online Trade Fair Database (J-messe)</a></li>
					<li>User Registration(Terms of Use)</li>
				</ul>
			</div>
		</div>

		<!-- **************** jmesse_top **************** -->
		{$app_ne.jmessetop}

		<div id="area_content_main">
			<div id="elem_heading_lv1">
				<h1>User Registration(Terms of Use)</h1>
			</div>
			<div class="elem_pic">
				<div class="center elem_pic_pad">
					<img alt="Terms of Use" src="http://www.jetro.go.jp/library/en/database/j-messe/images/db/user01.jpg" />
				</div>
			</div>
			<form name="userTermForm">
				<div class="elem_table_heading">
					<p><strong>Terms of Use and Indemnity Related to the Registration of Trade Fairs</strong></p>
				</div>
				<ol class="terms">
					<li>Limitation of Trade Fair Information Registerees<br />Registration of trade fair related information is limited to organizers of trade fairs and exhibitions, their operating staff members or official agents.<br /><br /></li>
					<li>
						Right to Discontinue or Refuse Services<br />
						We will not publish registered information if it is deemed to apply to any of the following.<br />
						We will also cancel publication if the trade fair or exhibition is deemed, after publication, to apply to any of the following.<br />
						<strong>Events for which Registration will be Refused</strong><br />
						<ul class="inside">
							<li>Events with net floor space of less than 1000m2</li>
							<li>Seminars, lectures and the like<br />(If being held in conjunction with a trade fair, please enter the information in the specified column.)</li>
							<li>Events that are not being held for the purpose of conducting business negotiations<br />(e.g. spot sales and bazaars)</li>
							<li>Fashion shows (Shows attended by buyers may be registered.)</li>
							<li>By-invitation-only promotional events held by a single company</li>
							<li>Events which may possibly lend themselves to antisocial behavior</li>
							<li>Events that may possibly be detrimental to public safety or credibility</li>
							<li>Events that may violate related laws or official notices</li>
							<li>Other events which JETRO determines as being inappropriate</li>
						</ul><br />
					</li>
					<li>
						Revision or Updating of Trade Fair Information<br />
						If there are any changes to the registered information regarding the trade fair, please promptly revise or update the registered information. You cannot revise or update the information beginning on the day after the end of the trade fair term.<br />
						JETRO may revise or delete information related to trade fairs without notice to the registerees if JETRO determines that there is a need to revise or delete a portion of the registered content. <br /><br />
					</li>
					<li>
						Limitations on Liabilities and Remedies Related to the Trade Fair Information<br />
						JETRO disclaims all warranties, express or claimed, of any kind related to the content of the trade fair information (information, photographs, data, etc.) registered on this site. It is used at the sole risk of the User (registeree and viewer) and any liability is to be borne by the registeree. The User shall indemnify JETRO from any and all claims and damages resulting from the registered information. <br /><br />
					</li>
					<li>
						Time until Publication (Public Release)<br />
						In order to provide accurate information related to trade fairs for use in Japan and elsewhere, JETRO may choose to verify the content of the registered information prior to its publication. Please note beforehand that it will therefore take a certain of time for information to be published.<br /><br />
					</li>
					<li>
						Prohibited Actions<br />
						Registerees may not partake in any of the following or in actions which could possibly be construed as such:<br />
						<ol class="inside">
							<li>Actions contrary to public order and morality</li>
							<li>Actions violating laws</li>
							<li>Actions violating the copyrights of other registering companies or third parties</li>
							<li>Actions maligning or slandering other registering companies or third parties</li>
							<li>Actions causing losses to other registering companies or third parties</li>
							<li>Election campaigns or similar actions, or actions violating laws such as the Public Offices Election Law</li>
							<li>Actions that impede the administration of JETRO</li>
							<li>Sales and marketing activities that are not approved of by JETRO</li>
							<li>Other actions that JETRO deems to be inappropriate</li>
						</ol><br />
					</li>
					<li>
						Privacy Policy<br />
						Your personal information is treated properly according to JETRO's <a href="https://www.jetro.go.jp/en/privacy/">Privacy Policy.</a><br /><br />
					</li>
				</ol>
				<p class="t_center">
					<input type="checkbox" name="agreement" id="agreement" value="1" /> I Agree to the Terms of Use.<br />
					<div class="elem_content_divide_block">
						<div class="content_divide_col3 elem_content_divide_block_pad">
							<div class="elem_content_divide_box">
								<div class="elem_linkBox_list">
									<ul class="var_large_pad">
										<li>
											<div class="linkBox">
												<a href="{$config.url}?action_user_enLogin=true" class="var_small"><span class="left">Back</span></a>
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
													<a href="javascript:void(0)" onclick="agreecheck('{$config.url}')" class="var_small"><span>Next</span></a>
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
