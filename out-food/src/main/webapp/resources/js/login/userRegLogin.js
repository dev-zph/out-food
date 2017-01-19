/*
 功能：用户登录、注册
 时间：2016年11月8日
 作者：su
 */    //判断用户名是否已存在
    function valiUserName(userName) {
        $.ajax({
            type: "POST",
            url: ctx + "/valiUserName.html",
            data: {"userName": userName},
            dataType: "json",
            async: false,
            error: function () {
                layer.msg('请求网络失败，请重试!', {icon: 7});
            },
            success: function (data) {
                if (data == "101") {
                    changeRegPage(userName);
                } else if(data == "206"){
                    layer.msg("您输入的手机号不正确！", {icon: 2})
                }else{
                	layer.msg("失败！", {icon: 2})
                }
            }
        });
    }

    //注册第二步 step2
    function changeRegPage(userName) {
        $(".steps-4 ol li").eq(0).removeClass('active');
        $(".steps-4 ol li").eq(1).addClass('active');
        $("#regStep1").css('display', 'none');
        $("#regStep2").css('display', 'block');
        $('input[name=userName]').val(userName);
    }
    //更换图片验证码
    function changCode() {
        var img = $("#code-Img");
        var src = img.attr("src");
        var timeStamp = new Date().getTime();
        src = ctx + "/code.html?timeStamp=" + timeStamp;
        img.attr("src", src);
    }
    //timer处理函数
    var InterVal; //timer变量，控制时间
    var curCount = 60;//当前剩余秒数
    function SetRemainTime() {
        if (curCount == 0) {
            window.clearInterval(InterVal);//停止计时器
            $(".sendMsg").text("获取短信验证码");//显示获取验证码
            curCount = 60;
        }
        else {
            curCount--;
            $(".sendMsg").text(curCount + "秒");
            $(".sendMsg").addClass('layui-btn-disabled');
            $(".sendMsg").attr('lay-filter', 'disable');
        }
    }
    //发送短信验证码
    function sendMsg(userName, codeImg) {
        $.ajax({
            type: "POST",
            url: ctx + "/sendMsg.html",
            data: {"userName": userName, "codeImg": codeImg},
            dataType: "json",
            success: function (data) {
                if (data == "101") {
                    layer.msg("短信已发送，请查收！", {icon: 1})
                    InterVal = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                } else {
                    layer.msg("图片验证码错误，请重新输入！", {icon: 2, time: 2000})
                    changCode()
                }
            }
        });
    }
    //验证密码
    function checkPassWord(userName, codeMsg) {
        var passWord = $('input[name=passWord]').val();
        var rePassWord = $('input[name=rePassWord]').val();
        if (passWord != '') {
            if (passWord == rePassWord) {
                Reg(userName, passWord, codeMsg);
            } else {
                layer.msg("两次输入的密码不一致！", {icon: 2});
            }
        } else {
            layer.msg("请输入您的密码！", {icon: 2});
        }
    }
    //验证短信验证码（注册）
    function Reg(userName, passWord, codeMsg) {
        $.ajax({
            type: "POST",
            url: ctx + "/Reg.html",
            data: {"userName": userName, "pwd": passWord, "code": codeMsg},
            dataType: "json",
            error: function () {
                layer.msg('请求网络失败，请重试!', {icon: 7});
            },
            success: function (data) {
                if (data == "101") {
                    layer.msg('注册成功！正在跳转...', {icon: 1, time: 1000}, function () {
                        window.location.href = ctx + "/home.html";
                    });
                } else {
                    layer.msg('注册失败，请重试!', {icon: 2});
                }
            }
        });
    }
// 用户登录
     //验证用户登录
    function login(userName, password) {
        $.ajax({
            type: "POST",
            url: ctx +"/Login.html",
            data: {"userName": userName, "pwd": password},
            dataType: "json",
            error: function () {
                layer.msg('请求网络失败，请重试!', {icon: 7});
            },
            success: function (data) {
                if (data == "101") {
                    layer.msg('登录成功！正在跳转...', {icon: 1, time: 500}, function () {
                        window.location.href = ctx + "/home.html";
                        top.location.href = ctx + "/home.html";
                    });
                } else {
                    layer.msg('账号/密码错误，请重新输入!', function () {
                    });
                    return false;
                }
            }
        });
    }