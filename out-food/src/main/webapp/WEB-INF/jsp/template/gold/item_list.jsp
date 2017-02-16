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
    <title>爱养牛</title>
    <%--
    <link rel="stylesheet" type="text/css"
          href="${ctx}/resources/template/gold/gold01/css/cssreset.css">
    <link rel="stylesheet" type="text/css"
          href="${ctx}/resources/template/gold/gold01/css/shop.css">
    --%>
    <%--
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/template/gold/gold01/css/slides.css">
    --%>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/ezhanlu/css/shop.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/ezhanlu/css/prolist.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/ezhanlu/css/cg.css">
    <!--首页商品样式引入-->
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/styleCss/sellerProductDisplay.css">
    <style type="text/css">
        .pro-list-sub-div {
            height: 144px;
        }
    </style>
</head>
<body ctx="${ctx}">
<%@ include file="../../common/head.jsp" %>
<%@ include file="../../common/sellerHead.jsp" %>
<%@ include file="../../common/sellerSignNav.jsp" %>
<!--Logo及 搜索-->
<div class="">
    <div class="container">
        <div class="pro">
            <!--<div class="filter">-->
            <!--<ul class="fl">-->
            <!--<li class="on">综合排序<i class="icon icon-fd"></i>-->
            <!--</li>-->
            <!--<li>人气<i class="icon icon-fd"></i>-->
            <!--</li>-->
            <!--<li>销量<i class="icon icon-fd"></i>-->
            <!--</li>-->
            <!--<li>信用<i class="icon icon-fd"></i>-->
            <!--</li>-->
            <!--<li><span class="fl">价格</span>-->
            <!--<div class="pricedown fl">-->
            <!--<i class="icon icon-pup"></i><i class="icon icon-pdown"></i>-->
            <!--</div>-->
            <!--</li>-->
            <!--</ul>-->
            <!--<div class="pricerang fl">-->
            <!--<input name="min-price"> — <input name="max-price">-->
            <!--</div>-->
            <!--<div class="simplepage fr">-->
            <!--</div>-->
            <!--</div>-->
            <c:forEach items="${list}" var="classifyList" varStatus="res">
                <c:forEach items="${classifyList}" var="map">
                    <div class="pro-list-sub clear-float">
                        <div style="hight:100px;margin-bottom:15px;border-bottom: 1px solid #dbdbdb;">
                            <span style="font-size:26px;margin:0 20px 0 15px;">${map.key.name }</span>
                            <c:if test="${user ne null}">
                                <button href="javascript:void(0)" opsnode="${res.index}"
                                        onclick="document.getElementById('sys-purchaselist_${res.index}').style.display='block';document.getElementById('ui-dialog-overlay_${res.index}').style.display='block'"
                                        class="plcg layui-btn button-orange layui-btn-small layui-btn-radius"
                                        style="vertical-align: super;">批量采购
                                </button>
                            </c:if>
                        </div>
                        <div class="goods-list">
                            <ul class="gl-warp" ectype="items">
                                <c:forEach items="${map.value}" var="list" varStatus="status">
                                    <li class="gl-item">
                                        <div class="gl-i-wrap network-wrap ">
                                            <!--主图-->
                                            <div class="p-img">
                                                <a href="${ctx}/item/getItemById.html?itemId=${list.id}"
                                                   target="_blank"><img
                                                        src="${list.imgsCover}" width="216" height="216"
                                                        class="lazy" data-original="缩略图"
                                                        style="display: inline;"></a>
                                                <div class="new_picon pi1"></div>
                                            </div>

                                            <div class="p-price">
                                                <strong>¥${list.price }</strong>
                                            </div>
                                            <div class="p-num">销量：
                                                <b>
                                                    <c:choose>
                                                        <c:when test="${empty list.itemSumCount }">
                                                            0
                                                        </c:when>
                                                        <c:otherwise>
                                                            <em>${list.itemSumCount }</em>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    ${list.unit}
                                                </b>
                                            </div>
                                            <div class="p-version">
                                                规格：<em>${list.version}</em>
                                            </div>
                                            <div class="p-name">
                                                <a href="${ctx}/item/getItemById.html?itemId=${list.id}"
                                                   target="_blank">${list.name}</a>
                                            </div>

                                            <div class="p-commit">
                                                <div class="p-commit-left">
                                                    <div class="p-eva">已有<em>${list.itemCommCount }</em>条评价</div>
                                                </div>

                                                <c:if test="${list.status==3}">
                                                    <div class="p-commit-right">
                                                        <a class="addcart addCarOne" id="${list.id}" href="javascript:;">
                                                            <i></i>
                                                            加入购物车
                                                        </a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${list.status!=3}">
                                                    <a href="javascript:;">已下架</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </c:forEach>
        </div>
        <%@ include file="../../common/template/gold/bottom_gold01.jsp" %>
    </div>
