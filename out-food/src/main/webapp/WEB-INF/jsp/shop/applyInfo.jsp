<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	
	<title><c:out value="${pageTitle}"/></title>
	
	 <link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<script src="${ctx}/resources/js/jquery.min.js"></script>
	<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
	<link rel="stylesheet" href="../resources/css/base.css"/>
	<link rel="stylesheet" href="../resources/css/jquery.fileupload.css"/>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/js/pfa-base.js"></script>
	<script src="../resources/js/jquery.ui.widget.js"></script>
	<script src="../resources/js/jquery.iframe-transport.js"></script>
	<script src="../resources/js/jquery.fileupload.js"></script>
	<script src="../resources/js/jquery.fileupload-process.js"></script>
	<script src="../resources/js/jquery.fileupload-validate.js"></script>
	<script src="${ctx}/resources/js/datepicker/WdatePicker.js"></script> 
<%-- 	<script charset="utf-8" src="${ctx}/resources/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="${ctx}/resources/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${ctx}/resources/kindeditor/plugins/code/prettify.js"></script> --%>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head1.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp" %>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="javascript:void(0);">首页</a>&gt;<a href="javascript:void(0);">卖家中心</a>&gt;<a href="javascript:void(0);">我要开店</a>
			</p>
			<div class="box-content noBorder">
				<h3 class="open-title-step step02">
					<img src="../resources/images/step02.jpg" style="width:90%" />
					<!-- <i></i> -->
				</h3>
				
				<div class="open-write-info borderTop">
					<div class="write-pro">
						<input id="applyInfoId" type="hidden"/>
						<div class="write-info info-p">
							<div style="margin-bottom:20px;"> <font color="red" style="margin-left: 20px;">注：以下所有信息填写提交后便无法修改，如有修改需要请联系平台，请认真填写</font>
							</div>
							<div class="write-info borTopGary">
							<h3>店铺信息</h3>
							<p><label>店铺名称:</label>
								<input id="shopName" maxlength="45" type="text" />
							</p>
							<p>
								<label>店铺logo:</label>
							    <span class="fileinput-button">
								    <span><img width="102px" height="76px" src="../resources/images/addProImg.jpg"/></span>
								    <input id="shopLogUrl" type="file"  />
							    </span>
							    <span class="fileupload-process"></span>
							</p>
							<label>店铺种类      :</label><select onchange="" id="shopType" maxlength="45" class="selector">
                   					<option value="0" selected>大类</option>
                   					<option value="1">饭菜</option>
                   					<option value="2">米粉</option>
                   					<option value="3">甜品</option>
                   					<option value="4">水煮</option>
                  				</select>
							<p>
								
							</p>
							<p><label>最低起送价:</label>
								<input id="leastMon" maxlength="45" type="text" class="shortInput"/>
							</p>
							<p><label>配送费:</label>
								<input id="sendMon" maxlength="45" type="text" class="shortInput"/>
							</p>
							<p><label>打包费:</label>
								<input id="packageMon" maxlength="45" type="text" class="shortInput"/>
							</p>
							<p >
								<label>店铺简介:</label>
								<textarea id="businessScope" class="textArea" style="height: 100px;width: 400px;" maxlength="1000"></textarea>
								<span class="spanTips">0/1000</span>
							</p>
							<p>
								<label>营业执照:</label>
							    <span class="fileinput-button">
								    <span><img width="102px" height="76px" src="../resources/images/addProImg.jpg"/></span>
								    <input id="licenseUrl" type="file"  />
							    </span>
							    <span class="fileupload-process"></span>
							</p>
							
							<p>
								<label>营业执照号:</label>
								<input id="licenseNum" type="text" maxlength="50"/>
							</p>
							<div style="margin-bottom:20px;"> <font color="red" style="margin-left: 20px;">以下地址是外卖配送地址，请一定要准确填写!</font>
							</div>
							<p>
								<label>店铺地址:</label>
								<input id="shopAddress" type="text" maxlength="50"/>
							</p>
						</div>
</div>
						<div class="write-info borTopGary">
							<h3>联系人</h3>
							<p><label>店铺联系人姓名:</label>
								<input id="contactName" maxlength="45" type="text" class="shortInput" />
							</p>
							<p><label>联系手机:</label>
								<input id="contactCell" maxlength="45" type="text" style="width:100px;" />
								<span id="msg" style="color:red;margin-left:10px;">&nbsp;</span>
							</p>
							<p><label>联系人身份证:</label>
							    <!-- The fileinput-button span is used to style the file input field as button -->
							    <span class="fileinput-button">
								    <span><img width="102px" height="76px" src="../resources/images/addProImg.jpg"/></span>
								    <input id="contactUrl" type="file" multiple />
							    </span>
							    <!-- The global file processing state -->
							    <span class="fileupload-process"></span>
							</p>
						</div>
						<p class="text-center buttonList">
							<button class="garyBtn" style="background-color: #fd9b00;color: #fff;margin-right:40px;">保 存</button>
							<button class="regBtn">下一步</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->

	
	<script src="../resources/js/shop-apply-info.js"></script>
	<script type="text/javascript">
		function valiCell(contactCell){
		var phoneRule = /^1[0-9][0-9]\d{8}$/; 
		if(phoneRule.test(contactCell)){
			return true;
		}else{
			$("#msg").html("请输入正确的手机号.");
			$("#contactCell").focus();
			return false;
	}
}
	</script>

	<script type="text/javascript">
		var isConfirm = true;//是否确定服务范围
		$("#modify-service-area").click(function(){
			isConfirm = false;
			$(".service-area").hide();
			$(".service-area-select").show();
			$(".service-area-check").show();
			$(".service-area-btn").show();
		});
		$("#confirm-modify").click(function(){
			var provinceId = $("#province").val();
			var province = $("#province option:selected").text();
			var cityId = $("#city").val();
			var city = $("#city option:selected").text();
			var area_list = '';
			var area_checked = $(".service-area-check").find("input:checked");
			$.each(area_checked,function(i,area){
				if(i==area_checked.length-1){
					area_list += $(area).val();
				}else{
					area_list += $(area).val()+'/';
				}
			});
			if(provinceId=="0"){
				province = '';
				/* layer.msg("请选择省份！",{icon:3});
				return; */
			}
			if(cityId=="0"){
				city = '';
				/* layer.msg("请选择城市！",{icon:3});
				return; */
			}
			$("#serviceArea").val(province+city+area_list);
			$(".service-area").show();
			$(".service-area-select").hide();
			$(".service-area-check").hide();
			$(".service-area-btn").hide();
			isConfirm = true;
		});
		$("#cancel-modify").click(function(){
			$(".service-area").show();
			$(".service-area-select").hide();
			$(".service-area-check").hide();
			$(".service-area-btn").hide();
			isConfirm = true;
		});
/* 		var editor;
		KindEditor.ready(function(K) {
			editor=K.create('#editor_id', {
				cssPath : '${ctx}/resources/kindeditor/plugins/code/prettify.css',
				uploadJson : '${ctx}/file/upload.html',
				afterBlur:function(){this.sync();}  
			});
		}); */
	    var ue = UE.getEditor('container', {
	    	catchRemoteImageEnable: false
	    });
	</script>
</body>
</html>