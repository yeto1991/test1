<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="{$config.css_js_base}js/jquery.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselect.js"></script>
<script type="text/javascript" src="{$config.css_js_base}j-messe/js2/j-messe/jquery.dynamicselectforjson.js"></script>
<script type="text/javascript">
{literal}
<!--
	/**
	 * 初期表示。
	 */
	function init() {
		// 業種関連
		var main_industory = document.getElementById('main_industory_jp').options[document.getElementById('main_industory_jp').selectedIndex].value;
		if (null != main_industory) {
			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory+'&use_language_flag=0','','#sub_industory_jp',document.getElementById('tmp_sub_industory_jp').value);
		}
// 		main_industory = document.getElementById('main_industory_en').options[document.getElementById('main_industory_en').selectedIndex].value;
// 		if (null != main_industory) {
// 			dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory+'&use_language_flag=1','','#sub_industory_en',document.getElementById('tmp_sub_industory_en').value);
// 		}

		// 開催地関連
		var region = document.getElementById('region_jp').options[document.getElementById('region_jp').selectedIndex].value;
		if (null != document.getElementById('tmp_country_jp').value && '' != document.getElementById('tmp_country_jp').value) {
			if (null != region && '' != region) {
				dynamicpulldownlist('?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=0','','#country_jp',document.getElementById('tmp_country_jp').value);
			}
		}
// 		if (null != document.getElementById('tmp_country_en').value && '' != document.getElementById('tmp_country_en').value) {
// 			region = document.getElementById('region_en').options[document.getElementById('region_en').selectedIndex].value;
// 			if (null != region && '' != region) {
// 				dynamicpulldownlist('?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=1','','#country_en',document.getElementById('tmp_country_en').value);
// 			}
// 		}

		// 展示会に係わる画像(3点)
		// input fileの中身が消えてしまうので削除
		document.getElementById('photos_name_1').value = '';
		document.getElementById('photos_name_2').value = '';
		document.getElementById('photos_name_3').value = '';
	}

	/**
	 * 業種関連。
	 */
	function set_sub_industory_jp() {
		var main_industory = document.getElementById('main_industory_jp').options[document.getElementById('main_industory_jp').selectedIndex].value;
		dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory+'&use_language_flag=0','','#sub_industory_jp',null);
	}

// 	function set_sub_industory_en() {
// 		var main_industory = document.getElementById('main_industory_en').options[document.getElementById('main_industory_en').selectedIndex].value;
// 		dynamicpulldownlist('?action_json_getSubIndustory=true&kbn_2='+main_industory+'&use_language_flag=1','','#sub_industory_en',null);
// 	}

	function save_sub_industory_jp() {
		document.getElementById('tmp_sub_industory_jp').value = document.getElementById('sub_industory_jp').options[document.getElementById('sub_industory_jp').selectedIndex].value;
	}

// 	function save_sub_industory_en() {
// 		document.getElementById('tmp_sub_industory_en').value = document.getElementById('sub_industory_en').options[document.getElementById('sub_industory_en').selectedIndex].value;
// 	}

	function regist_industory_jp() {
		var main_industory = document.getElementById('main_industory_jp').options[document.getElementById('main_industory_jp').selectedIndex].value;
		var sub_industory = document.getElementById('sub_industory_jp').options[document.getElementById('sub_industory_jp').selectedIndex].value;
		var main_industory_str = document.getElementById('main_industory_jp').options[document.getElementById('main_industory_jp').selectedIndex].text;
		var sub_industory_str = document.getElementById('sub_industory_jp').options[document.getElementById('sub_industory_jp').selectedIndex].text;
		if ('' == main_industory || '' == sub_industory) {
			window.alert('大分類と小分類の両方を選択して下さい。');
			return;
		}
		if (6 == document.getElementById('industory_list_jp').options.length) {
			window.alert('登録可能な最大数が登録されています。');
			return;
		}
		for (var i = 0; i < document.getElementById('industory_list_jp').length; i++) {
			if (document.getElementById('industory_list_jp').options[i].value == main_industory + ':' + sub_industory) {
				window.alert(main_industory_str + '／' + sub_industory_str + 'は既に登録されています。');
				return;
			}
		}
		var op = document.createElement('option');
		op.value = main_industory + ':' + sub_industory;
		op.innerHTML = main_industory_str + '／' + sub_industory_str;
		document.getElementById('industory_list_jp').appendChild(op);
	}

// 	function regist_industory_en() {
// 		var main_industory = document.getElementById('main_industory_en').options[document.getElementById('main_industory_en').selectedIndex].value;
// 		var sub_industory = document.getElementById('sub_industory_en').options[document.getElementById('sub_industory_en').selectedIndex].value;
// 		var main_industory_str = document.getElementById('main_industory_en').options[document.getElementById('main_industory_en').selectedIndex].text;
// 		var sub_industory_str = document.getElementById('sub_industory_en').options[document.getElementById('sub_industory_en').selectedIndex].text;
// 		if ('' == main_industory || '' == sub_industory) {
// 			window.alert('大分類と小分類の両方を選択して下さい。');
// 			return;
// 		}
// 		if (6 == document.getElementById('industory_list_en').options.length) {
// 			window.alert('登録可能な最大数が登録されています。');
// 			return;
// 		}
// 		for (var i = 0; i < document.getElementById('industory_list_en').length; i++) {
// 			if (document.getElementById('industory_list_en').options[i].value == main_industory + ':' + sub_industory) {
// 				window.alert(main_industory_str + '／' + sub_industory_str + 'は既に登録されています。');
// 				return;
// 			}
// 		}
// 		var op = document.createElement('option');
// 		op.value = main_industory + ':' + sub_industory;
// 		op.innerHTML = main_industory_str + '／' + sub_industory_str;
// 		document.getElementById('industory_list_en').appendChild(op);
// 	}

	function delete_industory_jp() {
		for (var i = document.getElementById('industory_list_jp').length - 1; i >= 0; i--) {
			if (document.getElementById('industory_list_jp').options[i].selected) {
				document.getElementById('industory_list_jp').remove(i);
			}
		}
	}

// 	function delete_industory_en() {
// 		for (var i = document.getElementById('industory_list_en').length - 1; i >= 0; i--) {
// 			if (document.getElementById('industory_list_en').options[i].selected) {
// 				document.getElementById('industory_list_en').remove(i);
// 			}
// 		}
// 	}

	/**
	 * 開催地関連。
	 */
	function set_country_jp() {
		var region = document.getElementById('region_jp').options[document.getElementById('region_jp').selectedIndex].value;
		dynamicpulldownlist('?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=0','','#country_jp',null);
	}

// 	function set_country_en() {
// 		var region = document.getElementById('region_en').options[document.getElementById('region_en').selectedIndex].value;
// 		dynamicpulldownlist('?action_json_getCountry=true&kbn_2='+region+'&use_language_flag=1','','#country_en',null);
// 	}

	function save_country_jp() {
		document.getElementById('tmp_country_jp').value = document.getElementById('country_jp').options[document.getElementById('country_jp').selectedIndex].value;
		document.getElementById('city_name_jp').value = '';
		document.getElementById('city_jp').value = '';
	}

