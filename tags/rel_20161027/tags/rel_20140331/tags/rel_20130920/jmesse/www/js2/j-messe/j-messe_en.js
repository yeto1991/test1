//j-messe 国一覧

function toggle_cy_en (e) {
	var span = $(e).next().next().toggleClass("close");
	var closed = String(span.attr('class')).match(/close/);
	var img = $(e).prev("img");
	var src = img.attr('src');
	if ( closed ) {
		img.attr('src', src.replace(/expanded/, "collapsed"));
		img.attr('alt', "Open");
		$(e).attr('title', "Open");
		$(e).html("Others");
	} else {
		img.attr('src', src.replace(/collapsed/, "expanded"));
		img.attr('alt', "Close");
		$(e).attr('title', "Close");
		$(e).html("Close");
	}
	return false;
}


//スライドショー
$(document).ready(function(){
	$("a[rel^='prettyPhoto']").prettyPhoto({animationSpeed:'normal',theme:'light_square',slideshow:5000,autoplay_slideshow:true,show_title:true});
	$("a[rel$='prettyPhoto']").prettyPhoto({animationSpeed:'normal',theme:'light_square',slideshow:false,autoplay_slideshow:false,show_title:true});

});
