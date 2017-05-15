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
            <li class="on"><a >店铺列表</a><i class="icon icon-fd"></i>
            </li>
            </ul>
            </div>

<c:forEach items="${shopList}" var="shop" varStatus="res">
                    <div class="pro-list-sub clear-float">
                        <div class="goods-list">
                                        <div class="gl-i-wrap network-wrap ">
                                            <!--主图-->
                                            <div class="p-img">
                                                <a onclick="toShop(${shop.id})"
                                                   target="_blank"><img
                                                        src="${server}${shop.shopLogUrl}" width="216" height="216"
                                                        class="lazy" data-original="缩略图"
                                                        style="display: inline;"></a>
                                                <div class="new_picon pi1"></div>
                                            </div>

                                            <div class="p-price">
                                                <strong>${shop.shopName }</strong>
                                            </div>
                                        </div>
                        </div>
                    </div>
            </c:forEach>
        </div>
        <%@ include file="../../template/gold/bottom_gold01.jsp" %>
    </div>
</div>

<!-- 底部信息 -->
<%@ include file="../../common/footer.jsp" %>
<!-- 底部信息 -->
<script type="text/javascript">

function toShop(shopId){
	window.open(ctx + "/shop/getItemList.html?shopId="+shopId);
}

</script>
</body>
<!-- 批量采购脚本写入js文件 -->
<script type="text/javascript" src="${ctx}/resources/js/shop/item-list.js"></script>
</html>