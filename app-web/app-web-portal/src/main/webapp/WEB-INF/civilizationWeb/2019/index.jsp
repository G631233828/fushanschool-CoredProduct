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
<title>2019福山外语节－“我和我的祖国”文化周</title>

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
li{
	list-style:none;
}
</style>
<body style=" width:1184px;height:768px; margin:0px auto; ">
	
	<div style="background-image:url(${pageContext.request.contextPath}/assets/web/2019/2019_fushang_bg.jpg); background-repeat:no-repeat;">
	<div style="width:1024px; height:167px;">
		<div class="top">
			<ul>
			<%-- 	<li style="margin-top: -5px;">
				
				<img  src="${pageContext.request.contextPath}/assets/web/2019/2019-fushang-logo.png" /></li>
				 --%>
				<li style="float:right; margin-top: -10px;">
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
											<a href="${pageContext.request.contextPath}/web/civilization/list?isMenu=one&isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
												<span style="color:#FFFFFF;">
												${subm.menuName}
												</span>
											</a>
											</c:when>
											<c:otherwise>
												<!-- 二级菜单 -->
												<a href="${pageContext.request.contextPath}/web/civilization/list?isMenu=one&isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
													<span style="color:#FFFFFF;">
														${subm.menuName}
													</span>
												</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
									<!-- 只有一级菜单 -->
									<a href="${pageContext.request.contextPath}/web/civilization/list?isone=yes&superid=${items.id}&id=${items.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
										<span style="color:#FFFFFF;">
											${subm.menuName}
										</span>
									</a>
									</c:otherwise>
								</c:choose>
									
								
								</div>
								<div style="float:left; width:30px;text-align: center; color:#FFFFFF;"> / </div>
					</c:forEach></c:forEach>
					</c:forEach></c:if>
					</li>
			</ul>
		</div>
	
	</div>
		<div style="width:1184px;height: 200px; margin-top: 380px; text-align: center;" >
				<div >
				<span style="color:#ffffff;font-size:18px; font-weight:bold;margin-left: 180px;">
				<b>外语节活动报道</b>
				</span>
				<ul style="margin-left: 530px;margin-top: 26px;">
				
					 <c:forEach items="${pageList.datas}" var="item" varStatus="status">
						<li style="height: 31px;font-size: 14px;">
						<div style="float: left;">
							<img  height="20px" width="20px" alt="${item.title}" src="${pageContext.request.contextPath}/assets/web/2019/mind_xc.png">
						</div>
						 <div style="float: left;padding-left: 5px; margin-top: 0px;">
							 <a target="_blank" href="${pageContext.request.contextPath}/web/civilization/find?superid=null&id=null&newsId=${item.id}&menuName=${item.title}">
								 <span style=" color: #fff;" title="${item.title}">
								  
								   <c:choose>
										<c:when test="${fn:length(item.title)<20}">
											<font color="#ffffff">${item.title}</font>
										</c:when>
										<c:otherwise>
											<font color="#ffffff">${fn:substring(item.title,0,20)}…</font>
										</c:otherwise>
									</c:choose>
								  
								 </span>
							 </a>
						</div>
						 
						 </li>
					 
					</c:forEach>
					
				</ul>
				
				</div>
		</div>
	</div>
	
</body>
</html>

