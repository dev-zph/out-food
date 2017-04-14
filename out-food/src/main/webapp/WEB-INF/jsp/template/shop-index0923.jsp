<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>${empty title?'陈佳_外卖系统':title}</title>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<link rel="stylesheet" href="${ctx}/resources/css/reset.css"/>
	<link rel="stylesheet" href="${ctx}/resources/css/webBase.css"/>
	<link rel="stylesheet" href="${ctx}/resources/home/css/head.css" /><!-- DD版 -->
	<script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>
	<script src="${ctx}/resources/js/main.js"></script>
	<style type="text/css">
		.service-score ,.total-score-img{
			background-image:url(${ctx}/resources/images/start.png);
			/* padding-left:85px; */
			margin-right:10px
		}
		.name a{
			color: #000;
		}
	</style>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/head_web.jsp" %>
	<!--Logo及 搜索-->

	<div class="full-box store-name">
		<div class="store-info content clear-float">
			<%-- <p class="store-score">
				服务评分：<span class="total-score-img"><label class="total-score" value="${totalScore}"></label>分
				<!-- <a href="#" class="follow">加关注</a> -->
			</p> --%>
			<p class="store-name">卖家：${shop.company}</p>
		</div>
	</div>

	<%-- <div class="full-box store-top-banner">
		<div class="store-top content clear-float">
			<h2 class="store-logo">
				<img src="${ctx}/resources/temp/dp-logo.png" />
			</h2>
		</div>
	</div> --%>
	<div class="full-box store-top-banner" style="background-image: url(${shop.logoUrl})">
		<!-- <div class="store-top content clear-float">
			<h2 class="store-logo">
				
			</h2>
		</div> -->
		
	</div>

	<div class="full-box store-menu-bg">
		<div class="store-menu content clear-float">
			<ul>
				<li><a href="${ctx}/template/toShopIndex/${shopId}.html">首页</a></li>
				<li><a href="${ctx}/item/getItemList.html?shopId=${shopId}&byClassify=true">所有商品</a></li>
				<c:forEach items="${classifyList}" var="classify" end="4">
					<li><a href="${ctx}/item/getItemList.html?shopId=${shopId}&shopClassifyId=${classify.id}&byClassify=true">${classify.name}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<!--菜单 Banner-->
	<div index="-1" class="full-box menu-box stote-banner" 
		data="${ctx}/resources/temp/dp-banner01.png|${ctx}/resources/temp/dp-banner02.jpg|${ctx}/resources/temp/dp-banner03.jpg|${ctx}/resources/temp/dp-banner04.jpg|${ctx}/resources/temp/dp-banner05.jpg">
		<div class="ad-disc">
		</div>
	</div>
	<input type="hidden" value="${shop.banner1}" class="banner1"></input>
	<input type="hidden" value="${shop.banner2}" class="banner2"></input>
	<input type="hidden" value="${shop.banner3}" class="banner3"></input>
	<input type="hidden" value="${shop.banner4}" class="banner4"></input>
	<script type="text/javascript">
		var banner1 = $(".banner1").val();
		var banner2 = $(".banner2").val();
		var banner3 = $(".banner3").val();
		var banner4 = $(".banner4").val();
		var data = [];
		var banner = 0;
		if(banner1 != null && banner1 != ""){
			data.push(banner1);
			banner = 1;
		}
		if(banner2 != null && banner2 != ""){
			data.push('|');
			data.push(banner2);
			banner = 1;
		}
		if(banner3 != null && banner3 != ""){
			data.push('|');
			data.push(banner3);
			banner = 1;
		}
		if(banner4 != null && banner4 != ""){
			data.push('|');
			data.push(banner4);
			banner = 1;
		}
		if(banner == 1){
			$(".stote-banner").attr("data",data.join(""));
		}
	</script>
	<!--菜单 Banner-->

	<div class="content content-box">
		<div class="store-box content clear-float">
			<div class="left-nav float-left">
				<%-- <h2></h2>
				<p class="name-info"><label>卖    家：</label>${shop.company}</p>
				<p class="bzj-red">已缴纳保证金${shop.bail}元</p>
				<p class="bzj-red"></p>
				<div class="store-box-info"  style="border-bottom: 0px;">
					<p>
						<span>
							<img src="${ctx}/resources/images/store-box-info-01.jpg" />
						</span>
						<span>
							<img src="${ctx}/resources/images/store-box-info-02.jpg" />
						</span>
						<span>
							<img src="${ctx}/resources/images/store-box-info-03.jpg" />
						</span>
					<p>
				</div>
				<div style="border-bottom: 1px solid #E5E5E5;">
					<span class="store-score">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						服务评分：
						<span class="total-score-img">
						</span><label class="total-score" value="${totalScore}"></label>分
					</span>
					<br/>
					<br/>
					<br/>
				</div>
				<div class="pinfe-list store-info">
					<ul>
						<li>
							<span class="store-score">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								商品质量：
								<span class="service-score"></span>
								<label class="score">${quality}</label>分
							</span>
							<label>与同行相比: </label><em>99.40%</em></li>
						<li>
							<span class="store-score">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								服务态度：
								<span class="service-score"></span>
								<label class="score">${send}</label>分
							</span>
							<label>与同行相比: </label><em>99.40%</em> 
						</li>
						<li>
							 <span class="store-score">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								发货速度：
								<span class="service-score"></span>
								<label class="score">${attitude}</label>分
							</span>
							<label>与同行相比: </label><em>99.40%</em> 
						</li>
					</ul>
				</div>
				<div class="dianpu-tel">
					<label>店铺名称：</label>${shop.name}<br>
					<label>公司名称：</label>${shop.company}<br>
					<label>服务热线：</label>${shop.serviceHotline}<br>
					<label>所在地址：</label>${shop.companyAddress}<br>
					<label>工商执照号：</label>${shop.licenseNum}<br> 
				</div>
				<p class="info-cn">
					<i class="info-cn-01"></i>买家保障
					<i class="info-cn-02"></i>企业实地认证
				</p>
				<div class="er-msg">
					<img src="${shop.qrCodeUrl}" />
				</div> 
			--%>
				<div class="shop-year">
					<img src="${ctx}/resources/home/images/pic/score_year_img.jpg">第<span>1</span>年
				</div>
				<div class="shop-name">
					<label>卖&nbsp;&nbsp;家：</label>	<span>${shop.company}</span>
				</div>
				<div class="shop-service">
					<label>服务评分：</label><div class="service-star"><div id="ssb" class="service-star-bar" ></div></div> <span id="span1"></span>分
				</div>
				<div class="service-pinfe-list">
					<div>
						<label>服务态度：</label>
						<div class="service-star"><div id="ssb1" class="service-star-bar" ></div></div> <span id="span2"></span>分
					</div>
					<div>
						<label>发货速度：</label>
						<div class="service-star"><div id="ssb2" class="service-star-bar" ></div></div> <span id="span3"></span>分
					</div>
					<div>
						<label>商品质量：</label>
						<div class="service-star"><div id="ssb3" class="service-star-bar" ></div></div> <span id="span4"></span>分
					</div>
				</div>
				<div class="shop-info">
					<div class="shop-info-tit">
						商家信息
					</div>
					<div class="shop-info-list">
						<div>
							<label>公司名称：</label>	${shop.company }
						</div>
						<div>
							<label>服务热线：</label>	${shop.serviceHotline}
						</div>
						<div>
							<label>营业执照：</label>	${shop.licenseNum} <a href="${shop.licenseUrl }" class="tooltip" title="点击查看大图">点击查看</a>
						</div>
						<input type="hidden" id="detailShopId" value="${shop.id }" />
					</div>
				</div>
				<div class="shop-attest">
					<ul>
						<li>
							<img src="${ctx}/resources/home/images/icon/attest01.jpg"><br>
							买家保障
						</li>
						<li>
							<img src="${ctx}/resources/home/images/icon/attest02.jpg"><br>
							企业实地认证
						</li>
						<li>
							<img src="${ctx}/resources/home/images/icon/attest03.jpg"><br>
							已缴保证金
						</li>
					</ul>
				</div>
			</div>

			<div class="store-right float-right">
				<div class="store-about">
					<!-- <h4>公司介绍<a href="#" class="more">更多>></a></h4> -->
					<img src="${shop.aboutUrl}" class="about-img" />
				</div>
				<div class="store-list">
					<h4>推荐产品
						<!-- <a href="#" class="more">更多>></a> -->
					</h4>
					<div class="store-box-list clear-float store-style-type01">
						<c:forEach items="${itemList}" var="item" varStatus="status" end="4">
							<c:if test="${status.index < 6}">
								<dl>
									<a target="_blank" href="item_detail.html" style="text-decoration:none;">
									<dt><a href="${ctx}/item/getItemById.html?itemId=${item.id}"><img src="${item.imgsCover}" /></a></dt>
									<dd class="name"><a href="${ctx}/item/getItemById.html?itemId=${item.id}">${item.name}</a></dd>
									<dd class="price">
										<em>￥</em><i>${item.price}</i>
										<c:if test="${not empty item.old}">
											<span>原价：<del>${item.old}</del></span>
										</c:if>
									</dd>
									</a>
								</dl>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<div class="store-ry">
			<!-- <h4>荣誉资质</h4> -->
			<img src="${shop.honorUrl}" />
		</div>

		<div class="copyright-info-stor">
			<!-- *本店铺使用权：杭州某某科技有限公司 -->
			<i></i>
			商家版&nbsp;&nbsp;&nbsp;
			<!-- 店铺设计：JOJO工作室 -->
		</div>
	
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->
</body>
<!-- <script type="text/javascript">
	//计算红星的显示宽度，半个星为一个单位
	var half_star_px = 8;
	$.each($(".score"),function(i,scoreObj){
		var score = parseFloat($(scoreObj).text()).toFixed(1);
		var half_star_count = score/0.5;
		
		var space_count = Math.ceil(score);
		var start_img_width = half_star_count * half_star_px + space_count;
		$(scoreObj).siblings(".service-score").css("padding-left",start_img_width+"px");
	});
	
	//总评分
	half_star_px = 7.5;
	var total_score = parseFloat($(".total-score").attr("value"));
	var total_space_count = Math.ceil(total_score/0.5);
	$(".total-score").text(parseFloat(total_score).toFixed(1));
	var total_space_width =  parseFloat(total_score/0.5*half_star_px+total_space_count).toFixed(5);
	$(".total-score-img").css("padding-left",total_space_width+"px");
