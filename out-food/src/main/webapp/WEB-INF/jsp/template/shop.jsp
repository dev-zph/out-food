<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>${empty title?'爱养牛':title}</title>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<link rel="stylesheet" href="${ctx}/resources/css/reset.css"/>
	<link rel="stylesheet" href="${ctx}/resources/css/webBase.css"/>
	<script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>
	<script src="${ctx}/resources/js/main.js"></script>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/head_web.jsp" %>

	<div class="full-box store-name">
		<div class="store-info content clear-float">
			<p class="store-score">服务评分：<span></span>9.7分<a href="#" class="follow">加关注</a></p>
			<p class="store-name">卖家： 颐通信息官方旗舰店</p>
		</div>
	</div>

	<div class="full-box store-top-banner">
		<div class="store-top content clear-float">
			<h2 class="store-logo">
				<img src="${ctx}/resources/temp/dp-logo.png" />
			</h2>
		</div>
	</div>

	<div class="full-box store-menu-bg">
		<div class="store-menu content clear-float">
			<ul>
				<li><a href="#">首页</a></li>
				<li><a href="#">所有商品</a></li>
				<li><a href="#">网站建设</a></li>
				<li><a href="#">企业邮箱</a></li>
				<li><a href="#">微站建设</a></li>
				<li><a href="#">微信管家</a></li>
				<li><a href="#">电商管家</a></li>
			</ul>
		</div>
	</div>

	<!--小导航-->
	<div class="smail-nav">
		<div class="content">
			<span><a href="#">首页</a></span>
			&gt;
			${shop.name}
		</div>
	</div>
	<!--小导航-->

	<%-- <div class="content content-box">
		<div class="sub-page-info-text clear-float">
			<div class="dianpu-img">
				<img src="temp/dp-info.png" />
				<p>分享
					<span class="follow"></span>
					<a href="#">收藏店铺</a></p>
			</div>
			<div class="dianpu-all-info">
				<div class="a">
					<em class="strong">店铺动态评分: </em>
					<ul>
						<li><label>服务质量</label><strong>5.0</strong></li>
						<li><label>于同行相比: </label><span>99.40%</span></li>
						<li><label>服务态度: </label><strong>5.0</strong></li>
						<li><label>于同行相比: </label><span>99.40%</span></li>
						<li><label>发货速度: </label><strong>5.0</strong></li>
						<li><label>于同行相比: </label><span>99.40%</span></li>
					</ul>
				</div>
				<div class="b">
					<em class="strong">店铺信息:</em>
					<ul>
						<li><label>店铺名称: </label>${shop.name}</li>
						<li><label>公司名称：</label>${shop.company}</li>
						<li><label>服务热线：</label>0571-28065199</li>
						<li><label>所在地址：</label>杭州市拱墅区 莫干山路789号 美都广场E座11层</li>
						<li><label>工商执照号：</label>866756434687431</li>
					</ul>
				</div>
				<p>
					搜到<em>253</em>件商品
					<span>
						商品：<input type="text" class="long-text">
						价格<input type="text" class="price">到
						<input type="text" class="price"><button>搜索</button>
					</span>
				</p>
			</div>
		</div>
	</div> --%>

	<div class="server-tj content content-box clear-float">
		<h4 class="all-pro">
			<span class="tag">所有商品</span>
			<p><a href="#">&lt;</a><span>1/3</span><a href="#">&gt;</a></p>
		</h4>
		<div class="store-box-list clear-float store-style-type01">
			<c:forEach items="${itemList}" var="item">
				<dl>
					<a target="_blank" href="item_detail.html" style="text-decoration:none;">
					<dt><img src="${item.imgsCover}" /></dt>
					<dd class="name">${fn:substring(item.name, 0, 20)}...</dd>
					<dd class="price">
						<em>￥</em><i>${item.price}</i>
						<span>原价：<del>${item.old}</del></span>
					</dd>
					</a>
				</dl>
			</c:forEach>
			
		</div>
		${page.pageBar}
	</div>
	
	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->

	
</body>
</html>