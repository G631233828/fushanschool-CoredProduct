<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>2017福山外语节－儿童的世界.世界的儿童</title>

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
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

body {
	overflow-y: scroll;
	font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
		"Helvetica Neue", Helvetica, sans-serif;
	background: #f4f4f4;
	padding: 0;
	margin: 0;
}

a, a:hover {
	border: none;
	text-decoration: none;
}

img, a img {
	border: none;
}

.clear {
	clear: both;
}

/* gallery */
.zoomed>.gallery {
	-webkit-filter: blur(3px);
	filter: blur(3px);
}

.gallery {
	width: 800px;
	margin: 20px auto;
}

.gallery li {
	float: left;
	margin: 10px;
	width: 80px;
	height: 80px;
}

.gallery li:nth-child(6n) {
	padding-right: 0;
}

.gallery li a, .gallery li img {
	float: left;
}
</style>

<!--图片弹出层样式 必要样式-->
<link rel="stylesheet"  href="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/Assets/css/zoom.css" media="all" />
</head>

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
			<li class="post_by">发布者：${news.author }</li>
			<li class="post_categoty">访问量：${news.browseTimes}</li>
			<li class="post_comments">发布日期：<fmt:formatDate value="${news.createTime}" type="both" /></li>
		
		</ul>
		<c:if test="${fn:length(news.source) > 10}">
			
			<p style="text-align: center;">
				来源： 
				<a href="${news.source}" target="_blank">
					${news.source}
				</a>
			</p>
			
		</c:if>
		
		<div class="post_info_content" style="text-align: left;">
			<c:out value="${news.content}" escapeXml="false"/>	
			
		</div>

		  <div class="gallery">	 
			<ul>
			  <c:if test="${not empty news.fileList }">

			<c:forEach var="mrFile" items="${news.fileList}">
					<li><a href="${pageContext.request.contextPath}/uploadmr/${mrFile.generateName}">
					<img style="width: 69px;height: 69px;" src="${pageContext.request.contextPath}/uploadmr/${mrFile.generateName}" />
					</a></li>
				</c:forEach>
				</c:if>
				<!--此处做为备用 -->
				<li><a></a></li>
			</ul>
			 <div class="clear"></div>
		</div>
		

</div>


<div class="clearfix margin_top4"></div>
      <%@include file="public/footer.jsp"%> 
</div>
</div>
<script src="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/Assets/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/Assets/js/zoom.min.js"></script>
</body>
</html>