</script> -->
<script type="text/javascript">
		<%-- function countSum(val1,val2){
			var width = 1 + val1 * 3 + val2 * 14;
			return width;
		}
		$(document).ready(function() { 
			var detailShopId = $("#detailShopId").val();
			$.ajax({
			    		type:"POST",
			    		url:"${ctx}/getShopComment/data.html",
			    		data:{
			    			shopId:detailShopId
			    		},
			    		dataType:"json",
			    		error:function(){
			    			layer.msg("请求网络失败,请重试！",{icon:7});
			    		},
			    		success:function(data){
			    			var o = eval(data);
			    			
			    			var vag = (parseFloat(o[0].starSum)+parseFloat(o[0].startEnd)+parseFloat(o[0].startService)) / 3;
			    			var vagInt = Math.floor(vag);
			    			//var width = countSum(vagInt,vag);
			    			if(vag == 0)
			    				vag = 5;
			    			var width = (vag/5)*100;
			    			//alert(width);
			    			//$(".start").find("i").css("width",width);
			    			$("#ssb").css("width",width+"%");
			    			var span = Math.round(vag*10)/10;
			    			$("#span1").html(span);
			    			
			    			
			    			var vagInt1 = parseFloat(o[0].starSum);
			    			//var width1 = countSum(vagInt1,parseFloat(o[0].starSum));
			    			if(vagInt1 == 0)
			    				vagInt1 = 5;
			    			var width1 = Math.floor((vagInt1/5)*100);
			    			var span1 = Math.round(vagInt1*10)/10;
			    			$("#span2").html(span1);
			    			
			    			var vagInt2 = parseFloat(o[0].startEnd);
			    			//var width2 = countSum(vagInt2,parseFloat(o[0].startEnd));
			    			if(vagInt2 == 0)
			    				vagInt2 = 5;
			    			var width2 = Math.floor((vagInt2/5)*100);
			    			var span2 = Math.round(vagInt2*10)/10;
			    			$("#span3").html(span2);
			    			
			    			var vagInt3 = parseFloat(o[0].startService);
			    			//var width3 = countSum(vagInt3,parseFloat(o[0].startService));
			    			if(vagInt3 == 0)
			    				vagInt3 = 5;
			    			var width3 = Math.floor((vagInt3/5)*100);
			    			var span3 = Math.round(vagInt3*10)/10;
			    			$("#span4").html(span3);
			    			
			    			

			    			$("#ssb1").css("width",width1);
							$("#ssb2").css("width",width2);
							$("#ssb3").css("width",width3);
							
			    			
			    		}
			    	})
		}); --%>




