<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta name="Keywords" content="" />
{include file="user/header.tpl"}
<title>ユーザー登録 - 世界の見本市・展示会(J-messe) -ジェトロ</title>
</head>
<body class="layout-LC highlight-match j-messe">
	<!-- header -->
	{$app_ne.header}
	<!-- /header -->

	<!-- bread -->
	<div id="bread">
		<ul>
			<li><a href="http://www.jetro.go.jp/indexj.html">HOME</a></li>
			<li><a href="{$config.url_pub}">見本市・展示会データベース（J-messe）</a></li>
			<li>ユーザー登録</li>
		</ul>
	</div>
	<!-- /bread -->

	<!-- contents -->
	<div id="contents">


		<div class="area">
			<!-- left -->
			{$app_ne.left_menu}
			<!-- /left -->

			<!-- center -->
			<div id="center">
				<div id="main">
					<div class="bgbox_set">

						<div class="bgbox_base">

							<div class="h1">
								<h1>見本市・展示会データベース（J-messe）</h1>
							</div>

							<div class="h2">
								<h2>ユーザー登録</h2>
							</div>

							<div class="in_main">
								<h3 class="img t_center">
									<img src="/j-messe/images/db/user01.jpg" alt="利用規約">

								</h3>
								<p class="t_center">
									見本市・展示会データベース（J-messe）への見本市情報の登録および掲載は無料です。<br /> 次の利用規約・免責事項をよくお読みになり、同意の上でご登録いただきますようお願い申し上げます。
								</p>

								<form>
									<h4>見本市登録に関する利用規約・免責事項</h4>

									<ol class="terms">
										<li><strong>見本市情報の登録者制限</strong><br /> J-messeへの見本市情報の登録は、見本市・展示会主催者及び事務局運営者の方、またはその正式な代理人の方によるもののみとさせていただきます。<br /> <br /></li>

										<li><strong>登録情報、サービスの停止・拒否の権限</strong><br /> 登録情報が次の項目に該当すると判断された場合は、掲載を見送らせて頂きます。<br /> また掲載後もこれらに該当すると判断された場合は掲載を取り消させていただきます。<br /> <strong>登録できないイベント</strong>

											<ul class="inside nomargin_top">
												<li>展示面積(net)が1,000平方メートル未満のイベント</li>
												<li>セミナー、講演会のみの催し（見本市併催の場合は指定項目に記入）</li>
												<li>即売会、バザールなど商談ベースではないイベント</li>
												<li>ファッションショー（バイヤーが集まるショーは登録可）</li>
												<li>来場者が限定されている単独企業開催のPR型イベント</li>
												<li>反社会的行為に結びつく恐れのあるイベント</li>

												<li>社会の安全性、信頼性を損なう恐れのあるイベント</li>
												<li>関係法令および通達に抵触すると思われるイベント</li>
												<li>その他、ジェトロが不適切と判断したイベント</li>
											</ul> <br />
										</li>

										<li><strong>見本市情報の修正・更新</strong><br /> ご登録いただきました見本市の開催内容に変更が生じた場合は、速やかに登録情報の修正・更新をお願致します。また、登録情報の内容を一部修正または削除する必要があるとジェトロが判断した場合には、登録者への通知・了解を得ることなく情報の修正・削除などを行うことがあります。<br /> <br /></li>

										<li><strong>見本市情報に関する責任</strong><br /> 本ウェブサイトにご登録いただく見本市情報のデータコンテンツ（情報、写真、データ等）に関する責任は、登録者本人が負うものとします。<br /> ジェトロは、ご登録いただいた見本市情報により利用者（登録者・閲覧者）に生じたいかなる損害に対しても、一切の責任を負いません。<br /> <br /></li>

										<li><strong>掲載（一般公開）までにかかる時間</strong><br /> 日本及び各国・地域で開催される見本市情報を正確に提供するため、情報の掲載に先立ち、ジェトロは登録情報の内容を審査することがあります。ついては、登録情報が一般公開されるまで所定の時間を要しますので、予めご了承ください。<br /> <br /></li>

										<li><strong>登録者の禁止事項</strong><br /> 登録者の以下に該当する、またはその恐れのある行為は禁止とします。

											<ol class="inside nomargin_top">
												<li>公序良俗に反する行為</li>
												<li>法令に反する行為</li>
												<li>他の登録企業もしくは第三者の著作権を侵害する行為</li>
												<li>他の登録企業もしくは第三者を誹謗、中傷する行為</li>
												<li>他の登録企業もしくは第三者に不利益を与える行為</li>
												<li>選挙運動もしくはこれに類似される行為、または公職選挙法などの法令に違反する行為</li>

												<li>ジェトロの運営を妨害する行為</li>
												<li>ジェトロが承認していない営業行為</li>
												<li>その他、ジェトロが不適切と判断する行為</li>
											</ol> <br />
										</li>

										<li><strong>個人情報保護方針</strong><br /> ご登録いただきました個人情報は、ジェトロの<a href="http://www.jetro.go.jp/privacy/">個人情報保護方針</a>に基づき、取り扱います。<br /> <br /></li>

									</ol>
									<p class="t_center">
										<input type="checkbox" name="agreement" id="agreement" value="1" />「見本市登録に関する利用規約・免責事項」に同意する<br>
										<!-- navi area-->
										<table width="100%">
											<tr>
												<td><a href="{$config.url}?action_user_login=true"><img src="/j-messe/images/db/btn-back.gif" alt="戻る" width="110" height="37" class="over" /> </a></td>

												<td align="right"><div id="next_btn"><a href="{$config.url}?action_user_userRegist=true"><img src="/j-messe/images/db/btn-next.gif" alt="次へ" width="180" height="37" class="over" /></a></div></td>
											</tr>
										</table>
									</p>
									<div class="line_dot">
										<hr />
									</div>
									<!-- /navi area-->
									<!-- ssl area-->
									<script language="JavaScript" src="https://www.jetro.go.jp/js/jetro_seal_ja.js"></script>
									<!-- /ssl area-->
							</div>
						</div>
					</div>
				</div>
				<p class="totop">
					<a href="javascript:window.open('{$config.url}?action_user_userTerms=true&print=1', 'print')" target="print"><img src="/images/jp/btn-print.gif" alt="印刷" height="23" width="71" /> </a><a href="javascript:window.scrollTo(0, 0);"><img src="/images/jp/btn-totop.gif" alt="このページの上へ" height="23" width="110" /> </a>
				</p>
			</div>
			<!-- /center -->
		</div>
	</div>
	<!-- /contents -->
	<!-- footer -->
	{$app_ne.footer}
	<!-- /footer -->

<script type="text/javascript">
{literal}
$(function(){
	$("#next_btn").click(function(){
		if (!$("#agreement").attr('checked')) {
			alert("次へ進むには「見本市登録に関する利用規約・免責事項」への同意が必要です。");
			return false;
		}
	});
});
{/literal}
</script>
</body>
</html>
