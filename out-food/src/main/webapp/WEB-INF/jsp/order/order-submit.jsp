<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.food.out.model.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>我的购物车</title>
	<%@ include file="../common/init.jsp" %>
	<%-- <link rel="stylesheet" href="${ctx}/resources/css/reset.css"/> --%>
	<link rel="stylesheet" href="${ctx}/resources/css/webBase.css"/>
	<link rel="stylesheet" href="${ctx}/resources/css/user_pay.css"/>
	<%-- <link rel="stylesheet" href="${ctx}/resources/home/css/head.css" /><!-- DD版 --> --%>
	<script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>
	<script src="${ctx}/resources/js/main.js"></script>
	<script type="text/javascript">
		javascript:window.history.forward(1); //支付页面点击浏览返回按钮，跳到支付页面
	</script>
	<style type="text/css">
	</style>
</head>
<body ctx="${ctx}">
	<div class="header container">
		<div class="pay-top">
			<div class="logo fl" style="margin-left: 0px;">
				<img src="${ctx}/resources/images/bigLogo.jpg" alt="外卖" class="fl">
				<h1 class="fl" style="text-indent: 15px;color: #3D3C3D;text-decoration: none;font-size: 20px;font-weight: bold;margin-top: 15px;">结算页</h1>
			</div>
			<div class="stepflex" id="#sflex03">
		        <dl class="first doing">
		            <dt class="s-num">1</dt>
		            <dd class="s-text">1.填写核对订单信息<s></s><b></b></dd>
		        </dl>
		        <dl class="normal last">
		            <dt class="s-num">2</dt>
		            <dd class="s-text">2.选择支付方式<s></s><b></b></dd>
		        </dl>
		        <dl class="normal last">
		            <dt class="s-num">3</dt>
		            <dd class="s-text">3.支付成功<s></s><b></b></dd>
		        </dl>
	    	</div>
	    </div>
	</div>
<!-- 新版结算 -->
<div class="main">
	<div class="order-submit">
		<div class="checkout-tit">
			<span class="tit-txt">填写并核对订单信息</span>
		</div>
		<!-- 隐藏值区域 -->
<input type="hidden" value="${itemList[0].shopId}" id="shopId">
		<div class="checkout-steps">
			<!-- 分割线 -->
			<div class="hr-dashed"></div>
			<!-- 确认订单信息 -->
<!-- 收货地址选择 -->
			<div class="step-tit">
				<h3>收货人信息</h3>
			</div>

			<input type="text" name="yourname" size="100" maxlength="200" id="address"  onblur="getAddress();"><br> 
			<!-- 打印开始 -->
			<div class="info-list">
				<div>
					<div class="step-tit">
						<h3>店铺名称：${itemList[0].shopName} -------确认订单信息</h3>
					</div>
						<div>
							<table class="grid-bundle">
								<thead>
									<tr>
										<th class="tube-price">商品名称</th>
										<th class="tube-price">单价</th>
										<th class="tube-amount">数量</th>
										<th class="tube-sum">小计（店铺包装费：${itemList[0].sendMon}￥,打包费：${itemList[0].packageMon}￥）</th>
										<!-- <th class="tube-postage">是否定金支付</th> -->
									</tr>
									<tr class="row-border">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<!-- <td></td> -->
									</tr>
								</thead>
								<c:forEach items="${itemList}" var="cart">
								<c:if test="${!empty cart}">
								<tbody>
								
									<tr>
										<td colspan="5" class="tube-main">
											<table class="item-info">
												<tbody class="item-use">
													<tr class="tube-main-ttr" itemid="${cart.id}">
															<th class="tube-price"style="color: black;font-size:15px"">${cart.itemName}</th>
										<th class="tube-price"style="color: black;font-size:15px">${cart.itemPrice}</th>
										<th class="tube-amount"style="color: black;font-size:15px">${cart.buyCount}</th>
										<th class="tube-sum"style="font-size:15px"><fmt:formatNumber value="${cart.itemPrice * cart.buyCount}"  type="currency"  pattern="0.00"></fmt:formatNumber></th>
													<div class="group">
                		<div class="inner">
                			<button type="submit" onclick="deleteCart(${cart.id})" >
                				删除
                			</button>
                </div>
            </div>
													</tr>
												</tbody>
											</table>
										</td>								
									</tr>
								</tbody>
								</c:if>
								</c:forEach>
								<tfoot class="foot-price">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									

								</tr>	
								</tfoot>
							</table>
						</div>
				

			<!-- 分割线 -->
			<div class="hr"></div>
			

			<div class="hr-dashed"></div>

		</div>
	</div>

	</div>
