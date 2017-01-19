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
				<a href="#">首页</a>&gt;<a href="#">卖家中心</a>&gt;<a href="#">未开票订单</a>
			</p>
			<div class="box-content">
				<div class="data-box">
					<table style="font-size: 12px;">
						<thead>
							<tr>
								<td width="5%">序号</td>
								<td width="15%">订单号</td>
								<td width="25%">收货信息</td>
								<td width="10%">金额</td>
								<td width="10%">支付方式</td>
								<td width="15%">下单时间</td>
								<td width="15%">操作</td>
							</tr>
						</thead>
						<tbody>  
							<c:forEach items="${page.records }" var="list" varStatus="start">
								<tr>
									<td class="">${start.count +num}</td>
									<td class="blue-text">
										<a href="${ctx }/order/getOrderDetail/${list.orderNum }.html?ud=${list.userId}" style="color: #0173BC;">${list.orderNum }</a>
									</td>
									<td class="text-left">
										<em>${list.userName }&nbsp; &nbsp; &nbsp; &nbsp;
										<c:choose> 
											<c:when test="${empty  list.province}">
												${list.province }${list.city }${list.area }${list.addressInfo }
											</c:when>

											<c:otherwise>
												【 ${list.province }${list.city }${list.area }${list.addressInfo }】
											</c:otherwise>
										</c:choose>
										</br>${list.phone }</em>
									</td>
									<td class="red-text">￥${list.money }</td>
									<td>${list.name }</td>
									<td><fmt:formatDate value="${list.addTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td class="operation">
										<c:choose>
											<c:when test="${list.status == 0 }">
												<a href="#" id="${list.orderNum }" class="agree layui-btn layui-btn-small button-red">开具发票</a>
											</c:when>
											<c:otherwise>
												<a class="layui-btn layui-btn-small button-green">已开票</a>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>                                                     
						</tbody>
					</table>
					<!-- <div class="page-box clear-float">
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
					</div> -->
					${page.pageBar }
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->


	<div class="pop" style="display: none;">
		<div class="pop-box w600" style="top:5%">
			<h3 class="clear-float">开票信息<i class="colse sprite float-right"></i></h3>
			<div class="pop-data-list">
				<ul>
					<li><label>订单编号:</label><input type="text" value="" id="orderNum" name="orderNum" style="width: 150px;" readonly="readonly"/></li>
					<li><label>开&nbsp;&nbsp;户&nbsp;行:</label><input type="text" value="" id="bankName" name="bankName" style="width: 350px;" readonly="readonly"/>
						<span class="radio-input"><input type="hidden" value="" id="gs" class="select"/></span>
					</li>
					<li><label>银行账号:</label><input type="text" value="" id="bankNum" name="bankNum" style="width: 150px;" readonly="readonly"/></li>
					<li><label>公司名称:</label><input type="text" value="" id="companyName" name="companyName" style="width: 350px;" readonly="readonly"/></li>
					<li><label>税&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label><input type="text" value="" id="taxNum" name="taxNum" style="width: 150px;" readonly="readonly"/></li>
					<li><label>公司地址:</label><input type="text" value="" id="companyAddress" name="companyAddress" style="width: 350px;" readonly="readonly"/></li>
					<li><label>电话号码:</label><input type="text" value="" id="contactCell" name="contactCell" style="width: 150px;" readonly="readonly"/></li>
					<li>
						<label>收货地址:</label>
						<input type="text" value="" readonly="readonly"  id="addressInfo" name="addressInfo" style="width: 450px;"/>
					</li>
					<li><label>物流公司:</label>
						<select id="expressName" name="expressName">
							<option value="yuantong">圆通</option>
							<option value="ems">EMS</option>
							<option value="shentong">申通</option>
							<option value="zhongtong">中通</option>
							<option value="tiantian">天天</option>
							<option value="yunda">韵达</option>
							<option value="shunfeng">顺丰</option>
							<option value="zhaijisong">宅急送</option>
							<option value="debangwuliu">德邦物流</option>
							<option value="youzhengguonei">邮政包裹</option>
						</select>
					</li>
					<li>
						<label>物流单号:</label>
						<input type="text" value="" id="expressNum" name="expressNum" style="width: 450px;"/>
					</li>
				</ul>
				<button class="blockBtn layui-btn layui-btn-small button-red button-xlarge">确认开票</button>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
//开票获取订单信息
$('body').on('click','.agree',function(){
	var orderNum = this.id;
	$.ajax({
		type:"POST",
		url:"${ctx}/getInvoiceById.html",
		data:"orderNum="+orderNum, 
		dataType:"json",
		error:function(){
			layer.msg('请求网络失败，请重试！', {icon: 7});
		},
		success:function(data){
			console.log(data);
			$("#orderNum").val(data.orderNum);
			$("#bankName").val(data.bankName);
			$("#bankNum").val(data.bankNum);
			$("#companyName").val(data.title);
			$("#taxNum").val(data.taxNum);
			$("#companyAddress").val(data.companyAddress);
			$("#contactCell").val(data.contactCell);
			var address = data.province+data.city+data.area+data.addressInfo;
			$("#addressInfo").val(address);
			if(data.type == 1 ){
				$("#gs").removeClass("selected");
				$("#ge").addClass("selected");
				$("#gs").addClass("select");
				$("#title").val("个人");
			}else{
				$("#ge").removeClass("selected");
				$("#ge").addClass("select");
				$("#gs").addClass("selected");
			}
		}
	});
	$(".pop").show();
});

$('body').on('click','.colse',function(){
	$(".pop").hide();
});
//点击开票按钮进行开票
$('body').on('click','.blockBtn',function(){
	var orderNum = $("#orderNum").val();
	var expressName = $("#expressName").val();
	var expressNum = $("#expressNum").val();
	$.ajax({
		type:"POST",
		url:"${ctx}/addInvoiceDetailInfo.html",
		data:"orderNum="+orderNum+"&expressName="+expressName+"&expressNum="+expressNum, 
		dataType:"json",
		error:function(){
			layer.msg('请求网络失败，请重试！', {icon: 7});
		},
		success:function(data){
			if(data == 1){
				layer.msg('开票成功！', {icon: 1});
				return true; 
			}else{
				layer.msg('开票失败，请重试！', {icon: 2});
				return false; 
			}
		}
	});
	$(".pop").hide();
});
</script>
</html>