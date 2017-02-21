function GetDateStr(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    var d = dd.getDate();
    return d;
}
function GetMonthStr(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
	var m = dd.getMonth()+1;//获取当前月份的日期
	return m; 
}
function GetYearStr(AddDayCount){
	var dd = new Date();
	dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
	var y = dd.getFullYear();
	var m = dd.getMonth()+1;//获取当前月份的日期
	var d = dd.getDate();
	if(m<10){
		m='0'+m;
	}
	if(d<10){
		d='0'+d;
	}
	return y+"/"+m+"/"+d;
} 
//验证手机
function telCheck(tel){
	var pattern=/^(((13[0-9]|15[012356789]|17[678]|18[0-9]|14[57]))+\d{8})$/;
	if (!pattern.test(tel)) {
		return false;
	}
	return true;
}
$(function(){
	var activeday=day.split(',');
	var mydate = new Date();
	var Currentmonth=mydate.getMonth()+1;
	var Currentday=mydate.getDate();
	var week = new Array('0','1','2','3','4','5','6');  
	var Currenweek = week[mydate.getDay()];  
	$(".events-calendar-tit span b").text(Currentmonth);
	var panzhi=0;
	for (var i = 0; i < 35; i++) {
		var j=i-Currenweek;
		if(j==0){
			for (var z = 0; z <activeday.length; z++){
				if(activeday[z]==GetYearStr(j)){
					$(".calendar-day").append("<li class='today plan'>"+GetDateStr(j)+"</li>");
					panzhi=1;
				}
			};
			if(panzhi==0){
				$(".calendar-day").append("<li class='today'>"+GetDateStr(j)+"</li>");
			}
			panzhi=0;
		}else if(GetMonthStr(j)<Currentmonth){
			for (var z = 0; z <activeday.length; z++){
				if(activeday[z]==GetYearStr(j)){
					$(".calendar-day").append("<li class='next plan'>"+GetDateStr(j)+"</li>");
					panzhi=1;
				}
			};
			if(panzhi==0){
				$(".calendar-day").append("<li class='next'>"+GetDateStr(j)+"</li>");
			}
			panzhi=0;
			
		}
		else{
			for (var z = 0; z <activeday.length; z++){
				if(activeday[z]==GetYearStr(j)){
					$(".calendar-day").append("<li class='plan'>"+GetDateStr(j)+"</li>");
					panzhi=1;
				}
			};
			if(panzhi==0){
				$(".calendar-day").append("<li>"+GetDateStr(j)+"</li>");
			}
			panzhi=0;
		}			
	};
	$(".signup span,.ongo").on("click", function(){
		$("#registrationid").val($(this).prev().attr("id"));
		$("#registrationtype").val($(this).prev().attr("itm"));
		$(".mask").css("top",$(document).scrollTop()+"px");
		$(".reg").css("top",$(document).scrollTop()+"px");
		$(".mask").show();
		$(".reg").show();
		$("body").css("overflow","hidden");
	});
	$("#registration-close").click(function(){
		$(".mask").hide();
		$(".reg").hide();
		$("body").css("overflow","auto");
	});
	$(".registration-btn").click(function(){
		 var saveUrl= ctx+"/advice/addentry.json?tt=" + Math.random(0, 100);
		$(".error-message").html("");
		var id=$('#registrationid').val();
		var type=$('#registrationtype').val();
		var mobile=$("#jointel").val();
		var joinname=$("#joinname").val();
		var joincompany=$("#joincompany").val();
		var joinpost=$("#joinpost").val();
		if(joinname==""){
			$(".error-message").html("姓名不能为空");
		}else if(mobile==""){
			$(".error-message").html("手机不能为空");
		}else if(joincompany==""){
			$(".error-message").html("认购量不能为空");
		}else if(!telCheck(mobile)){
			$(".error-message").html("请填写正确的手机号码");
		}else{
			 saveUrl+="&actId="+id+"&actType="+type+"&mobileNum="+mobile+"&name="+joinname+"&companyName="+joincompany+"&position="+joinpost;
			$.ajax({
				async : true,
				url : saveUrl,
				type : "post",
				dataType:"json",
				success : function(data){
					if(data.flag){
						$(".registration-apply").hide();
						$(".registration-success").show();
						}else{
							layer.msg("报名失败！",{icon:2});
						}
					}
				});
		}
	});
	$(".registration-success-btn a").click(function(){
		$(".mask").hide();
		$(".reg").hide();
		$("body").css("overflow","auto");
	});
});