function countSum(val1,val2){
	var width = val1 * 1.2 + val2 * 13;
	return width;
}
$(document).ready(function() { 
	var detailShopId = $("#detailShopId").val();
	$.ajax({
		type:"POST",
		url:"${ctx}/getShopComment/data.html",
		data:{
			shopId:detailShopId
		},
		dataType:"json",
		error:function(){
			layer.msg("请求网络失败,请重试！",{icon:7});
		},
		success:function(data){
			var o = eval(data);
			
			var vag = (parseFloat(o[0].starSum)+parseFloat(o[0].startEnd)+parseFloat(o[0].startService)) / 3;
			var vagInt = Math.floor(vag);
			var width = countSum(vagInt,vag);
			$("#ssb").css("width",width);
			var span = Math.round(vag*10)/10;
			$("#span1").html(span);
			
			
			var vagInt1 = Math.floor(parseFloat(o[0].starSum));
			var width1 = countSum(vagInt1,parseFloat(o[0].starSum));
			var span1 = Math.round(parseFloat(o[0].starSum)*10)/10;
			$("#span2").html(span1);
			
			var vagInt2 = Math.floor(parseFloat(o[0].startEnd));
			var width2 = countSum(vagInt2,parseFloat(o[0].startEnd));
			var span2 = Math.round(parseFloat(o[0].startEnd)*10)/10;
			$("#span3").html(span2);
			
			var vagInt3 = Math.floor(parseFloat(o[0].startService));
			var width3 = countSum(vagInt3,parseFloat(o[0].startService));
			var span3 = Math.round(parseFloat(o[0].startService)*10)/10;
			$("#span4").html(span3);
			
			
			

			$("#ssb1").css("width",width1);
			$("#ssb2").css("width",width2);
			$("#ssb3").css("width",width3);
			
		}
	})
}); 
	</script>
</html>