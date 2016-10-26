$(function() {
	/**
	 * JSONデータをサーバーから取得し、指定したDOMにHTML加工してから挿入する関数
	 *
	 * @parameter url: jsonリソースを得られるURL
	 * @parameter jQueryTargetObj:HTMLにしたJSONをinnerHTMLに入れられるDOM
	 * @parameter convertFunc:JSONのデータ構造に対して、HTML変換を実装する関数
	 * @return : void
	 */
	function insertHTMLContentFromUserJSON(url, jQueryTargetObj, convertFunc) {
		// ajax
		$.ajax({
			"url" : url,
			"dataType" : "json",
			"success" : function(data) {
				var content_data = convertFunc(data);
				jQueryTargetObj.append(content_data);
			}
		});
	}

	/**
	 * JSONのデータ構造に対して、HTML変換を実装する関数の例
	 *
	 * @parameter data: JSONデータ
	 * @return : JSONデータを加工したHTML文字列
	 */
	var industory_ConvertJSONtoHTML = function(data) {
		return function() {
			// variables
			var content_data = '';
			var content_length = 0;
			var column_length = data.length;
			var temp_loop_ref = null;

			// core logic
			for ( var column_no = 0; column_no < column_length; ++column_no) {
				content_length = data[column_no].length;
				content_data += '<div class="columns">';

				for ( var content_no = 0; content_no < content_length; ++content_no) {
					temp_loop_ref = data[column_no][content_no];
					content_data += '<li><a href="/jmesse/www/' + temp_loop_ref["url"] + '">' + temp_loop_ref["industory"] + '（' + temp_loop_ref["count"] + '）</a></li>';
				}

				content_data += '</div>';
			}
			return content_data;
		}
	};

	insertHTMLContentFromUserJSON("jsonfile/industry2_jp.json", $('#industry'), industory_ConvertJSONtoHTML);
	insertHTMLContentFromUserJSON("jsonfile/industry2_en.json", $('#industry_en'), industory_ConvertJSONtoHTML);

});
