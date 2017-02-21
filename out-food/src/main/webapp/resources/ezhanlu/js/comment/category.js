$(function(){
		$.ajax({
			type : "post",
			url : ctx+"/item/getItemMenu.html",
			dataType : "json",
			async : false,
			success : function(data) {
				var mstr="<div class=\"sidebar01\" style=\"display:none;\">";
				mstr+="<div class=\"sidebar-left fl\">";
				mstr+="<div class=\"sidebar-left-menu fl\"><ul>";
				var listTwo=[];  
				var iconIndex = 1;
				for (var  i = 0; i < data.length; i++) {
					oClassify ={};
	 				if (data[i].parentId== 0) {
						var iconIndexString;
						if(iconIndex<10){
							iconIndexString="0"+iconIndex;
						}else{
							iconIndexString=iconIndex;
						}
						mstr+="<li class=\"oneClass\"  id=\""+data[i].id+"\"><i class=\"icon icon-menu-"+ iconIndexString + " \"></i>"+data[i].name+"</li>";
						oClassify.id=data[i].id;
						oClassify.name=data[i].name;
						oClassify.parentId=data[i].parentId;
						listTwo.push(oClassify);
						iconIndex++;
					} 
				}
				mstr+="</ul></div><div class=\"sidebar-left-sub fl\">";
				for (var j = 0; j < listTwo.length; j++) {
					mstr+="<div class=\"sub-box\">";
					for (var i = 0; i < data.length; i++) {
						if (listTwo[j].id==data[i].parentId) {
							mstr+="<div class=\"sub-b-tit\"><a id="+ data[i].id;
							mstr+=" class=\"twoClass\" href=\"javascript:;\" style=\"color: #424242;\">"+ data[i].name+ "</a></div>";
							mstr+="<div class=\"sub-b-list\">";
							for (var k = 0; k <data.length; k++) {
								if (data[k].parentId==data[i].id) {
									mstr+= "</a>&nbsp;|&nbsp;";
									mstr+="<a id="+ data[k].id+ " class=\"threeClass\" href=\"javascript:;\" style=\"color: #424242;\">"+ data[k].name;
									
								}
							}
							mstr+="</div>";
						}
					}
					mstr+="</div>";
				}
				mstr+="</div></div></div>";
				$("#indexMenu").html(mstr);
				if($(window).width()>1190){
					var rightzhi=($(window).width()-1190)/2;
				}else{
					var rightzhi=0;
				}
				 $(".sidebar01").css("left",rightzhi+"px");
				 $(window).resize(function(){
					if($(window).width()>1190){
						var rightzhi=($(window).width()-1190)/2;
					}else{
						var rightzhi=0;
					}
					$(".sidebar01").css("left",rightzhi+"px");
				});
				 $(".categories").hover(
					  function () {
					    $(".sidebar01").show();
					  },
					  function () {
					    $(".sidebar01").hide();
					  }
					  );
				$(".sidebar01").hover(
				  function () {
				    $(".sidebar01").show();
				  },
				  function () {
				    $(".sidebar01").hide();
				  }); 
				$(".sidebar-left-menu li").hover(
					  function () {
					   	var index=$(this).index();
						$('.sub-box').eq(index).show();
					  },
					  function () {
					    var index=$(this).index();
						$('.sub-box').eq(index).hide();
					  }
					);
					$(".sub-box").hover(
					  function () {
					  	var index=$(this).index();
					  	$(".sidebar-left-menu li:eq("+index+")").addClass("active");
					   	$(this).show();
					  },
					  function () {
					  	var index=$(this).index();
					  	$(".sidebar-left-menu li:eq("+index+")").removeClass("active");
					    $(this).hide();
					  }
					);
			}
		});
});