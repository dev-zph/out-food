<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<title><c:out value="${pageTitle}"/></title>
	<link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${ctx}/resources/js/jquery.min.js"></script>
<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="../resources/css/base.css"/>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/js/pfa-base.js"></script>
	<script src="../resources/js/shop-apply-verify.js"></script>
	<style type="text/css">
		.seller-center-sidebar ul li a{
			color:#7F7F7F;
		}
	</style>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head1.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp"%>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">卖家中心</a>&gt;<a href="javascript:void(0);">我要开店</a>
			</p>
			<div class="box-content noBorder">
				<h3 class="open-title-step step03">
					<img src="../resources/images/step04.jpg" />
					<!-- <i></i> -->
				</h3>
				<div class="open-info-verify">
					<c:if test="${shopStatus eq 2}">
						<h3>您的申请信息已经提交成功，正在审核中...</h3>
						<p>我们将在2小时内审核你的信息，请保持通信畅通，感谢您对陈佳_外卖系统平台的支持和关注！</p>
					</c:if>
					<c:if test="${shopStatus eq 3}">
						<h3>恭喜你，您的申请信息审核已通过！</h3>
					</c:if>
					<c:if test="${shopStatus eq 4}">
						<h3>很抱歉，您的申请信息没有审核通过！</h3>
						<p>详情请联系管理员!</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->

</body>
</html>