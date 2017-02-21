<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Home</title>
		<%@ include file="common/init.jsp" %>
		<link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="${ctx}/resources/js/jquery.min.js"></script>
		<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
   		 <meta name="viewport" content="width=device-width, initial-scale=1">
		 <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	</head>
	<body>
<%@ include file="common/head.jsp" %>
		<div class="top-nav">
			<div class="container">
				<span class="menu"> </span>
				<ul>
					<li class="active"><a href="index.html">热榜<span> </span></a></li>
					<div class="clearfix"> </div>
				</ul>
			</div>
		</div>
		<!--- top-nav -->
		<!-- script-for-nav -->
		<script>
			$(document).ready(function(){
				$("span.menu").click(function(){
					$(".top-nav ul").slideToggle(500);
				});
			});
		</script>
			
		<!-- /script-for-nav -->
		<!-- banner -->
		<div class="banner">
			<div class="container">
				<!--- img-slider --->
				<div class="img-slider">
						<!----start-slider-script---->
					<script src="${ctx}/resources/js/responsiveslides.min.js"></script>
					 <script>
					    // You can also use "$(window).load(function() {"
					    $(function () {
					      // Slideshow 4
					      $("#slider4").responsiveSlides({
					        auto: true,
					        pager: true,
					        nav: true,
					        speed: 500,
					        namespace: "callbacks",
					        before: function () {
					          $('.events').append("<li>before event fired.</li>");
					        },
					        after: function () {
					          $('.events').append("<li>after event fired.</li>");
					        }
					      });
					
					    });
					  </script>
					<!----//End-slider-script---->
					<!-- Slideshow 4 -->
					    <div  id="top" class="callbacks_container">
					      <ul class="rslides" id="slider4">
					        <li>
					          <img class="img-responsive" src="${ctx}/resources/images/slide1.jpg" alt="">
					          <div class="slider-caption">
					          	<h1>Beautiful & durable</h1>
					          	<p>Classically simple and beautifully elegant Hard wearing leather shoes and hand-made with heart </p>
					          </div>
					        </li>
					        <li>
					          <img src="${ctx}/resources/images/slide1.jpg" alt="">
					           <div class="slider-caption">
					          	<h1>Beautiful & durable</h1>
					          		<p>Classically simple and beautifully elegant Hard wearing leather shoes and hand-made with heart </p>
					          </div>
					        </li>
					        <li>
					          <img src="${ctx}/resources/images/slide1.jpg" alt="">
					           <div class="slider-caption">
					           	<h1>Beautiful & durable</h1>
					           	<p>Classically simple and beautifully elegant Hard wearing leather shoes and hand-made with heart </p>
					          </div>
					        </li>
					      </ul>
					    </div>
					    <div class="clearfix"> </div>
					</div>
						<!-- slider -->
			</div>
		</div>
		<!-- banner -->
		<!-- top-grids -->
		<div class="d-products f-products">
						<h2>好评榜</h2>
			<div class="container">
				<c:forEach items="${goodestShopList}" var="gshop" varStatus="status">
				<div class="col-md-4 top-grid text-center">
					<div class="top-grid-pic">
						<img src="${server}${gshop.shopLogUrl}" width="380" height="336" title="Boots" />
						<span>${gshop.shopName}</span>
					</div>
					<div class="top-grid-pic-info">
						<a  onclick="toShop(${gshop.id})">进入店铺</a>
					</div>
				</div>
				</c:forEach>
				<div class="clearfix"> </div>
			</div>
		</div>
		<!-- top-grids -->
		<!-- bottom-grids -->
		<div class="bottom-grids">
			<div class="container">
				<div class="col-md-9 bottom-grids-left">
					<div class="f-products">
						<h2>新开店铺</h2>
							<!----sreen-gallery-cursual---->
						<div class="sreen-gallery-cursual">
							 <!-- requried-jsfiles-for owl -->
							<link href="${ctx}/resources/css/owl.carousel.css" rel="stylesheet">
							    <script src="${ctx}/resources/js/owl.carousel.js"></script>
							        <script>
									    $(document).ready(function() {
									      $("#owl-demo").owlCarousel({
									        items : 3,
									        lazyLoad : true,
									        autoPlay : true,
									        navigation : true,
									        navigationText :  false,
									        pagination : false,
									      });
									    });
									   </script>
							 <!-- //requried-jsfiles-for owl -->
							 <!-- start content_slider -->
						       <div id="owl-demo" class="owl-carousel text-center">
						       <c:forEach items="${leastShopList}" var="lshop" varStatus="status">
					                <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="${server}${lshop.shopLogUrl}" width="224" height="200" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a onlick="toShop(${lshop.id})">${lshop.shopName}</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
<!-- 														<span>$1</span> -->
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" onclick="toShop(${lshop.id})">进入店铺</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 </c:forEach>
				              </div>
						<!--//sreen-gallery-cursual---->
							
					</div>
				</div>
				<div class="d-products f-products">
						<h2>销量排名</h2>
							<!----sreen-gallery-cursual---->
						<div class="sreen-gallery-cursual">
							 <!-- requried-jsfiles-for owl -->
							<link href="${ctx}/resources/css/owl.carousel.css" rel="stylesheet">
							    <script src="${ctx}/resources/js/owl.carousel.js"></script>
							        <script>
									    $(document).ready(function() {
									      $("#owl-demo1").owlCarousel({
									        items : 3,
									        lazyLoad : true,
									        autoPlay : true,
									        navigation : true,
									        navigationText :  false,
									        pagination : false,
									      });
									    });
									   </script>
							 <!-- //requried-jsfiles-for owl -->
							 <!-- start content_slider -->
						       <div id="owl-demo1" class="owl-carousel text-center">
						       <c:forEach items="${mastShopList}" var="mshop" varStatus="status">
					                <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="${server}${mshop.shopLogUrl}" width="224" height="200" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a onlick="toShop(${mshop.id})">${mshop.shopName}</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>总销量： ${mshop.orderCount}</span>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" onclick="toShop(${mshop.id})">进入店铺</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 </c:forEach>
				              </div>
						<!--//sreen-gallery-cursual---->
							
					</div>
				</div>
				</div>
				<div class="col-md-3 bottom-grids-right">
					<h2>意见箱</h2>
					<p>投出你宝贵的意见，我们将会认真查阅，共同努力，更好的服务！.</p>
					<form>
						<input type="text" class="text" value="Type your email address ..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type your email address ...';}">
						<input type="submit" value="" />
					</form>
					<div class="shhiping text-center">
						<h2>平台总交易额</h2>
						<a href="#"><img src="${ctx}/resources/images/offer-pic.png" title="￥23421.12" /></a>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<!-- bottom-grids -->
		<!-- footer -->
		<!-- 底部信息 -->
<%@ include file="common/footer.jsp" %>
		<!-- footer -->
		<!-- container -->
	
</body>
<script type="text/javascript">
function toShop(shopId){
	window.open(ctx + "/shop/getItemList.html?shopId="+shopId);
}
</script>
</html>

