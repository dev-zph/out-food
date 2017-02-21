$(function($){
	$.ajax({
		type:"POST",
		url:ctx+"/info/getType.json",
		dataType:"json",
		async:false,
		success:function(data){
			var info='';
			for(var key in data) {
				info+='<ul><li class="about-tit">'+key+'</li>';
				  for(var i in data[key]){  
					  if(data[key][i].url.length>0 ){
						  info+='<li><a href="'+ data[key][i].url+'" target="_blank">'+data[key][i].name+'</a></li>';
					  }else{
						  info+='<li><a href="'+ctx+'/info/detail.html?id='+data[key][i].id+'&type='+data[key][i].contypeId+'">'+data[key][i].name+'</a></li>';
					  }
					   } 
				  info+='</ul>';
			}
			$(".about-info").html(info);
		}
	});
});