// 	function save_country_en() {
// 		document.getElementById('tmp_country_en').value = document.getElementById('country_en').options[document.getElementById('country_en').selectedIndex].value;
// 		document.getElementById('city_name_en').value = '';
// 		document.getElementById('city_en').value = '';
// 	}

	function open_select_city_jp(url) {
		var region = document.getElementById('region_jp').options[document.getElementById('region_jp').selectedIndex].value;
		var country = document.getElementById('country_jp').options[document.getElementById('country_jp').selectedIndex].value;
		if ('' == region || '' == country) {
			window.alert('地域と国・地域の両方を選択して下さい');
			return;
		}
		window.open(url + "?action_admin_selectCity=1&kbn_2=" + region + "&kbn_3=" + country + "&use_language_flag=0", 'select_city', 'width=400, height=300, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
	}

// 	function open_select_city_en(url) {
// 		var region = document.getElementById('region_en').options[document.getElementById('region_en').selectedIndex].value;
// 		var country = document.getElementById('country_en').options[document.getElementById('country_en').selectedIndex].value;
// 		if ('' == region || '' == country) {
// 			window.alert('地域と国・地域の両方を選択して下さい');
// 			return;
// 		}
// 		window.open(url + "?action_admin_selectCity=1&kbn_2=" + region + "&kbn_3=" + country + "&use_language_flag=1", 'select_city', 'width=400, height=300, menubar=no, toolbar=no, location=no, status=no, scrollbars=yes');
// 	}

	function delete_city_jp() {
		document.getElementById('city_jp').value = "";
		document.getElementById('city_name_jp').value = "";
	}

// 	function delete_city_en() {
// 		document.getElementById('city_en').value = "";
// 		document.getElementById('city_name_en').value = "";
// 	}

	/**
	 * 展示会に係わる画像(3点)関連。
	 */
	function up_photos_list() {
		var value;
		var text;
		for (var i = 0; i < document.getElementById('photos_list').length; i++) {
			if (document.getElementById('photos_list').options[i].selected) {
				if (0 < i) {
					value = document.getElementById('photos_list').options[i].value;
					text = document.getElementById('photos_list').options[i].text;
					document.getElementById('photos_list').options[i].value = document.getElementById('photos_list').options[i-1].value;
					document.getElementById('photos_list').options[i].text = document.getElementById('photos_list').options[i-1].text;
					document.getElementById('photos_list').options[i-1].value = value;
					document.getElementById('photos_list').options[i-1].text = text;
					document.getElementById('photos_list').options[i-1].selected = true;
				}
				break;
			}
		}
	}

	function down_photos_list() {
		var value;
		var text;
		for (var i = document.getElementById('photos_list').length - 1; i >= 0; i--) {
			if (document.getElementById('photos_list').options[i].selected) {
				if (document.getElementById('photos_list').length - 1 > i) {
					value = document.getElementById('photos_list').options[i].value;
					text = document.getElementById('photos_list').options[i].text;
					document.getElementById('photos_list').options[i].value = document.getElementById('photos_list').options[i+1].value;
					document.getElementById('photos_list').options[i].text = document.getElementById('photos_list').options[i+1].text;
					document.getElementById('photos_list').options[i+1].value = value;
					document.getElementById('photos_list').options[i+1].text = text;
					document.getElementById('photos_list').options[i+1].selected = true;
				}
				break;
			}
		}
	}

	function delete_photos_list() {
		var delfiletag;
		for (var i = document.getElementById('photos_list').length - 1; i >= 0; i--) {
			if (document.getElementById('photos_list').options[i].selected) {
				delfiletag = document.createElement('input');
				delfiletag.type = 'hidden';
				delfiletag.name = 'del_photos_name[]';
				delfiletag.id = 'del_photos_name[]';
				delfiletag.value = document.getElementById('photos_list').options[i].value;
				document.getElementById('form_admin_fairRegist').appendChild(delfiletag);
				document.getElementById('photos_list').remove(i);
			}
		}
	}

	function add_photos(photos) {
		var path = document.getElementById(photos).value;
		if ('' == path) {
			return;
		}

		var paths = path.split('\\');
		if (1 == paths.length) {
			paths = path.split('/');
		}
		var filename = paths[paths.length - 1];

		for (i = 0; i < document.getElementById('photos_list').length; i++) {
			if (filename == document.getElementById('photos_list').options[i].value) {
				window.alert('画像ファイル名が重複しました。');
				return;
			}
		}
		if (3 <= document.getElementById('photos_list').length) {
			window.alert('画像ファイルの登録は3件までです。');
			return;
		}

		var op = document.createElement('option');
		op.value = filename;
		op.innerHTML = filename;
		document.getElementById('photos_list').appendChild(op);
	}

	/**
	 * 登録。
	 */
	function registFair() {
		// 業種設定
		var i = 0;
		var value;
		var text;
		var no;
		var use_language_flag;
		for (i = 0; i < document.getElementsByName('use_language_flag').length; i++) {
			if (document.getElementsByName('use_language_flag')[i].checked) {
				use_language_flag = document.getElementsByName('use_language_flag')[i].value;
				break;
			}
		}
//		if ("0" == use_language_flag) {
			for (i = 0; i < document.getElementById('industory_list_jp').length; i++) {
				value = document.getElementById('industory_list_jp').options[i].value.split(":");
				text = document.getElementById('industory_list_jp').options[i].text.split("／");
				no = i + 1;
				document.getElementById('main_industory_' + String(no)).value = value[0];
				document.getElementById('sub_industory_' + String(no)).value = value[1];
				document.getElementById('main_industory_name_' + String(no)).value = text[0];
				document.getElementById('sub_industory_name_' + String(no)).value = text[1];
			}
//		} else {
// 			for (i = 0; i < document.getElementById('industory_list_en').length; i++) {
// 				value = document.getElementById('industory_list_en').options[i].value.split(":");
// 				text = document.getElementById('industory_list_en').options[i].text.split("／");
// 				no = i + 1;
// 				document.getElementById('main_industory_' + String(no)).value = value[0];
// 				document.getElementById('sub_industory_' + String(no)).value = value[1];
// 				document.getElementById('main_industory_name_' + String(no)).value = text[0];
// 				document.getElementById('sub_industory_name_' + String(no)).value = text[1];
// 			}
// 		}
		for (; i < 6; i++) {
			no = i + 1;
			document.getElementById('main_industory_' + String(no)).value = '';
			document.getElementById('sub_industory_' + String(no)).value = '';
			document.getElementById('main_industory_name_' + String(no)).value = '';
			document.getElementById('sub_industory_name_' + String(no)).value = '';
		}

		// TEXTAREAの文字数チェック
		// キャッチフレーズ
		if (500 < document.getElementById('profile_jp').value.length) {
			window.alert('キャッチフレーズ（日）は500文字以内（改行を含む）で入力して下さい。(' + document.getElementById('profile_jp').value.length + ')');
			return;
		}
		if (500 < document.getElementById('profile_en').value.length) {
			window.alert('キャッチフレーズ（英）は500文字以内（改行を含む）で入力して下さい。(' + document.getElementById('profile_en').value.length + ')');
			return;
		}
		// ＰＲ・紹介文
		if (1000 < document.getElementById('detailed_information_jp').value.length) {
			window.alert('ＰＲ・紹介文（日）は1000文字以内（改行を含む）で入力して下さい。(' + document.getElementById('detailed_information_jp').value.length + ')');
			return;
		}
		if (1000 < document.getElementById('detailed_information_en').value.length) {
			window.alert('ＰＲ・紹介文（英）は1000文字以内（改行を含む）で入力して下さい。(' + document.getElementById('detailed_information_en').value.length + ')');
			return;
		}
		// 出品物
		if (300 < document.getElementById('exhibits_jp').value.length) {
			window.alert('出品物（日）は300文字以内（改行を含む）で入力して下さい。(' + document.getElementById('exhibits_jp').value.length + ')');
			return;
		}
		if (300 < document.getElementById('exhibits_en').value.length) {
			window.alert('出品物（英）は300文字以内（改行を含む）で入力して下さい。(' + document.getElementById('exhibits_en').value.length + ')');
			return;
		}

		// 展示会に係わる画像(3点)
		for (i = 0; i < document.getElementById('photos_list').length; i++) {
			no = i + 1;
			document.getElementById('photos_name_' + String(no)).value = document.getElementById('photos_list').options[i].value;
		}

		if (!window.confirm('登録します。よろしいですか？')) {
			return;
		}
		document.getElementById('form_admin_fairRegist').submit();
	}
// -->
{/literal}
</script>
<title>見本市ＤＢ 管理者用</title>
</head>
<body onload="init()">
	<form name="form_admin_fairRegist" id="form_admin_fairRegist" method="post" action="" enctype="multipart/form-data">
		{uniqid}
		{if ("regist" == $form.mode)}
		<input type="hidden" name="action_admin_fairRegistDo" id="action_admin_fairRegistDo" value="dummy">
		{elseif ("change" == $form.mode)}
		<input type="hidden" name="action_admin_fairChangeDo" id="action_admin_fairChangeDo" value="dummy">
		{elseif ("copy" == $form.mode)}
		<input type="hidden" name="action_admin_fairRegistDo" id="action_admin_fairRegistDo" value="dummy">
		{else}
		<input type="hidden" name="action_admin_fairRegistDo" id="action_admin_fairRegistDo" value="dummy">
		{/if}
		<!-- 業種（小分類） -->
		<input type="hidden" name="tmp_sub_industory_jp" id="tmp_sub_industory_jp" value="{$form.tmp_sub_industory_jp}" />
{*		<input type="hidden" name="tmp_sub_industory_en" id="tmp_sub_industory_en" value="{$form.tmp_sub_industory_en}" /> *}
		<!-- 業種登録 -->
		<input type="hidden" name="main_industory_1" id="main_industory_1" value="{$form.main_industory_1}" />
		<input type="hidden" name="sub_industory_1" id="sub_industory_1" value="{$form.sub_industory_1}" />
		<input type="hidden" name="main_industory_name_1" id="main_industory_name_1" value="{$form.main_industory_1}" />
		<input type="hidden" name="sub_industory_name_1" id="sub_industory_name_1" value="{$form.sub_industory_1}" />
		<input type="hidden" name="main_industory_2" id="main_industory_2" value="{$form.main_industory_2}" />
		<input type="hidden" name="sub_industory_2" id="sub_industory_2" value="{$form.sub_industory_2}" />
		<input type="hidden" name="main_industory_name_2" id="main_industory_name_2" value="{$form.main_industory_2}" />
		<input type="hidden" name="sub_industory_name_2" id="sub_industory_name_2" value="{$form.sub_industory_2}" />
		<input type="hidden" name="main_industory_3" id="main_industory_3" value="{$form.main_industory_3}" />
		<input type="hidden" name="sub_industory_3" id="sub_industory_3" value="{$form.sub_industory_3}" />
		<input type="hidden" name="main_industory_name_3" id="main_industory_name_3" value="{$form.main_industory_3}" />
		<input type="hidden" name="sub_industory_name_3" id="sub_industory_name_3" value="{$form.sub_industory_3}" />
		<input type="hidden" name="main_industory_4" id="main_industory_4" value="{$form.main_industory_4}" />
		<input type="hidden" name="sub_industory_4" id="sub_industory_4" value="{$form.sub_industory_4}" />
		<input type="hidden" name="main_industory_name_4" id="main_industory_name_4" value="{$form.main_industory_4}" />
		<input type="hidden" name="sub_industory_name_4" id="sub_industory_name_4" value="{$form.sub_industory_4}" />
		<input type="hidden" name="main_industory_5" id="main_industory_5" value="{$form.main_industory_5}" />
		<input type="hidden" name="sub_industory_5" id="sub_industory_5" value="{$form.sub_industory_5}" />
		<input type="hidden" name="main_industory_name_5" id="main_industory_name_5" value="{$form.main_industory_5}" />
		<input type="hidden" name="sub_industory_name_5" id="sub_industory_name_5" value="{$form.sub_industory_5}" />
		<input type="hidden" name="main_industory_6" id="main_industory_6" value="{$form.main_industory_6}" />
		<input type="hidden" name="sub_industory_6" id="sub_industory_6" value="{$form.sub_industory_6}" />
		<input type="hidden" name="main_industory_name_6" id="main_industory_name_6" value="{$form.main_industory_6}" />
		<input type="hidden" name="sub_industory_name_6" id="sub_industory_name_6" value="{$form.sub_industory_6}" />
		<!-- 国・地域 -->
		<input type="hidden" name="tmp_country_jp" id="tmp_country_jp" value="{$form.tmp_country_jp}" />
{*		<input type="hidden" name="tmp_country_en" id="tmp_country_en" value="{$form.tmp_country_en}" /> *}
		<input type="hidden" name="city_jp" id="city_jp" value="{$form.city_jp}" />
		<input type="hidden" name="city_en" id="city_en" value="{$form.city_en}" />
		<!-- 展示会に係わる画像(3点) -->
		<input type="hidden" name="photos_name_1" id="photos_name_1" value="{$form.photos_name_1}" />
		<input type="hidden" name="photos_name_2" id="photos_name_2" value="{$form.photos_name_2}" />
		<input type="hidden" name="photos_name_3" id="photos_name_3" value="{$form.photos_name_3}" />
		<input type="hidden" name="del_photos_name[]" id="del_photos_name[]" value="" />
		<!-- 見本市番号 -->
		<input type="hidden" name="mihon_no" id="mihon_no" value="{$form.mihon_no}" />
		<!-- 登録モード -->
		<input type="hidden" name="mode" id="mode" value="{$form.mode}" />
		<table width="100%">
			<tr>
				<td valign="top" width="200">{include file="admin/menu.tpl"}</td>
				<td valign="top" >
					<div align="center">
						<font size="5"><b>見本市ＤＢ 管理者用（
{if ("regist" == $form.mode)}新規登録
{elseif ("change" == $form.mode)}更新登録
{elseif ("copy" == $form.mode)}コピー更新登録
{/if}
）</b></font>
					</div>
					<hr>

					{* エラー表示 *}
					{if count($errors)}
					<ul>
						{foreach from=$errors item=error}
						<li><font color="#ff0000">{$error}</font></li>
						{/foreach}
					</ul>
					{/if}

					{* 成功 *}
					{if ("1" == $app.success)}
					<center><b><font color="#0000ff"><br/>登録しました。<br/><br/></font></b></center>
					{/if}
					{if ("2" == $app.success)}
					{* 成功(会期未定の場合) *}
					<center><b><font color="#0000ff"><br/>登録しました。※開催日未定での登録となっています。<br/><br/></font></b></center>
					{/if}


					<font color="#CC3333">●</font>印は入力必須項目、<font color="#CC3333">○</font>は入力推奨項目です。<br> 言語選択で「日本語のみ」をつけた時は、原則 翻訳入力は必要ありません<br> （英語インターフェースでの検索対象となりません）

					<table border="1">
						{if ("change" == $form.mode || "copy" == $form.mode)}
						<tr>
							<td nowrap>見本市番号</td>
							<!-- 見本市番号 -->
							<td nowrap>{$form.mihon_no}</td>
						</tr>
						{/if}

						<tr>
							<td nowrap>Webページの表示／非表示 <font color="#CC3333">●</font></td>
							<!-- Ｗｅｂページの表示／非表示 -->
							<td nowrap>
								<input type="radio" name="web_display_type" id="web_display_type" value="1" {if ("1" == $form.web_display_type || "0" != $form.web_display_type)}checked{/if} />表示する
								<input type="radio" name="web_display_type" id="web_display_type" value="0" {if ("0" == $form.web_display_type)}checked{/if} />表示しない
							</td>
						</tr>

						<tr>
							<td nowrap>承認フラグ <font color="#CC3333">●</font></td>
							<!-- 承認フラグ -->
							<!-- 否認コメント -->
							<td nowrap>
								{if ("copy" == $form.mode)}
									<input type="radio" name="confirm_flag" id="confirm_flag" value="1"  />承認
									<input type="radio" name="confirm_flag" id="confirm_flag" value="0" checked />承認待ち
									<input type="radio" name="confirm_flag" id="confirm_flag" value="2"  />否認<br />
									否認コメント： <input type="text" name="negate_comment" id="negate_comment" value="{$form.negate_comment}" maxlength="255" size="100" />
								{else}
									<input type="radio" name="confirm_flag" id="confirm_flag" value="1" {if ("1" == $form.confirm_flag)}checked{/if} />承認
									<input type="radio" name="confirm_flag" id="confirm_flag" value="0" {if ("0" == $form.confirm_flag || ("1" != $form.confirm_flag && "2" != $form.confirm_flag))}checked{/if} />承認待ち
									<input type="radio" name="confirm_flag" id="confirm_flag" value="2" {if ("2" == $form.confirm_flag)}checked{/if} />否認<br />
									否認コメント： <input type="text" name="negate_comment" id="negate_comment" value="{$form.negate_comment}" maxlength="255" size="100" />
								{/if}
							</td>
						</tr>

						<tr>
							<td nowrap>メール送信フラグ <font color="#CC3333">●</font></td>
							<!-- メール送信フラグ -->
							<td nowrap>
								{if ("copy" == $form.mode)}
									<input type="radio" name="mail_send_flag" id="mail_send_flag" value="1" checked />送信しない
									<input type="radio" name="mail_send_flag" id="mail_send_flag" value="0" />送信する
								{else}
									<input type="radio" name="mail_send_flag" id="mail_send_flag" value="1" {if ("1" == $form.mail_send_flag || "0" != $form.mail_send_flag)}checked{/if} />送信しない
									<input type="radio" name="mail_send_flag" id="mail_send_flag" value="0" {if ("0" == $form.mail_send_flag)}checked{/if} />送信する
								{/if}
							</td>
						</tr>

						<tr>
							<td nowrap>ユーザ使用言語フラグ <font color="#CC3333">●</font></td>
							<!-- ユーザ使用言語フラグ -->
							<td nowrap>
								<input type="radio" name="use_language_flag" id="use_language_flag" value="0" {if ("0" == $form.use_language_flag || "1" != $form.use_language_flag)}checked{/if} />日本語
								<input type="radio" name="use_language_flag" id="use_language_flag" value="1" {if ("1" == $form.use_language_flag)}checked{/if} />英語
							</td>
						</tr>

						<tr>
							<td nowrap>Eメール <font color="#CC3333">●</font></td>
							<!-- Eメール -->
							<td nowrap><input type="text" name="email" id="email" value="{$form.email}" maxlength="255" size="100" />（半角英数）</td>
						</tr>

						<tr>
							<td nowrap>申請年月日 <font color="#CC3333">●</font></td>
							<!-- 申請年月日 -->
							<td nowrap>
								<input type="text" name="date_of_application_y" id="date_of_application_y" value="{if (null == $form.date_of_application_y || 0 == count($form.date_of_application_y))}{$app.year}{else}{$form.date_of_application_y}{/if}" maxlength="4" size="4" />年
								<input type="text" name="date_of_application_m" id="date_of_application_m" value="{if (null == $form.date_of_application_m || 0 == count($form.date_of_application_m))}{$app.month}{else}{$form.date_of_application_m}{/if}" maxlength="2" size="2" />月
								<input type="text" name="date_of_application_d" id="date_of_application_d" value="{if (null == $form.date_of_application_d || 0 == count($form.date_of_application_d))}{$app.day}{else}{$form.date_of_application_d}{/if}" maxlength="2" size="2" />日
							</td>
						</tr>

						<tr>
							<td nowrap>登録日(承認日) <font color="#CC3333">●</font></td>
							<!-- 登録日(承認日) -->
							<td nowrap>
								<input type="text" name="date_of_registration_y" id="date_of_registration_y" value="{if (null == $form.date_of_registration_y || 0 == count($form.date_of_registration_y))}{$app.year}{else}{$form.date_of_registration_y}{/if}" maxlength="4" size="4" />年
								<input type="text" name="date_of_registration_m" id="date_of_registration_m" value="{if (null == $form.date_of_registration_m || 0 == count($form.date_of_registration_m))}{$app.month}{else}{$form.date_of_registration_m}{/if}" maxlength="2" size="2" />月
								<input type="text" name="date_of_registration_d" id="date_of_registration_d" value="{if (null == $form.date_of_registration_d || 0 == count($form.date_of_registration_d))}{$app.day}{else}{$form.date_of_registration_d}{/if}" maxlength="2" size="2" />日
							</td>
						</tr>

						<tr>
							<td nowrap>言語選択情報 <font color="#CC3333">●</font></td>
							<!-- 言語選択情報 -->
							<td nowrap>
								<input type="radio" name="select_language_info" id="select_language_info" value="0" {if ("0" == $form.select_language_info || ("1" != $form.select_language_info && "2" != $form.select_language_info))}checked{/if} />日本語
								<input type="radio" name="select_language_info" id="select_language_info" value="2" {if ("2" == $form.select_language_info)}checked{/if} />日本語・英語両方
								<input type="radio" name="select_language_info" id="select_language_info" value="1" {if ("1" == $form.select_language_info)}checked{/if} />英語
							</td>
						</tr>

						<tr>
							<td nowrap rowspan="2">見本市名 <font color="#CC3333">●</font></td>
							<!-- 見本市名(日) -->
							<!-- 見本市名(英) -->
							<td nowrap>日：<input type="text" name="fair_title_jp" id="fair_title_jp" value="{$form.fair_title_jp}" maxlength="255" size="100" /></td>
						</tr>
						<tr>
							<td nowrap>英：<input type="text" name="fair_title_en" id="fair_title_en" value="{$form.fair_title_en}" maxlength="255" size="100" /></td>
						</tr>

						<tr>
							<td nowrap>見本市略称</td>
							<!-- 見本市略称(英) -->
							<td nowrap>英：<input type="text" name="abbrev_title" id="abbrev_title" value="{$form.abbrev_title}" maxlength="255" size="100" /><br> <font size="-1">■日本語は文字化けが発生するため、入力しないでください。</font>

							</td>
						</tr>

						<tr>
							<td nowrap>見本市URL <font color="#CC3333">●</font></td>
							<!-- 見本市ＵＲＬ -->
							<td nowrap><input type="text" name="fair_url" id="fair_url" value="{$form.fair_url}" maxlength="255" size="100" /></td>
						</tr>

						<tr>
							<td nowrap rowspan="2">キャッチフレーズ <font color="#CC3333">○</font></td>
							<!-- キャッチフレーズ(日) -->
							<!-- キャッチフレーズ(英) -->
							<td nowrap>日：<br /> <textarea name="profile_jp" id="profile_jp" cols="80" rows="7">{$form.profile_jp}</textarea><br />
							</td>
						</tr>
						<tr>
							<td nowrap>英：<font color="#CC3333">（翻訳）</font><br /> <textarea name="profile_en" id="profile_en" cols="80" rows="7">{$form.profile_en}</textarea><br />
							</td>
						</tr>

						<tr>
							<td nowrap rowspan="2">ＰＲ・紹介文</td>
							<!-- ＰＲ・紹介文(日) -->
							<!-- ＰＲ・紹介文(英) -->
							<td nowrap>日：<br> <textarea name="detailed_information_jp" id="detailed_information_jp" cols="80" rows="7">{$form.detailed_information_jp}</textarea></td>
						</tr>
						<tr>
							<td nowrap>英：<font color="#CC3333">（翻訳）</font><br /> <textarea name="detailed_information_en" id="detailed_information_en" cols="80" rows="7">{$form.detailed_information_en}</textarea></td>
						</tr>

						<tr>
							<td nowrap>検索キーワード</td>
							<td nowrap><input type="text" name="keyword" id="keyword" value="{$form.keyword}" maxlength="100" size="100" />
						</tr>

						<tr>
							<td nowrap>会期 <font color="#CC3333">●</font></td>
							<!-- 開始年月 -->
							<!-- 開始日 -->
							<!-- 終了年月 -->
							<!-- 終了日 -->
							<td>
								<input type="text" name="date_from_yyyy" id="date_from_yyyy" value="{$form.date_from_yyyy}" maxlength="4" size="4" />年
								<input type="text" name="date_from_mm" id="date_from_mm" value="{$form.date_from_mm}" maxlength="2" size="2" />月
								<input type="text" name="date_from_dd" id="date_from_dd" value="{$form.date_from_dd}" maxlength="2" size="2" />日から
								<input type="text" name="date_to_yyyy" id="date_to_yyyy" value="{$form.date_to_yyyy}" maxlength="4" size="4" />年
								<input type="text" name="date_to_mm" id="date_to_mm" value="{$form.date_to_mm}" maxlength="2" size="2" />月
								<input type="text" name="date_to_dd" id="date_to_dd" value="{$form.date_to_dd}" maxlength="2" size="2" />日まで<br>
								<font size="-1">■例：2002年8月1日の場合には半角数字で、2002 08 01 と入力してください。</font><br>
								<font size="-1">■会期の日付（会期開始日または会期終了日）が未定の場合には半角数字で、00 と入力してください。</font>
							</td>
						</tr>

						<tr>
							<td nowrap rowspan="1">開催頻度 <font color="#CC3333">●</font></td>
							<!-- 開催頻度(日) -->
							<!-- 開催頻度(英) -->
{*
							<td bgcolor="#FFFFAA">この項目の選択はユーザ使用言語フラグで選択（日本語・英語）した方を修正して下さい。</td>
						</tr>
						<tr>
*}
							<td nowrap>{* 日：<br/> *}
							<table>
								{section name=it loop=$app.frequency}
								{if (0 == (($smarty.section.it.index) % 5))}
								<tr>
								{/if}
									<td><input type="radio" name="frequency_jp" id="frequency_jp" value="{$app.frequency[it].kbn_2}" {if ($form.frequency_jp == $app.frequency[it].kbn_2)}checked{/if} />{$app.frequency[it].discription_jp}</td>
								{if (0 == (($smarty.section.it.index + 1) % 5))}
								</tr>
								{/if}
								{/section}
							</table>
							</td>
						</tr>
{*
						<tr>
							<td nowrap>英：<br/>
							<table>
								{section name=it loop=$app.frequency}
								{if (0 == (($smarty.section.it.index) % 5))}
								<tr>
								{/if}
									<td><input type="radio" name="frequency_en" id="frequency_en" value="{$app.frequency[it].kbn_2}"  {if ($form.frequency_en == $app.frequency[it].kbn_2)}checked{/if} />{$app.frequency[it].discription_en}</td>
								{if (0 == (($smarty.section.it.index + 1) % 5))}
								</tr>
								{/if}
								{/section}
							</table>
							</td>
						</tr>
*}

						<tr>
							<td nowrap rowspan="1">業種 <font color="#CC3333">●</font></td>
							<!-- 業種大分類(日) -->
{*
							<td bgcolor="#FFFFAA">この項目の選択はユーザ使用言語フラグで選択（日本語・英語）した方を修正して下さい。</td>
						</tr>
						<tr>
*}
							<td nowrap>{* 日： *}
								<table>
									<tr>
										<td colspan="2"><font size="-1">1. 大分類 → 小分類の順に選択してください。</font></td>
									</tr>
									<tr>
										<td colspan="2">大分類
											<select name="main_industory_jp" id="main_industory_jp" style="width:200px;" onchange="set_sub_industory_jp()">
												<option value="">...</option>
											{section name=it loop=$app.main_industory}
												<option value="{$app.main_industory[it].kbn_2}" {if ($form.main_industory_jp == $app.main_industory[it].kbn_2)}selected{/if} />{$app.main_industory[it].discription_jp}</option>
											{/section}
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2">小分類
											<select name="sub_industory_jp" id="sub_industory_jp" style="width:200px;" onchange="save_sub_industory_jp()">
												<option value="">...</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2"><font size="-1">2.「登録」ボタンをクリックして下さい。</font></td>
									</tr>
									<tr>
										<td>
											<select name="industory_list_jp" id="industory_list_jp" size="4" style="width:200px;">
{*											{if ("0" == $form.use_language_flag)} *}
											{if (null != $form.main_industory_1 && 0 < count($form.main_industory_1))}
												<option value="{$form.main_industory_1}:{$form.sub_industory_1}">{$form.main_industory_name_1}／{$form.sub_industory_name_1}</option>
											{/if}
											{if (null != $form.main_industory_2 && 0 < count($form.main_industory_2))}
												<option value="{$form.main_industory_2}:{$form.sub_industory_2}">{$form.main_industory_name_2}／{$form.sub_industory_name_2}</option>
											{/if}
											{if (null != $form.main_industory_3 && 0 < count($form.main_industory_3))}
												<option value="{$form.main_industory_3}:{$form.sub_industory_3}">{$form.main_industory_name_3}／{$form.sub_industory_name_3}</option>
											{/if}
											{if (null != $form.main_industory_4 && 0 < count($form.main_industory_4))}
												<option value="{$form.main_industory_4}:{$form.sub_industory_4}">{$form.main_industory_name_4}／{$form.sub_industory_name_4}</option>
											{/if}
											{if (null != $form.main_industory_5 && 0 < count($form.main_industory_5))}
												<option value="{$form.main_industory_5}:{$form.sub_industory_5}">{$form.main_industory_name_5}／{$form.sub_industory_name_5}</option>
											{/if}
											{if (null != $form.main_industory_6 && 0 < count($form.main_industory_6))}
												<option value="{$form.main_industory_6}:{$form.sub_industory_6}">{$form.main_industory_name_6}／{$form.sub_industory_name_6}</option>
											{/if}
{*											{/if} *}
											</select>
										</td>
										<td>
											<input type="button" name="ind_add" value="登録" onClick="regist_industory_jp()" /><br /><br />
											<input type="button" name="ind_del" value="削除" onClick="delete_industory_jp()" />
										</td>
									</tr>
								</table> <font size="-1">■ 業種は6つまで登録可能です。業種を追加したい場合には1、2の作業を繰り返して下さい。 </font>
							</td>
						</tr>
{*
						<tr>
							<td nowrap>英： <!--  2002.10.24 add [ start ] infocom  -->
								<table>
									<tr>
										<td colspan="2"><font size="-1">1. 大分類 → 小分類の順に選択してください。</font></td>
									</tr>
									<tr>
										<td colspan="2">大分類
											<select name="main_industory_en" id="main_industory_en" style="width:200px;" onchange="set_sub_industory_en()">
												<option value="">...</option>
											{section name=it loop=$app.main_industory}
												<option value="{$app.main_industory[it].kbn_2}">{$app.main_industory[it].discription_en}</option>
											{/section}
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2">小分類
											<select name="sub_industory_en" id="sub_industory_en" style="width:200px;" onchange="save_sub_industory_en()">
												<option value="">...</option>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="2"><font size="-1">2.「登録」ボタンをクリックして下さい。</font></td>
									</tr>
									<tr>
										<td>
											<select name="industory_list_en" id="industory_list_en" size="4" style="width:200px;">
											{if ("1" == $form.use_language_flag)}
											{if (null != $form.main_industory_1 && 0 < count($form.main_industory_1))}
												<option value="{$form.main_industory_1}:{$form.sub_industory_1}">{$form.main_industory_name_1}／{$form.sub_industory_name_1}</option>
											{/if}
											{if (null != $form.main_industory_2 && 0 < count($form.main_industory_2))}
												<option value="{$form.main_industory_2}:{$form.sub_industory_2}">{$form.main_industory_name_2}／{$form.sub_industory_name_2}</option>
											{/if}
											{if (null != $form.main_industory_3 && 0 < count($form.main_industory_3))}
												<option value="{$form.main_industory_3}:{$form.sub_industory_3}">{$form.main_industory_name_3}／{$form.sub_industory_name_3}</option>
											{/if}
											{if (null != $form.main_industory_4 && 0 < count($form.main_industory_4))}
												<option value="{$form.main_industory_4}:{$form.sub_industory_4}">{$form.main_industory_name_4}／{$form.sub_industory_name_4}</option>
											{/if}
											{if (null != $form.main_industory_5 && 0 < count($form.main_industory_5))}
												<option value="{$form.main_industory_5}:{$form.sub_industory_5}">{$form.main_industory_name_5}／{$form.sub_industory_name_5}</option>
											{/if}
											{if (null != $form.main_industory_6 && 0 < count($form.main_industory_6))}
												<option value="{$form.main_industory_6}:{$form.sub_industory_6}">{$form.main_industory_name_6}／{$form.sub_industory_name_6}</option>
											{/if}
											{/if}
											</select>
										</td>
										<td>
											<input type="button" name="ind_add" value="登録" onClick="regist_industory_en()" /><br /><br />
											<input type="button" name="ind_del" value="削除" onClick="delete_industory_en()" />
										</td>
									</tr>
								</table> <font size="-1">■ 業種は6つまで登録可能です。業種を追加したい場合には1、2の作業を繰り返して下さい。 </font>
							</td>
						</tr>
*}

						<tr>
							<td nowrap rowspan="2">出品物 <font color="#CC3333">●</font></td>
							<!-- 出品物(日) -->
							<!-- 出品物(英) -->
							<td nowrap>日：<br/>
							<textarea name="exhibits_jp" id="exhibits_jp" cols="80" rows="7">{$form.exhibits_jp}</textarea>
							<br>
							</td>
						</tr>
						<tr>
							<td nowrap>英：<font color="#CC3333">（翻訳）</font><br>
							<textarea name="exhibits_en" id="exhibits_en" cols="80" rows="7">{$form.exhibits_en}</textarea>
							</td>
						</tr>

						<tr>
							<td nowrap rowspan="1">開催地 <font color="#CC3333">●</font></td>
							<!-- 開催地域(日) -->
							<!-- 開催地域(英) -->
							<!-- 開催国(日) -->
							<!-- 開催国(英) -->
							<!-- 開催都市(日) -->
							<!-- 開催都市(英) -->
							<!-- その他の都市(日) -->
							<!-- その他の都市(英) -->
{*
							<td bgcolor="#FFFFAA">この項目の選択はユーザ使用言語フラグで選択（日本語・英語）した方を修正して下さい。</td>
						</tr>
						<tr>
*}
							<td nowrap>{* 日： *}
								<table border="0">
									<tr>
										<td colspan="4"><font size="-1">1.地域 → 2.国 → 3.都市の順に選択してください。</font></td>
									</tr>
									<tr>
										<td>1.</td>
										<td>地域</td>
										<td>
										<select name="region_jp" id="region_jp" style="width:200px;" onchange="set_country_jp()">
											<option value="">...</option>
										{section name=it loop=$app.region}
											<option value="{$app.region[it].kbn_2}" {if ($form.region_jp == $app.region[it].kbn_2)}selected{/if}>{$app.region[it].discription_jp}</option>
										{/section}
										</select>
										</td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td>2.</td>
										<td>国・地域</td>
										<td>
										<select name="country_jp" id="country_jp" style="width:200px;" onchange="save_country_jp()">
											<option value="">...</option>
										{section name=it loop=$app.country}
											<option value="{$app.country[it].kbn_3}" {if ($form.country_jp == $app.country[it].kbn_3)}selected{/if}>{$app.country[it].discription_jp}</option>
										{/section}
										</select>
										</td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td>3.</td>
										<td>都市</td>

										<td colspan="2">
											<a href="javascript:open_select_city_jp('{$config.url}');">都市を選択</a>
											<input type="text" name="city_name_jp" id="city_name_jp" value="{$form.city_name_jp}" readonly />
											<input type="button" value="削除" onClick="delete_city_jp()"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td><input type="checkbox" name="othercity_jp" id="othercity_jp" value="1" {if ("1" == $form.othercity_jp)}checked{/if} /> その他</td>
										<td colspan="2"><input type="text" name="other_city_jp" id="other_city_jp" value="{$form.other_city_jp}" maxlength="100" size="100" /></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td><input type="checkbox" name="othercity_en" id="othercity_en" value="1" {if ("1" == $form.othercity_en)}checked{/if} /> Others</td>
										<td colspan="2"><input type="text" name="other_city_en" id="other_city_en" value="{$form.other_city_en}" maxlength="100" size="100" /><font color="#CC3333">（翻訳）</font></td>
									</tr>
								</table>
								<font size="-1">■「都市を選択」をクリックして表示される一覧に、開催都市がない場合は「その他」にチェックをし、都市名を入力して下さい。</font>
							</td>
						</tr>
{*
						<tr>
							<td nowrap>英：
								<table border="0">
									<tr>
										<td colspan="4"><font size="-1">1.地域 → 2.国 → 3.都市の順に選択してください。</font></td>
									</tr>

									<tr>
										<td>1.</td>
										<td>地域</td>
										<td>
										<select name="region_en" id="region_en" style="width:200px;" onchange="set_country_en()">
											<option value="">...</option>
										{section name=it loop=$app.region}
											<option value="{$app.region[it].kbn_2}" {if ($form.region_en == $app.region[it].kbn_2)}selected{/if}>{$app.region[it].discription_en}</option>
										{/section}
										</select>
										</td>
										<td colspan="2"></td>
									</tr>

									<tr>
										<td>2.</td>
										<td>国・地域</td>
										<td>
										<select name="country_en" id="country_en" style="width:200px;" onchange="save_country_en()">
											<option value="">...</option>
										{section name=it loop=$app.country}
											<option value="{$app.country[it].kbn_3}" {if ($form.country_en == $app.country[it].kbn_3)}selected{/if}>{$app.country[it].discription_en}</option>
										{/section}
										</select>
										</td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td>3.</td>
										<td>都市</td>
										<td colspan="2"><a href="javascript:open_select_city_en('{$config.url}');">都市を選択</a>
										<input type="text" name="city_name_en" id="city_name_en" value="{$form.city_name_en}" readonly/>
										<input type="button" value="削除" onClick="delete_city_en()"></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td><input type="checkbox" name="othercity_en" value="1" {if ("1" == $form.othercity_en)}checked{/if} /> Others</td>
										<td colspan="2"><input type="text" name="other_city_en" id="other_city_en" value="{$form.other_city_en}" maxlength="100" size="100" /><font color="#CC3333">（翻訳）</font></td>
									</tr>
								</table> <font size="-1">■「都市を選択」をクリックして表示される一覧に、開催都市がない場合は「その他」にチェックをし、都市名を入力して下さい。</font> <!--  2002.10.24 add [  end  ] infocom  -->
							</td>
						</tr>
*}
						<tr>
							<td nowrap rowspan="2">会場名 <font color="#CC3333">●</font></td>
							<!-- 会場名(日) -->
							<!-- 会場名(英) -->
							<td nowrap>日：<input type="text" name="venue_jp" id="venue_jp" value="{$form.venue_jp}" maxlength="255" size="100" /></td>
						</tr>
						<tr>
							<td nowrap>英：<input type="text" name="venue_en" id="venue_en" value="{$form.venue_en}" maxlength="255" size="100" /></td>
						</tr>

						<tr>
							<td nowrap>会場名URL</td>
							<!-- 会場URL -->
							<td nowrap><input type="text" name="venue_url" id="venue_url" value="{$form.venue_url}" maxlength="255" size="100" /></td>
						</tr>

						<tr>
							<td nowrap>開催予定規模 <font color="#CC3333">○</font></td>
							<!-- 開催予定規模 -->
							<td nowrap><input type="text" name="gross_floor_area" id="gross_floor_area" value="{$form.gross_floor_area}" maxlength="10" size="10" />sq.m.<br> <font size="-1">■半角数字のみ入力して下さい。","(カンマ)は使用しないで下さい。例：1000</font></td>
						</tr>

						<tr>
							<td nowrap rowspan="1">入場資格 <font color="#CC3333">●</font></td>
							<!-- 入場資格(日) -->
							<!-- 入場資格(英) -->
{*
							<td bgcolor="#FFFFAA">この項目の選択はユーザ使用言語フラグで選択（日本語・英語）した方を修正して下さい。</td>
						</tr>
						<tr>
*}
							<td nowrap>{* 日：<br/> *}
							{section name=it loop=$app.open_to}
							<input type="radio" name="open_to_jp" id="open_to_jp" value="{$app.open_to[it].kbn_2}" {if ($app.open_to[it].kbn_2 == $form.open_to_jp)}checked{/if} />{$app.open_to[it].discription_jp}
							{/section}
							</td>
						</tr>
{*
						<tr>
							<td nowrap>英：<br/>
							{section name=it loop=$app.open_to}
							<input type="radio" name="open_to_en" id="open_to_en" value="{$app.open_to[it].kbn_2}" {if ($app.open_to[it].kbn_2 == $form.open_to_en)}checked{/if} />{$app.open_to[it].discription_en}
							{/section}
							</td>
						</tr>
*}

						<tr>
							<td nowrap rowspan="1">入場方法 <font color="#CC3333">●</font></td>
							<!-- 入場方法(日) -->
							<!-- 入場方法(英) -->
							<!-- その他の入場方法(日) -->
							<!-- その他の入場方法(英) -->
{*
							<td bgcolor="#FFFFAA">この項目の選択はユーザ使用言語フラグで選択（日本語・英語）した方を修正して下さい。</td>
						</tr>
						<tr>
*}
							<td nowrap>{* 日：<br/> *}
							<table>
							<tr>
							<td><input type="checkbox" name="admission_ticket_1_jp" id="admission_ticket_1_jp" value="1" {if ("1" == $form.admission_ticket_1_jp)}checked{/if} />登録の必要なし</td>
							<td><input type="checkbox" name="admission_ticket_2_jp" id="admission_ticket_2_jp" value="1" {if ("1" == $form.admission_ticket_2_jp)}checked{/if} />公式ウェブサイトからの事前登録</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="admission_ticket_3_jp" id="admission_ticket_3_jp" value="1" {if ("1" == $form.admission_ticket_3_jp)}checked{/if} />主催者もしくは日本国内の連絡先への問い合わせ</td>
							<td><input type="checkbox" name="admission_ticket_4_jp" id="admission_ticket_4_jp" value="1" {if ("1" == $form.admission_ticket_4_jp)}checked{/if} />当日会場でチケット入手</td>
							</tr>
							<tr>
							<td colspan="2"><input type="checkbox" name="admission_ticket_5_jp" id="admission_ticket_5_jp" value="1" {if ("1" == $form.admission_ticket_5_jp)}checked{/if} />その他 <input type="text" name="other_admission_ticket_jp" id="other_admission_ticket_jp" value="{$form.other_admission_ticket_jp}" maxlenth="500" size="100" /></td>
							</tr>
							<tr>
							<td colspan="2"><input type="checkbox" name="admission_ticket_5_en" id="admission_ticket_5_en" value="1" {if ("1" == $form.admission_ticket_5_en)}checked{/if} />Others <input type="text" name="other_admission_ticket_en" id="other_admission_ticket_en" value="{$form.other_admission_ticket_en}" maxlenth="500" size="100" /></td>
							</tr>
							</table>
							</td>
						</tr>
{*
						<tr>
							<td nowrap>英：<br/>
							<table>
							<tr>
							<td><input type="checkbox" name="admission_ticket_1_en" id="admission_ticket_1_en" value="1" {if ("1" == $form.admission_ticket_1_en)}checked{/if} />Free</td>
							<td><input type="checkbox" name="admission_ticket_2_en" id="admission_ticket_2_en" value="1" {if ("1" == $form.admission_ticket_2_en)}checked{/if} />Web Registration</td>
							</tr>
							<tr>
							<td><input type="checkbox" name="admission_ticket_3_en" id="admission_ticket_3_en" value="1" {if ("1" == $form.admission_ticket_3_en)}checked{/if} />Contact to the Organizer/Agency in Japan</td>
							<td><input type="checkbox" name="admission_ticket_4_en" id="admission_ticket_4_en" value="1" {if ("1" == $form.admission_ticket_4_en)}checked{/if} />Available at the Gate</td>
							</tr>
							<tr>
							<td colspan="2"><input type="checkbox" name="admission_ticket_5_en" id="admission_ticket_5_en" value="1" {if ("1" == $form.admission_ticket_5_en)}checked{/if} />Others <input type="text" name="other_admission_ticket_en" id="other_admission_ticket_en" value="{$form.other_admission_ticket_en}" maxlenth="500" size="100" /></td>
							</tr>
							</table>
							</td>
						</tr>
*}

						<tr>
							<td nowrap>過去の実績 <font color="#CC3333">○</font></td>
							<!-- 実績年 -->
							<!-- 総入場者数(人) -->
							<!-- 海外からの入場者数(人) -->
							<!-- 総出典者数(社) -->
							<!-- 海外からの出典者数(社) -->
							<!-- 開催規模 -->
							<!-- 予備域１ -->
							<td nowrap>
								<table border="0">
									<tr>
										<td>&nbsp;</td>
										<td colspan="2"><input type="text" name="year_of_the_trade_fair" id="year_of_the_trade_fair" value="{$form.year_of_the_trade_fair}" maxlength="20" size="10" /> 年実績（西暦４桁）</td>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr>
										<td>来場者数</td>
										<td><input type="text" name="total_number_of_visitor" id="total_number_of_visitor" value="{$form.total_number_of_visitor}" maxlength="10" size="10" /> 人</td>
										<td>（うち海外から</td>
										<td><input type="text" name="number_of_foreign_visitor" id="number_of_foreign_visitor" value="{$form.number_of_foreign_visitor}" maxlength="10" size="10" /> 人）</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>出展社数</td>
										<td><input type="text" name="total_number_of_exhibitors"  id="total_number_of_exhibitors" value="{$form.total_number_of_exhibitors}" maxlength="10" size="10"> 社</td>
										<td>（うち海外から</td>
										<td><input type="text" name="number_of_foreign_exhibitors" id="number_of_foreign_exhibitors" value="{$form.number_of_foreign_exhibitors}" maxlength="10" size="10"> 社）</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>開催規模</td>
										<td colspan="4"><input type="text" name="net_square_meters" id="net_square_meters" value="{$form.net_square_meters}" maxlength="50" size="50">sq.m.<br> <font size="-1">■半角数字のみ入力して下さい。","(カンマ)は使用しないで下さい。例：1000</font></td>
									</tr>
									<tr>
										<td>承認機関</td>
										<td colspan="4">英：<input type="text" name="spare_field1" id="spare_field1" value="{$form.spare_field1}" maxlength="255" size="100" /></td>
									</tr>
								</table> <font size="-1">■出展社数の多いデータが検索結果で上位に表示されます。</font>
							</td>
						</tr>

						<tr>
							<td nowrap>主催者・問合せ先 <font color="#CC3333">●</font></td>
							<!-- 問合わせ先・運営機関名(日) -->
							<!-- 問合わせ先・運営機関名(英) -->
							<!-- 問合わせ先・運営機関ＴＥＬ -->
							<!-- 問合わせ先・運営機関ＦＡＸ -->
							<!-- 問合わせ先・運営機関Ｅ－ＭＡＩＬ -->
							<td>
								<table border="0">
									<tr>
										<td nowrap>名称（日）<font color="#CC3333">●</font></td>
										<td nowrap><input type="text" name="organizer_jp" id="organizer_jp" value="{$form.organizer_jp}" maxlength="500" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>名称（英）<font color="#CC3333">●</font></td>
										<td nowrap><input type="text" name="organizer_en" id="organizer_en" value="{$form.organizer_en}" maxlength="500" size="100" /><font color="#CC3333">（翻訳）</font></td>
									</tr>
									<tr>
										<td nowrap>住所</td>
										<td><input type="text" name="organizer_addr" id="organizer_addr" value="{$form.organizer_addr}" maxlength="225" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>担当部課</td>
										<td><input type="text" name="organizer_div" id="organizer_div" value="{$form.organizer_div}" maxlength="225" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>担当者</td>
										<td><input type="text" name="organizer_pers" id="organizer_pers" value="{$form.organizer_pers}" maxlength="100" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>ＴＥＬ <font color="#CC3333">●</font></td>
										<td><input type="text" name="organizer_tel" id="organizer_tel" value="{$form.organizer_tel}" maxlength="100" size="100" /> （半角数字）</td>
									</tr>
									<tr>
										<td nowrap>ＦＡＸ</td>
										<td><input type="text" name="organizer_fax" id="organizer_fax" value="{$form.organizer_fax}" maxlength="100" size="100" /> （半角数字）</td>
									</tr>
									<tr>
										<td nowrap>Ｅ－Ｍａｉｌ</td>
										<td nowrap><input type="text" name="organizer_email" id="organizer_email" value="{$form.organizer_email}" maxlength="255" size="100" /> （半角英数）</td>
									</tr>
								</table> <font size="-1"> ■TEL・FAX はハイフン区切り、国番号から入力してください。 <br> 例：東京の場合 +81-3-1234-5678 <br>
							</font>
							</td>
						</tr>

						<tr>
							<td nowrap>日本国内の連絡先</td>
							<!-- 在日代理店名(日) -->
							<!-- 在日代理店名(英) -->
							<!-- 在日代理店ＴＥＬ -->
							<!-- 在日代理店ＦＡＸ -->
							<!-- 在日代理店Ｅ－ＭＡＩＬ -->
							<td>
								<table border="0">
									<tr>
										<td nowrap>名称（日）</td>
										<td nowrap><input type="text" name="agency_in_japan_jp" id="agency_in_japan_jp" value="{$form.agency_in_japan_jp}" maxlength="255" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>名称（英）</td>
										<td nowrap><input type="text" name="agency_in_japan_en" id="agency_in_japan_en" value="{$form.agency_in_japan_en}" maxlength="255" size="100" /><font color="#CC3333">（翻訳）</font></td>
									</tr>
									<tr>
										<td nowrap>住所</td>
										<td><input type="text" name="agency_in_japan_addr" id="agency_in_japan_addr" value="{$form.agency_in_japan_addr}" maxlength="255" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>担当部課</td>
										<td><input type="text" name="agency_in_japan_div" id="agency_in_japan_div" value="{$form.agency_in_japan_div}" maxlength="255" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>担当者</td>
										<td><input type="text" name="agency_in_japan_pers" id="agency_in_japan_pers" value="{$form.agency_in_japan_pers}" maxlength="100" size="100" /></td>
									</tr>
									<tr>
										<td nowrap>ＴＥＬ</td>
										<td><input type="text" name="agency_in_japan_tel" id="agency_in_japan_tel" value="{$form.agency_in_japan_tel}" maxlength="100" size="100" /> （半角数字）</td>
									</tr>
									<tr>
										<td nowrap>ＦＡＸ</td>
										<td><input type="text" name="agency_in_japan_fax" id="agency_in_japan_fax" value="{$form.agency_in_japan_fax}" maxlength="100" size="100" /> （半角数字）</td>
									</tr>
									<tr>
										<td nowrap>Ｅ－Ｍａｉｌ</td>
										<td nowrap><input type="text" name="agency_in_japan_email" id="agency_in_japan_email" value="{$form.agency_in_japan_email}" maxlength="255" size="100" /> （半角英数）</td>
									</tr>
								</table> <font size="-1"> ■海外で開催される見本市で、日本国内に問合せ先がある場合のみ入力してください。 <br> ■TEL・FAX はハイフン区切り、国番号から入力してください。 <br> 例：東京の場合 +81-3-1234-5678
							</font>
							</td>
						</tr>

						<tr>
							<td nowrap>見本市レポート／URL</td>
							<!-- 駐在員レポート／リンク -->
							<td nowrap><input type="text" name="report_link" id="report_link" value="{$form.report_link}" maxlength="255" size="100" /></td>
						</tr>
{*
						<tr>
							<td nowrap>世界の展示会場／URL</td>
							<!-- 展示会場／リンク -->
							<td nowrap><input type="text" name="venue_link" id="venue_link" value="{$form.venue_link}" maxlength="255" size="100" /></td>
						</tr>
*}
						<tr>
							<td nowrap>展示会に係わる画像(3点)</td>
							<!-- 展示会に係わる画像(3点) -->
							<td>
								<font size="-1">1. 画像ファイルをアップロードする際は以下の点にご注意ください。条件を満たさない場合は、正常に登録されません。</font><br/>
								<font size="-1">・画像1ファイル辺り2MB以下、縦600×横800ピクセル以内のgifまたはjpegにしてください。</font><br/>
								<font size="-1">・またファイル名は、半角英数字(a～ｚ、0～9)のみご使用ください。</font><br/>
								<input type="file" name="photos_1" id="photos_1" size="50" onBlur="add_photos('photos_1')" /><br/>
								<input type="file" name="photos_2" id="photos_2" size="50" onBlur="add_photos('photos_2')" /><br/>
								<input type="file" name="photos_3" id="photos_3" size="50" onBlur="add_photos('photos_3')" /><br/>
								<font size="-1">2. 登録された画像ファイル名が以下に表示されます。表示されない時は画面上をクリックしてください。</font><br/>
								<input type="button" value="上へ" onClick="up_photos_list();">&nbsp;<input type="button" value="下へ" onClick="down_photos_list()">&nbsp;<input type="button" value="削除" onClick="delete_photos_list()"><br>
								<select name="photos_list" id="photos_list" size="5" style="width:200px">
									{section name=it loop=$app.photos}
									<option value="{$app.photos[it]}">{$app.photos[it]}</option>
									{/section}
								</select>
								<input type="hidden" name="values2" value=""> <br/>
								<font size="-1">登録されているイメージの順番は上から1番目です。<br>
								詳細表示するときには左から1番目を表示します。</font>
							</td>
						</tr>

						<tr>
							<td nowrap>システム管理者備考欄</td>
							<!-- システム管理者備考欄 -->
							<td nowrap><input type="text" name="note_for_system_manager" id="note_for_system_manager" value="{$form.note_for_system_manager}" maxlength="255" size="100" /></td>
						</tr>

						<tr>
							<td nowrap>データ管理者備考欄</td>
							<!-- データ管理者備考欄 -->
							<td nowrap><input type="text" name="note_for_data_manager" id="note_for_data_manager" value="{$form.note_for_data_manager}" maxlength="255" size="100" /></td>
						</tr>
						<tr>
							<td nowrap>削除</td>
							<!-- 削除フラグ -->
							<td nowrap>
								{if ("copy" == $form.mode)}
									<input type="radio" name="del_flg" id="del_flg" value="0" checked />未削除
									<input type="radio" name="del_flg" id="del_flg" value="1"  />削除済
								{else}
									<input type="radio" name="del_flg" id="del_flg" value="0" {if ("0" == $form.del_flg || "1" != $form.del_flg)}checked{/if} />未削除
									<input type="radio" name="del_flg" id="del_flg" value="1" {if ("1" == $form.del_flg)}checked{/if} />削除済
								{/if}
							</td>
						</tr>
						<tr>
							<td nowrap>登録カテゴリ</td>
							<!-- 登録カテゴリ -->
							<td nowrap>
								<input type="radio" name="regist_category" id="regist_category" value="0" {if ("0" == $form.regist_category)}checked{/if} />ユーザによる登録（新規/コピー登録）
								<input type="radio" name="regist_category" id="regist_category" value="1" {if ("1" == $form.regist_category)}checked{/if} />運営委託先/管理者による登録
								<input type="radio" name="regist_category" id="regist_category" value="2" {if ("2" == $form.regist_category)}checked{/if} />新規発掘登録
								<input type="radio" name="regist_category" id="regist_category" value="9" {if ("9" == $form.regist_category)}checked{/if} />その他<br />
							</td>
						</tr>
						<tr>
							<td nowrap>JECC認証</td>
							<!-- JECC認証フラグ -->
							<td nowrap>
								{if ("copy" == $form.mode)}
									<input type="radio" name="jecc_flag" id="jecc_flag" value="0" checked />未認証
									<input type="radio" name="jecc_flag" id="jecc_flag" value="1"  />認証
								{else}
									<input type="radio" name="jecc_flag" id="jecc_flag" value="0" {if ("0" == $form.jecc_flag || "1" != $form.jecc_flag)}checked{/if} />未認証
									<input type="radio" name="jecc_flag" id="jecc_flag" value="1" {if ("1" == $form.jecc_flag)}checked{/if} />認証
								{/if}
							</td>
						</tr>
						<tr>
							<td nowrap>JECC認証年月日</td>
							<!-- JECC認証年月日 -->
							<td nowrap>
								<input type="text" name="jecc_date_y" id="jecc_date_y" value="{$form.jecc_date_y}"  maxlength="4" size="4" />年
								<input type="text" name="jecc_date_m" id="jecc_date_m" value="{$form.jecc_date_m}"  maxlength="2" size="2" />月
								<input type="text" name="jecc_date_d" id="jecc_date_d" value="{$form.jecc_date_d}"  maxlength="2" size="2" />日
							</td>
						</tr>
						<tr>
							<td nowrap>JETRO出展支援</td>
							<!-- JETRO出展支援フラグ -->
							<td nowrap>
								{if ("copy" == $form.mode)}
									<input type="radio" name="exhibit_support_flag" id="exhibit_support_flag" value="0" checked />無
									<input type="radio" name="exhibit_support_flag" id="exhibit_support_flag" value="1"  />有
								{else}
									<input type="radio" name="exhibit_support_flag" id="exhibit_support_flag" value="0" {if ("0" == $form.exhibit_support_flag || "1" != $form.exhibit_support_flag)}checked{/if} />無
									<input type="radio" name="exhibit_support_flag" id="exhibit_support_flag" value="1" {if ("1" == $form.exhibit_support_flag)}checked{/if} />有
								{/if}
							</td>
						</tr>
						<tr>
							<td nowrap>JETRO出展支援URL</td>
							<!-- JETRO出展支援URL -->
							<td nowrap><input type="text" name="jetro_suport_url" id="jetro_suport_url" value="{if ('' == $form.jetro_suport_url)}http://www.jetro.go.jp/services/tradefair/list/{else}{$form.jetro_suport_url}{/if}" maxlength="255" size="100" /></td>
						</tr>
					</table>
					<hr>
					<input type="button" value="登録" onclick="registFair()" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
