$(function() {
	$(".sidebar01").show();
	$(".sidebar01").unbind("hover");
	$(".rec-list ul li").hover(
		function() {
			$(this).children().show();
		},
		function() {
			$(this).children().hide();
		}
	);
	$(document).scroll(function() {
		var bodyw = document.body.clientWidth;
		var scrollTop = $(document).scrollTop();
		if (bodyw > 1262) {
			if (scrollTop > 530) {
				$(".gotop").show();
				var leftw = (bodyw - 1262) / 2;
				$(".gotop").css("right", leftw);
			} else {
				$(".gotop").hide();
			}
		} else {
			$(".gotop").show();
		}
	});
	$('.anchor a').click(function() {
		var index = $(this).index();
		var top = $('.anchorgo').eq(index).offset().top - 20;
		$('html, body').animate({
			scrollTop: top
		}, 300);

	});
	$('.gotop').click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 300);

	});
})