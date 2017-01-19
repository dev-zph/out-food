<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
	<script src="${ctx}/resources/js/main.js"></script>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp"%>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx }/item/toAdd.html">商品管理</a>&gt;<a href="${ctx }/item/get/4.html">违规下架</a>
			</p>
			<div class="box-content">
				<form id="searchForm" action="${ctx}/item/get/${type}.html" method="post">
				<div class="count-input yellowBg">
					<span>
						<label>商品名称:</label>
						<input id="name" name="name" type="text" value="${name}" />
					</span>
					<!-- 
					<span>
						<label>商品价格:</label>
						<input type="text" value="" />至
						<input type="text" value="" />
					</span>
					 -->
					<span>
						<button class="serchBtn" onclick="search()">搜 索</button>
					</span>
				</div>
			</form>
				<div class="data-box">
					<p class="work-off">共有 ${count}个 违规下家的商品</p>
					<table>
						<thead>
							<tr>
								<td width="35%">商品名称</td>
								<td width="15%">价格</td>
								<td width="15%">规格</td>
								<td width="10%">更新时间</td>
								<td width="10%">创建时间</td>
								<td width="10%">操作</td>
							</tr>
							<!-- 
							<tr>
								<th class="text-left" colspan="7">
									<span>
										<input type="checkbox">全选
									</span>
									<button>删除</button>
								</th>
							</tr>
							 -->
						</thead>
						<tbody>  
							<c:forEach items="${page.records}" var="item">
								<tr>
									<!--<td class="vtop"><input type="checkbox" class="data-box-input-mid"></td>-->
									<td>
										<a href="${ctx}/item/getItemById.html?itemId=${item.id}" target="_blank">
											<%-- <img src="${item.imgsCover}" class="pro-img"/> --%>
											<em>${item.name}</em>
										</a>
									</td>
									<td class="red-text">${item.price}元</td>
									<td>
										${item.version }
									</td>
									<td><fmt:formatDate value="${item.updateTime }" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${item.addTime }" pattern="yyyy-MM-dd"/></td>
									<td class="operation">
										<a href="javascript:update(${item.id})" class="pure-button button-red">放入仓库修改</a>
									</td>
								</tr>
							</c:forEach>                                                       
						</tbody>
					</table>
					<div class="page-box clear-float">
						${page.pageBar }
						<!-- 
						<p class="page-list float-right">        
							<a class="previous" href="#">上一页</a>
							<a class="index" href="#">1</a>
							<a class="index" href="#">2</a>
							<a class="index" href="#">3</a>
							<a class="index" href="#">4</a>
							<span>……</span>
							<a class="index" href="#">100</a>
							<a class="index" href="#">下一页</a>
							<span>到第</span>
							<input type="text">
							<span>页</span>
							<button>确定</button>
						</p>
						 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->

<script type="text/javascript">
function update(id){
	$.ajax({
		type:"POST",
		url:"${ctx}/item/update.html",
		data:{id : id,status : 1},
		dataType:"json",
		error:function(){
			layer.msg('请求网络失败，请重试!', {icon: 7});
		},
		success:function(data){
			if(data == "101"){
				layer.msg('操作成功！', {icon: 1,time: 2000}, function(index){
                window.location.href = "${ctx}/item/get/4.html";
                });
			}else if(data == "205"){
				layer.msg('登录过期，需重新登录！', {icon: 2,time: 2000}, function(index){
                 window.location.href = "${ctx}/toLogin.html";
                });
			}else{
				layer.msg('取消失败，请重试!', {icon: 2});
				return false;
			}
			
		}
	});
}
function search(){
	var name = $.trim($("#name").val());
	if(name == ""){
		layer.msg('请输入要搜索的商品名称！', {icon: 3,time: 2000}, function(index){
          $("#name").focus(); })
	}else{
		$("#searchForm").submit();
	}
}
</script>
</body>
</html>