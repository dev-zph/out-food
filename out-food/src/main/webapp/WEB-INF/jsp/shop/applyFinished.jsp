<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
<link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${ctx}/resources/js/jquery.min.js"></script>
<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
	<script src="${ctx}/resources/js/main.js"></script>
	<script src="${ctx}/resources/home/js/nav.js"></script><!-- DD版 -->
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head1.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp" %>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx}/order/getShopOrderList.html?status=0">卖家中心</a>&gt;<a href="${ctx }/navigate_apply/index.html">我要开店</a>
			</p>
			<div class="box-content noBorder">
				<h3 class="open-title-step step04">
					<img src="${ctx }/resources/images/step04.jpg" style="width:96.6%" />
					<!-- <i></i> -->
				</h3>
				<div class="open-step-box">
					<c:if test="${shopStatus eq 0}">
						<div class="open-tips">
							<p class="title">恭喜您，已经开通了属于你自己的店铺，赶紧去添加商品吧</p>
							<!-- <p> 事实和口碑胜于一切,30万创业者通过我们找项目、迈出成功创业第一步。<br />成功人生这里启航几十万创业者通过留言找项目收获了自己的财富事业。</p> -->
							<p><button class="layui-btn layui-btn-small button-orange" onclick="goAdd()">去添加商品</button></p>
						</div>
					</c:if>
					<c:if test="${shopStatus eq 5}">
						<div class="open-tips" style="background-image:url(../resources/images/failIcon.jpg);">
							<p>&nbsp;</p>
							<p class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								您的店铺已被冻结，详情已短信发送至您的店铺联系人。
							</p>
							<p>暂时无法使用，可联系客服申请解冻！</p>
							<p>&nbsp;</p>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->

<script type="text/javascript">
function goAdd(){
	window.location.href = "${ctx}/item/toAdd.html";
}
</script>
</body>
</html>