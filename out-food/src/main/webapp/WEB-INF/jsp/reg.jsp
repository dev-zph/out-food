<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@ include file="common/init.jsp" %>
    <title>
<%--         <c:out value="${pageTitle}"/> --%>
    </title>
    <!--用户注册登录页面样式-->
    <link rel="stylesheet" href="${ctx}/resources/css/login/userRegLogin.css"/>
</head>
<body>
<div class="page">
    <!--注册步骤-->
    <div class="steps steps-4">
        <ol>
            <li class="active"><i>1</i><span class="tsl">设置登录账号</span></li>
            <li><i>2</i><span class="tsl">填写账号信息</span></li>
            <li><i class="layui-icon">&#xe605</i><span class="tsl">注册成功</span></li>
        </ol>
    </div>
    <div class="content">
        <form class="layui-form" action="" id="regStep1">
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input"
                           placeholder="请输入你的手机号码">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否同意协议</label>
                <div class="layui-input-inline">
                    <input type="checkbox" name="agree" title="我已阅读并同意此协议">
                    <div class="layui-unselect layui-form-checkbox layui-form-checked"><span>我已阅读并同意此协议</span><i
                            class="layui-icon"></i></div>
                </div>
                <div class="layui-form-mid layui-word-aux">
<%--                     <a href="${ctx}/item/two.html" target="_blank">《用户注册协议》</a> --%>
                </div>
            </div>
            <div class="buttonStep">
                <div class="layui-form-item buttonStepLeft">
                    <button class="layui-btn" lay-submit="" lay-filter="step1">下一步</button>
                </div>
            </div>
        </form>
        <form class="layui-form" action="" id="regStep2" style="display: none;">
            <input type="hidden" name="userName">
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="passWord" placeholder="请输入您的密码" autocomplete="off" class="layui-input"
                           data-com.agilebits.onepassword.user-edited="yes">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="rePassWord" placeholder="请确认您的密码" autocomplete="off"
                           class="layui-input"
                           data-com.agilebits.onepassword.user-edited="yes">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">验证码</label>
                <div class="layui-input-inline">
                    <input type="text" name="codeImg" lay-verify="required" autocomplete="off" class="layui-input"
                           placeholder="请输入验证码">
                </div>
                <div class="layui-form-mid layui-word-aux" style="padding: 2px 0;">
                    <img id="code-Img" alt="验证码" src="${ctx}/code.html" onclick="changCode()">
                </div>
            </div>
<!--             <div class="layui-form-item"> -->
<!--                 <label class="layui-form-label">短信验证码</label> -->
<!--                 <div class="layui-input-inline"> -->
<!--                     <input type="text" name="codeMsg" lay-verify="" autocomplete="off" class="layui-input" -->
<!--                            placeholder="请输入接收到的短信验证码"> -->
<!--                 </div> -->
<!--                 <div class="layui-form-mid layui-word-aux" style="padding: 3px 0;"> -->
<!--                     <button class="layui-btn layui-btn-primary layui-btn-small sendMsg" lay-submit="" -->
<!--                             lay-filter="sendMsg"> -->
<!--                         获取验证码 -->
<!--                     </button> -->
<!--                 </div> -->
<!--             </div> -->
            <div class="buttonStep">
                <div class="layui-form-item buttonStepLeft" style="margin-left: -35px">
                    <button class="layui-btn">上一步</button>
                    <button class="layui-btn" lay-submit="" lay-filter="step2">下一步</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script src="${ctx}/resources/js/login/userRegLogin.js"></script>
<!--页面事件-->
<script>
    layui.use(['form'], function () {
        //创建Form
        var form = layui.form()
                , layer = layui.layer
        //监听提交
        form.on('submit(step1)', function (data) {//第一步
            var checkUser = data.field;
            var userName = checkUser.phone;
            if ($(".layui-form-checkbox").hasClass('layui-form-checked')) {
                valiUserName(userName);
            } else {
                layer.msg("请同意注册协议后再进行注册！", {icon: 2});
            }
            return false;
        });
        form.on('submit(sendMsg)', function () {//发送验证码
            var checkName = $('input[name=userName]').val();
            var codeImg = $('input[name=codeImg]').val();
            if (checkName != '') {//判断是否填写手机号
                sendMsg(checkName, codeImg);
            } else {
                layer.msg("请填写手机号！", {icon: 2});
            }
            return false;
        });
        form.on('submit(disable)', function () {//验证码倒数按钮事件
            return false;
        });
        form.on('submit(step2)', function (data) {//第二步
            var checkCode = data.field;
            var codeImg = $('input[name=codeImg]').val();
            var checkName = $('input[name=userName]').val();
            checkPassWord(checkName, codeImg);
            return false;
        });
    });
</script>
</html>