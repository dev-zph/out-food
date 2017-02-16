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
<title>${empty title?'爱养牛':title}壹路通商家</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/template/vip/vip01/css/cssreset.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/template/vip/vip01/css/shop.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/template/vip/vip01/css/slides.css">
<script type="text/javascript"
	src="${ctx}/resources/template/vip/vip01/js/jquery.flexslider-min.js"></script>
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
	<%@ include file="../../common/head.jsp"%>
	<%@ include file="../../common/template/vip/head_vip01.jsp"%>
	<!--Logo及 搜索-->
	<div class="content">
		<div class="container">
			<%@ include file="../../common/template/vip/top_vip01.jsp"%>
			<div class="banner">
				<div class="flexslider">
					<ul class="slides">
						<c:if test="${fn:length(shop.banner1) > 0 }">
							<li style="background: url(${shop.banner1}) 50% 0 no-repeat;"></li>
						</c:if>
						<c:if test="${fn:length(shop.banner2) > 0 }">
							<li style="background: url(${shop.banner2}) 50% 0 no-repeat;"></li>
						</c:if>
						<c:if test="${fn:length(shop.banner3) > 0 }">
							<li style="background: url(${shop.banner3}) 50% 0 no-repeat;"></li>
						</c:if>
						<c:if test="${fn:length(shop.banner4) > 0 }">
							<li style="background: url(${shop.banner4}) 50% 0 no-repeat;"></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="rec-pro">
				<div class="rec-pro-tit">
					推荐产品 <a href="${ctx}/store/${shopId}/getItemList.html" class="fr">更多>></a>
				</div>
				<c:forEach items="${itemList}" var="item" varStatus="status" end="4">
					<c:choose>
						<c:when test="${status.index == 0}">
							<div class="rec-top1 fl">
								<div class="top1-pro">
									<div class="showimg fl">
										<a target="_blank"
											href="${ctx}/item/getItemById.html?itemId=${item.id}"><img
											src="${item.imgsCover}"></a>
									</div>
									<div class="showsmalllist fl">
										<ul>
											<%-- <c:forTokens items="${item.imgs}" delims="," var="itemImgs">
												<li><img src="<c:out value="${itemImgs}"/>"><span></span></li>
											</c:forTokens> --%>
										</ul>
									</div>
									<div class="showexplain">
										<div class="explainname">
											<p class="tit">
												<a target="_blank"
													href="${ctx}/item/getItemById.html?itemId=${item.id}">${item.name }</a>
											</p>
											<p class="price">
												<span>RMB</span> ${item.price}
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${(status.index-1)%2 == 0}">
								<div class="rec-pro-list fl">
							</c:if>
							<div class="top5-pro">
								<div class="showimg fl">
									<a target="_blank"
										href="${ctx}/item/getItemById.html?itemId=${item.id}"><img
										src="${item.imgsCover}"></a>
								</div>
								<div class="showsmalllist fl">
									<ul>
										<%-- <c:forTokens items="${item.imgs}" delims="," var="itemImgs">
											<li><img src="<c:out value="${itemImgs}"/>"><span></span></li>
										</c:forTokens> --%>
									</ul>
								</div>
								<div class="showexplain">
									<div class="explainname fl">
										<p class="tit">
											<a href="#"><a target="_blank"
												href="${ctx}/item/getItemById.html?itemId=${item.id}">${item.name }</a></a>
										</p>
										<p class="price">
											<span>RMB</span> ${item.price}
										</p>
									</div>
								</div>
							</div>
							<c:if test="${status.index%2 == 0}">
				</div>
				</c:if>
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</div>
		</div>
		<%@ include file="../../common/template/vip/bottom_vip01.jsp"%>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../../common/footer.jsp"%>
	<!-- 底部信息 -->
</body>

</html>