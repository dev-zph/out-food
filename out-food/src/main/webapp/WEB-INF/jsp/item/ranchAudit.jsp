<!DOCTYPE html>
<html>
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="../common/initMyCenter.jsp" %>
    <!--bootstrap-table样式-->
    <link href="${ctx}/resources/backstage/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>牧场审核</h5>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <!--表格分块-->
                <div class="col-sm-12">
                    <!-- 表格开始/EL -->
                    <table id="exampleTableEvents">
                        <thead>
                        <tr>
                            <th data-field="nickName">牧场名称</th>
                            <th data-field="idCardNum">法人身份证</th>
                            <th data-field="contactCell">联系电话</th>
                            <th data-field="addTime">添加时间</th>
                            <th data-field="auditState">审核状态</th>
                            <th data-field="operate">审核操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!--<c:forEach items="${userList}" var="item">
                        </c:forEach>-->
                        </tbody>
                    </table>
                    <!-- 表格结束 -->
                </div>
                <!--表格分块结束-->
            </div>
        </div>
    </div>
</div>
</body>
<!-- Bootstrap table -->
<script src="${ctx}/resources/backstage/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/resources/backstage/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${ctx}/resources/backstage/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<!--公用js-->
<script src="${ctx}/resources/styleJs/common.js"></script>
<!-- 调取数据 -->
<script src="${ctx}/resources/styleJs/ranchAudit.js"></script>
</html>