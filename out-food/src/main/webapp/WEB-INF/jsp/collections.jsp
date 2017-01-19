<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>collections</title>
		<%@ include file="common/init.jsp" %>
		<link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="${ctx}/resources/js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
		<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
   		 <meta name="viewport" content="width=device-width, initial-scale=1">
		 <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
   		 <!-- webfonts -->
   		 <link href='http://fonts.useso.com/css?family=Glegoo:400,700' rel='stylesheet' type='text/css'>
   		 <link href='http://fonts.useso.com/css?family=Rochester' rel='stylesheet' type='text/css'>
   		 <link href='http://fonts.useso.com/css?family=Lora:400,700' rel='stylesheet' type='text/css'>
   		  <!-- webfonts -->
	</head>
	<body>
		<!-- container -->
		<!-- header -->
		<div class="header">
			<!-- top-header -->
			<div class="top-header">
				<div class="container">
					<div class="rigister-info">
						<ul>
							<li><a href="#">Login</a></li>
							<li><a href="#">SignUp</a></li>
							<div class="clearfix"> </div>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<!-- /top-header -->
			<!-- bottom-header -->
			<div class="bottom-header">
				<div class="container">
					<div class="bottom-header-left">
						<p>The Finest Genuine Leather meet with Ingenious  Craftsmen Shoes </p>
					</div>
					<div class="logo">
						<a href="index.html"><img src="images/logo.png" title="gaia" /></a>
					</div>
					<div class="bottom-header-right">
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Wishlist</a></li>
							<li><a href="#">Checkout</a></li>
						</ul>
						<div class="search-cart">
							<div class="search-box">
								<form>
									<input type="text" value="Search..." />
									<input type="submit" value="" />
								</form>
							</div>
							<div class="cart-box">
								<select>
									<option> 02 Items</option>
									<option> 03 Items</option>
									<option> 04 Items</option>
								</select>
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
				</div>
			</div>
			<!-- /bottom-header -->
		</div>
		<!-- header -->
		<!--- top-nav -->
		<div class="top-nav">
			<div class="container">
				<span class="menu"> </span>
				<ul>
					<li><a href="index.html">Home<span> </span></a></li>
					<li class="active"><a href="collections.html">Collections<span> </span></a></li>
					<li><a href="404.html">New Arrivals<span> </span></a></li>
					<li><a href="404.html">Sale<span> </span></a></li>
					<li><a href="404.html">Accessories<span> </span></a></li>
					<li><a href="about.html">About Us<span> </span></a></li>
					<li><a href="contact.html">Contact Us<span> </span></a></li>
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
		<!-- bottom-grids -->
		<div class="bottom-grids collections">
			<div class="container">
				<h1>Our Collections</h1>
				<div class="col-md-9 bottom-grids-left">
					<div class="f-products">
						<h2>Featured Products</h2>
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
					                <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p1.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$129</span>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p2.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$89</span>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p3.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$149</span>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p1.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$129</span>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p3.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$129</span>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
				              </div>
						<!--//sreen-gallery-cursual---->
							
					</div>
				</div>
				<div class="d-products f-products">
						<h2>Discounts</h2>
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
					                <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="${ctx}/resources/images/p4.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$129</span>
														<label> </label>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p5.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$86</span>
														<label> </label>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p6.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$149</span>
														<label> </label>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p1.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$129</span>
														<label> </label>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
					                 <div class="item">
					                	<div onclick="location.href='single-page.html';" class="product-grid">
											<div class="product-pic">
												<img src="images/p4.jpg" title="Elliot Boots" />
											</div>
											<div class="product-pic-info">
												<h3><a href="#">Elliot Boots</a></h3>
												<div class="product-pic-info-price-cart">
													<div class="product-pic-info-price">
														<span>$129</span>
														<label> </label>
													</div>
													<div class="product-pic-info-cart">
														<a class="p-btn" href="#">Buy now</a>
													</div>
													<div class="clearfix"> </div>
												</div>
											</div>
										</div>
					                </div>
				              </div>
						<!--//sreen-gallery-cursual---->
							
					</div>
				</div>
				</div>
				<div class="col-md-3 bottom-grids-right">
					<h2>Exclusive Offers</h2>
					<p>Sign Up for Our Newsletter and get the exclusive offers directly into your inbox.</p>
					<form>
						<input type="text" class="text" value="Type your email address ..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type your email address ...';}">
						<input type="submit" value="" />
					</form>
					<div class="shhiping text-center">
						<h2>Free Shipping</h2>
						<a onclick="location.href='single-page.html';"  href="#"><img src="images/offer-pic.png" title="$250" /></a>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<!-- bottom-grids -->
		<!-- footer -->
		<div class="footer">
			<div class="container">
				<div class="footer-grids">
					<div class="col-md-3 footer-grid">
						<h3>Information</h3>
						<ul>
							<li><a href="about.html">About Us</a></li>
							<li><a href="#">Return</a></li>
							<li><a href="#">Delivery Information</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Terms & Conditions</a></li>
						</ul>
					</div>
					<div class="col-md-3 footer-grid">
						<h3>Extras</h3>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="collections.html">Collections</a></li>
							<li><a href="404.html">New Arrivals</a></li>
							<li><a href="404.html">Sale</a></li>
							<li><a href="404.html">Accessories</a></li>
							<li><a href="about.html">About Us</a></li>
							<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-md-3 footer-grid testmonial">
						<h3>Testimonials</h3>
						<div class="testmonial-grid">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.</p>
							<a href="#">John Smith,<span>Occupation</span></a>
						</div>
						<div class="clearfix"> </div>
						<div class="testmonial-grid">
							<p>In reprehenderit in voluptate velit esse cillum.</p>
							<a href="#">John Smith,<span>Occupation</span></a>
						</div>
					</div>
					<div class="col-md-3 footer-grid about-grid">
						<h3>About Us</h3>
						<p>Aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<!-- social-icons -->
				<div class="social-icons text-center">
					<ul>
						<li><a href="#"><span class="facebook"> </span></a></li>
						<li><a href="#"><span class="twitter"> </span></a></li>
						<li><a href="#"><span class="gpluse"> </span></a></li>
						<li><a href="#"><span class="pin"> </span></a></li>
						<li><a href="#"><span class="ens"> </span></a></li>
						<li><a href="#"><span class="you"> </span></a></li>
					</ul>
				</div>
				<!-- social-icons -->
				<!-- footer-bottom -->
				<div class="footer-bottom">
					<div class="footer-bottom-left">
						<p>Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
					</div>
					<div class="footer-bottom-right">
						<ul>
							<li><span class="visa"> </span></li>
							<li><span class="master"> </span></li>
							<li><span class="paypla"> </span></li>
							<li><span class="ami"> </span></li>
						</ul>
					</div>
					<div class="clearfix"> </div>
					<!-- footer-bottom -->
				</div>
			</div>
		</div>
		<!-- footer -->
		<!-- container -->
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

