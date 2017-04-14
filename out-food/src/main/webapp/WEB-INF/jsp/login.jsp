<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="common/init.jsp" %>
    <title>
        <c:out value="${pageTitle}"/>
    </title>
    <!--用户注册登录页面样式-->
    <link rel="stylesheet" href="${ctx}/resources/css/login/userRegLogin.css"/>
</head>
<body>
<div class="loginPage">
    <div class="header">
        <a href="${ctx}/home.html" title="陈佳_外卖系统" target="_top">
            <img class="ayn-logo" src="${ctx}/resources/images/bigLogo.jpg">
        </a>
    </div>
    <div class="loginContent">
        <div class="mui-zebra-module loginPicture" style="width: 100%; background-color: #FFFBF8">
            <div class="inner">
                <img src="" alt="" id="loginImg">
                <a href="#" id="innerUrl"></a>
            </div>
        </div>
        <div class="form" style="display: block; right: 97.5px;">
            <div class="form-inner">
                <div class="form-content">
                    <iframe src="${ctx}/public/loginPage.html" scrolling="no" frameborder="no" border="0" width="320"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" name="contypeId" value="11">
</body>
<!--分类信息内容渲染接口-->
<script src="${ctx}/resources/js/login/listContentInfos.js"></script>
<script>
    //登录海报渲染
    var contypeId = $("input[name=contypeId]").val();//获取分类编号
    listContentInfos(contypeId);//方法
</script>
</html>