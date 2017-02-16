<%@ page language="java" pageEncoding="UTF-8"%>

<div class="full-box seller-center-menu" style="clear: both;">
	<div class="content content-box seller-center">
		<ul class="clear-float">
			<li>
				<c:if test="${hasShop eq null}">
					<a href="${ctx}/navigate_apply/index.html">我是卖家</a>
				</c:if>
				<c:if test="${hasShop ne null}">
					<a href="${ctx}/order/getShopOrderList.html?status=0">我是卖家</a>
				</c:if>
			</li>
			<li>
				<c:if test="${empty shopStatus}">
					<a href="javascript:;">进入商铺</a>
				</c:if>
				<c:if test="${!empty shopStatus}">
					<a href="${ctx}/order/getStore.html" target="_black">进入商铺</a>
				</c:if>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	var url = window.location.href;
	if(url.indexOf("navigate_shop/info.html")>0 || url.indexOf("navigate_shop/upload.html")>0){
		$(".seller-center-menu ul li:eq(1) a").addClass("on");
	}else if(url.indexOf("flow_volume.html")>0 ||
		url.indexOf("item_sales_volume.html")>0 ||
		url.indexOf("sales_volume.html")>0||
		url.indexOf("item_flow_volume.html")>0||
		url.indexOf("sales_flow_rate.html")>0||
		url.indexOf("bill/shop/getBillList.html")>0
		){
		$(".seller-center-menu ul li:eq(2) a").addClass("on");
	}else{
		$(".seller-center-menu ul li:eq(0) a").addClass("on");
	}
</script>


