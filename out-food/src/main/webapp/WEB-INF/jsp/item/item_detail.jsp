<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Product-details</title>
		<%@ include file="../common/init.jsp" %>
		<link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="${ctx}/resources/js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
		<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
   		 <meta name="viewport" content="width=device-width, initial-scale=1">
		 <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	</head>
	<body>
<%@ include file="../common/head.jsp" %>
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
						<li><a href="index.html">店铺名称:</a></li>
						<li class="active-page">${shop.shopName}</li>
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
									<img class="etalage_thumb_image" src="${server}${item.itemImg}" style="display: inline; width: 300px; height: 400px; opacity: 1;">
									<img class="etalage_source_image" src="${server}${item.itemImg}">
								</a>
							</li>
							<li class="etalage_thumb thumb_3 etalage_thumb_active" style="display: list-item; opacity: 1; background-image: none;">
								<img class="etalage_thumb_image" src="${server}${item.itemImg}" style="display: inline; width: 300px; height: 400px; opacity: 1;">
								<img class="etalage_source_image" src="${server}${item.itemImg}">
							</li>
					</div>
					<div class="details-left-info">
						<div class="details-right-head">
						<input type="hidden" id="itemId" value="${item.id}"/>
						<input type="hidden" id="shopId" value="${item.shopId}"/>
						<h1>${item.itemName}</h1>
						<p class="product-detail-info">商家描述： ${item.describe}</p>
						<div class="product-more-details">
							<ul class="price-avl">
								<li class="price"><label>￥ ${item.itemPrice }</label></li>
								<br></br>
								<li class="price"><label>日供量： ${item.dayStock }</label></li>
								<div class="clearfix"> </div>
								  <dl class="tb-amount tm-clear">
                                    <li class="price"><label>购买数量</label></li>
                                    <dd>
                                        <span class="tb-amount-widget mui-amount-wrap">
                                            <input id="buyCount" type="text" class="tb-text mui-amount-input item-count" value="1"
                                                   title="请输入购买量">
                                            <em id="J_EmStock" class="mui-amount-unit" style="display: inline;">
                                        </span>
                                    </dd>
                                </dl>
                                 
                                </dl>
							</ul>
							<input type="button" value="添加至购物车" onclick="addCartItem()">
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
		<script src="${ctx}/resources/js/item/item_detail.js"></script>
</body>
</html>

