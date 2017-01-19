<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="../resources/css/base.css"/>
	<link rel="stylesheet" href="../resources/css/jquery.fileupload.css"/>
	<link rel="stylesheet" href="../resources/js/jcrop/jquery.Jcrop.css"/>
	<link rel="stylesheet" href="../resources/css/shop.base.upload.css"/>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/js/pfa-base.js"></script>
	<script src="../resources/js/jquery.ui.widget.js"></script>
	<script src="../resources/js/jquery.iframe-transport.js"></script>
	<script src="../resources/js/jquery.fileupload.js"></script>
	<script src="../resources/js/jquery.fileupload-process.js"></script>
	<script src="../resources/js/jquery.fileupload-validate.js"></script>
	<script src="../resources/js/jcrop/jquery.Jcrop.js"></script>
	<script src="../resources/js/shop-base-upload.js"></script>
	<style type="text/css">
	#preview-pane-honorUrl .preview-container{
		width: 256px;
		height: 120px;
	}
	.user-info p{
		margin: 10px 0;
	}
	</style>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp" %>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<!--
		<div class="sidebar seller-center-sidebar float-left">
			<img src="../resources/images/imgRen.jpg" class="vip-headImg" />
			<h4 class="sidebar-title"><i class="on"></i>账号管理</h4>
			<ul>
				<li><a href="javascript:void(0);">基本信息</a></li>
				<li><a href="javascript:void(0);">联系信息</a></li>
				<li><a href="javascript:void(0);">银行信息</a></li>
			</ul>
		</div>
		-->
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx}/navigate_shop/info.html">账号管理</a>&gt;上传资料
			</p>
			<div class="box-content">
				<h4 class="nav-list">
					<a href="javascript:void(0);">基本资料</a>
					<a href="javascript:void(0);" class="on">上传资料</a>
				</h4>
				<div class="user-info">
					<div class="dd-user">
						<div class="user-info-tit float-left"><h4>店铺LOGO:</h4></div>
						<div class="upload-user-img float-left">
						    <!-- The fileinput-button span is used to style the file input field as button -->
						    <span class="fileinput-button">
							    <span><img id="logoUrlOriginal" src="../resources/images/adduserimg1.jpg" class="add-user-img-head" /></span>
							    <input class="shopUpload" id="logoUrl" type="file" multiple />							
						    </span>
						    <!-- The global file processing state -->
						    <span class="fileupload-process"></span>
						  	<div id="preview-pane-logoUrl">
						    	<div class="preview-container" style="width: 256px;height: 100px;">
						      		<img id="logoUrlPreview" src="../resources/images/user-img-smail.jpg" style="display: none;" class="jcrop-preview" />
						    	</div>
						  	</div>
						  	<p style="color:red">（建议图片像素：1190*120）</p>
						</div>
					</div>
					<!-- <h4>荣誉资质</h4> -->
					<div class="dd-user">
						<div class="user-info-tit float-left"><h4>底部广告条:</h4></div>
						<div class="upload-user-img float-left">
						    <!-- The fileinput-button span is used to style the file input field as button -->
						    <span class="fileinput-button">
							    <span><img id="honorUrlOriginal" src="../resources/images/adduserimg1.jpg" class="add-user-img-head" /></span>
							    <input class="shopUpload" id="honorUrl" type="file" multiple />
						    </span>
						    <!-- The global file processing state -->
						    <span class="fileupload-process"></span>
						  	<div id="preview-pane-honorUrl">
						    	<div class="preview-container"  style="width: 256px;height: 100px;">
						      		<img id="honorUrlPreview" src="../resources/images/user-img-smail.jpg" style="display: none;" class="jcrop-preview" />
						    	</div>
						  	</div>
						  	<p style="color:red">（建议图片高200px，宽度1190px）</p>
						</div>						
					</div>
					
					<div class="dd-user">
						<div class="user-info-tit float-left"><h4>二维码:</h4></div>
						<div class="upload-user-img float-left">
						    <!-- The fileinput-button span is used to style the file input field as button -->
						    <span class="fileinput-button">
							    <span><img id="qrCodeUrlOriginal" src="../resources/images/adduserimg2.jpg" class="add-user-img-head" style="width:100px; height:100px" /></span>
							    <input class="shopUpload" id="qrCodeUrl" type="file" multiple style="width:100px; height:100px;" />
						    </span>
						    <!-- The global file processing state -->
						    <span class="fileupload-process"></span>
						  	<div id="preview-pane-qrCodeUrl">
						    	<div class="preview-container"  style="width: 100px;height: 100px;">
						      		<img id="qrCodeUrlPreview" src="../resources/images/user-img-smail.jpg" style="display: none;" class="jcrop-preview" />
						    	</div>
						  	</div>
						  	<p style="color:red">（建议图片像素：200*200）</p>
						</div>						
					</div>
					<div class="dd-user">
						<div class="user-info-tit float-left"><h4>公司简介:</h4></div>
						<div class="upload-user-img float-left">
						    <!-- The fileinput-button span is used to style the file input field as button -->
						    <span class="fileinput-button">
							    <span><img id="aboutUrlOriginal" src="../resources/images/adduserimg1.jpg" class="add-user-img-head" /></span>
							    <input class="shopUpload" id="aboutUrl" type="file" multiple />
						    </span>
						    <!-- The global file processing state -->
						    <span class="fileupload-process"></span>
						  	<div id="preview-pane-aboutUrl">
						    	<div class="preview-container"  style="width: 256px;height: 100px;">
						      		<img id="aboutUrlPreview" src="../resources/images/user-img-smail.jpg" style="display: none;" class="jcrop-preview" />
						    	</div>
						  	</div>
						  	<p style="color:red">（建议图片宽度1190px,建议高度313px，可自行加长）</p>
						</div>						
					</div>
				</div>
				<button class="regBtn" style="display:block">保存</button>
				<br>
				<br>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->


</body>
</html>