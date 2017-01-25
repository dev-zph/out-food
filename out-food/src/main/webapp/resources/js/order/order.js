$(function($) {
	var ctx = $('body').attr('ctx');
	var is_point_valid = true;//输入积分是否有效(10的倍数)
	var info = {};
	var _addAddress = function(){
		//获取省份列表
		$('.address-add').click(function(){
			$.ajax({
				type: 'POST',
				url: ctx+'/area/byparent.html',
				data:{
					parentId : '0'
				},
			    dataType: 'json',
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					var result = data.data || [];
                    var selectTemp = ['<option value="0">--请选择--</option>'];
                    $.each(result, function(i, obj){
                        selectTemp.push( '<option value="'+  obj.id  +'">'+ obj.name +'</option>' );
                    });
                    $('.province').empty().append(selectTemp.join('') );
                    $('.province').unbind('change').bind('change',function(){
                        var provinceId = $('.province').val();
                        if(provinceId!=0){
                        	_getCityList(provinceId);
                        }else{
                        	 $('.city').empty().append('<option value="0">--请选择--</option>');
                        	 $('.area').empty().append('<option value="0">--请选择--</option>');
                        }
                    });
					$('.class-pop-update').show();
				}
			});
		});
		//添加收货地址
		$('.regBtn').click(function(){
			var provinceId = $('.province').val();
			var province = $('.province').find("option:selected").text();
			var cityId = $('.city').val();
			var city = $('.city').find("option:selected").text();
			var areaId = $('.area').val();
            var area = $('.area').find("option:selected").text();
			var addressInfo = $('.address-detail').val();
			var zipCode = $('.zip-code').val();
			var userName = $('.name').val();
			var phone = $('.mobile').val();
			var cell = $('.tel-no').val();
			if(provinceId=='0' || cityId=='0' || addressInfo.trim()==''){//areaId=='0' 允许四个直辖市
				$('.address-warning').text('请填写完整收货地址！');
				return;
			}else{
				$('.address-warning').text('');
			}
			if(zipCode==''){
				$('.zipCode-warning').text('请填写邮政编码！');
				return;
			}else{
				$('.zipCode-warning').text('');
			}
			if(userName==''){
				$('.name-warning').text('请填写收货人姓名！');
				return;
			}else{
				$('.name-warning').text('');
			}
			if(phone==''){
				$('.mobile-warning').text('请填写手机号！');
				return;
			}else{
				$('.mobile-warning').text('');
			}
			if(cell==''){
				$('.tel-warning').text('请填写电话号码！');
				return;
			}else{
				$('.tel-warning').text('');
			}
			$.ajax({
				type: 'POST',
				url: ctx+'/address/mine/save.html',
				data:{
					provinceId:provinceId,
					province : province,
					cityId:cityId,
					city:city,
					areaId:areaId,
					area:area,
					addressInfo:addressInfo,
					zipCode:zipCode,
					userName:userName,
					phone:phone,
					cell:cell
				},
			    dataType: 'json',
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					 if(data){
                         var result = data.data || 'fail',
                             message = data.message || '';
                         if(result == 'success'){
                        	 ('收货地址添加成功！');
                        	 $('.class-pop-update').hide();
                        	 window.location.reload();
                         }else if(message == 'limit'){
                             layer.msg('亲，收货地址不能这么多啊！',{icon:7});
                         }else{
                             if(result == 'fail'){
                                 layer.msg('保存失败！',{icon:2});
                             }
                         }
                     }
				}
			});
		});
		$('.colse').click(function(){
			$('.class-pop-update').hide();
		});
	},
	//获取市区列表
	_getCityList = function(pid){
		if(pid && pid!=0){
			$.ajax({
                url : ctx+'/area/byparent.html',
                data : {
                    parentId : pid
                },
                success : function(data){
                    if(data){
                        var result = data.data || [];
                        var selectTemp = ['<option value="0">--请选择--</option>'];
                        $.each( result, function(i, obj){
                            selectTemp.push( '<option value="'+  obj.id  +'">'+ obj.name +'</option>' );
                        });
                        $('.city').empty().append( selectTemp.join('') );
                        $('.city').unbind('change').bind('change',function(){
                            var cityId = $('.city').val();
                            if(cityId!=0){
                            	_getAreaList(cityId);
                            }else{
                            	$('.area').empty().append('<option value="0">--请选择--</option>');
                            }
                        });
                    }
                }
            });
        }else{
            var selectTemp = ['<option value="0">--请选择--</option>'];
            $('.city').empty().append(selectTemp.join(''));
        }
	},
	//获取区镇列表
	_getAreaList = function(pid){
		if(pid && pid!=0){
			$.ajax({
                url : ctx+'/area/byparent.html',
                data : {
                    parentId : pid
                },
                success : function(data){
                    if(data){
                        var result = data.data || [];
                        var selectTemp = ['<option value="0">--请选择--</option>'];
                        $.each( result, function(i, obj){
                            selectTemp.push( '<option value="'+  obj.id  +'">'+ obj.name +'</option>' );
                        });
                        $('.area').empty().append( selectTemp.join('') );
                    }
                }
            });
        }else{
            var selectTemp = ['<option value="0">--请选择--</option>'];
            $('.area').empty().append(selectTemp.join('')); 
        }
	},
	_addressSelect = function(){
		$('.take-address-list li').find('[type=radio]').bind('click',function(){
			//选中地址字体加粗加大
			$(this).siblings('.address').addClass('selected');
			$(this).parent().siblings('li').find('.address').removeClass('selected');

		});

		$('.take-address-list li').bind('mouseover',function(){
			//鼠标指针悬浮，产生高亮
			$(this).css("background-color","#fef7eb");
			$(this).siblings('li').css("background-color","#FFF");
		});


	},
	_addressEdit = function(){
		$('.address-setDefault').click(function(){
			var _this = $(this);
			// _this.removeAttr('href');//去掉href属性，防止点击后页面置顶
			var addressId = _this.attr('addressid');
			$.ajax({
				type: 'POST',
				url: ctx+'/address/mine/update.html',
				data:{
					id:addressId,
					isDefault:'0'
				},
			    dataType: 'json',
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					if(data.data=='success'){
						_this.text('默认地址').css('background-color','#999');
                        _this.text('默认地址').css('color','#fff');
                        _this.text('默认地址').css('padding','3px 3px');
                        _this.text('默认地址').css('line-height','20px');
                        _this.parents('li').siblings('li').find('.address-setDefault').text('设为默认地址').css('background-color','transparent');
                        _this.parents('li').siblings('li').find('.address-setDefault').text('设为默认地址').css('color','#005ea7');
                        _this.parents('li').siblings('li').find('.address-setDefault').text('设为默认地址').css('padding','0px');
                        _this.parents('li').siblings('li').find('.address-setDefault').text('设为默认地址').css('line-height','none');
						_this.attr('href','#');//加上href属性
						layer.msg('默认地址设置成功', {icon: 1});
					};
				}
			});	
		});
		/*删除收货地址*/
		$('.address-delete').click(function(){
			var _this = $(this);
			// _this.removeAttr('href');//去掉href属性，防止点击后页面置顶
			var addressId = _this.attr('addressid');
			$.ajax({
				type: 'POST',
				url: ctx+'/address/mine/update.html',
				data:{
					id:addressId,
					deleted:'1'
				},
			    dataType: 'json',
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					if(data.data=='success'){
						_this.parents('li').remove();
					};
				}
			});	
		});
		/*修改收货地址*/
		$('.address-modify').click(function(){
			
		});
	},	
	// 开票信息弹窗
	_addInvoice = function(){
		$('.invoice-add').click(function(){
			$('.class-pop-invoice').show();
		});
		//添加开票信息
		$('.invoice-save').click(function(){
        	var id = $('#id').val();
            var bankNum_save = $('#bankNum_save').val();
            var bankName_save = $('#bankName_save').val();
            var companyName_save = $('#companyName_save').val();
            var taxNum_save = $('#taxNum_save').val();
            var companyAddress_save = $('#companyAddress_save').val();
            var contactCell_save = $('#contactCell_save').val();
            var isDefault_save = $('#isDefault_save').prop("checked")?0:1;

			if(bankName_save==''){
				$('.bankName-warning').text('请填写开户行名称！');
				return;
			}else{
				$('.bankName-warning').text('');
			}
			if(bankNum_save==''){
				$('.bankNum-warning').text('请填写银行账号！');
				return;
			}else{
				$('.bankNum-warning').text('');
			}
			if(companyName_save==''){
				$('.companyName-warning').text('请填写公司名称！');
				return;
			}else{
				$('.companyName-warning').text('');
			}
			if(taxNum_save==''){
				$('.taxNum-warning').text('请填写税号！');
				return;
			}else{
				$('.taxNum-warning').text('');
			}
			if(companyAddress_save==''){
				$('.companyAddress-warning').text('请填写公司地址！');
				return;
			}else{
				$('.companyAddress-warning').text('');
			}
			if(contactCell_save==''){
				$('.contactCell-warning').text('请填写电话号码！');
				return;
			}else{
				$('.contactCell-warning').text('');
			}

			$.ajax({
				type: 'POST',
				url: ctx+'/invoiceInfo/update.html',
				data:{
                  	id:id,
                        bankNum : bankNum_save,
                        bankName : bankName_save,
                        companyName : companyName_save,
                        taxNum : taxNum_save,
                        companyAddress : companyAddress_save,
                        contactCell : contactCell_save,
                        isDefault : isDefault_save
				},
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					 if(data){
                         var result = data.code;
                         if(result == '101'){
                        	 ('开票信息添加成功！');
                        	 $('.class-pop-invoice').hide();
                        	 window.location.reload();
                         }else{
                             if(result == '102'){
                                 layer.msg('保存失败！',{icon:2});
                             }
                         }
                     }
				}
			});
		});
		$('.colse').click(function(){
			$('.class-pop-invoice').hide();
		});
	},
	// 修改开票信息
	_invoiceEdit = function(){
		$('.invoice-setDefault').click(function(){
			var _this = $(this);
			_this.removeAttr('href');//去掉href属性，防止点击后页面置顶
			var invoiceId = _this.attr('invoiceInfoId');
			$.ajax({
				type: 'POST',
				url: ctx+'/invoiceInfo/update.html',
				data:{
					id:invoiceId,
					isDefault:'0'
				},
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					if(data.code=='101'){
						_this.text('默认开票信息').css('background-color','#999');
                        _this.text('默认开票信息').css('color','#fff');
                        _this.text('默认开票信息').css('padding','3px 3px');
                        _this.text('默认开票信息').css('line-height','20px');
                        _this.parents('li').siblings('li').find('.invoice-setDefault').text('设为默认开票信息').css('background-color','transparent');
                        _this.parents('li').siblings('li').find('.invoice-setDefault').text('设为默认开票信息').css('color','#005ea7');
                        _this.parents('li').siblings('li').find('.invoice-setDefault').text('设为默认开票信息').css('padding','0px');
                        _this.parents('li').siblings('li').find('.invoice-setDefault').text('设为默认开票信息').css('line-height','none');
						_this.attr('href','#');//加上href属性
						layer.msg('默认开票信息设置成功', {icon: 1});
					};
				}
			});	
		});
		/*删除开票信息*/
		$('.invoice-delete').click(function(){
			var _this = $(this);
			_this.removeAttr('href');//去掉href属性，防止点击后页面置顶
			var invoiceId = _this.attr('invoiceInfoId');
			$.ajax({
				type: 'POST',
				url: ctx+'/invoiceInfo/delete.html',
				data:{
					id:invoiceId
				},
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					if(data.code=='101'){
						_this.parents('li').remove();
					};
				}
			});	
		});
		/*修改收货地址*/
		$('.address-modify').click(function(){
			
		});
	},
	_usePoint = function(){
		var total_price = parseFloat($('.total-price').text().replace('￥','')).toFixed(2);
		$('.use-point').click(function(){
			if($(this).prop('checked')==true){
				$.ajax({
					type: 'POST',
					url: ctx+'/point/getUserPoint.html',
				    dataType: 'json',
				    error:function(){
						layer.msg("请求网络失败,请重试！",{icon:7});
					},
					success:function(data){
						if(data.result=='success'){
							var point = data.data;
							point = point == null ? 0:point;
							$('.usable-point').text(point);
							$('.point-block').css('display','block');
						}
					}
				});	
			}else{
				
				$('.prompt').hide();//隐藏积分10的倍数提示
				is_point_valid = true;
				$('.submit-order').attr('href','#');
				
				$('.point-block').css('display','none');
				$('.total-price').text('￥'+total_price);
				$('.input-point').val('');
				$('.offset').text('-￥0.00');
			}
		});
		/*输入积分数量*/
		$('.input-point').bind('change',function(){
			if(isNaN($(this).val())){//防止输入法状态下回车输入字母
				$(this).val('');
			}
//			is_point_valid = _validatePoint($(this).val());//校验输入积分数量是否为10的倍数
			_exchange($(this).val(),total_price);//计算积分可兑换成的抵扣额度
		}).keyup(function(){//keyup事件处理 ,禁止输入非数字
			$(this).val($(this).val().replace(/\D|^0/g,''));
			var max_point = parseInt($('.usable-point').text());
			var input_point = parseInt($(this).val());
			if(input_point-max_point>0){//输入积分不可超过可用数量
				$(this).val(max_point);
			}
			is_point_valid = _validatePoint($(this).val());//校验输入积分数量是否为10的倍数
			_exchange($(this).val(),total_price);
		}).bind("paste",function(){ //CTR+V事件处理 
			$(this).val($(this).val().replace(/\D|^0/g,''));
			var max_point = parseInt($('.usable-point').text());
			var input_point = parseInt($(this).val());
			if(input_point-max_point>0){//输入积分不可超过可用数量
				$(this).val(max_point);
			}
			is_point_valid = _validatePoint($(this).val());//校验输入积分数量是否为10的倍数
			_exchange($(this).val(),total_price);
		}).css("ime-mode", "disabled"); //CSS设置输入法不可用
	},
	_exchange = function(point,total_price){//计算积分可兑换成的抵扣额度,并且从总计金额扣除
		if(point != '' && is_point_valid){
			var cash_offset = (parseFloat(point)/100).toFixed(2);//可抵消现金额度
			$('.offset').text('-￥'+cash_offset);
			var new_total_price =  (total_price-cash_offset).toFixed(2);
			$('.total-price').text('￥'+new_total_price);
		}else{
			$('.offset').text('-￥0.00');
			$('.total-price').text('￥'+total_price);
		}
	},
	_validatePoint = function(point){
		var total_price = parseFloat($('.total-price').text().replace('￥','')).toFixed(2);
		var cash_offset = point == '' ? 0 : (parseFloat(point)/100).toFixed(2);//可抵消现金额度
		if(point%10>0 || cash_offset>total_price){
			$('.prompt').show();
			return false;
		}else{
			$('.prompt').hide();
			return true;
		}
	}
	,
	/*提交订单*/
	_submitOrder = function(){
		$('.submit-order').click(function(){//封装订单信息json字符串

			if(!is_point_valid){
				$(this).parent().removeAttr('href');//屏蔽点击置顶效果
				return;
			}else{
				$(this).parent().attr('href','#');
			}

			var address_id = $('.consignee-cont li').find('.selected').siblings('.float-right').find('.address-modify').attr('addressid');
			if($('.consignee-cont li').length==0){
				layer.msg('请添加收货地址！',{icon:3,offset: '200px'});
				return;
			}else{
				address_id = $('.consignee-cont li').find('.item-selected').attr('addressid');
				if(address_id == null){
					layer.msg("请选择收货地址！",{icon:3,offset: '200px'});
					return;
				}
			}
			// //设置选择的开票信息编号
			// if($('.invoiceinfolist-cont li').length == 0){
			// 	layer.msg('请添加订单开票信息',{offset: '100px'},function(){});
			// 	return;
			// }
			var invoiceInfoId =$('.invoiceinfolist-cont li').find('.invoice-selected').attr('invoiceInfoId');
			if(invoiceInfoId==null){
				// layer.msg('请选择订单开票信息',{offset: '100px'},function(){});
				// return;
                invoiceInfoId = '';
			}
			var percentPay = $('#dj-select').val();
			if(percentPay > 100 || percentPay < 0 || percentPay == ""){
                layer.msg('首付比例不得大于100%或小于0%',{offset: '200px'},function(){});
                return;
			}
			var total_price = $('.total-price').text().replace('￥','');
			var order_info = "{'addressId':'"+address_id+"','totalPrice':'"+total_price+"','invoiceInfoId':'"+invoiceInfoId+"','itemInfoList': [";
			var itemInfoList = $('.info-list');
			var flag = false;//公司发票抬头是否填写

			$.each(itemInfoList,function(i,shop){
				var shop_id = $(shop).find('.shop-name').attr('shopid'); 
				var contact_cell = $(shop).find('.shop-contact-cell-name').text();
				var shop_total_price = total_price;
				var message = $(shop).find('.message').val();
				//帐期支付
				var payModel = $(shop).find('.paymode-selected').attr('value');
				var accountPeriod = $(shop).find('.period-selected').attr('period');
				var shop_percentPay = percentPay;
				//帐期支付
				var invoice_title = 0;
				var invoice_type =  2;
//				if(invoice_type == '2' && invoice_title.trim() == ''){
//						flag = true;
//				}
				var input_point = 0;
				var point_offset = 0.00;
				var shop_total_price_offset = 0.00;
				if($('.use-point').prop('checked')==true && i==0){//如果使用积分支付，则对第一个订单产生效果(一个店铺对应一个订单)
					input_point = parseInt($('.input-point').val()==''?0:$('.input-point').val());
					point_offset = parseFloat($('.offset').text().replace('-￥','')).toFixed(2);
					shop_total_price_offset = (shop_total_price-point_offset).toFixed(2);
				}else{
					shop_total_price_offset = shop_total_price;
				}
				order_info = order_info + "{'shopId': '"+shop_id+"','contactCell':'"+contact_cell+"','shopTotalPrice':'"+shop_total_price+"','usePoint':'"+input_point+"','shopTotalPriceOffset':'"+shop_total_price_offset+"','message':'"+message+"','invoiceType':'"+invoice_type+"','invoiceTitle':'"+invoice_title;			
				order_info = order_info +"','payModel':'"+payModel+"','accountPeriod':'"+accountPeriod+"','percentPay':'"+shop_percentPay
				order_info = order_info +"','shopItemList': ["; 
				var shopItemList = $(shop).find('.tube-main-ttr');
				$.each(shopItemList,function(j,item){
					var item_id = $(item).attr('itemid');
					var item_unit_price = $(item).find('.item-unit-price').text();
					var item_count = $(item).find('.item-count').text();
					var item_old_count = $(item).find('.item-count').attr('oldCount');//初始数量（即数据库中的数据）
					if(j==shopItemList.length-1){//最后一个商品
						order_info = order_info + "{'itemId': '"+item_id+"','count':'"+item_count+"','oldCount':'"+item_old_count+"','unitPrice':'"+item_unit_price+"'}";
					}else{
						order_info = order_info + "{'itemId': '"+item_id+"','count':'"+item_count+"','oldCount':'"+item_old_count+"','unitPrice':'"+item_unit_price+"'},";
					}
				});
				if(i==itemInfoList.length-1){
					order_info = order_info +"]}]";
				}else{
					order_info = order_info +"]},";
				}
			});
			order_info = order_info +"}";
			if($("#checkbox_a1").prop('checked')==false){
				layer.msg('只有您同意《商品购买协议》后才能提交订单！！',{offset: '200px'},function(){});
				return;
			}
			var submit_from = $('.submit-from').val();
			//ajax请求提交订单，避免重复提交订单
			$.ajax({
				type: 'POST',
				url: ctx+'/order/submitOrder.html',
				dataType: 'json',
				data:{
					orderInfo:order_info,
					submitFrom:submit_from
				},
				error:function(){
					layer.msg('请求网络失败,请重试！',{icon:7,time:2000,offset: '200px'},function(){});
				},
				success:function(data){
					if(data){
						if(data.code=="101"){
							layer.msg(data.message,{offset: '200px'});
						}else{
							layer.msg(data.message, {icon: 2,time:2000,offset: '200px'});
						}
						window.location.href=ctx+data.data;
					}
				}
			});
			
		});
		$('.invoice-type').click(function(){//发票类型单选
			if($(this).prop('checked')==true){
				$(this).siblings().prop('checked',false);
			}
		});
	},
	_payOrder = function(){
		$('.pay-order').click(function(){
			var no = $('.order-no').text();
			var pay_order_price = parseFloat($('.pay-order-price').text()).toFixed(2);
			var pay_type = $('.paybox').find('input[type=radio]:checked').val();
			//农行支付
			if (pay_type == '4'){
				$("#abcpayform").submit();
			}else{
				$.ajax({
					type: 'POST',
					url: ctx+'/order/payOrder.html',
					data:{
						orderNo:orderNo,
						payType:pay_type
					},
				    dataType: 'json',
				    error:function(){
						layer.msg("请求网络失败,请重试！",{icon:7});
					},
					success:function(data){
						var requestForm = data.data;
						$(requestForm).appendTo("body");
						$("#alipaysubmit").submit();
					}
				});	
			}

		});
	},
	_payBail = function(){
		$('.pay-bail').click(function(){
			var payForType = $(this).attr('payfortype');
			var shopId = $(this).attr('shopid');
			var order_no = $('.order-no').text();
			var pay_order_price = parseFloat($('.pay-order-price').text()).toFixed(2);
			var pay_type = $('.select-pay').find('input[type=radio]:checked').val();
			$.ajax({
				type: 'POST',
				url: ctx+'/order/payBail.html',
				data:{
					orderNo:order_no,
					shopId:shopId,
					payOrderPrice:pay_order_price,
					payType:pay_type,
					payForType:payForType
				},
			    dataType: 'json',
			    error:function(){
					layer.msg("请求网络失败,请重试！",{icon:7});
				},
				success:function(data){
					var requestForm = data.data;
					$(requestForm).appendTo("body");
					$("#alipaysubmit").submit();
//					$(requestForm).submit();
				}
			});	
		});
	};
	_addAddress();
	/*选择收货地址*/
	_addressSelect();
	/*编辑收货地址*/
	_addInvoice();
	/*添加开票信息*/
	_invoiceEdit();
	/*编辑开票信息*/
	_addressEdit();
	/*使用积分*/
	_usePoint();
	/*提交订单*/
	_submitOrder();
	/*支付订单*/
	_payOrder();
	/*支付保证金*/
	_payBail();
});