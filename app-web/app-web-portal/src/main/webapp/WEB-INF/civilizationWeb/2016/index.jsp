<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en-gb" class="no-js">
<!--<![endif]-->

<head>
<title>2016福山外语节－迪士尼文化周</title>

<meta charset="utf-8">
<meta name="keywords" content="" />
<meta name="description" content="" />
<!-- Favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/web/title.ico">
<!-- this styles only adds some repairs on idevices  -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath}/assets/web/civilization/css/ip.css"
	rel="stylesheet">
<style type="text/css">
a{
text-decoration:none;
}
</style>
<body style=" width:1024px; margin:0px auto;">
	<div
		style="<%-- background-image:url(${pageContext.request.contextPath}/assets/web/civilization/images/in_01.gif); --%> background-repeat:no-repeat;width:1024px; height:167px;">
		<div class="top">
			<ul>
				<li><%-- <img src="${pageContext.request.contextPath}/assets/web/civilization/images/logo.png" /> --%></li>
				<li style="margin-left: 80px;">
					<c:if test="${ not empty sessionScope.fuShangSchoolSession}">
					<c:forEach items="${sessionScope.fuShangSchoolSession}" var="superItem" varStatus="status">
						<c:forEach items="${superItem.listMenu}" var="items" varStatus="status">
							<c:forEach items="${items.listPermissionSubMenu}" var="subm" varStatus="status">
								<div style="float:left;">
								<c:choose>
									<c:when test="${subm.menuType == 2}">
									<!-- 三级菜单 -->
										<c:choose>
											<c:when test="${subm.menuName == '学科专项研究' }">
											<a href="${pageContext.request.contextPath}/web/civilization/${year }list?isMenu=one&isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
												<span style="color:#fff;">
												${subm.menuName}
												</span>
											</a>
											</c:when>
											<c:otherwise>
												<!-- 二级菜单 -->
												<a href="${pageContext.request.contextPath}/web/civilization/${year }list?isMenu=one&isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
													<span style="color:#fff;">
														${subm.menuName}
													</span>
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
									<!-- 只有一级菜单 -->
									<a href="${pageContext.request.contextPath}/web/civilization/${year }/list?isone=yes&superid=${items.id}&id=${items.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
										<span style="color:#fff;">
											${subm.menuName}
										</span>
									</a>
									</c:otherwise>
								</c:choose>
									
								
								</div>
								<div style="float:left; width:30px;text-align: center;"> / </div>
					</c:forEach></c:forEach>
					</c:forEach></c:if>

					</li>
			</ul>
		</div>
	</div>
	<div
		style="background-image:url(${pageContext.request.contextPath}/assets/web/civilization/images/in_13.jpg);background-repeat:no-repeat; width:1024px; height:593px;">
		<img
			src="${pageContext.request.contextPath}/assets/web/civilization/images/in_03.gif"
			align="right">
		<div class="bm">
			<ul>
				<li
					style="color:#990; font-size:18px; font-weight:bold; background-image:url(${pageContext.request.contextPath}/assets/web/civilization/images/in_04.jpg); background-repeat:no-repeat; width:461px; height:54px;"><br />
					<center>
						外语节报道
					</center>
					</li>
					
					 <c:forEach items="${pageList.datas}" var="item" varStatus="status">
						<li style="height: 31px;font-size: 14px;">
						<div style="float: left;">
							<img  height="20px" width="20px" alt="${item.title}" src="${pageContext.request.contextPath}/assets/web/2018/mind_xc.png">
						</div>
						 <div style="float: left;padding-left: 5px;margin-top: 5px;">
							 <a target="_blank" href="${pageContext.request.contextPath}/web/civilization/${year}/find?superid=null&id=null&newsId=${item.id}&menuName=${item.title}">
								 <span style="vertical-align:text-top;" title="${item.title}">
								  
								   <c:choose>
										<c:when test="${fn:length(item.title)<20}">
											${item.title}
										</c:when>
										<c:otherwise>
											${fn:substring(item.title,0,20)}…
										</c:otherwise>
									</c:choose>
								  
								 </span>
							 </a>
						</div>
						 
						 </li>
					 
					</c:forEach>
				
				<li
					style="background-image:url(${pageContext.request.contextPath}/assets/web/civilization/images/in_15.gif); background-repeat:no-repeat">
			</ul>
		</div>
	</div>
</body>
</html>

