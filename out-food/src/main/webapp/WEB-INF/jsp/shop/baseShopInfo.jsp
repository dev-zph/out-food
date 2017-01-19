<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="../resources/css/base.css"/>
	<script src="../resources/js/main.js"></script>
	<script src="../resources/js/pfa-base.js"></script>
<%-- 		<script charset="utf-8" src="${ctx}/resources/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="${ctx}/resources/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="${ctx}/resources/kindeditor/plugins/code/prettify.js"></script> --%>
	<script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.all.js"></script>
	<style type="text/css">
		.radio-input i.selected:after {
			left: .3em;
		}
		.add-user-img{
			width:256px; height:100px;
		}
		.add-user-img-code{
			width: 100px;height: 100px;
			display: inline-block;
			padding: 5px;
			border: 1px solid #CCC;
		}
	</style>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/seller_head.jsp"%>
	<%@ include file="../common/head_seller.jsp"%>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx}/navigate_shop/info.html">账号管理</a>&gt;基本资料
			</p>
			<div class="box-content">
				<div class="user-info">
					<input id="infoId" type="hidden"/>
					<p>
						<span>
							<label>店铺名称:</label>
							<input id="name" maxlength="45" type="text" />
						</span>
					</p>
					<p>
						<label>店招图:</label>
						<span class="add-user-img" style="height:60px;">
							<img id="logoUrl" width="595px" height="60px" src="../resources/images/addProImg1.jpg"/>
						</span>
					</p>
					<p style="display: none;">
						<!-- <label class="imgTitle">荣誉资质:</label> -->
						<label></label>
						<span class="add-user-img">
							<img id="honorUrl" width="256px" height="100px" src="../resources/images/addProImg1.jpg"/>
						</span>
					</p>
					<!-- <p>
						<label>二维码:</label>
						<span class="add-user-img-code">
							<img id="qrCodeUrl" width="100px" height="100px" src="../resources/images/addProImg2.jpg"/>
						</span>
					</p> -->
					<p>
						<label>公司简介:</label>
						<!-- <span style="margin-left: 120px;display: inline-block;"><textarea id="editor_id"  style="width:750px;height:600px;visibility:hidden;"></textarea></span> -->
					<script id="container" type="text/plain" style="width: 700px; height: 500px; margin: 0px auto;"></script>
					</p>
					<p>
						<span>
							<label>服务热线:</label>
							<input id="serviceHotline" maxlength="45" type="text" style="width:400px;"/>
						</span>
					</p>
					<p class="service-area">
						<span>
							<label>地区:</label>
							<input id="serviceArea" maxlength="100" type="text" style="width:400px;"/>
							<!-- <button class="garyBtn" id = "modify-service-area" 
								style="background-color: #FF6766;color: #fff;">修 改</button> -->
						</span>
					</p>
					<p class="service-area-select" style="display:none;">
						<span>
							<label>地区:</label>
							<select style="width:138px;" id="province">
								<option value="0">--请选择--</option>
							</select>
							<select style="width:138px;" id="city">
								<option value="0">--请选择--</option>
							</select >
						</span>
					</p>
					<p class="service-area-check" style="display:none;" id="area"></p>
					<p class="service-area-btn" style="display:none;">
						<label></label>
						<button class="garyBtn" id="confirm-modify" 
							style="background-color: #FF6766;box-shadow: 0 3px 0 #FD4E4B;color: #fff;">确 定</button>
						<button class="garyBtn" id="cancel-modify" 
							style="background-color: #FF6766;box-shadow: 0 3px 0 #FD4E4B;color: #fff;">取 消</button>
					</p>
					<p>
						<span>
							<label>店铺联系人姓名:</label>
							<input id="contactName" type="text"/>
						</span>
					</p>
					<p>
						<span>
							<label>联系电话:</label>
							<input id="contactCell" type="text"/>
						</span>
					</p>
					<p>
						<label>联系人身份证:</label>
						<span class="add-user-img">
							<img id="contactUrl" width="256px" height="100px" src="../resources/images/addProImg1.jpg"/>
						</span>
					</p>
					<p>
						<span>
							<label>公司名称:</label>
							<input id="company" type="text" readonly="readonly" style="border-style: none;"/>
						</span>
					</p>
					<p>
						<span>
							<label>公司地址:</label>
							<input id="companyAddress" type="text"/>
						</span>
					</p>
					<p>
						<label>营业执照:</label>
						<span class="add-user-img">
							<img id="licenseUrl" width="256px" height="100px" src="../resources/images/addProImg1.jpg"/>
						</span>
					</p>
					<p>
						<span>
							<label>营业执照号:</label>
							<input id="licenseNum" type="text" readonly="readonly" style="border-style: none;"/>
						</span>
					</p>
					<p>
						<label>经营范围:</label>
						<textarea id="businessScope" class="textArea" readonly="readonly" style="border-style: none;width: 650px;"></textarea>
					</p>
					<p>
						<label>税务登记证编号:</label>
						<input id="taxNum" type="text" readonly="readonly" style="border-style: none;"/>
						<span id="taxStatus" class="radio-input">是否为一般纳税人：&nbsp;<i class="selected" data-value="0"></i>是&nbsp;&nbsp;<i data-value="1"></i>否</span>
					</p>
					<p>
						<label>税务登记证:</label>
						<span class="add-user-img">
							<img id="taxUrl" width="256px" height="100px" src="../resources/images/addProImg1.jpg"/>
						</span>
					</p>
					<p>
						<label>账期:</label>
						<input id="accountPeriod" type="number" readonly="readonly"/>
					</p>
					<p>
						<span>
							<label>开户行账户名称:</label>
							<input id="bankAccountName" type="text" maxlength="45"/>
						</span>
					</p>
					<p>
						<span>
							<label>开户行支行名称:</label>
							<input id="bankName" type="text" maxlength="100"/>
						</span>
					</p>
					<p>
						<span>
							<label>银行账号:</label>
							<input id="bankNum" type="text" maxlength="45"/>
						</span>
					</p>
					
					<p class="zfbBg" style="display: none;">
						<label>支付保证金余额:</label>
						<strong id="bail">￥0</strong>
						<a href="#" class="pay-bail">充值</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->
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
	</script>

</body>
<script type="text/javascript">
/* var editor;
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
	$('.pay-bail').click(function(){
		var shopId = $('#infoId').val();
		var cxt = $('body').attr('ctx');
		var balance = parseFloat($(this).siblings('#bail').text().replace('￥','')).toFixed(2);
		var needPay = parseFloat(2000.00-balance).toFixed(2);
		window.location.href = cxt+'/order/toPayBail.html?price='+needPay+'&payForType=2'+'&shopId='+shopId;
	});
</script>
<script src="../resources/js/shop-base-info.js"></script>
</html>