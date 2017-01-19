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
	<%@ include file="../common/head_seller.jsp" %>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx }/shopClassify/toList.html">店铺管理</a>&gt;<a href="${ctx }/shopClassify/toList.html">商品分类</a>
			</p>
			<div class="box-content">
				<div class="data-box">
					<p class="work-off">共有 ${count}个 商品分类
<!-- 					<a style="margin-left:726px; cursor: pointer;" class="orange" onclick="javascript:add()">&nbsp;&nbsp;添加&nbsp;&nbsp;</a></p>
 -->					<table>
						<thead>
							<tr>
								<td width="15%">排序</td>
								<td width="40%">商品分类名称</td>
								<td width="10%">排序</td>
								<td width="20%">创建时间</td>
								<td width="15%">操作</td>
							</tr>
						</thead>
						<tbody>   
							<tr>
								<td>0</td>
								<td>
									<em><input id="name" type="text" style="position:inherit" /></em>
								</td>
								<td class="red-text"><input id="sort" type="text" style="width: 30px"/></td>
								<td>正在添加新分类</td>
								<td class="operation">
									<a href="javascript:add()" class="layui-btn layui-btn-small  button-orange">添加新分类</a>
								</td>
							</tr>
							<c:forEach items="${page.records}" var="classify" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td >
										<em><input id="name${classify.id}" type="text" readonly="readonly" value="${classify.name}"/></em>
									</td>
									<td class="red-text"><input id="sort${classify.id}" type="text" readonly="readonly" value="${classify.sort}" style="width: 30px"/></td>
									<td>
										<fmt:formatDate value="${classify.addTime }" pattern="yyyy年MM月dd日 HH:mm:ss"/>
									</td>
									<td class="operation">
										<span id="del${classify.id}">
											<a href="javascript:toUpdate(${classify.id})" class="layui-btn layui-btn-small button-red">编辑</a>
											<a href="javascript:del(${classify.id})" class="layui-btn layui-btn-small layui-btn-primary">删除</a>
										</span>
										<span id="cancel${classify.id}" style="display: none">
											
											<a href="javascript:celUpdate(${classify.id})" class="layui-btn layui-btn-small layui-btn-primary">取消</a>
											<a href="javascript:update(${classify.id})" class="layui-btn layui-btn-small button-red">保存</a>
										</span>
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
function add(){
	var name = $.trim($("#name").val());
	var sort = $.trim($("#sort").val());
	if(name == ''){
		layer.msg('请填写分类名称！',{icon:3,time:2000}, function(){});
		$("#name").focus();
		return false;
	}
	if(sort == ''){
		layer.msg('请填写分类排序！',{icon:3,time:2000}, function(){});
		$("#sort").focus();
		return false;
	}
	$.ajax({
		type:"POST",
		url:"${ctx}/shopClassify/add.html",
		data:{name : name,sort : sort},
		dataType:"json",
		error:function(){
			layer.msg('请求网络失败，请重试！', {icon:7,time:2000},function(){});

		},
		success:function(data){
			if(data == "101"){
				layer.msg('添加成功！',{icon: 1,time: 2000}, function(index){
                    window.location.href = "${ctx}/shopClassify/toList.html";
                    });
			}else{
				layer.msg('添加失败，请重试！',{icon:2,time:2000}, function(){});
				return false;
			}
		}
	});
}
function toUpdate(id){
	$("#name"+id).attr("readonly",false);
	$("#sort"+id).attr("readonly",false);
	$("#name"+id).focus();
	$("#del"+id).hide();
	$("#cancel"+id).show();
}
function celUpdate(id){
	$("#name"+id).attr("readonly",true);
	$("#sort"+id).attr("readonly",true);
	$("#name"+id).focus();
	$("#del"+id).show();
	$("#cancel"+id).hide();
}
function update(id){
	var name = $("#name"+id).val();
	var sort = $("#sort"+id).val();
	$.ajax({
		type:"POST",
		url:"${ctx}/shopClassify/update.html",
		data:{id : id,name : name,sort : sort},
		dataType:"json",
		error:function(){
			layer.msg('请求网络失败，请重试！',{icon:7,time:2000}, function(){});
		},
		success:function(data){
			if(data == "101"){
				layer.msg('更新成功！', {icon: 1,time: 2000}, function(index){
		                        window.location.href = "${ctx}/shopClassify/toList.html";
		                        });

			}else{
				layer.msg('请求失败，请重试！',{icon:2,time:2000}, function(){});

				return false;
			}
			
		}
	});
}
// function del(id){
// 	if(confirm("是否确定要删除？")){
// 		$.ajax({
// 			type:"POST",
// 			url:"${ctx}/shopClassify/del.html",
// 			data:{id : id},
// 			dataType:"json",
// 			error:function(){
// 				layer.msg("请求网络失败，请重试！",{icon:7});
// 			},
// 			success:function(data){
// 				if(data == "101"){
// 					layer.msg("删除成功.",{icon:1});
// 					window.location.href = "${ctx}/shopClassify/toList.html";
// 				}else{
// 					layer.msg("删除失败，请重试.",{icon:2});
// 					return false;
// 				}
				
// 			}
// 		});
// 	}
// }

function del(id){
	layer.confirm('是否确定要删除？', {
		  btn: ['确定','取消'] //按钮
			}, function(){
				$.ajax({
					type:"POST",
					url:"${ctx}/shopClassify/del.html",
					data:{id : id},
					dataType:"json",
					error:function(){
						layer.msg('请求网络失败，请重试!', {icon: 7});

					},
					success:function(data){
						if(data == "101"){
							
							layer.msg('删除成功！', {icon: 1,time: 2000}, function(index){
		                        window.location.href = "${ctx}/shopClassify/toList.html";
		                        });

						}else{
							layer.msg('删除失败，请重试!', {icon: 2});
							return false;
						}
						
					}
				});


			}, function(){
	});
}


</script>
</body>
</html>