<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if(request.getParameter("shopClassifyId") == null || request.getParameter("shopClassifyId") ==""){
	request.setAttribute("MENU_INDEX", "storeitemlist");
}else{
	request.setAttribute("MENU_INDEX", "storeitemclass");
}
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
			<div class="pro">
				<div class="filter">
					<ul class="fl">
						<li class="on">综合排序<i class="icon icon-fd"></i>
						</li>
						<li>人气<i class="icon icon-fd"></i>
						</li>
						<li>销量<i class="icon icon-fd"></i>
						</li>
						<li>信用<i class="icon icon-fd"></i>
						</li>
						<li><span class="fl">价格</span>
							<div class="pricedown fl">
								<i class="icon icon-pup"></i><i class="icon icon-pdown"></i>
							</div></li>
					</ul>
					<div class="pricerang fl">
						<input name="min-price"> — <input name="max-price">
					</div>
					<div class="simplepage fr">
						<span class="fl">${itemPage.pageNo }/${itemPage.totalPageNo }</span> <a href="javascript:;" onclick="toPage('${itemPage.prePageNo}','${itemPage.pageUrl}');"> <img
							src="${ctx}/resources/template/vip/vip01/images/simple_prev.png">
						</a> <a href="javascript:;" onclick="toPage('${itemPage.nextPageNo}','${itemPage.pageUrl}');"> <img
							src="${ctx}/resources/template/vip/vip01/images/simple_next.png">
						</a>
					</div>
				</div>
				<div class="prolist">
					<ul>
					<c:forEach items="${itemPage.records }" var="list">
						<li><a class="imglink" target="_blank" href="${ctx}/item/getItemById.html?itemId=${list.id}"> <img
								src="${list.imgsCover }">
						</a>
							<div class="name-price">
								<a target="_blank" href="${ctx}/item/getItemById.html?itemId=${list.id}">${list.name }</a> <span
									class="proprice fl">¥<b>${list.price }</b></span>
									<c:if test="${list.old > 0}"> 
									<span class="propricey fr">原价：￥${list.old }</span>
									</c:if>
							</div></li>
					</c:forEach>						
					</ul>
					<!-- 
					<div class="page-list">
						<a href="javascript:void(0)" class="previous">首页</a> <a
							href="javascript:void(0)" class="index">上一页</a> <a
							href="javascript:void(0)" class="index on">1</a> <a
							href="javascript:void(0)">2</a> <a href="javascript:void(0)">3</a>
						<a href="javascript:void(0)">4</a> <a href="javascript:void(0)"
							class="index">下一页</a> <a href="javascript:void(0)" class="index">末页</a>
					</div>
					 -->
					${itemPage.pageBar }
				</div>
			</div>
		</div>
		<%@ include file="../../common/template/vip/bottom_vip01.jsp"%>
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