<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>${empty title?'爱养牛':title}</title>
    <meta charset="utf-8">
    <%@ include file="../common/init.jsp" %>
    <link rel="stylesheet" href="${ctx}/resources/css/base.css"/>
    <link rel="stylesheet" href="${ctx}/resources/js/swfupload/default.css"/>
    <script src="${ctx}/resources/js/main.js"></script>
    <link rel="stylesheet" href="${ctx}/resources/css/jquery.fileupload.css"/>

    <script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/resources/ueditor/ueditor.all.js"></script>
</head>
<body ref="${ctx}" ctx="${ctx}">

<input type="hidden" id="id" value="${item.id}"/>
<input type="hidden" id="defaultnum" value="${defaultnum}"/>

<input id="parentId" type="hidden" value="${item.id}"/>

<%@ include file="../common/head.jsp" %>
<%@ include file="../common/head_web.jsp" %>
<%@ include file="../common/head_seller.jsp"%>
<div class="content content-box clear-float">
    <%@include file="../common/left_menu_seller.jsp" %>
    <div class="seller-center-info float-right">
        <p class="small-nav">
            <a href="#">首页</a>&gt;<a href="#">商品管理</a>&gt;<a href="#">添加新规格商品</a>
        </p>
        <div class="box-content noBorder">
            <div class="upload-pro">
                <p>
                    <label><font style="color: red">*</font>名称:</label>
                    <input id="name" type="text" value="${item.name }"/></p>
                <p>
                    <label><font style="color: red">*</font>副标题:</label>
                    <input id="title" type="text" value="${item.title }"/></p>
                <p><label><font style="color: red">*</font>分类:</label>
                    <select id="classifyOne" class="shortInput" onchange="getClassifyTwo(this.value)">
                        <option value="">请选择</option>
                        <c:forEach items="${classifyOneList}" var="classify">
                            <option value="${classify.id}"
                            <c:if test="${classify.id eq item.classifyOne}">selected="selected"</c:if>
                            >${classify.name}</option>
                        </c:forEach>
                    </select>
                    <select id="classifyTwo" class="shortInput" onchange="getClassifyThree(this.value)">
                        <option value="">请选择</option>
                        <c:forEach items="${classifyTwoList}" var="classify">
                            <option value="${classify.id}"
                            <c:if test="${classify.id eq item.classifyTwo}">selected="selected"</c:if>
                            >${classify.name}</option>
                        </c:forEach>
                    </select>
                    <select id="classifyThree" class="shortInput">
                        <option value="">请选择</option>
                        <c:forEach items="${classifyThreeList}" var="classify">
                            <option value="${classify.id}"
                            <c:if test="${classify.id eq item.classifyThree}">selected="selected"</c:if>
                            >${classify.name}</option>
                        </c:forEach>
                    </select><span class="tips">至少选择前两级分类</span>
                </p>
                <p><label>店铺分类:</label>
                    <select id="shopClassifyId" class="shortInput">
                        <option value="">请选择</option>
                        <c:forEach items="${shopClassifyList}" var="shopClassify">
                            <option value="${shopClassify.id}"
                            <c:if test="${shopClassify.id eq item.shopClassifyId}">selected="selected"</c:if>
                            >${shopClassify.name}</option>
                        </c:forEach>
                    </select><span class="tips">非必填</span>
                </p>
                <p><label>品牌:</label>
                    <select id="brandId" class="shortInput">
                        <option value="">请选择</option>
                        <c:forEach items="${brandList}" var="brand">
                            <option value="${brand.id}"
                            <c:if test="${brand.id eq item.brandId}">selected="selected"</c:if>
                            >${brand.name}</option>
                        </c:forEach>
                    </select><span class="tips">非必填</span>
                </p>
                <p style="display: none;">
                    <label>原价:</label>
                    <input id="old" type="text" posRelaceholder="原价" class="shortInput oldIput" value="${item.old }"
                           onkeyup="checkNum(this)"/>元
                </p>
                <p>
                    <label><font style="color: red">*</font>平台价:</label>
                    <input id="price" type="text" class="shortInput" value="${item.price }" onkeyup="checkNum(this)"/>元
                </p>
                <p>
                    <label><font style="color: red">*</font>单位:</label>
                    <input id="unit" type="text" class="shortInput" value="${item.unit }"/><span
                        class="tips">如：个、千克、吨</span>
                </p>
                <p>
                    <label><font style="color: red">*</font>库存:</label>
                    <input id="stock" type="text" class="shortInput" value="${item.itemStock }" /><span class="tips">如：100、998、3001</span>
                </p>
                <p><label><font style="color: red">*</font>商品规格:</label>
                    <input id="version" type="text" class="shortInput"/>
                    <span class="tips">如：黄色、100升、10*10cm、蛋白≥22等</span>
                </p>
                <p><label style="color:#B6B6B6">已有规格:</label>
                    <c:forEach items="${versionList}" var="versions">
                        <input type="text" class="shortInput shortInputVersion" value="${versions.version }"
                               readonly="readonly"/>
                    </c:forEach>
                </p>
                <p>
                    <label>备注:</label>
                    <input id="remark" type="text" value="${item.remark}"/></p>

                <p>
                <div>
                <label><font style="color: red">*</font>上传商品主图: <font style="color: red">规格：400*400</font></label>
                    <div style="display: inline-block;">
                        <div class="none">
                            <c:forEach begin="0" end="4" var="i">
                                <c:if test="${!empty itemImgList[i]}">
                                    <input type="hidden" id="path${i}" value="${itemImgList[i].img}"/>
                                    <div class="fileinput-button" style="width: 102px;margin-right: 10px;">
												<span>
												<img name="preimages" id="img_${i}" width="100px" height="100px"
                                                     style="border: 1px solid #e4e4e4;"
                                                     src="${itemImgList[i].img}"/></span>
                                        <input name="voucherFile${i}" type="file"/>
                                        <button onclick="delImg(${i})" class="pure-button">删除</button>
                                        <span class="fileupload-process${i}"></span>
                                    </div>
                                </c:if>
                                <c:if test="${empty itemImgList[i]}">
                                    <input type="hidden" id="path${i}" value=""/>
                                    <div class="fileinput-button" style="width: 102px;margin-right: 10px;">
										<span>
										<img name="preimages" id="img_${i}" width="100px" height="100px"
                                             style="border: 1px solid #e4e4e4;"
                                             src="${ctx}/resources/images/adduserimg2.jpg"/></span>
                                        <input name="voucherFile${i}" type="file"/>
                                        <button onclick="delImg(${i})" class="pure-button">删除</button>
                                        <span class="fileupload-process${i}"></span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                </p>

                <p><label><font style="color: red">*</font>默认主图封面:</label>
                    <c:if test="${!empty defaultnum}">
                        <input type="hidden" id="defaultImg" value="${itemImgList[defaultnum].img}"/>
                    </c:if>
                    <c:if test="${empty defaultnum}">
                        <input type="hidden" id="defaultImg" value=""/>
                    </c:if>
                    <select id="imgSelect" class="shortInput" onchange="changeImg(this.value)" value="0">
                        <option value="">请选择</option>
                        <option value="0">图片一</option>
                        <option value="1">图片二</option>
                        <option value="2">图片三</option>
                        <option value="3">图片四</option>
                        <option value="4">图片五</option>

                    </select>

                </p>

                <p>
                    <label style="width:340px;text-align: left;"><font style="color: red">*</font>商品描述<font
                            style="color: red">(若同一产品不同规格则该产品描述一样)</font>:</label>
                    <!-- <button class="hidden" id="cancel3"></button> -->
                    <script id="container" type="text/plain"
                            style="width: 800px; height: 500px; margin: 0px auto;"></script>
                    <!-- 							<div id="fsUploadProgress3" ></div>
                                                <span style="margin-left: 106px;">选择图片：<button id="chooseFile3" ></button></span> -->
                </p>
                <%--
                <p>
                    <c:if test="${item.content eq null}">
                        <span class="bigProImg"></span>
                    </c:if>
                    <c:if test="${item.content != null}">
                        <span class="bigProImg" style="background-image: url(${item.content})"></span>
                    </c:if>

                </p>
                --%>
                <p class="text-center buttonList" style="margin: 20px 0;">
                    <button class="layui-btn button-red layui-btn-big" onclick="add(2)">上架商品</button>
                    <button class="layui-btn button-orange layui-btn-big" onclick="add(1)">放入仓库</button>
                </p>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>
