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
			<!-- /bottom-header -->
			<!-- bottom-header -->
			<div class="bottom-header">
				<div class="container">
					<div class="bottom-header-left">
						<p>食上最权威的 校园订餐平台 </p>
					</div>
					<div class="logo">
						<a href="${ctx }"><img src="${ctx}/resources/images/logo.png" title="gaia" /></a>
					</div>
					<div class="bottom-header-left">
					<ul>
						<li><a href="${ctx}">进入首页</a></li>
<%-- 							<li><a href="${ctx}/cart/toPersonShopCart.html">我的购物车</a></li> --%>
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
							<li><a href="${ctx}/order/getPersonOrderList.html">个人中心</a></li>
							</ul>
					</div>
				</div>
			</div>
			<!-- /bottom-header -->
		</div>
		<!-- header -->