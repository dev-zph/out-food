function addCartItem() {
	var itemId = $("#itemId").val();
	var buyCount = $("#buyCount").val();
	var shopId = $("#shopId").val();
	$.ajax({
		type: 'POST',
		url: ctx+"/cart/addToCart.json",
		data:{
			itemId : itemId,
			addCount : buyCount
		},
	    dataType: 'json',
	    error:function(){
			layer.msg("请求网络失败,请重试！",{icon:7});
		},
		success:function(data){
			alert("成功");
		}
	});
}