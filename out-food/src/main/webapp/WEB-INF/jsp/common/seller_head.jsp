<%@ page language="java" pageEncoding="UTF-8"%>
<!--Logo及 搜索-->
<div class="header container">
	<div class="logo fl" style="margin-bottom: 15px;">
		<img  src="${ctx}/resources/images/logo.jpg"  alt="爱养牛" class="fl">
	</div>
	<!--<div class="search fr">-->
		<!--<div class="seller-search-box" style="border:0px;">-->
			<!--<input type="text" style="color:#7F7F7F;width:250px;float:left;border-right:0" class="search-key">-->
			<!--<a href="#" class="search-btn">搜索</a>-->
		<!--</div>-->
	<!--</div>-->
</div>
<script type="text/javascript">
	$(function($){
		$(".search-btn").click(function(){
			var key = $(".search-key").val();
			window.location.href = ctx+"/order/getShopOrderList.html?status=0&orderNum="+key;
		});
		$(".areachoose span").click(function(){
			$(".areachoose").css("border","1px solid #dcdcdc");
			$(".icon-down").show();
			$(".areaswitch ul").show();
		});
		$(document).click(function() {
			$(".areachoose").css("border","1px solid #fff");
			$(".icon-down").hide();
			$(".areaswitch ul").hide();
		});
		$('.areaswitch').click(function(event) {
			event.stopPropagation();
		});
		$(".logo").click(function(){
			window.location.href =ctx+"/home.html";
		});
	});
</script>

