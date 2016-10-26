// The MIT License; http://www.opensource.org/licenses/mit-license.php
// Copyright (c) 2010 Takayuki Miwa
(function($, useDOM0) {
	$.extend($.fn, useDOM0 ? {
		clearOptions : function() {
			this.each(function() {
				this.options.length = 0
			});
		},
		addOption : function(text, value, selected) {
			this.each(function() {
				this.options[this.options.length] = new Option(text, value, selected, selected);
			});
		}
	} : {
		clearOptions : function() {
			this.empty();
		},
		addOption : function(text, value, selected) {
			$(selected ? '<option selected="selected" />' : '<option />').text(text).attr('value', value).appendTo(this);
		}
	})
})(jQuery, jQuery.browser.msie);