</div>

	<!-- 确认信息 -->
		<div class="trade-foot">
			<div class="trade-foot-detail-com">
				<div class="fc-price-info">
					<span class="price-tit">订单总额：</span>
					<span class="price-num total-price">￥${totalMoney}</span>
				</div>
				<c:forEach items="${addressList}" var="address">
					<div class="fc-consignee-info">
						<c:choose>
						<c:when test="${address.isDefault eq '0'}">
							<span class="mr20" id="sendAddr">配送至：<span class="mr20" id="addressName"></span></span>
							<span id="sendMobile">收货人：${address.userName}&nbsp;&nbsp;${address.phone}</span>
						</c:when>
						</c:choose>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="group">
                <div class="ui-ceilinglamp checkout-buttons">
                	<div class="sticky-wrap">
                		<div class="inner">
                			<button type="submit" class="checkout-submit settlement-btn submit-order">
                				通知店铺收单
                			</button>
							<input type="hidden" value="${submitFrom}" class="submit-from">
                		</div>
                	</div>
                </div>
            </div>


<!-- 结束 -->

<!-- 添加收货地址弹窗 -->
<div class="pop class-pop-update">
		<div class="pop-box w933">
			<h3 class="clear-float redText">添加收货地址<i class="colse sprite float-right"></i></h3>
			<div class="pop-data-list">
				<div class="pop-block">
					<input type="hidden" id="addressId_update">
					<table class="msg-text" style="font-size:13px;">
						<tr>
							<td width="12%" align="center">所在地区<em style="color: #DD3334;">*</em></td>
							<td>
								<select class="province"><option value="0">--请选择--</option></select>
								<select class="city"><option value="0">--请选择--</option></select>
								<select class="area"><option value="0">--请选择--</option></select>
								&nbsp;&nbsp;
								详细地址<em style="color: #DD3334;">*</em>&nbsp;&nbsp;
								<input type="text" size="40" class="address-detail"/>
								<label style="color:#F13F4D" class="address-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="center">邮政编码<em style="color: #DD3334;">*</em></td>
							<td>
								<input maxlength="18" type="text" class="textInput zip-code" size="29"/>&nbsp;&nbsp;&nbsp;
								<label style="color:#F13F4D" class="zipCode-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="center">联系人姓名<em style="color: #DD3334;">*</em></td>
							<td>
								<input maxlength="18" type="text" class="textInput name" size="29"/>&nbsp;&nbsp;&nbsp;
								<label style="color:#F13F4D" class="name-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="center">手机号码<em style="color: #DD3334;">*</em></td>
							<td>
								<input maxlength="18" type="text" class="textInput mobile" size="29"/>&nbsp;&nbsp;&nbsp;
								<label style="color:#F13F4D" class="mobile-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="center">电话号码<em style="color: #DD3334;">*</em></td>
							<td>
								<input maxlength="18" type="text" class="textInput tel-no" size="29"/>&nbsp;&nbsp;&nbsp;
								<label style="color:#F13F4D" class="tel-warning"></label>
							</td>
						</tr>
					</table>
					<button class="regBtn auto-center ">确定</button>
				</div>
			</div>
		</div>
	</div>

