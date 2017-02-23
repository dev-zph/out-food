<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>About</title>
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
						<a href="${ctx }"><img src="${ctx}/resources/images/logo.png" title="gaia" /></a>
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
					<li><a href="collections.html">Collections<span> </span></a></li>
					<li><a href="404.html">New Arrivals<span> </span></a></li>
					<li><a href="404.html">Sale<span> </span></a></li>
					<li><a href="404.html">Accessories<span> </span></a></li>
					<li class="active"><a href="about.html">About Us<span> </span></a></li>
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
		<!-- About -->
		<div class="about">
				<!----- header-section ---->
				<div class="header-section">
					<div class="container">
						<h1>About Us</h1>
					</div>
				</div>
				<!---- aboutgrids ----->
				<div class="about-grids">
					<div class="container">
						<div class="about-left-grids">
							<h2>This is main heading H2</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elit turpis, dictum nec auctor at, semper nec lectus. Aenean vitae cursus neque. Suspendisse at aliquet tortor. Donec eget laoreet lectus, ac sollicitudin diam. Nunc orci urna, sagittis vel semper in,</p>
							<h3>This is main heading H3</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elit turpis, dictum nec auctor at, semper nec lectus. Aenean vitae cursus neque. Suspendisse at aliquet tortor. Donec eget laoreet lectus, ac sollicitudin diam. Nunc orci urna, sagittis vel semper in,</p>
							<h4>This is main heading H4</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elit turpis, dictum nec auctor at, semper nec lectus. Aenean vitae cursus neque. Suspendisse at aliquet tortor. Donec eget laoreet lectus, ac sollicitudin diam. Nunc orci urna, sagittis vel semper in, vehicula ut metus. Proin sit amet enim at velit tincidunt luctus in eget nibh. Quisque tempor scelerisque convallis. Vivamus in accumsan dolor. Phasellus bibendum lorem a pretium molestie. Sed non tincidunt nibh.</p>
							<ul class="unorder-list">
								<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
								<li> Quisque elit turpis, dictum nec auctor at, semper nec lectus. Aenean vitae cursus neque. </li>
								<li> Suspendisse at aliquet tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
							</ul>
							<ol class="order-list">
								<li>1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
								<li>2. Quisque elit turpis, dictum nec auctor at, semper nec lectus. Aenean vitae cursus neque. </li>
								<li>3. Suspendisse at aliquet tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
							</ol>
							<p>n venenatis libero et risus viverra congue. Sed lacinia aliquet nisi ut tristique. <a href="#">Suspendisse</a> potenti. Fusce vulputate lectus ac nibh ullamcorper, at commodo nisi rhoncus. Curabitur sollicitudin purus sit amet lorem iaculis hendrerit. Phasellus purus justo, consectetur eu enim id, <a href="#">consectetur</a> lacinia ipsum. Fusce pharetra mi nunc, ac sollicitudin nibh varius vel. Mauris eu accumsan turpis, eu dictum augue. Quisque ante nisi, aliquam vitae condimentum ac, venenatis mollis elit. Duis faucibus orci justo, id <a href="#">feugiat ipsum </a>euismod id. Suspendisse non elementum ligula, vel volutpat elit.</p>
						</div>
						<div class="about-right-grids">
							<img src="${ctx}/resources/images/slide1.jpg" title="name">
							<!----- latest-news ----->
							<div class="latest-news">
								<h2>Latest-News</h2>
								<div class="latest-news-grids">
									<div class="latest-news-grid">
										<h3><a href="#">Lorem ipsum dolor sit amet, consectetur</a></h3>
										<span>01. 17 .14</span>
										<p> Quisque elit turpis, dictum nec auctor at, semper nec lectus. Aenean vitae cursus neque</p>
									</div>
									<div class="latest-news-grid">
										<h3><a href="#">Lorem ipsum dolor sit amet, consectetur</a></h3>
										<span>01. 17 .14</span>
										<p> Quisque elit turpis, dictum nec auctor at, semper nec lectus. Aenean vitae cursus neque</p>
									</div>
								</div>
							</div>
							<!----- latest-news ----->
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<!---- aboutgrids ----->
				<!----- header-section ---->
			</div>
		<!-- About -->
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

