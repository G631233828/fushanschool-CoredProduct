<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>奉贤区四团小学</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/web/title.ico">
<style type="text/css">
img.wp-smiley, img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/web/mainWeb/style/style2.css" />
<link
	href="${pageContext.request.contextPath}/assets/web/mainWeb/e/templates/150714/style.css"
	type="text/css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/assets/web/mainWeb/js/jq.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/web/mainWeb/js/jq1.js"></script>
</head>

<body>

	<%@include file="webPublic/top.jsp"%>

	<div class="sy_xw">
		<div class="main_box main_box_style1">
			<div class="main_box_inner">
					<div class="current_location current_location_564">
						<ul>
							<li class="current_location_1">当前位置：
							<a href="${pageContext.request.contextPath}/web/index"/>首页</a> &gt;
							${pm.menuName} &gt;
							${menuName}&gt; 
							 </li>
							<li class="current_location_2">详细信息</li>
						</ul>
					</div>
					<div class="sublanmu_box sublanmu_box_564">
						<div class="sublanmu_content sublanmu_content_introduct">
							<!-- 标题，作者 -->
							<div>
								<div style="text-align: center;"><h1>${news.title}</h1></div>
								<div style="font-size: 10px;color: rgb(158, 151, 151);">
									<div style="float: left;padding-left: 15%;">发布者：${news.author}</div>
									<div style="float: left;padding-left: 20%;">日期：<fmt:formatDate value="${news.createTime}" type="both" /></div>
									
									<div style="float:right;padding-right: 15%;">访问量：${news.browseTimes}</div>
								</div>
								<br><br>
							</div>
							<!-- 详细内容信息 -->
							<c:out value="${news.content}" escapeXml="false"/>
<%-- 							<c:if test="${not empty news.bananerPic }"> --%>
<%-- 								<img src="${pageContext.request.contextPath}/files/${news.bananerPic}" alt=""/> --%>
<%-- 							</c:if>	 --%>
					</div>
				</div>
			</div>
			<div class="clear main_box_inner_bottom"></div>
		</div>



	</div>
<%@include file="webPublic/footer.jsp" %>
	<script
		src="${pageContext.request.contextPath}/assets/web/mainWeb/js/d1.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/web/mainWeb/js/d2.js"></script>
</body>
</html>
