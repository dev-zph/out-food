<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib uri="/tags/d" prefix="d" %>
    <meta charset="utf-8">
    <%@ include file="../common/init.jsp" %>
    <!--bootstrap-table样式-->
    <link href="${ctx}/resources/backstage/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <style type="text/css">
        .qq-inline {
            background-image: url("${ctx}/resources/images/qqOnline.gif");
            background-repeat: no-repeat;
            text-decoration: none !important;
            width: 74px;
            height: 23px;
            zoom: 1;
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <strong style="border-bottom: 1px solid #c6c6c6;display: block;padding-bottom: 8px;margin-bottom: 10px;">订单信息</strong><span>(如果有任何疑问，您可以联系我们协商解决)</span>
        </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox-content">
                        <!--订单状态-->
                        <div class="alert alert-success">
                            <strong class="alert-link">
                                <h3>
                                    当前订单状态：
                                    <d:order code="${order.status}"/>
                                </h3>
                                <h3>
                                    订单号：${order.orderNum}
                                </h3>
                            </strong>
                            <li>
                                <i class="fa fa-bell-o"></i>
                                
                                <span>
                                <!--联系我们-->
                            </span>
                                <span>
                                 <!--<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=305141308&amp;site=qq&amp;menu=yes">-->
                                    <!--<img target="_blank" class="qq-inline"/></a>-->
                            </span>
                                <span>
                                <!--协商解决-->
                            </span>
                            </li>
                        </div>
                        <!--买卖双方信息-->
                        <div class="row">
                            <!--我的信息-->
                            <div class="col-md-4">
                                <div class="well">
                                    <strong style="border-bottom: 1px solid #c6c6c6;display: block;padding-bottom: 8px;margin-bottom: 10px;">我的信息</strong>
                                    <h2>
                                           买家名称：  ${order.nickName}
                                    </h2>
                                </div>
                            </div>
                            <br>
                            <!--卖家信息-->
                            <div class="col-md-4">
                                <div class="well">
                                    <strong style="border-bottom: 1px solid #c6c6c6;display: block;padding-bottom: 8px;margin-bottom: 10px;">卖家信息</strong>
                                    <h2>
                                          商家名称:  ${order.shopName}
                                           商家联系电话:  ${order.contactCell}
                                    </h2>
                                    <p>
                                        <br>
                                        <a class="btn btn-block btn-outline btn-primary"
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!--购买清单-->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="widget-container fluid-height">
                                    <div class="widget-content padded clearfix">
                                        <!--商品清单-->
                                        <table class="table table-striped invoice-table">
                                            <thead>
                                            <tr>
                                                <th>商品名称</th>
                                                <th>数量</th>
                                                <th>单价</th>
                                                <th>总价</th>
                                                <c:if test="${order.status eq 3}">
                                                    <th>操作</th>
                                                </c:if>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${order.detailList}" var="detail" varStatus="status">
                                                <tr>
                                                    <td>
                                                            <div>
                                                                <strong>
                                                                    ${detail.itemName}
                                                                </strong>
                                                            </div>
                                                    </td>
                                                    <td>${detail.itemCount}</td>
                                                    <td>&yen;${detail.itemPrice}</td>
                                                    <td>&yen;<fmt:formatNumber type="number"
                                                                               value="${detail.itemCount * detail.itemPrice}"
                                                                               pattern="0.00" maxFractionDigits="2"/>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <!--结算-->
                                        <table class="table invoice-total">
                                            <tbody>
                                            <tr>
                                                <td><strong>支付类型</strong> 货到付款
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><strong>总计</strong>
                                                </td>
                                                <td>

                                                    <strong>
                                                        <fmt:formatNumber value="${order.price}" type="currency"
                                                                          pattern="￥0.00"/>
                                                    </strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>

</div>
</body>
<!-- 自定义js -->
<script src="${ctx}/resources/backstage/js/content.js?v=1.0.0"></script>
<!-- Bootstrap table -->
<script src="${ctx}/resources/backstage/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/resources/backstage/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${ctx}/resources/backstage/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<!-- 调取数据 -->

</html>