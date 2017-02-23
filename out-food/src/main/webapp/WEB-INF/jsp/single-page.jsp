<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Product-details</title>
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
						<a href="${ctx}"><img src="${ctx}/resources/images/logo.png" title="gaia" /></a>
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
					<li class="active"><a href="index.html">Home<span> </span></a></li>
					<li><a href="collections.html">Collections<span> </span></a></li>
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
		<!-- Product-Details-page -->
		<div class="details-page">
			<div class="content details-page">
			<!---start-product-details--->
			<div class="product-details">
				<div class="container">
					<ul class="product-head">
						<li><a href="index.html">Home</a> <span>::</span></li>
						<li class="active-page">Product Page</li>
						<div class="clearfix"> </div>
					</ul>
				<!----details-product-slider--->
				<!-- Include the Etalage files -->
					<link rel="stylesheet" href="${ctx}/resources/css/etalage.css">
					<script src="${ctx}/resources/js/jquery.etalage.min.js"></script>
				<!-- Include the Etalage files -->
				<script>
						jQuery(document).ready(function($){
			
							$('#etalage').etalage({
								thumb_image_width: 300,
								thumb_image_height: 400,
								source_image_width: 900,
								source_image_height: 1000,
								show_hint: true,
								click_callback: function(image_anchor, instance_id){
									alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
								}
							});
							// This is for the dropdown list example:
							$('.dropdownlist').change(function(){
								etalage_show( $(this).find('option:selected').attr('class') );
							});

					});
				</script>
				<!----//details-product-slider--->
				<div class="details-left">
					<div class="details-left-slider">
						<ul id="etalage" class="etalage" style="display: block; width: 314px; height: 552px;">
							<li class="etalage_thumb thumb_1" style="display: none; opacity: 0; background-image: none;">
								<a href="optionallink.html">
									<img class="etalage_thumb_image" src="${ctx}/resources/images/product-slide/image1_thumb.jpeg" style="display: inline; width: 300px; height: 400px; opacity: 1;">
									<img class="etalage_source_image" src="${ctx}/resources/images/product-slide/image1_large.jpeg">
								</a>
							</li>
							<li class="etalage_thumb thumb_2" style="display: none; opacity: 0; background-image: none;">
								<img class="etalage_thumb_image" src="${ctx}/resources/images/product-slide/image2_thumb.jpeg" style="display: inline; width: 300px; height: 400px; opacity: 1;">
								<img class="etalage_source_image" src="${ctx}/resources/images/product-slide/image2_large.jpeg">
							</li>
							<li class="etalage_thumb thumb_3 etalage_thumb_active" style="display: list-item; opacity: 1; background-image: none;">
								<img class="etalage_thumb_image" src="${ctx}/resources/images/product-slide/image3_thumb.jpeg" style="display: inline; width: 300px; height: 400px; opacity: 1;">
								<img class="etalage_source_image" src="${ctx}/resources/images/product-slide/image3_large.jpeg">
							</li>
							<li class="etalage_thumb thumb_4" style="display: none; opacity: 0; background-image: none;">
								<img class="etalage_thumb_image" src="${ctx}/resources/images/product-slide/image4_thumb.jpeg" style="display: inline; width: 300px; height: 400px; opacity: 1;">
								<img class="etalage_source_image" src="${ctx}/resources/images/product-slide/image4_large.jpeg">
							</li>
							<li class="etalage_thumb thumb_5" style="display: none; opacity: 0; background-image: none;">
								<img class="etalage_thumb_image" src="${ctx}/resources/images/product-slide/image5_thumb.jpeg" style="display: inline; width: 300px; height: 400px; opacity: 1;">
								<img class="etalage_source_image" src="${ctx}/resources/images/product-slide/image5_large.jpeg">
							</li>
							<li class="etalage_thumb thumb_6" style="display: none; opacity: 0; background-image: none;">
								<img class="etalage_thumb_image" src="${ctx}/resources/images/product-slide/image6_thumb.jpeg" style="display: inline; width: 300px; height: 400px; opacity: 1;">
								<img class="etalage_source_image" src="${ctx}/resources/images/product-slide/image6_large.jpeg">
							</li>
							<li class="etalage_thumb thumb_7" style="display: none; opacity: 0; background-image: none;">
								<img class="etalage_thumb_image" src="${ctx}/resources/images/product-slide/image1_thumb.jpeg" style="display: inline; width: 300px; height: 400px; opacity: 1;">
								<img class="etalage_source_image" src="${ctx}/resources/images/product-slide/image1_large.jpeg">
							</li>
						<li class="etalage_magnifier" style="margin: 0px; padding: 0px; left: 6px; top: 6px; display: none; opacity: 0.05449673905968666;"><div style="margin: 0px; padding: 0px; width: 195px; height: 215px;"><img src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image3_thumb.jpg" style="margin: 0px; padding: 0px; width: 300px; height: 400px; display: inline; left: 0px; top: 0px;"></div></li><li class="etalage_icon" style="display: list-item; top: 380px; left: 20px; opacity: 1;">��</li><li class="etalage_hint" style="display: none; margin: 0px; top: -15px; right: -15px;">��</li><li class="etalage_zoom_area" style="margin: 0px; opacity: 0; left: 324px; display: none; background-image: none;"><div class="etalage_description" style="width: 546px; bottom: 6px; left: 6px; opacity: 0.7; display: none;"></div><div style="width: 586px; height: 538px;"><img class="etalage_zoom_img" src="${ctx}/resources/images/product-slide/image3_large.jpg" style="width: 900px; height: 1000px; left: -157.34166420232418px; top: 0px;"></div></li><li class="etalage_small_thumbs" style="width: 314px; top: 424px;"><ul style="width: 1072px;"><li class="etalage_smallthumb_navtoend" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image7_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image1_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="etalage_smallthumb_first" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image2_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="etalage_smallthumb_active" style="opacity: 1; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image3_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="etalage_smallthumb_last" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image4_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image5_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image6_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image7_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li><li class="etalage_smallthumb_navtostart" style="opacity: 0.4; margin: 0px 10px 0px 0px; left: -216px;"><img class="etalage_small_thumb" src="http://192.168.2.7/chaitanya/spike_shoes/${ctx}/resources/images/product-slide/image1_thumb.jpg" width="90" style="width: 90px; height: 120px;"></li></ul></li></ul>
					</div>
					<div class="details-left-info">
						<div class="details-right-head">
						<h1>Product Name Goes Here</h1>
						<ul class="pro-rate">
							<li><a href="#">0 Review(s) Add Review</a></li>
						</ul>
						<p class="product-detail-info">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
						<a class="learn-more" href="#"><h3>MORE DETAILS</h3></a>
						<div class="product-more-details">
							<ul class="price-avl">
								<li class="price"><span>$153.39</span><label>$145.72</label></li>
								<li class="stock"><i>In stock</i></li>
								<div class="clearfix"> </div>
							</ul>
							<ul class="product-colors">
								<h3>available Colors ::</h3>
								<li><a class="color1" href="#"><span> </span></a></li>
								<li><a class="color2" href="#"><span> </span></a></li>
								<li><a class="color3" href="#"><span> </span></a></li>
								<li><a class="color4" href="#"><span> </span></a></li>
								<li><a class="color5" href="#"><span> </span></a></li>
								<li><a class="color6" href="#"><span> </span></a></li>
								<li><a class="color7" href="#"><span> </span></a></li>
								<li><a class="color8" href="#"><span> </span></a></li>
								<div class="clearfix"> </div>
							</ul>
							<ul class="prosuct-qty">
								<span>Quantity:</span>
								<select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
								</select>
							</ul>
							<input type="button" value="add to cart">
							<ul class="product-share">
								<h3>All so Share On</h3>
								<ul>
									<li><a class="share-face" href="#"><span> </span> </a></li>
									<li><a class="share-twitter" href="#"><span> </span> </a></li>
									<li><a class="share-google" href="#"><span> </span> </a></li>
									<li><a class="share-rss" href="#"><span> </span> </a></li>
									<div class="clearfix"> </div>
								</ul>
							</ul>
						</div>
					</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="details-right">
					
				</div>
				<div class="clearfix"> </div>
			</div>
			<!---//End-product-details--->
			</div>
		</div>
		</div>
		<!-- /Product-Details-page -->
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

