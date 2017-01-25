<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.xianguo.platform.model.*"%>
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
				<img src="${ctx}/resources/images/logo.jpg" width="287" height="60" alt="爱养牛" class="fl">
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

		<div class="checkout-steps">
			<!-- 收货地址选择 -->
			<div class="step-tit">
				<h3>收货人信息</h3>
				<div class="extra-r">
					<a href="javascript:;" class="address-add ftx-05"  >新增收货地址</a>
					<input type="hidden" id="del_consignee_type" value="0">
					</div>
			</div>

			<div class="step-cont">
				<div class="consignee-content">
					<div class="consignee-scrollbar">
						<div class="ui-scrollbar-main">
							<div class="consignee-scroll">
								<div class="consignee-cont">
									<ul>
										<c:forEach items="${addressList}" var="address">
										<li class="ui-switchable-panel ui-switchable-panel-selected" style="display: list-item;">
											<c:choose>
												<c:when test="${address.isDefault eq '0'}">
														<div type="radio" class="consignee-item item-selected" addressid="${address.id}" username="${address.userName}" phone="${address.phone}" province="${address.province}" city="${address.city}" area="${address.area}" info="${address.addressInfo}">
															<span limit="8">${address.userName} ${address.city}</span> <b></b>
														</div>

														<div class="addr-detail">
															<span class="addr-name">${address.userName}</span>
															<span class="addr-info address" >${address.province}&nbsp;${address.city}&nbsp;${address.area}&nbsp;${address.addressInfo}</span>
															<span class="addr-tel">${address.phone}</span>
															<!-- <span class="addr-default">默认地址</span> -->
														</div>

														<div class="op-btns" >
															<span></span>
															<a href="javascript:;" class="ftx-05 setdefault-consignee address-setDefault address-Default"  addressid="${address.id}">默认地址</a>
															<!-- <a href="javascript:;" class="ftx-05 edit-consignee" >编辑</a> -->
															<a href="javascript:;" class="ftx-05 del-consignee address-delete" addressid="${address.id}">删除</a>
														</div>
												</c:when>	
												<c:otherwise>
													<div type="radio" class="consignee-item" addressid="${address.id}" username="${address.userName}" phone="${address.phone}" province="${address.province}" city="${address.city}" area="${address.area}" info="${address.addressInfo}">
														<span limit="8">${address.userName} ${address.city}</span> <b></b>
													</div>

													<div class="addr-detail">
														<span class="addr-name">${address.userName}</span>
														<span class="addr-info" >${address.province}&nbsp;${address.city}&nbsp;${address.area}&nbsp;${address.addressInfo}</span>
														<span class="addr-tel">${address.phone}</span>
													</div>
													<div class="op-btns" >
														<span></span>
														<a href="javascript:;" class="ftx-05 setdefault-consignee address-setDefault"   addressid="${address.id}">设为默认地址</a>
														<!-- <a href="javascript:;" class="ftx-05 edit-consignee" >编辑</a> -->
														<a href="javascript:;" class="ftx-05 del-consignee address-delete" addressid="${address.id}" >删除</a>
													</div>	
												</c:otherwise>
											</c:choose>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!-- 分割线 -->
			<div class="hr-dashed"></div>
			<!-- 开票信息选择 -->
			<div class="step-tit">
				<h3>开票信息</h3>
				<div class="extra-r">
					<a href="javascript:;" class="invoice-add ftx-05"  >新增开票信息</a>
					<input type="hidden" id="del_consignee_type" value="0">
					</div>
			</div>

			<div class="step-cont">
				<div class="consignee-content">
					<div class="consignee-scrollbar">
						<div class="ui-scrollbar-main">
							<div class="consignee-scroll-invoice">
								<div class="consignee-cont-invoice invoiceinfolist-cont">
									<ul>
										<c:forEach items="${invoiceInfoList}" var="invoiceInfo">
										<li class="ui-switchable-panel ui-switchable-panel-selected" style="display: list-item;">
											<c:choose>
												<c:when test="${invoiceInfo.isDefault eq '0'}">
														<div type="radio" class="consignee-invoice item-selected invoice-selected" invoiceInfoId="${invoiceInfo.id}">
															<span limit="8">税号:${invoiceInfo.taxNum}</span> <b></b>
														</div>

														<div class="addr-detail">
															<span class="addr-name">公司名称：${invoiceInfo.companyName}</span>
															<!-- <span class="addr-default">默认地址</span> -->
														</div>

														<div class="op-btns" >
															<span></span>
															<a href="javascript:;" class="ftx-05 setdefault-consignee invoice-setDefault address-Default"  invoiceInfoId="${invoiceInfo.id}">默认开票信息</a>
															<!-- <a href="javascript:;" class="ftx-05 edit-consignee" >编辑</a> -->
															<a href="javascript:;" class="ftx-05 del-consignee invoice-delete" invoiceInfoId="${invoiceInfo.id}">删除</a>
														</div>
														<div class="invoice-bottom">&nbsp;&nbsp;&nbsp;&nbsp;开户行：${invoiceInfo.bankName}&nbsp;&nbsp;&nbsp;&nbsp;银行账号：${invoiceInfo.bankNum}</div>	
												</c:when>	
												<c:otherwise>
													<div type="radio" class="consignee-invoice" invoiceInfoId="${invoiceInfo.id}" >
														<span limit="8">税号${invoiceInfo.taxNum}</span> <b></b>
													</div>

													<div class="addr-detail">
														<span class="addr-name">公司名称：${invoiceInfo.companyName}</span>
													</div>
													<div class="op-btns" >
														<span></span>
														<a href="javascript:;" class="ftx-05 setdefault-consignee invoice-setDefault"   invoiceInfoId="${invoiceInfo.id}">设为默认开票信息</a>
														<!-- <a href="javascript:;" class="ftx-05 edit-consignee" >编辑</a> -->
														<a href="javascript:;" class="ftx-05 del-consignee invoice-delete" invoiceInfoId="${invoiceInfo.id}" >删除</a>
													</div>
													<div class="invoice-bottom">&nbsp;&nbsp;&nbsp;&nbsp;开户行：${invoiceInfo.bankName}&nbsp;&nbsp;&nbsp;&nbsp;银行账号：${invoiceInfo.bankNum}</div>	
												</c:otherwise>
											</c:choose>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>


			<!-- 分割线 -->
			<div class="hr-dashed"></div>
			<!-- 确认订单信息 -->
			<c:forEach items="${orderInfoList}" var="shop">
			<c:if test="${!empty shop.itemList}">

			<!-- 打印开始 -->
			<div class="info-list">
				<div>
					<div class="step-tit">
						<h3>确认订单信息</h3>
					</div>
						<div>
							<table class="grid-bundle">
								<thead>
									<tr>
										<th class="tube-title">
											<div class="title-wrap">
												<div class="title-inner">
													<div class="bundle-title">
														店铺：<label class="shop-name" shopid="${shop.shopId}">${shop.shopName}</label>

													</div>

												</div>
											</div>
										</th>
										<th class="tube-sku">规格</th>
										<th class="tube-price">单价</th>
										<th class="tube-amount">数量</th>
										<th class="tube-sum">小计</th>
										<!-- <th class="tube-postage">是否定金支付</th> -->
									</tr>
									<tr class="row-border">
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<!-- <td></td> -->
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="5" class="tube-main">
											<table class="item-info">
											<c:forEach items="${shop.itemList}" var="item">
												<tbody class="item-use">
													<tr class="tube-main-ttr" itemid="${item.itemId}">
														<td class="tube-master" href="${ctx}/item/getItemById.html?itemId=${item.itemId}" class="item-name">${item.itemName}</td>
														<td class="tube-sku">${item.itemVersion}</td>
														<td class="tube-price item-unit-price">${item.unitPrice}</td>
														<td class="tube-amount item-count" oldCount="${item.oldCount}">${item.count}</td>
														<td class="tube-sum"><fmt:formatNumber value="${item.unitPrice * item.count}"  type="currency"  pattern="0.00"></fmt:formatNumber></td>
													</tr>
												</tbody>
												</c:forEach>
											</table>
										</td>								
									</tr>
								</tbody>
								<tfoot class="foot-price">
								<tr><!-- <em class="shop-total-price">${shop.shopPrice}</em> -->
									<td></td>
									<td></td>
									<td></td>
									
								<td colspan="2" class="tube-main-foot">
								总计：<span>￥${shop.shopTotalPrice}</span></td>		

								</tr>	
								</tfoot>
							</table>
						</div>
				

			<!-- 分割线 -->
			<div class="hr"></div>
			<!-- 支付方式 -->
			<div>
				<div>
					<div class="step-tit">
						<h3>支付方式</h3>
					</div>
					<div class="step-cont">
						<div class="payment-list">
							<div class="font-left-line"></div>
							<div class="list-cont pay_model">
								<ul>
									<li class="paymode-selected paymode online-payment period_show" value="1">
										<b></b>
										账期支付
									</li>
									<li class="paymode online-payment period_hide" value="0">
											<b></b>
											全额支付
									</li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			

			<!-- 确认账期 -->
				<div class="period-item">
					<!-- 分割线 -->
					<div class="hr"></div>
					<div class="step-tit">
						<h3>确认账期</h3>
					</div>
					<div class="step-cont">
						<div class="payment-list">
							<div class="font-left-line">账期时间：</div>
							<div class="list-cont">
								<ul>
									<li class="period-selected payment-item online-payment" period="30">
											<b></b>
											一个月
									</li>
									<li class="payment-item online-payment" period="60">
											<b></b>
											二个月
									</li>
									<li  class="payment-item online-payment"  period="90">
											<b></b>
											三个月
									</li>
								</ul>
							</div>
						</div>

						<div class="select-height">
							<div class="font-left-line">首付比例：</div>
								<div class="dj-select">
									<input id="dj-select" type="number" aria-valuemax="100" aria-valuemin="0" style="width: 90px;" value="${shop.percentPay}"><span> %</span>
									<!--<select id="dj-select" style="width: 85px;">-->
										<!--<option>请选择</option>-->
										<!--<option value="50" <c:if test ="${shop.percentPay == 50}" >selected</c:if>>50%</option>-->
										<!--&lt;!&ndash; <option value="4">自定义</option> &ndash;&gt;-->
									<!--</select>-->
								</div>
						</div>

					</div>
				</div>

			<!-- 发票信息 -->
