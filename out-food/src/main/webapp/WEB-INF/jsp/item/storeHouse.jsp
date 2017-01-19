<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
<link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="${ctx}/resources/js/jquery.min.js"></script>
<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
	<script src="${ctx}/resources/js/main.js"></script>
	<script src="${ctx}/resources/home/js/nav.js"></script><!-- DD版 -->
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head1.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp"%>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx }/item/toAdd.html">商品管理</a>&gt;<a href="${ctx }/item/get/1.html">仓库中的商品</a>
			</p>
			<div class="box-content">
				<form id="searchForm" action="${ctx}/item/get/${type}.html" method="post">
					<div class="count-input yellowBg">
						<span>
							<label>商品名称:</label>
							<input id="name" name="itemName" type="text" style="width:200px; height:30px;" value="${itemName}" />
						</span>
						<span>
							<button class="serchBtn" onclick="search()">搜 索</button>
						</span>
					</div>
				</form>
				<div class="data-box">
					<p class="work-off">共有 ${count}个 仓库中的商品</p>
					<table>
						<thead>
							<tr>
								<td width="25%">商品名称</td>
								<td width="10%">价格</td>
								<td width="10%">更新时间</td>
								<td width="10%">创建时间</td>
								<td width="25%">操作</td>
							</tr>
							<!-- 
							<tr>
								<th class="text-left" colspan="7">
									<span>
										<input type="checkbox">全选
									</span>
									<button>删除</button>
									<button>上架</button>
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
											<em>${item.itemName}</em>
										</a>
									</td>
									<td>${item.itemPrice}元</td>
									<td><fmt:formatDate value="${item.updateTime}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${item.creatTime}" pattern="yyyy-MM-dd"/></td>
									<td class="operation">
										<a href="${ctx}/item/toUpdate/${item.id}.html" class="layui-btn  layui-btn-small button-orange">编辑商品</a>
										<a href="javascript:update(${item.id})" class="layui-btn  layui-btn-small button-red">上 架</a>
									</td>
								</tr>
							</c:forEach>                                                  
						</tbody>
					</table>
					<div class="page-box clear-float">
						${page.pageBar }
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->

<script type="text/javascript">
function search(){
	var name = $.trim($("#name").val());
	if(name == ""){
		layer.msg('请输入要搜索的商品名称！', {icon: 3,time: 2000}, function(index){
          $("#name").focus(); 
        });
	}else{
		$("#searchForm").submit();
	}
}
function update(id){
	$.ajax({
		type:"POST",
		url:"${ctx}/item/updateItemStatus.html",
		data:{id : id,status : 2},
		dataType:"json",
		error:function(){
			layer.msg('请求网络失败，请重试!', {icon: 7});
		},
		success:function(data){
			if(data.data == "101"){
				layer.msg('已申请上架！', {icon: 1,time: 2000}, function(index){
                 window.location.href = "${ctx}/item/get/1.html";
                });
			}else if(data.data == "205"){
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
</script>
</body>
</html>