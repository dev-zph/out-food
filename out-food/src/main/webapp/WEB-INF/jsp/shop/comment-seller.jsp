<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="../resources/css/base.css"/>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/js/pfa-base.js"></script>
	<script src="../resources/js/jquery-pagination.js"></script>
	<script src="../resources/js/comment-seller.js"></script>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp" %>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx }/order/getShopOrderList.html?status=0">订单管理</a>&gt;<a href="${ctx}/navigate_comment/seller.html">评价</a>
			</p>
			<div class="box-content">
				<div class="score-box yellowBg">
					<h3>商铺动态评分</h3>
					<div class="score-leval">
						<span class="score-start sc-service">服务质量：<span class="start"><i></i></span><em>&nbsp;</em></span>
						<span class="score-start sc-send">响应速度：<span class="start"><i></i></span><em>&nbsp;</em></span>
						<span class="score-start sc-quality">服务态度：<span class="start"><i></i></span><em>&nbsp;</em></span>
					</div>
				</div>
				<div class="data-box">
					<div class="score-page-tag" id="commentTotal">
						<span class="on">来自买家评价(0)</span>
					</div>
					<table id="commentRecord">
						<thead>
							<tr class="score-page-title">
								<th width="35%">商品信息</th>
								<th width="15%">购买时间</th>
								<th width="35%">评价内容</th>
								<th width="10%">评价人</th>
							</tr>   
						</thead>
						<tbody>      
							<!--                                  
							<tr>
								<td class="text-left">
									<img src="../resources/temp/img14.png" class="pro-img"/>
									<em>是专利法保护的专利的三种类型而且法律状态最为稳定技</em>
								</td>
								<td>2015-06-04</td>
								<td>
									商品评价内容商品评价内容商品评价内容商品评价内容商品评价内容<span>[2015-05-11 15:50:45]</span>
								</td>
								<td>zy3fffff</td>
							</tr>
							<tr>
								<td class="text-left">
									<img src="../resources/temp/img14.png" class="pro-img"/>
									<em>是专利法保护的专利的三种类型而且法律状态最为稳定技</em>
								</td>
								<td>2015-06-04</td>
								<td>
									商品评价内容商品评价内容商品评价内容商品评价内容商品评价内容<span>[2015-05-11 15:50:45]</span>
								</td>
								<td>zy3fffff</td>
							</tr>
							<tr>
								<td class="text-left">
									<img src="../resources/temp/img14.png" class="pro-img"/>
									<em>是专利法保护的专利的三种类型而且法律状态最为稳定技</em>
								</td>
								<td>2015-06-04</td>
								<td>
									商品评价内容商品评价内容商品评价内容商品评价内容商品评价内容<span>[2015-05-11 15:50:45]</span>
								</td>
								<td>zy3fffff</td>
							</tr>
							<tr>
								<td class="text-left">
									<img src="../resources/temp/img14.png" class="pro-img"/>
									<em>是专利法保护的专利的三种类型而且法律状态最为稳定技</em>
								</td>
								<td>2015-06-04</td>
								<td>
									商品评价内容商品评价内容商品评价内容商品评价内容商品评价内容<span>[2015-05-11 15:50:45]</span>
								</td>
								<td>zy3fffff</td>
							</tr>
							<tr>
								<td class="text-left">
									<img src="../resources/temp/img14.png" class="pro-img"/>
									<em>是专利法保护的专利的三种类型而且法律状态最为稳定技</em>
								</td>
								<td>2015-06-04</td>
								<td>
									商品评价内容商品评价内容商品评价内容商品评价内容商品评价内容<span>[2015-05-11 15:50:45]</span>
								</td>
								<td>zy3fffff</td>
							</tr>
							<tr>
								<td class="text-left">
									<img src="../resources/temp/img14.png" class="pro-img"/>
									<em>是专利法保护的专利的三种类型而且法律状态最为稳定技</em>
								</td>
								<td>2015-06-04</td>
								<td>
									商品评价内容商品评价内容商品评价内容商品评价内容商品评价内容<span>[2015-05-11 15:50:45]</span>
								</td>
								<td>zy3fffff</td>
							</tr>
							-->              
						</tbody>
					</table>
					<div class="page-box clear-float">
						<p class="page-list float-right">
							<!--   
							<a class="previous" href="#">上一页</a>
							<a class="index" href="#">1</a>
							<a class="index" href="#">2</a>
							<a class="index" href="#">3</a>
							<a class="index" href="#">4</a>
							<span>……</span>
							<a class="index" href="#">100</a>
							<a class="index" href="#">下一页</a>
							<span>到第</span>
							<input type="text">
							<span>页</span>
							<button>确定</button>
							-->       
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->


</body>
</html>