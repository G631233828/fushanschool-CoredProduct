<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>2016福山外语节－迪士尼文化周</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/web/title.ico">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/web/civilization/Assets/css/reset.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/web/civilization/Assets/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/web/civilization/Assets/plugins/FlexSlider/jquery.flexslider.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/web/civilization/Assets/plugins/FlexSlider/flexslider.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/web/civilization/Assets/js/js_z.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/web/civilization/Assets/css/thems.css">
<script >
	$(function() {
		$('.flexslider').flexslider({
			animation : "slide"
		});
	});
</script>

<body>


<div class="wrapper_boxed">

<div class="site_wrapper">

<%@include file="public/top.jsp"%>
<div class="clearfix"></div>

<!-- Contant
======================================= -->



<div class="clearfix"></div>

<div class="container" style="text-align: center;">
<br><br>
		<h3>
			${news.title}
		</h3>
		<ul class="post_meta_links" style="margin-left: 30%">
			<li class="post_by">发布者：<a href="#">${news.author }</a></li>
			<li class="post_categoty">访问量：<a href="#">${news.browseTimes}</a></li>
			<li class="post_comments">发布日期：<a href="#"><fmt:formatDate value="${news.createTime}" type="both" /></a></li>
		</ul>

		<div class="post_info_content" style="text-align: left;">
			<c:out value="${news.content}" escapeXml="false"/>	
			
<%-- 			<c:if test="${not empty news.bananerPic }"> --%>
<%-- 				<img src="${pageContext.request.contextPath}/files/${news.bananerPic}" alt=""/> --%>
<%-- 			</c:if>						 --%>
		</div>



</div>


<div class="clearfix margin_top4"></div>
      <%@include file="public/footer.jsp"%> 
</div>
</div>

</body>
</html>
