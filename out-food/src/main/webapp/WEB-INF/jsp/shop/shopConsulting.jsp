<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<%@ include file="../common/init.jsp" %>
	<title><c:out value="${pageTitle}"/></title>
	<link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
	<script src="${ctx}/resources/js/main.js"></script>
</head>
<body ctx="${ctx}">
	<%@ include file="../common/head.jsp" %>
	<%@ include file="../common/seller_head.jsp" %>
	<%@ include file="../common/head_seller.jsp" %>
	<div class="content content-box clear-float">
		<%@include file="../common/left_menu_seller.jsp" %>
		<div class="seller-center-info float-right">
			<p class="small-nav">
				<a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx }/order/getShopOrderList.html?status=0">订单管理</a>&gt;<a href="${ctx}/getShopConsulting.html">咨询</a>
			</p>
			<div class="box-content">
				<div class="score-box yellowBg">
					<h3>商铺动态评分</h3>
					<div class="score-leval">
						<span class="score-start">服务态度: <span class="start1"><i></i></span><span id="span2"></span>分</span>
						<span class="score-start">发货速度:<span class="start2"><i></i></span><span id="span3"></span>分</span>
						<span class="score-start">商品质量: <span class="start3"><i></i></span><span id="span4"></span>分</span>
						<input type="hidden" id="detailShopId" value="${shopId }" />
					</div>
				</div>
				<div class="data-box">
					<div class="score-page-tag whiteBg">
					<c:choose>
						<c:when test="${status == 1 || status=='' || status == null }">
							<span class="on"><a id="1" class="allConsultings" href="#">所有咨询(${allCount }) </a></span>
						<span><a id="2" class="allConsultings" href="#">待回复咨询(${playCount })</a></span>
						</c:when>
						<c:otherwise>
							<span><a id="1" class="allConsultings" href="#">所有咨询(${allCount }) </a></span>
							<span class="on"><a id="2" class="allConsultings" href="#">待回复咨询(${playCount })</a></span>
						</c:otherwise>
					</c:choose>
						
					</div>                                            
					<table style="font-size: 12px;">
						<tbody>     
							<tr class="score-page-title">
								<th width="5%">序号</th>
								<th width="35%">咨询商品</th>
								<th width="60%">咨询内容</th>
							</tr>   
						<c:forEach items="${page.records}" var="list" varStatus="status">                                              
							<tr>
								<td>${status.index + 1 }</td>
								<td class="text-left">
								<%-- 	<img src="${list.imgsCover }" class="pro-img"/> --%>
									<em>${list.name }</em>
								</td>
								<td class="text-left">
									<div class="q"><label>${list.userName }：</label>${list.consultingTitle }<span> [<fmt:formatDate value="${list.addTime}" pattern="yyyy-MM-dd HH:mm:ss"/>]</span><i id="${list.id }"  class="send-msg">回复</i>
										<c:if test="${list.content  != null}">
											<div class="a">
												<label>${list.nickName }：<strong>回复 </strong></label>${list.content }<span> [<fmt:formatDate value="${list.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>]</span>
											</div>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="page-box clear-float">
						<!-- <p class="page-list float-right">        
							<a class="previous" href="#">上一页</a>
							<a class="index" href="#">1</a>
							<a class="index" href="#">2</a>
							<a class="index" href="#">3</a>
							<a class="index" href="#">4</a>
							<span>……</span>
							<a class="index" href="#">100</a>
							<a class="index" href="#">下一页</a>
							<span>到第</span>
							<input type="text">
							<span>页</span>
							<button>确定</button>
						</p> -->
						${page.pageBar }
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="pop1" style="display: none;">
		<div class="pop-box w600">
			<h3 class="clear-float">咨询回复<i class="colse sprite float-right"></i></h3>
			<div class="pop-data-list">
				<ul>
					<li style="vertical-align: top;"><label>回复内容:</label>
						
					</li>
					<li>
						<textarea rows="12" cols="70" id="content" name="content"></textarea>
					</li>
				</ul>
				<div id="btn"></div>
			</div>
		</div>
	</div>
	<!-- 底部信息 -->
	<%@ include file="../common/footer.jsp" %>
	<!-- 底部信息 -->
</body>
<script type="text/javascript">
	$("body").on("click",".send-msg",function(){
		var id = this.id;
		var msg = "<button id="+id+" class=\"regBtnAddTopic\"  style=\"margin-left: 40%;\" >回 复</button>";
		$.ajax({
			type:"POST",
			url:"${ctx}/getConsultingReplyById.html",
			data:"id="+id,
			dataType:"json",
			error:function(){
				layer.msg("请求网络失败，请重试！",{icon:7});
			},
			success:function(data){
				if(data == 1){
					layer.msg("该条咨询已经回复，不可重复回复！",{icon:1})
					return false;
				}else{
					$(".pop1").show();
					$("#btn").html(msg);
				}
			}
		});
		
	});
	$('body').on('click','.allConsultings',function(){
		var status;
		if(this.id == 1){
			status = 1;
			$(this).parents('.score-page-tag').find("span:eq(0)").addClass("on"); 
			$(this).parents('.score-page-tag').find("span:eq(1)").removeClass("on"); 
		}else if(this.id == 2){
			status = 2;
			$(this).parents('.score-page-tag').find("span:eq(1)").addClass("on"); 
			$(this).parents('.score-page-tag').find("span:eq(0)").removeClass("on"); 
		}
		$("<form action=\"${ctx}/getShopConsulting.html\" method=\"post\" id=\"updateTopic\" target=\"_self\"><input type=\"hidden\" id=\"status\" name=\"status\" value=\""+status+"\"/></form>").appendTo("body");
		$("#updateTopic").submit();
	});
	$("body").on("click",".colse",function(){
		$(".pop1").hide();
		return false;
	});
	$("body").on("click",".regBtnAddTopic",function(){
		var id = this.id;
		var content = $("#content").val();
		$("<form action=\"${ctx}/updateConsultings.html\" method=\"post\" id=\"updateTopic\" target=\"_self\"><input type=\"hidden\" id=\"upId\" name=\"upId\" value=\""+id+"\"/><input type=\"hidden\" id=\"content\" name=\"content\" value=\""+content+"\"/></form>").appendTo("body");
		$("#updateTopic").submit();
		return false;
	});
</script>
<script type="text/javascript">
		function countSum(val1,val2){
			var width = 1 + val1 * 3 + val2 * 14;
			return width;
		}
		$(document).ready(function() { 
			var detailShopId = $("#detailShopId").val();
			$.ajax({
	    		type:"POST",
	    		url:"${ctx}/getShopComment/data.html",
	    		data:{
	    			shopId:detailShopId
	    		},
	    		dataType:"json",
	    		error:function(){
	    			layer.msg("请求网络失败,请重试！",{icon:7});
	    		},
	    		success:function(data){
	    			var o = eval(data);
	    			
	    			var vagInt1 = Math.floor(parseInt(o[0].starSum));
	    			var width1 = countSum(vagInt1,parseInt(o[0].starSum));
	    			var span1 = Math.round(parseInt(o[0].starSum)*10)/10;
	    			$("#span2").html(span1);
	    			
	    			var vagInt2 = Math.floor(parseInt(o[0].startEnd));
	    			var width2 = countSum(vagInt2,parseInt(o[0].startEnd));
	    			var span2 = Math.round(parseInt(o[0].startEnd)*10)/10;
	    			$("#span3").html(span2);
	    			
	    			var vagInt3 = Math.floor(parseInt(o[0].startService));
	    			var width3 = countSum(vagInt3,parseInt(o[0].startService));
	    			var span3 = Math.round(parseInt(o[0].startService)*10)/10;
	    			$("#span4").html(span3);
	    			
	    			
	    			$(".start1").find("i").css("width",width1);
	    			$(".start2").find("i").css("width",width2);
	    			$(".start3").find("i").css("width",width3); 
	    			
	    		}
	    	})
		}); 
		
	</script>
</html>