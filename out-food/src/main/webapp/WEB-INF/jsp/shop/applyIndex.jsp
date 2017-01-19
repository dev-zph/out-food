<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="../common/init.jsp" %>
    <link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<script src="${ctx}/resources/js/jquery.min.js"></script>
	<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
    <title>
        <c:out value="${pageTitle}"/>
    </title>
    <link rel="stylesheet" href="${ctx}/resources/css/webBase.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
    <%--
    <link rel="stylesheet" href="${ctx}/resources/home/css/head.css"/><!-- DD版 --> --%>
    <script src="${ctx}/resources/js/datepicker/WdatePicker.js"></script> <!--时间选择器 -->
    <script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>
    <script src="${ctx}/resources/js/main.js"></script>
   <script src="${ctx}/resources/js/shop-apply-index.js"></script>
   <script src="${ctx}/resources/js/pfa-base.js"></script>
</head>
<body ctx="${ctx}">
<%@ include file="../common/head1.jsp" %>
<%@ include file="../common/seller_head.jsp" %>
<%@ include file="../common/head_seller.jsp" %>
<div class="content content-box clear-float">
    <%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">卖家中心</a>&gt;<a href="javascript:void(0);">我要开店</a>
			</p>
			<div class="box-content noBorder">
				<div class="box-content-box">
					
					<h3 class="openTitle">开店流程</h3>
					<img src="../resources/images/seller-center-bj.jpg"  style="width: 98%;margin: 20px auto;" />
					<h4 class="open-shop-title">
						欢迎入驻爱养牛，我们会为您呈现不一样的精彩！
						<a href="javascript:void(0);" class="bottom"></a>
					</h4>
					<!-- <img src="../resources/images/openShopTitle.jpg" class="openShopTop" style="margin-top:20px;"/> -->
					<!-- <div class="open-shop-list clear-float">
						<div class="open-shop-list-block float-left borderRight">
							<p class="title">入驻需要哪些材料?</p>
							<p>查询自身行业所需要提交的资质</p>
							<p><a href="javascript:void(0);" class="garyBtn">查询开店标准</a></p>
						</div>
						<div class="open-shop-list-block float-right">
							<p class="title">我的申请通过了吗?</p>
							<p>入驻前咨询(0571) 88158077 工作日 09:00-18:00</p>
							<p><a href="javascript:void(0);" class="garyBtn">查询进度</a></p>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->


</body>
</html>