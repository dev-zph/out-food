<%@ page language="java" pageEncoding="UTF-8"%>
<div class="sidebar-seller seller-center-sidebar float-left">
	<h4 class="sidebar-title">
		<i class="off"></i>商品管理
	</h4>
	<ul>
		<li <c:if test="${status eq 1}">class="active"</c:if>><a
			href="${ctx}/SenderOrder/getOrderList.html"> &nbsp;待配送订单&nbsp; </a></li>
		<li <c:if test="${status eq 2}">class="active"</c:if>><a
			href="${ctx}/SenderOrder/getSelfOrders.html"> &nbsp;我的任务单&nbsp; </a></li>
		<li <c:if test="${status eq 3}">class="active"</c:if>><a
			href="${ctx}/SenderOrder/getOverOrders.html"> &nbsp;已完成订单&nbsp; </a></li>
	</ul>

</div>
<script type="text/javascript">
	var url = window.location.href;
	var hasShop = $(".hasShop").val();
	var status = $(".shop-status").val();
	var requestUrl = $(".requestUrl").val();
	//开店成功之前的页面左菜单，除了"我要开店"正常，其他链接都被屏蔽
	if (requestUrl.indexOf("shop/applyIndex") >= 0 || //我要开店
	requestUrl.indexOf("shop/applyReadMe") >= 0 || //阅读协议
	requestUrl.indexOf("shop/applyInfo") >= 0 || //填写公司信息
	requestUrl.indexOf("shop/applyVerify") >= 0//等待审核，支付保证金
	) {//账号管理
		if (status != '3') {
			$(".seller-center-sidebar ul:eq(0) li:eq(0)").addClass("active");
			$(".seller-center-sidebar ul:eq(0) li:gt(0) a").removeAttr("href")
					.css("color", "#7F7F7F");
			$(".seller-center-sidebar ul:gt(0) li a").removeAttr("href").css(
					"color", "#7F7F7F");
		}
		;
	}

	var ul_index;//ul标签的序号，一个ul表示一种管理，如"店铺管理"，ul_index=0
	var li_index;//ul里li标签的序号，一个li表示一种功能，如"店铺分类",ul_index=0,li_index=1
	var map = {
		"待配送订单" : [ "SenderOrder/getOrderList.html", 0, 0 ],
		"我的任务单" : [ "shopClassify/toList.html", 0, 1 ],
		"已完成订单" : [ "shop/toBanner.html", 0, 2 ],
	};
	$.each(map, function(i, item) {
		var request_method = item[0];//请求的方法路径，如"shopClassify/toList.html"
		if (url.indexOf(request_method) > 0) {
			ul_index = item[1];
			li_index = item[2];
		}
	});
	$(".seller-center-sidebar ul:eq(" + ul_index + ") li:eq(" + li_index + ")")
			.addClass("active");
</script>


