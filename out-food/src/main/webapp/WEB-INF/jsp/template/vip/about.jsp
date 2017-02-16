<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("MENU_INDEX", "storeinfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="../../common/init.jsp"%>
<title>${empty title?'爱养牛':title}金牌商家</title>
<link rel="stylesheet" type="text/css"	href="${ctx}/resources/template/vip/vip01/css/cssreset.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/resources/template/vip/vip01/css/shop.css">
<link rel="stylesheet" type="text/css"	href="${ctx}/resources/template/vip/vip01/css/slides.css">
</head>
<body ctx="${ctx}">
	<%@ include file="../../common/head.jsp"%>
	<%@ include file="../../common/template/vip/head_vip01.jsp"%>
	<!--Logo及 搜索-->
	<div class="content">
		<div class="container">
			<%@ include file="../../common/template/vip/top_vip01.jsp"%>
			<div class="aboutimg">
				<img src="${shop.aboutUrl}">
			</div>
			<%@ include file="../../common/template/vip/bottom_vip01.jsp"%>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- 底部信息 -->
</body>
<script type="text/javascript">
	$(function(){
		$(".shopinfo").hover(
		  function () {
		    $(".shopinfoshow").show();
		  },
		  function () {
		    $(".shopinfoshow").hide();
		  }
		);
		$(".shopinfoshow").hover(
		  function () {
		    $(".shopinfoshow").show();
		  },
		  function () {
		    $(".shopinfoshow").hide();
		  }
		);
		$(".evaluate").hover(
		  function () {
		    $(".shopinfoshow").show();
		  },
		  function () {
		    $(".shopinfoshow").hide();
		  }
		);
		$(".qrcode").hover(
		  function () {
		    $(".shopeqcodeshow").show();
		  },
		  function () {
		    $(".shopeqcodeshow").hide();
		  }
		);
		$(".shopeqcodeshow").hover(
		  function () {
		    $(".shopeqcodeshow").show();
		  },
		  function () {
		    $(".shopeqcodeshow").hide();
		  }
		);
		$(".filter ul li").click(function(){
			$(".filter ul li").removeClass("on");
			$(this).addClass("on");
		})
	})
</script>
</html>