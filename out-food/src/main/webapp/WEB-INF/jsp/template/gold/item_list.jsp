<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%
if(request.getParameter("shopClassifyId") == null || request.getParameter("shopClassifyId") ==""){
request.setAttribute("MENU_INDEX", "storeitemlist");
}else{
request.setAttribute("MENU_INDEX", "storeitemclass");
}
%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <%@ include file="../../common/init.jsp" %>
     <link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="${ctx}/resources/js/jquery.min.js"></script>
		<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
    <title>陈佳_外卖系统</title>
    <%--
    <link rel="stylesheet" type="text/css"
          href="${ctx}/resources/template/gold/gold01/css/cssreset.css">
    <link rel="stylesheet" type="text/css"
          href="${ctx}/resources/template/gold/gold01/css/shop.css">
    --%>
    <%--
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/template/gold/gold01/css/slides.css">
    --%>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/shop.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/prolist.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/cg.css">
    <!--首页商品样式引入-->
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/sellerProductDisplay.css">
    <style type="text/css">
        .pro-list-sub-div {
            height: 144px;
        }
    </style>
</head>
<body ctx="${ctx}">
<%@ include file="../../common/head.jsp" %>
<!--Logo及 搜索-->
<div class="">
    <div class="container">
        <div class="pro">
            <div class="filter">
            <ul class="fl">
            <li class="on"><a href="${ctx}/cart/toPersonShopCart.html?shopId=${shop.id}">本店购物车</a><i class="icon icon-fd"></i>
            </li>
            </ul>
            </div>

<c:forEach items="${itemClass}" var="itemc" varStatus="res">
                    <div class="pro-list-sub clear-float">
                        <div style="hight:100px;margin-bottom:15px;border-bottom: 1px solid #dbdbdb;">
                            <span style="font-size:26px;margin:0 20px 0 15px;">${itemc.className }</span>
                        </div>
                        <div class="goods-list">
                            <ul class="gl-warp" ectype="items">
                                <c:forEach items="${itemList}" var="item" varStatus="status">
                                <c:if test="${item.shopItemClassId eq itemc.id}">
                                    <li class="gl-item">
                                        <div class="gl-i-wrap network-wrap ">
                                            <!--主图-->
                                            <div class="p-img">
                                                <a href="${ctx}/item/getItemById.html?itemId=${item.id}"
                                                   target="_blank"><img
                                                        src="${server}${item.itemImg}" width="216" height="216"
                                                        class="lazy" data-original="缩略图"
                                                        style="display: inline;"></a>
                                                <div class="new_picon pi1"></div>
                                            </div>

                                            <div class="p-price">
                                                <strong>¥${item.itemPrice }</strong>
                                            </div>
                                            <div class="p-name">
                                                <a href="${ctx}/item/getItemById.html?itemId=${item.id}"
                                                   target="_blank">${item.itemName}</a>
                                            </div>

                                            <div class="p-commit">
<!--                                                 <div class="p-commit-left"> -->
<%--                                                     <div class="p-eva">已有<em>${list.itemCommCount }</em>条评价</div> --%>
<!--                                                 </div> -->

                                                <c:if test="${item.status==3}">
                                                    <div class="p-commit-right">
                                                        <a class="addcart addCarOne" id="${item.id}" onclick="addCartItem(${item.id},${item.shopId})">
                                                            <i></i>
                                                            加入购物车
                                                        </a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${item.status!=3}">
                                                    <a href="javascript:;">已下架</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- 底部信息 -->
<%@ include file="../../common/footer.jsp" %>
<!-- 底部信息 -->
<script type="text/javascript">
function addCartItem(itemId,shopId) {
	var buyCount = 1;
	$.ajax({
		type: 'POST',
		url: ctx+"/cart/addToCart.json",
		data:{
			itemId : itemId,
			addCount : buyCount,
			shopId : shopId
		},
	    dataType: 'json',
		success:function(data){
			if(data.code=="101"){alert(data.message);}
			else if(data.code=="102"){alert(data.message);}
			else if(data.code=="205"){
				alert("清先登入账号");
				window.location.href=ctx+"/toLogin.html"
			}
			else{layer.msg("系统错误！",{icon:7});}
		}
	});
}

</script>
</body>
<!-- 批量采购脚本写入js文件 -->
<script type="text/javascript" src="${ctx}/resources/js/shop/item-list.js"></script>
</html>