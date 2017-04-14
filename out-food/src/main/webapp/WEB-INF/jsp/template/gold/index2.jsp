<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("MENU_INDEX", "storeindex");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="../../common/init.jsp"%>
<title>陈佳_外卖系统</title>
<%-- <link rel="stylesheet" type="text/css" href="${ctx}/resources/template/gold/gold01/css/cssreset.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/template/gold/gold01/css/shop.css">--%>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/template/gold/gold01/css/slides.css"> 
<link rel="stylesheet" type="text/css" href="${ctx}/resources/ezhanlu/css/shop.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/ezhanlu/css/prolist.css">
<style type="text/css">
.pro-list-sub-div{
height:144px;
}
</style>
<script type="text/javascript"src="${ctx}/resources/template/gold/gold01/js/jquery.flexslider-min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.flexslider').flexslider({
			directionNav : true,
			pauseOnAction : false
		});
	});
	$(function() {
		$(".showsmalllist ul li img").on(
				"click",
				function() {
					$(this).parent().parent().children("li").children("span")
							.removeClass("selectedimg");
					$(this).next().addClass("selectedimg");
					$(this).parent().parent().parent().prev().children("a")
							.children("img").attr("src", $(this).attr("src"));
				});
		$(".shopinfo").hover(function() {
			$(".shopinfoshow").show();
		}, function() {
			$(".shopinfoshow").hide();
		});
		$(".shopinfoshow").hover(function() {
			$(".shopinfoshow").show();
		}, function() {
			$(".shopinfoshow").hide();
		});
		$(".evaluate").hover(function() {
			$(".shopinfoshow").show();
		}, function() {
			$(".shopinfoshow").hide();
		});
		$(".qrcode").hover(function() {
			$(".shopeqcodeshow").show();
		}, function() {
			$(".shopeqcodeshow").hide();
		});
		$(".shopeqcodeshow").hover(function() {
			$(".shopeqcodeshow").show();
		}, function() {
			$(".shopeqcodeshow").hide();
		});
	})
</script>
</head>
<body ctx="${ctx}">
	<div class="main">

	<%@ include file="../../common/head.jsp"%>
	<%@ include file="../../common/template/gold/head_gold.jsp"%>
	<!--Logo及 搜索-->
	<div class="content">
		<div class="container">
			<%@ include file="../../common/template/gold/top_gold01.jsp"%>
			<c:if test="${!empty shop.banner1||!empty shop.banner2||!empty shop.banner3||!empty shop.banner4}">
			<div class="banner">
				<div class="flexslider">
					<ul class="slides">
						<c:if test="${!empty shop.banner1&&fn:length(shop.banner1) > 0 }">
							<li style="background: url(${shop.banner1}) 50% 0 no-repeat;"></li>
						</c:if>
						<c:if test="${!empty shop.banner2&&fn:length(shop.banner2) > 0 }">
							<li style="background: url(${shop.banner2}) 50% 0 no-repeat;"></li>
						</c:if>
						<c:if test="${!empty shop.banner3&&fn:length(shop.banner3) > 0 }">
							<li style="background: url(${shop.banner3}) 50% 0 no-repeat;"></li>
						</c:if>
						<c:if test="${!empty shop.banner4&&fn:length(shop.banner4) > 0 }">
							<li style="background: url(${shop.banner4}) 50% 0 no-repeat;"></li>
						</c:if>
					</ul>
				</div>
			</div>
		</c:if>
		<div class="pro-list-sub clear-float">
			<c:forEach items="${itemList}" var="list" varStatus="status" >
					<div class="pro-list-sub-div">
						<div class="pro-list-sub-div-txt">
							<div class="pro-list-sub-div-info float-left">
								<div class="pro-list-sub-div-name">
									<a href="${ctx}/item/getItemById.html?itemId=${list.id}"  target="_blank">${list.name }</a>
									<span style="color: #ffa906;">规格：${list.version}</span>
									<span>简介：${list.title}</span>
								</div>
								<div class="pro-list-sub-div-items">
									<span class="items-deal">成交：
									<b>
										<c:choose>
										<c:when test="${empty list.itemSumCount }">
											0 
										</c:when>
										<c:otherwise>
											${list.itemSumCount }
										</c:otherwise>
									</c:choose>
									笔</b>
									</span>
									<span class="items-eva">评价：<b>${list.itemCommCount }条</b></span><c:if test="${list.orderType=='1'}"><span class="dingjintip">可账期支付</span></c:if>
									<a href="${ctx}/item/getItemById.html?itemId=${list.id}" class="float-right">查看详情&nbsp;></a>
								</div>
							</div>
							<div class="pro-list-sub-div-buy float-right">
								<div class="pro-list-sub-div-price">
									平台价：
									<p>¥<span>${list.price }</span></p>
								</div>
								<div class="pro-list-sub-div-buybtn">
									<c:if test="${list.status==3}">
									<a  id="${list.id}"  href="javascript:;" class="addCarOne">加入购物车</a>
									</c:if>
									<c:if test="${list.status!=3}">
									<a  href="javascript:;" >已下架</a>
									</c:if>
								</div>
							</div>	
						</div>
					</div>
				</c:forEach>
				</div>
		<%@ include file="../../common/template/gold/bottom_gold01.jsp"%>
	</div>
	</div>
	<!-- 底部信息 -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- 底部信息 -->
</div>
	
</body>

</html>