<!-- 底部信息 -->
<script type="text/javascript">

    var ue = UE.getEditor('container', {
        catchRemoteImageEnable: false
    });
    ue.addListener("ready", function () {
        ue.setContent('${item.content}');
    });
    // $(function($){
    // 	var img = $("#imgs").val();
    // 	var imgs = new Array();
    // 	var imgView = "";
    // 	imgs = img.split(",");
    // 	for(var i = 0; i < imgs.length; i++){
    // 		imgView += "<li><img style=\"width: 86px; height: 75px\" alt=\"预览\" src=\"" + imgs[i] +"\"></li>";
    // 	}
    // 	$("#imgsView").html(imgView);
    // });
</script>
<script type="text/javascript" src="${ctx}/resources/js/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/swfupload/fileprogress.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/item.upload.handlers_1.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/item.upload.handlers_2.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/item.upload.handlers_3.js"></script>
<%--
<script type="text/javascript" src="${ctx}/resources/js/item_addVersion.js"></script>
--%>
<script type="text/javascript" src="${ctx}/resources/styleJs/sellerItemAddVersion.js"></script>
<script src="${ctx}/resources/js/jquery.ui.widget.js"></script>
<script src="${ctx}/resources/js/jquery.iframe-transport.js"></script>
<script src="${ctx}/resources/js/jquery.fileupload.js"></script>
<script src="${ctx}/resources/js/jquery.fileupload-process.js"></script>
<script src="${ctx}/resources/js/jquery.fileupload-validate.js"></script>
</body>
</html>