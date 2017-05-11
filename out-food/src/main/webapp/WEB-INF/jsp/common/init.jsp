<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ taglib uri="/tags/fmt" prefix="fmt"%> --%>
<%-- <%@ taglib uri="/tags/fn" prefix="fn"%> --%>
<%-- <%@ taglib uri="/tags/d" prefix="d" %> --%>
<c:set value="<%=request.getContextPath() %>" var="ctx" scope="session" />
<c:set value="http://localhost/" var="server" scope="session" />
<c:set value="zph_校园订餐平台" var="pageTitle" />
<c:set value="zph_校园订餐平台" var="title" />
<meta name="keywords" content="校园订餐">
<meta name="description" content="陈佳 校园订餐  外卖  ">
<meta name="baidu-site-verification" content="hmVFtjq5Oe" />

<!--layui-->
<link rel="stylesheet" href="${ctx}/resources/js/layui/css/layui.css">
<script src="${ctx}/resources/js/layui/layui.js"></script>
<script src="${ctx}/resources/js/layui/lay/dest/layui.all.js"></script>

<!--pure-->
<link rel="stylesheet" href="${ctx}/resources/webFrame/frame/pure-0.6.0/base-min.css">
<link rel="stylesheet" href="${ctx}/resources/webFrame/frame/pure-0.6.0/pure-min.css">
<link rel="stylesheet" href="${ctx}/resources/webFrame/frame/pure-0.6.0/grids-min.css">
<link rel="stylesheet" href="${ctx}/resources/webFrame/frame/pure-0.6.0/grids-responsive-min.css">
<link rel="stylesheet" href="${ctx}/resources/webFrame/frame/pure-0.6.0/grids-responsive-old-ie-min.css">

<script type="text/javascript" src="${ctx}/resources/js/jquery-1.10.2.min.js"></script>
<script>
var ctx='${ctx}';
var server='${server}';
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "//hm.baidu.com/hm.js?c2789f61821dfd03826d7d9fcb2f19ab";
		  var s = document.getElementsByTagName("script")[0]; 
		  s.parentNode.insertBefore(hm, s);
		})();
</script>