<!-- 添加开票信息弹窗 -->
<div class="pop class-pop-invoice">
		<div class="pop-box w933" style="width:550px;margin-left: -300px;">
			<h3 class="clear-float redText">添加开票信息<i class="colse sprite float-right"></i></h3>
			<div class="pop-data-list">
				<div class="pop-block">
					<input type="hidden" id="addressId_update">
					<table class="msg-text updateadd">
					<input type="hidden" id="id">
						<tr>
							<td align="right">开户行名称:</td>
							<td>
								<input id="bankName_save" type="text" class="textInput" />
								<label style="color:#F13F4D" class="bankName-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="right">银行账号:</td>
							<td>
								<input id="bankNum_save" maxlength="45" type="text" class="textInput" />
								<label style="color:#F13F4D" class="bankNum-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="right">公司名称:</td>
							<td>
								<input id="companyName_save" maxlength="25" type="text" class="textInput" />
								<label style="color:#F13F4D" class="companyName-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="right">税号:</td>
							<td>
								<input id="taxNum_save" maxlength="45" type="text" class="textInput" />
								<label style="color:#F13F4D" class="taxNum-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="right">公司地址:</td>
							<td>
								<input id="companyAddress_save" maxlength="45" type="text" class="textInput" />
								<label style="color:#F13F4D" class="companyAddress-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="right">电话号码:</td>
							<td>
								<input id="contactCell_save" maxlength="45" type="text" class="textInput" />
								<label style="color:#F13F4D" class="contactCell-warning"></label>
							</td>
						</tr>
						<tr>
							<td align="right">默认开票信息:</td>
							<td>
								<input id="isDefault_save" type="checkbox" class="mLeft" />
								<label style="color:#F13F4D" class="isDefault-warning"></label>
							</td>
						</tr>
					</table>
					<button class="regBtn auto-center invoice-save">确定</button>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- 底部信息 -->
	<!-- 底部信息 -->

<script type="text/javascript">

// 收货地址选择
$(".consignee-item").click(function() {
    dz_clear();
    $(this).addClass("item-selected");

    // 提交订单时确认收货信息变更
    var username = $('.consignee-cont li').find('.item-selected').attr('username');
    var phone = $('.consignee-cont li').find('.item-selected').attr('phone');
    var province = $('.consignee-cont li').find('.item-selected').attr('province');
    var city = $('.consignee-cont li').find('.item-selected').attr('city');
    var area = $('.consignee-cont li').find('.item-selected').attr('area');
    var info = $('.consignee-cont li').find('.item-selected').attr('info');
    $("#endAddr").html("寄送至：" + province + "&nbsp;"+ city + "&nbsp;" + area + "&nbsp;" + info);
    $("#sendMobile").html("收货人：" + username + "&nbsp;&nbsp;"+ phone);

});

function dz_clear() {
    $(".consignee-item").each(function() {
        if ($(this).hasClass("item-selected")) {
            $(this).removeClass("item-selected");
        }
    });
}
//开票信息选择
$(".consignee-invoice").click(function() {
    invoice_clear();
    $(this).addClass("item-selected");
});
function invoice_clear() {
    $(".consignee-invoice").each(function() {
        if ($(this).hasClass("item-selected")) {
            $(this).removeClass("item-selected");
        }
    });
}
//支付方式选择
$(".paymode").click(function() {
    $(this).siblings().removeClass("paymode-selected");
    $(this).addClass("paymode-selected");
});

// 显示账期选择
$(".period_show").click(function() {
    $(this).parents(".info-list").find(".period-item").css('display','block');
});

// 隐藏账期选择
$(".period_hide").click(function() {
    $(this).parents(".info-list").find(".period-item").css('display','none');
});

//账期选择
$(".payment-item").click(function() {
   	$(this).siblings().removeClass("period-selected");
    $(this).addClass("period-selected");
});

$(function(){
	// 页面LOGO超链接
	$(".logo").click(function(){
	window.location.href =ctx+"/home.html";
	});
});
</script>
</body>
<script src="${ctx}/resources/js/order/order.js"></script>
</html>
