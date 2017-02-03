function addCartItem() {
	var itemId = $("#itemId").val();
	var buyCount = $("#buyCount").val();
	var shopId = $("#shopId").val();
	$.ajax({
		type: 'POST',
		url: ctx+"/cart/addToCart.json",
		data:{
			itemId : itemId,
			addCount : buyCount,
			shopId : shopId
		},
	    dataType: 'json',
	    error:function(){
			layer.msg("请求网络失败,请重试！",{icon:7});
		},
		success:function(data){
			if(data.code=="101"){alert(data.message);}
			else if(data.code=="102"){alert(data.message);}
			else{layer.msg("系统错误！",{icon:7});}
		}
	});
}