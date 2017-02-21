$(function(){
	$('.flexslider').flexslider({
		directionNav: true,
		pauseOnAction: false
	});
	var myVar=setInterval('autoScroll(".side-news-list")',3000);
	$(".side-news-list ul li").hover(
	  function () {
	    clearInterval(myVar);
	  },
	  function () {
	    // myVar=setInterval('autoScroll(".side-news-list")',3000);
	  }
	);
	$(".service-list-big a").hover(
	  function () {
	    $(this).children(".imglist").children(".imghover").fadeIn(500);
	  },
	  function () {
	    $(this).children(".imglist").children(".imghover").fadeOut(400);
	  }
	);
	$(".service-list-small ul li a").hover(
	  function () {
	    $(this).children(".imglist").children(".imghover").fadeIn(500);
	  },
	  function () {
	    $(this).children(".imglist").children(".imghover").fadeOut(400);
	  }
	);
});
function autoScroll(obj){  
	$(obj).find("ul").animate({  
		marginTop : "0px"
	},1000,function(){  
		// $(this).css({marginTop : "0px"}).find("li:first").appendTo(this);
	});
}