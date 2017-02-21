var InterVal; //timer变量，控制时间
var curCount = 60;//当前剩余秒数
var time = 2;	//自动登录秒数
function valiCell(userName){
	var phoneRule = /^1[0-9][0-9]\d{8}$/; 
	if(phoneRule.test(userName)){
		return true;
	}else{
		$("#msg").html("请输入正确的手机号.");
		$("#userName").focus();
		return false;
	}
}
function valiPwd(pwd,rePwd,code){
	var pwdRule = /^([a-zA-Z0-9]|[^a-zA-Z0-9]){6,20}$/;
	if(pwd != ""){
		if(pwdRule.test(pwd)){
			if(rePwd !=""){
				if(rePwd != pwd){
					$("#msg").html("两次输入密码不一致.");
					$("#rePwd").focus();
					return false;
				}else{
					if(code == ""){
						$("#msg").html("请输入验证码.");
						$("#code").focus();
						return false;
					}else{
						if($('#agree').is(':checked')){
							return true;
						}else{
							$("#msg").html("请接受注册协议.");
							return false;
						}
					}
				}
			}else{
				$("#msg").html("请输入确认密码.");
				$("#rePwd").focus();
				return false;
			}
		}else{
			if(pwd.length >20 || pwd.length < 6){
				$("#msg").html("密码长度只能在6-20位字符之间.");
			}else{
				$("#msg").html("密码只能由英文、数字及符号组成.");
			}
			$("#pwd").focus();
			return false;
		}
	}else{
		$("#msg").html("请输入密码.");
		$("#pwd").focus();
		return false;
	}
}
function sendCode(){
	var userName = $("#userName").val();
	var codeImg = $.trim($("#codeImg").val());
	if(valiCell(userName)){
		if(codeImg != ""){
			$.ajax({
				type:"POST",
				url:ctx+"/sendMsg.html",
				data:{"userName":userName,"codeImg":codeImg},
				dataType:"json",
				success:function(data){
					if(data == "101"){
						$("#msg").html("短信已发送，请查收.");
						$("#getCode").removeAttr('href');
						InterVal = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
					}else{
						$("#msg").html("图片验证码无效，请重新输入.");
					}
					
				}
			});
		}else{
			$("#msg").html("请输入图片验证码.");
		}
	}
}
function changCode(){
	var img = $("#code-Img");
	var src = img.attr("src");
	var timeStamp = new Date().getTime();
	src = ctx+"/code.html?timeStamp=" + timeStamp;
	img.attr("src",src);
}
//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {                
        window.clearInterval(InterVal);//停止计时器
        $("#getCode").text("获取短信验证码") ;//显示获取验证码
        $("#getCode").attr("href","javascript:sendCode();");
        curCount = 60;
    }
    else {
        curCount--;
        $("#getCode").text(curCount + "秒");
    }
}
function reg(){
	var userName = $.trim($("#userName").val());
	var pwd = $.trim($("#pwd").val());
	var rePwd = $.trim($("#rePwd").val());
	var code = $.trim($("#code").val());
	if(valiCell(userName) && validUserIsExists() && valiPwd(pwd, rePwd, code)){
		$.ajax({
			type:"POST",
			url:ctx+"/Reg.html",
			data:{"userName":userName,"pwd":pwd,"code":code},
			dataType:"json",
			error:function(){
				$("#msg").html("因网络原因请求失败，请重试.");
			},
			success:function(data){
				if(data == "203"){
					$("#msg").html("验证码错误，请重试.");
					$("#code").focus();
					return false;
				}else if(data == "204"){
					$("#msg").html("用户名已存在，请重试. 已有账号，请直接登录.");
				}else if(data == "102"){
					$("#msg").html("注册失败，请重试.");
				}else{
					autoLogin();
				}
			}
		});
	}
}
function validUserIsExists(){
	var userName = $.trim($("#userName").val());
	var flag = false;
	$.ajax({
		type:"POST",
		url:ctx+"/valiUserName.html",
		data:{"userName":userName},
		dataType:"json",
		async:false,
		error:function(){
			$("#msg").html("因网络原因请求失败，请重试.");
		},
		success:function(data){
			if(data == "204"){
				$("#getCode").removeAttr("href");
				$("#msg").html("用户名已存在，请重试.");
			}else{
				$("#getCode").attr("href","javascript:sendCode();");
				$("#msg").html("");
				flag = true;
			}
		}
	});
	return flag;
}
function autoLogin(){
	$("#msg").attr("style","color:green");
	var timeOut = window.setTimeout("autoLogin()",1000);  
    if(time > 0){  
       $("#msg").html("注册成功，跳转中..."+ time +"秒");
       time--;  
    }else{
    	window.location.href = ctx + "/home.html";
    }  
}
