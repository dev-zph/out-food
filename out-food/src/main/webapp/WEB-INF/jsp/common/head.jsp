<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    		<!-- header -->
		<div class="header">
			<!-- top-header -->
			<div class="top-header">
				<div class="container">
					<div class="rigister-info">
						<ul>
							<div class="welcome fl" style="font-size:20px;font-weight:600">
							       欢迎来平台订餐   
							<c:if test="${user ne null}">${user.nickName}<li><a href="${ctx}/toExit.html">安全退出</a></li></c:if>
				
							</div>
				<ul class="login fl login-menu">
				<c:if test="${user eq null}">
					<li>
						<div class="login-menu-hd">
							<a href="${ctx}/toLogin.html">请登录</a>
						</div>
					</li>
						<li>
								<div class="login-menu-hd">
									<a href="${ctx}/toReg.html">免费注册</a>
							</div>
						</li>
					</c:if>
				</ul>
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
						<p>食上最权威的 校园订餐平台 </p>
					</div>
					<div class="logo">
						<a href="index.html"><img src="${ctx}/resources/images/logo.png" title="gaia" /></a>
					</div>
					<div class="bottom-header-right">
						<ul>
							<li><a href="#">进入首页</a></li>
							<li><a href="#">我的订单</a></li>
							<li><a href="${ctx}/cart/toPersonShopCart.html">我的购物车</a></li>
							<li>
							<c:if test="${shop != null}">
								<div class="top-menu-hd">
									<a href="${ctx}/item/get/1.html" <c:if test='${user ne null}'></c:if>>商铺管理</a>
								</div>
							</c:if>
							<c:if test="${shop eq null}">
								<div class="top-menu-hd">
									<a href="${ctx}/navigate_apply/index.html" <c:if test='${user ne null}'></c:if>>我要开店</a>
								</div>
							</c:if>
							</li>
							<li><a href="#">个人中心</a></li>
						</ul>
						<div class="search-cart">
							<div class="search-box">
								<form>
									<input type="text" value="店铺搜索" />
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