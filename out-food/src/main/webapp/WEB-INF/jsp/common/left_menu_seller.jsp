<%@ page language="java" pageEncoding="UTF-8"%>
<div class="sidebar-seller seller-center-sidebar float-left">
	<h4 class="sidebar-title"><i class="off"></i>店铺管理</h4>
	<ul>
		<li><a href="${ctx}/navigate_apply/index.html">我要开店</a></li>
		<li><a href="${ctx}/shopClassify/toList.html">商品分类</a></li>
		 <!--<li><a href="${ctx}/shop/toBanner.html">店铺广告</a></li>-->
	</ul>

	<h4 class="sidebar-title"><i class="off"></i>商品管理</h4>
	<ul>
		<li><a href="${ctx}/item/toAdd.html">发布商品</a></li>
		<li><a href="${ctx}/item/get/3.html">销售中的商品</a></li>
		<li><a href="${ctx}/item/get/1.html">仓库中的商品</a></li>
		<li><a href="${ctx}/item/get/2.html">待审核</a></li>
		<li><a href="${ctx}/item/get/4.html">违规下架</a></li>
	</ul>
	<h4 class="sidebar-title"><i class="off"></i>订单管理</h4>
	<ul>
		<li <c:if test="${status eq 0}">class="active"</c:if>><a href="${ctx}/order/getShopOrderList.html">
			&nbsp;全部订单&nbsp;
		</a></li>
		<li  <c:if test="${status eq 2}">class="active"</c:if>><a href="${ctx}/order/getShopOrderList.html?status=0">
			&nbsp;待确认订单&nbsp;
		</a></li>
		<li  <c:if test="${status eq 3}">class="active"</c:if>><a href="${ctx}/order/getShopOrderList.html?status=1">
			&nbsp;已确认订单&nbsp;
		</a></li>
		<li  <c:if test="${status eq 4}">class="active"</c:if>><a href="${ctx}/order/getShopOrderList.html?status=2">
			&nbsp;骑士已接单&nbsp;
		</a></li>
		<li  <c:if test="${status eq 4}">class="active"</c:if>><a href="${ctx}/order/getShopOrderList.html?status=3">
			&nbsp;买家签收&nbsp;
		</a></li>
		<li  <c:if test="${status eq 5}">class="active"</c:if>><a href="${ctx}/order/getShopOrderList.html?status=4">
			&nbsp;买家已评价&nbsp;
		 </a></li> 
		 <li  <c:if test="${status eq 5}">class="active"</c:if>><a href="${ctx}/order/getShopOrderList.html?status=5">
			&nbsp;已取消订单&nbsp;
		 </a></li> 
		<li><a href="${ctx}/navigate_comment/seller.html">评价</a></li>
	</ul>
	<h4 class="sidebar-title"> <i class="off"></i>
		账期管理
	</h4>
	<ul>
		<li <c:if test="${index eq 7}">class="active"</c:if>
		>
		<a href="${ctx}/accountPeriod/businessList.html?index=7">账期订单</a>
		</li>
	</ul>
	<h4 class="sidebar-title"> <i class="off"></i>
		报表管理
	</h4>
	<ul>
		<li <c:if test="${index eq 11}">class="active"</c:if>>
		<a href="${ctx}/reportServer/orderReport.html?index=11" target="_blank">查看已导出报表</a>
		</li>
	</ul>
	<h4 class="sidebar-title"><i class="off"></i>咨询/售后</h4>
	<ul>
		<li><a href="${ctx}/getShopConsulting.html">咨询</a></li>
		<li><a href="${ctx}/navigate_aftersale/change.html">待处理换货</a></li>
		<li><a href="${ctx}/navigate_aftersale/return.html">待处理退货</a></li>
	</ul>
	<h4 class="sidebar-title"><i class="off"></i>开票管理</h4>
	<ul>
		<li><a href="${ctx }/getInvoiceInfo.html?status=0">未开票订单</a></li>
		<li><a href="${ctx }/getInvoiceInfo.html?status=1">已开票订单</a></li>
	</ul>

</div>
<input type="hidden" value="${hasShop}" class="hasShop"/>
<input type="hidden" value="${shopStatus}" class="shop-status"/>
<input type="hidden" value="${status}" class="left-menu"/>
<input type="hidden" value="${requestUrl}" class="requestUrl"/>
<script type="text/javascript">
	var url = window.location.href;
	var hasShop = $(".hasShop").val();
	var status = $(".shop-status").val();
	var requestUrl = $(".requestUrl").val();
	//开店成功之前的页面左菜单，除了"我要开店"正常，其他链接都被屏蔽
	if(requestUrl.indexOf("shop/applyIndex")>=0 ||//我要开店
			requestUrl.indexOf("shop/applyReadMe")>=0 ||//阅读协议
			requestUrl.indexOf("shop/applyInfo")>=0 ||//填写公司信息
			requestUrl.indexOf("shop/applyVerify")>=0//等待审核，支付保证金
			){//账号管理
	 	if(status != '3'){
	 		$(".seller-center-sidebar ul:eq(0) li:eq(0)").addClass("active");
			$(".seller-center-sidebar ul:eq(0) li:gt(0) a").removeAttr("href").css("color","#7F7F7F");
			$(".seller-center-sidebar ul:gt(0) li a").removeAttr("href").css("color","#7F7F7F");
	 	};
	}
	
	var ul_index;//ul标签的序号，一个ul表示一种管理，如"店铺管理"，ul_index=0
	var li_index;//ul里li标签的序号，一个li表示一种功能，如"店铺分类",ul_index=0,li_index=1
	var map = {
		"我要开店":	["navigate_apply/index.html",0,0],
		"商品分类":	["shopClassify/toList.html",0,1],
		"店铺广告":	["shop/toBanner.html",0,2],
		"发布商品":	["item/toAdd.html",1,0],
		"销售中的商品":	["item/get/3.html",1,1],
		"仓库中的商品":	["item/get/1.html",1,2],
		"待审核":		["item/get/2.html",1,3],
		"违规下架":	["item/get/4.html",1,4],
		"全部订单":	["order/getShopOrderList.html?status=0",2,0],
		"待付款":		["order/getShopOrderList.html?status=1",2,1],
		"待签合同":		["order/getShopOrderList.html?status=2",2,2],
		"待买方确认合同":		["order/getShopOrderList.html?status=3",2,3],
		"完成交易":	["order/getShopOrderList.html?status=4",2,4],
		"已取消订单":	["order/getShopOrderList.html?status=5",2,5],
		"评价":		["navigate_comment/seller.html",2,6],
		"账期订单":["accountPeriod/businessList.html?index=7",3,0],
		"我的报表":["reportServer/orderReport.html?index=11",4,0],
		"咨询":		["getShopConsulting.html",5,0],
		"待处理换货":["navigate_aftersale/change.html",5,1],
		"待处理退货":["navigate_aftersale/return.html",5,2],
		"未开票订单":["getInvoiceInfo.html?status=0",6,0],
		"已开票订单":["getInvoiceInfo.html?status=1",6,1]

	};
	$.each(map,function(i,item){
		var request_method = item[0];//请求的方法路径，如"shopClassify/toList.html"
		if(url.indexOf(request_method)>0){
			ul_index = item[1];
			li_index = item[2];
		}
	});
	$(".seller-center-sidebar ul:eq("+ul_index+") li:eq("+li_index+")").addClass("active");
</script>


