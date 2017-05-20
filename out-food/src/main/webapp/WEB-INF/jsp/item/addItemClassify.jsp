<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <%@ include file="../common/init.jsp" %>
            <title>
                <c:out value="${pageTitle}" />
            </title>
             <link href="${ctx}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
			<script src="${ctx}/resources/js/jquery.min.js"></script>
			<link href="${ctx}/resources/css/style.css" rel='stylesheet' type='text/css' />
             <link rel="stylesheet" href="${ctx}/resources/css/webBase.css"/>
            <link rel="stylesheet" href="${ctx}/resources/css/base.css" />
            <link rel="stylesheet" href="${ctx}/resources/js/swfupload/default.css" />
            <link rel="stylesheet" href="${ctx}/resources/css/jquery.fileupload.css" />
                    <script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.config.js"></script>
                    <script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.all.js"></script>
                    
                    
            <link rel="stylesheet" href="${ctx}/resources/js/swfupload/default.css" />
            <link rel="stylesheet" href="${ctx}/resources/css/jquery.fileupload.css" />
            <script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.config.js"></script>
            <script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.all.js"></script>
                    <script src="${ctx}/resources/js/main.js"></script>
    </head>

    <body ref="${ctx}" ctx="${ctx}">
        <!-- 隐藏值区域 -->
        <input type="hidden" id="defaultImg" value="" />

        <%@ include file="../common/head1.jsp" %>
            <%@ include file="../common/seller_head.jsp" %>
                <%@ include file="../common/head_seller.jsp"%>
                    <div class="content content-box clear-float">
                        <%@include file="../common/left_menu_seller.jsp" %>
                            <div class="seller-center-info float-right">
                                <p class="small-nav">
                                    <a href="${ctx}/home.html">首页</a>&gt;<a href="${ctx }/item/toAdd.html">商品管理</a>&gt;<a href="${ctx }/item/toAdd.html">发布商品</a>
                                </p>
                                <div class="box-content">
                                    <div class="upload-pro">
                                        <font style="color: red"></font>
<!--                                         <p> -->
<!--                                             <label><font style="color: red">*</font>商品名称:</label> -->
<!--                                             <input id="name" type="text" /> -->
<!--                                         </p> -->

<!--                                         <p> -->
<!--                                         <label>商品分类:</label> -->
<!--                               				<select id="shopItemClassId" class="shortInput" > -->
<!-- 											<option value="">请选择</option> -->
<%-- 											<c:forEach items="${classList}" var="itemClass"> --%>
<%-- 											<option value="${itemClass.id}">${itemClass.className}</option> --%>
<%-- 											</c:forEach> --%>
<!-- 											</select> -->
<!--                                         </p> -->
                                         <p>
                                            <label><font style="color: red">*</font>分类名称:</label>
                                            <input id="classifyName" type="text" class="shortInput" " /><span class="tips"></span>
                                        </p>
                                        </p>

                                                                    </p>
<!--                             <p> -->
<!-- 								<label>商品图片:</label> -->
<!-- 							    <span class="fileinput-button"> -->
<!-- 								    <span><img width="102px" height="76px" src="../resources/images/addProImg.jpg"/></span> -->
<!-- 								    <input id="itemImg" type="file"  /> -->
<!-- 							    </span> -->
<!-- 							    <span class="fileupload-process"></span> -->
<!-- 							</p> -->
                                    </div>
                                        </script>
                                    </p>
                                    <p class="text-center buttonList" style="margin: 20px 0;">
                                        <button class="layui-btn button-red layui-btn-big" onclick="add(2)">确认添加</button>
                                        <button class="layui-btn button-orange layui-btn-big" onclick="add(1)">取消</button>
                                    </p>
                                </div>
                            </div>
                    </div>
                    </div>
                    <!-- 底部信息 -->
                    <%@ include file="../common/footer.jsp" %>
                        <!-- 底部信息 -->
                        </script>
                        <script type="text/javascript">
                        </script>
                            
                             <script type="text/javascript">
                             function add(status){
                            		var classifyName = $.trim($("#classifyName").val());
                            		$.ajax({
                            			type:"POST",
                            			url:ctx + "/item/addClassify.json",
                            			data : {
                            				classifyName : classifyName
                            			},
                            			dataType:"json",
                            			error:function(){
                            				layer.msg('请求网络失败，请重试!', {icon: 7});
                            			},
                            			success:function(data){
                            				if(data.code == "101"){
                            	                        layer.msg('添加成功！', {icon: 1,time: 2000}, function(index){
                            	                         // window.location.href = $('body').attr('ref') + "/item/toAdd.html";
                            	                        });
                            					
                            				}else if(data.code == "205"){
                            	                        layer.msg('登录过期，需重新登录!', {icon: 2,time: 2000}, function(index){
                            	                         window.location.href = $('body').attr('ref') + "/toLogin.html";
                            	                        });
                            				}else{
                            	                        layer.msg('添加失败，请重试!', {icon: 2});
                            					return false;
                            				}
                            			}
                            		})
                             }
                             </script>
    </body>

    </html>