<!-- 			<div>
				<div>
					<div class="step-tit">
						<h3>发票信息（必填）</h3>
					</div>
					<div class="step-content">
						<div class="invoice-cont">
							<div class="font-left-line">请填写公司的开票信息：</div>
							<input type="text" class="text-input invoice-title" />
							<input type="hidden" class="text-input invoice-type" value="2" />
						</div>
					</div>
				</div>
			</div> -->

			<!-- 分割线 -->
			<div class="hr"></div>

			<!-- 卖家留言 -->
			<div>
				<div>
					<div class="step-tit">
						<h3>给卖家留言（选填）</h3>
					</div>
					<div class="step-content">
						<div class="invoice-cont">
							
							<div class="font-left-line">请填写想对卖家说的话：</div>
							<textarea class="message"></textarea>
						</div>
					</div>
				</div>
			</div>

			<!-- 分割线 -->
			<div class="hr-dashed"></div>

		</div>
	</div>
			<!-- 打印结束 -->
			</c:if>
			</c:forEach>



			<div style="margin-bottom: 20px;">
				<div>
					<div class="step-tit">
						<h3>电子合同信息</h3>
					</div>
					<div class="step-content">
						<div class="invoice-cont">
							<div class="ht-left">
								<input type="checkbox" id="checkbox_a1" class="chk_1"/><label for="checkbox_a1"></label>
							</div>
								
							<div class="ht-left">
								<span>我已同意《商品购买协议》</span>
							</div>
							<a href="${ctx}/public/purchase-agreement.html" class="ht-pdleft ht-hover xyxq" target="_blank">查看协议详情</a>
						</div>
					</div>
				</div>
			</div>

		
	</div>
</div>

	<!-- 确认信息 -->
		<div class="trade-foot">
			<div class="trade-foot-detail-com">
				<div class="fc-price-info">
					<span class="price-tit">订单总额：</span>
					<span class="price-num total-price">￥${totalPrice}</span>
				</div>
				<c:forEach items="${addressList}" var="address">
					<div class="fc-consignee-info">
						<c:choose>
						<c:when test="${address.isDefault eq '0'}">
							<span class="mr20" id="sendAddr">寄送至：${address.province}&nbsp;${address.city}&nbsp;${address.area}&nbsp;${address.addressInfo}</span>
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
                				提交订单
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
<%-- <script src="${ctx}/resources/js/cart/cart.js"></script> --%>
</html>
