<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="common/init.jsp" %>
    <!--用户注册登录页面样式-->
    <link rel="stylesheet" href="${ctx}/resources/css/login/userRegLogin.css"/>
</head>
<body>
<div class="loginPage2">
    <div class="page2Content">
        <div class="loginBox">
            <div class="bd">
                <div class="staticForm">
                    <div class="loginTitle">
                        密码登录
                    </div>
                    <form class="layui-form layui-form-pane" action="" id="loginStep1">
                        <div class="layui-form-item" style="margin-top:25px">
                            <label class="layui-form-label" style="width: 20px">
                                <i class="layui-icon">&#xe612;</i>
                            </label>
                            <div class="layui-input-block" style="margin-left:52px">
                                <input type="text" name="userName" autocomplete="off" lay-verify="userName"
                                       placeholder="请输入用户名" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" style="margin-top:25px">
                            <label class="layui-form-label" style="width: 20px">
                                <i class="layui-icon">&#xe64c;</i>
                            </label>
                            <div class="layui-input-block" style="margin-left:52px">
                                <input type="password" name="password" placeholder="请输入密码" lay-verify="password"
                                       autocomplete="off" class="layui-input"
                                       data-com.agilebits.onepassword.user-edited="yes">
                            </div>
                        </div>
                        <div class="layui-form-item" style="margin-top:25px">
                            <div class="layui-input-block" style="margin-left:0px">
                                <button class="layui-btn layui-btn-danger loginButton" lay-submit="" lay-filter="loginForm">
                                    登录
                                </button>
                            </div>
                        </div>
                        <div class="loginTops">
                            <a href="${ctx}/toFindPwd.html" class="forget-pwd" target="_blank">
                                忘记密码</a>
                            <a href="${ctx}/toReg.html" class="register" target="_blank">免费注册</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/resources/js/login/userRegLogin.js"></script>
<script type="text/javascript">
    layui.use(['form'], function () {
        //创建Form
        var form = layui.form()
        form.verify({
            userName: function (value) {
                if (value == '') {
                    return '请填写用户名!';
                }
            },
            password: function (value) {
                if (value == '') {
                    return '请填写密码!';
                }
            }
        });
        form.on('submit(loginForm)', function (data) {//登录按钮监听
            var userName = data.field.userName;
            var password = data.field.password;
            login(userName, password);
            return false;
        });
    });
</script>
</html>