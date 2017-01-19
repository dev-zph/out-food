<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
	<script src="${ctx}/resources/js/main.js"></script>
	<link rel="stylesheet" href="${ctx}/resources/js/swfupload/default.css"/>
	<script type="text/javascript" src="${ctx}/resources/js/swfupload/swfupload.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/swfupload/swfupload.queue.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/swfupload/fileprogress.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/banner.upload.handlers_1.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/banner.upload.handlers_2.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/banner.upload.handlers_3.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/banner.upload.handlers_4.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/banner_add.js"></script>
	<style type="text/css">
	.data-box table tbody td.operation a{
		display: inline-block;
		margin: 5px auto;
		padding: 8px 20px;
	}
	</style>
</head>
<body ref="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp" %>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx }/shopClassify/toList.html">店铺管理</a>&gt;<a href="${ctx }/shopClassify/toList.html">店铺广告</a>
			</p>
			<div class="box-content">
				<div class="data-box">
					<table>
						<thead>
							<tr>
								<td colspan="2" width="65%">广告位图片</td>
								<td width="20%">上传新广告</td>
								<td width="15%">操作</td>
							</tr>
						</thead>
						<tbody>   
							<tr>
								<td>广告位1</td>
								<td>
									<span class="add-pro-img">
										<c:if test="${shop.banner1 eq null || shop.banner1 eq ''}">
											<img id="imgView1" alt="请上传广告" src="${ctx}/resources/images/addProImg1.jpg">
										</c:if>
										<c:if test="${shop.banner1 != null && shop.banner1 != ''}">
											<img id="imgView1" alt="预览" src="${shop.banner1}">
										</c:if>
									</span>
								</td>
								<td class="red-text">
									<button class="hidden" id="cancel1"></button>
									<div id="fsUploadProgress1" ></div>
									<input id="imgs1" type="hidden"  value=""/>
									<span>选择图片：<button id="chooseFile1" ></button></span>
									<br><br>
									<span style="color:#F26D4E">建议上传尺寸：1903*499px</span>
								</td>
								<td class="operation">
									<a href="javascript:update(${shop.id},1)" class="orange">保存</a>
									<br>
									<a href="javascript:del(${shop.id},1)">删除</a>
								</td>
							</tr>
							<tr>
								<td>广告位2</td>
								<td>
									<span class="add-pro-img">
										<c:if test="${shop.banner2 eq null || shop.banner2 eq ''}">
											<img id="imgView2" alt="请上传广告" src="${ctx}/resources/images/addProImg1.jpg">
										</c:if>
										<c:if test="${shop.banner2 != null && shop.banner2 != ''}">
											<img id="imgView2" alt="预览" src="${shop.banner2}">
										</c:if>
									</span>
								</td>
								<td class="red-text">
									<button class="hidden" id="cancel2"></button>
									<div id="fsUploadProgress2" ></div>
									<input id="imgs2" type="hidden"  value=""/>
									<span>选择图片：<button id="chooseFile2" ></button></span>
									<br><br>
									<span style="color:#F26D4E">建议上传尺寸：1903*499px</span>
								</td>
								<td class="operation">
									<a href="javascript:update(${shop.id},2)" class="orange">保存</a>
									<br>
									<a href="javascript:del(${shop.id},2)">删除</a>
								</td>
							</tr>
							<tr>
								<td>广告位3</td>
								<td>
									<span class="add-pro-img">
										<c:if test="${shop.banner3 eq null || shop.banner3 eq ''}">
											<img id="imgView3" alt="请上传广告" src="${ctx}/resources/images/addProImg1.jpg">
										</c:if>
										<c:if test="${shop.banner3 != null && shop.banner3 != ''}">
											<img id="imgView3" alt="预览" src="${shop.banner3}">
										</c:if>
									</span>
								</td>
								<td class="red-text">
									<button class="hidden" id="cancel3"></button>
									<div id="fsUploadProgress3" ></div>
									<input id="imgs3" type="hidden"  value=""/>
									<span>选择图片：<button id="chooseFile3" ></button></span>
									<br><br>
									<span style="color:#F26D4E">建议上传尺寸：1903*499px</span>
								</td>
								<td class="operation">
									<a href="javascript:update(${shop.id},3)" class="orange">保存</a>
									<br>
									<a href="javascript:del(${shop.id},3)">删除</a>
								</td>
							</tr>
							<tr>
								<td>广告位4</td>
								<td>
									<span class="add-pro-img">
										<c:if test="${shop.banner4 eq null || shop.banner1 eq ''}">
											<img id="imgView4" alt="请上传广告" src="${ctx}/resources/images/addProImg1.jpg">
										</c:if>
										<c:if test="${shop.banner4 != null && shop.banner1 != ''}">
											<img id="imgView4" alt="预览" src="${shop.banner4}">
										</c:if>
									</span>
								</td>
								<td class="red-text">
									<button class="hidden" id="cancel4"></button>
									<div id="fsUploadProgress4" ></div>
									<input id="imgs4" type="hidden"  value=""/>
									<span>选择图片：<button id="chooseFile4" ></button></span>
									<br><br>
									<span style="color:#F26D4E">建议上传尺寸：1903*499px</span>
								</td>
								<td class="operation">
									<a href="javascript:update(${shop.id},4)" class="orange">保存</a>
									<br>
									<a href="javascript:del(${shop.id},4)">删除</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->

</body>
</html>