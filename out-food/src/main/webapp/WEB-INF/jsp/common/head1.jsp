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
		</div>
		<!-- header -->