</div>

<!-- 底部信息 -->
<%@ include file="../../common/footer.jsp" %>
<!-- 底部信息 -->
<!-- 批量采购弹窗 -->
<c:forEach items="${list}" var="classifyList" varStatus="res">
    <c:forEach items="${classifyList}" var="map">
        <div class="ui-dialog" style="position: fixed; left: 14%; top: 10%; z-index: 2015;">
            <div class="sys-purchaselist" id="sys-purchaselist_${res.index}">
                <div class="d-head">
                    <h2>请选采购商品的数量</h2>
                    <div class="close"
                         onclick="document.getElementById('sys-purchaselist_${res.index}').style.display='none';document.getElementById('ui-dialog-overlay_${res.index}').style.display='none'"></div>
                </div>
                <div class="d-body">
                    <div class="d-content sku-list-limit">
                        <div class="col-title fd-clr">
                            <div class="col1">
                                <input type="checkbox" class="all-select"></div>
                            <div class="col2">商品名称</div>
                            <div class="col3">型号</div>
                            <div class="col4567 fd-clr">
                                <div class="col4">单价（元）</div>
                                <!-- <div class="col5">可售数量（
                                <em class="unit">条</em>）</div> -->
                                <div class="col6">订购数量</div>
                                <div class="col7">小计（元）</div>
                            </div>
                        </div>
                        <!-- 商品列表开始 -->
                        <table class="item-table overflow-lb" style="margin-top: 10px;">
                            <tbody class="">
                            <c:forEach items="${map.value}" var="list" varStatus="status">
                                <tr class=" sku-list">
                                    <td class="checkBox col1-mid">
                                        <input type="checkbox" class="item-checkbox_batch" itemid="${list.id}">
                                    </td>
                                    <td class="pro-info col2">
                                        <p class="title"><a href="${ctx}/item/getItemById.html?itemId=${list.id}"
                                                            style="color: #000;">${list.name}</a>
                                        </p>
                                        <p class="fu-title" style="margin-top: 5px;">${list.title}</p>
                                    </td>
                                    <td class="col3-mid">
                                        <p>${list.version}</p>
                                    </td>
                                    <td class="old-price col4">
                                        <p class="item-price">${list.price}</p>
                                        <p><span>可账期支付</span>
                                        </p>
                                    </td>
                                    <td class="nums col6-mid">
                                        <p>
                                            <span class="num_red minus"><a href="javascript:void(0)">-</a></span>
                                            <input class="item_num_batch amount-input" type="text" value="1">
                                            <span class="num_inc plus"><a href="javascript:void(0)">+</a></span>
                                        </p>
                                    </td>
                                    <td class="price col7">0.00</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- 商品列表结束 -->
                        <div class="stat-info">
                            <div>
                <span class="span-type-stat">共计购买：
                <em class="order-total-item orange">0</em>&nbsp;种</span>
                                <span class="span-money-stat">合计：
                <em class="order-total-price orange">0.00</em>&nbsp;元</span></div>
                        </div>
                    </div>

                    <div class="d-foot fd-clr">
                        <a href="#"
                           class="submit_batch purchase-button purchase-button-y confirm"><em>确&nbsp;&nbsp;定</em></a>
                        <a href="#" class="purchase-button purchase-button-g close"
                           onclick="document.getElementById('sys-purchaselist_${res.index}').style.display='none';document.getElementById('ui-dialog-overlay_${res.index}').style.display='none'">
                            <em>取&nbsp;&nbsp;消</em></a>
                    </div>
                </div>
            </div>
        </div>
        <div id="ui-dialog-overlay_${res.index}" class="ui-dialog-overlay" tabindex="-1"
             style="opacity: 0.3; z-index: 2000; left: 0px; top: 0px; position: fixed; width: 100%; height: 100%;
                background-color: rgb(0, 0, 0);display: none;"></div>
    </c:forEach>
</c:forEach>
</body>
<!-- 批量采购脚本写入js文件 -->
<script type="text/javascript" src="${ctx}/resources/js/shop/item-list.js"></script>
</html>