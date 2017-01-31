$('.submit-order').click(function() {
	var address = $("#address").val();
	var shopId = $("#shopId").val();
	if ($("#checkbox_a1").prop('checked') == false) {
		layer.msg('只有您同意《商品购买协议》后才能提交订单！！', {
			offset : '200px'
		}, function() {
		});
		return;
	}
	$.ajax({
		type : 'POST',
		url : ctx + '/order/submitOrder.html',
		dataType : 'json',
		data : {
			address : address,
			shopId : shopId
		},
		error : function() {
			layer.msg('请求网络失败,请重试！', {
				icon : 7,
				time : 2000,
				offset : '200px'
			}, function() {
			});
		},
		success : function(data) {
		}
	});
})

function deleteCart(id) {
	$.ajax({
		type : 'POST',
		url : ctx + '/cart/deleteCart.html',
		dataType : 'json',
		data : {
			cartId : id
		},
		error : function() {
			layer.msg('请求网络失败,请重试！', {
				icon : 7,
				time : 2000,
				offset : '200px'
			}, function() {
			});
		},
		success : function(data) {
			if (data) {
				if (data.code == '101') {// 如果成功
					layer.msg(data.message, {
						icon :  2
					});
					window.location.reload();
				} else if (data.code == '102') {
					layer.msg(data.message, {
						icon :  2
					});
				} else {
					layer.msg('请求网络失败,请重试！', {
						icon : 7,
						time : 2000,
						offset : '200px'
					}, function() {
					});
				}
			}
		}
	});
}
//赋值
function getAddress() {
	var address = $("#address").val();
	document.getElementById("addressName").innerText = address;
}