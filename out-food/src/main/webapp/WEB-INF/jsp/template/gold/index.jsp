<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
request.setAttribute("MENU_INDEX", "storeindex");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="../../common/init.jsp"%>
    <title>陈佳_外卖系统</title>
    <!--轮播图样式-->
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/styleCss/sellerSlides.css">
    <!--轮播图jq-->
    <script type="text/javascript" src="${ctx}/resources/template/gold/gold01/js/jquery.flexslider-min.js"></script>
</head>
<body ctx="${ctx}">
<!--商家首页-->
<div class="main">
    <%@ include file="../../common/head.jsp"%>
    <%@ include file="../../common/sellerHead.jsp"%>
    <%@ include file="../../common/sellerSignNav.jsp"%>
    <!--Logo及 搜索-->
    <div class="content">
        <!--商家首页轮播图-->
        <c:if test="${!empty shop.banner1||!empty shop.banner2||!empty shop.banner3||!empty shop.banner4}">
            <div class="banner">
                <div class="flexslider">
                    <ul class="slides">
                        <c:if test="${!empty shop.banner1&&fn:length(shop.banner1) > 0 }">
                            <li style="background: url(${shop.banner1}) 50% 0 no-repeat;"></li>
                        </c:if>
                        <c:if test="${!empty shop.banner2&&fn:length(shop.banner2) > 0 }">
                            <li style="background: url(${shop.banner2}) 50% 0 no-repeat;"></li>
                        </c:if>
                        <c:if test="${!empty shop.banner3&&fn:length(shop.banner3) > 0 }">
                            <li style="background: url(${shop.banner3}) 50% 0 no-repeat;"></li>
                        </c:if>
                        <c:if test="${!empty shop.banner4&&fn:length(shop.banner4) > 0 }">
                            <li style="background: url(${shop.banner4}) 50% 0 no-repeat;"></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </c:if>
        <!--新商品展示-->
        <div class="container">
            <%@ include file="../../common/sellerProductDisplay.jsp"%>
        </div>
        <!--商品展示-->
    </div>
    <!-- 底部信息 -->
    <%@ include file="../../common/footer.jsp"%>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $('.flexslider').flexslider({
            directionNav: true,
            pauseOnAction: false
        });
    });
    $(function () {
        $(".showsmalllist ul li img").on(
                "click",
                function () {
                    $(this).parent().parent().children("li").children("span")
                            .removeClass("selectedimg");
                    $(this).next().addClass("selectedimg");
                    $(this).parent().parent().parent().prev().children("a")
                            .children("img").attr("src", $(this).attr("src"));
                });
        $(".shopinfo").hover(function () {
            $(".shopinfoshow").show();
        }, function () {
            $(".shopinfoshow").hide();
        });
        $(".shopinfoshow").hover(function () {
            $(".shopinfoshow").show();
        }, function () {
            $(".shopinfoshow").hide();
        });
        $(".evaluate").hover(function () {
            $(".shopinfoshow").show();
        }, function () {
            $(".shopinfoshow").hide();
        });
        $(".qrcode").hover(function () {
            $(".shopeqcodeshow").show();
        }, function () {
            $(".shopeqcodeshow").hide();
        });
        $(".shopeqcodeshow").hover(function () {
            $(".shopeqcodeshow").show();
        }, function () {
            $(".shopeqcodeshow").hide();
        });
    })
</script>
</html>
