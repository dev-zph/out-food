	function login(){
	$("#msg").html("正在登录...");
	var userName = $.trim($("#userName").val());
	var pwd = $.trim($("#pwd").val());
	var toUrl = $("#toUrl").val();
	if(userName == ""){
		$("#msg").html("请输入用户名.");
		$("#userName").focus();
		return false;
	}else if(pwd == ""){
		$("#msg").html("请输入密码.");
		$("#pwd").focus();
		return false;
	}else{
		$.ajax({
			type:"POST",
			url:ctx+"/Login.html",
			data:{"userName":userName,"pwd":pwd},
			dataType:"json",
			error:function(){
				$("#msg").html("因网络原因请求失败，请重试.");
			},
			success:function(data){
				if(data != "101"){
					$("#msg").html("账号/密码错误，请重新输入.");
					$("#userName").focus();
					return false;
				}else{
					$("#msg").html("登录成功.");
					if(toUrl != ""){
						window.location.href = toUrl;
					}else{
						window.location.href = ctx+ "/home.html";
					}
				}
				
			}
		});
	}
}
