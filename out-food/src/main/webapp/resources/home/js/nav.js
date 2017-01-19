$(function() {
	/* DD版导航 */
	$('.categories').hover(function() {
		$('#indexMenu').show();
		$('.classify-box').show();
	}, function() {
		// $('.classify-box').hide();
		// $('#indexMenu').hide();
	});
	$('.classify-box').hover(function() {
		
	}, function() {
		$('.classify-box').hide();
		$('#indexMenu').hide();
	});
	$('#indexMenu').hover(function() {
		$('#indexMenu').show();
	}, function() {
		$('#indexMenu').hide();
	});
	$(".classify-big li").hover(function() {
		var index = $(this).index();
		$('.classify-sub-box').eq(index).show();
	}, function() {
		var index = $(this).index();
		$('.classify-sub-box').eq(index).hide();
	});
	$(".classify-sub-box").hover(function() {
		var index = $(this).index();
		$(".classify-big li:eq(" + index + ")").addClass("active");
		$(this).show();
	}, function() {
		var index = $(this).index();
		$(".classify-big li:eq(" + index + ")").removeClass("active");
		$(this).hide();
	});

})
