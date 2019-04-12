
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
</head>

<body>

	<div class="wrapper_boxed">

		<div class="site_wrapper">

		

<div class="container">

	<%@include file="public/top.jsp"%>


	<div class="scd clearfix">
	<c:choose>
		<c:when test="${ not empty pm && not empty pm.listPermissionSubMenu}">
		<!-- 当前菜单下的子菜单 -->
			<div class="scd_l">
        	<div class="bg">&nbsp;</div>
        	<div class="title"><span>${pm.menuName}</span></div>
            <ul class="s_nav" style="height: auto;">
             	
	           	<c:forEach items="${pm.listPermissionSubMenu}" var="items" varStatus="status">
	           	
	           	 <li class="dropdown">
	           	 	<c:choose>
	           	 		<c:when test="${not empty items.listPermissionSubMenu}">
	           	 			<a  href="${pageContext.request.contextPath}/web/civilization/list?isMenu=two&isone=yes&superid=${pm.id}&id=${items.id}&moduleId=${items.id}&menuName=${items.menuName}" data-toggle="dropdown" class="dropdown-toggle">${items.menuName}</a>
	           	 			<ul class="dropdown-menu" role="menu">
		                  <c:forEach items="${items.listPermissionSubMenu}" var="subitems" varStatus="status">
		                            <li>
		                            <a style="width:180px;" href="${pageContext.request.contextPath}/web/civilization/list?isMenu=three&isone=yes&superid=${pm.id}&id=${items.id}&moduleId=${subitems.id}&menuName=${subitems.menuName}">
		                            ${subitems.menuName}
		                            </a></li>
		                  </c:forEach>
	                  </ul><!-- end dropdown-menu -->
	           	 		</c:when>
	           	 		<c:otherwise>
	           	 			<a href="${pageContext.request.contextPath}/web/civilization/list?isone=yes&isMenu=three&superid=${superid}&id=${pm.id}&moduleId=${items.id}&menuName=${items.menuName}" data-toggle="dropdown" class="dropdown-toggle">
	           	 			${items.menuName}</a>
	           	 		</c:otherwise>
	           	 	</c:choose>
	                
	          	</li>
	          	
	          	
	          	
	          	
			</c:forEach>
			<li class="dropdown">
	           	 <a href="javascript:history.go(-1)" data-toggle="dropdown" class="dropdown-toggle">返回上一步</a>
	          	</li>
            </ul>
        </div>
		</c:when>
		<c:otherwise>
		<!-- 最新数据信息 -->
		
	<div class="i_ma clearfix" style="max-width:200px;float:left;">
    	<div class="i_mam" style="max-width:200px;">
        	<div class="box_h" style="max-width:230px">
            	<span>热门新闻</span>
            </div>
            <ul class="i_news" style="max-width:200px">
            	<c:forEach items="${listText}" var="news" varStatus="status">
					    <c:if test="${status.count <=6}">
            	<li><a target="_blank" href="${pageContext.request.contextPath}/web/civilization/find?superid=null&id=null&newsId=${news.id}&menuName=${news.title}">
            			 <c:choose>
						<c:when test="${fn:length(news.title)<20}">
							${news.title}
						</c:when>
						<c:otherwise>
							${fn:substring(news.title,0,20)}…
						</c:otherwise>
					</c:choose>
					 <span style="float: right;"> ${news.createDate}</span>
            	</a></li>
            	</c:if>
            	</c:forEach>
            </ul>
        </div>
        </div>
		</c:otherwise>
		
	</c:choose>
	 
        
	        	    <div class="i_mb clearfix" style="width:70%; margin: 0px auto;margin-top: 0px;float: right;">
			       <div class="i_mbr">
			        	<div class="box_h">
			            	<span style="width:auto;">您当前的位置: ${menuName}</span>
			                <a href="" >&nbsp;</a>
			            </div>
			           	  <ul class="i_news" style="width:721px;height: 460px;">
							<c:forEach var="news" items="${newslist.datas}">
			            		<li><a target="_blank"  href="${pageContext.request.contextPath}/web/civilization/find?superid=${superid}&id=${pm.id}&newsId=${news.id}&menuName=${news.title}">
<%-- 			            		<c:if test="${isone=='yes'}"> --%>
<%-- 			            			&lt;${news.moduleName}> --%>
<%-- 			            		</c:if> --%>
			            		
			            		<c:choose>
											<c:when test="${fn:length(news.title)<37}">
												${news.title}
											</c:when>
											<c:otherwise>
												${fn:substring(news.title,0,37)}…
											</c:otherwise>
										</c:choose>
			            		<span style="float: right;"> ${news.createDate}</span>
			            		</a>
			            		</li>
			            	</c:forEach>
			            	
			      <div class="pagination">
			            	
						<a class="navlinks"
							href="${pageContext.request.contextPath}/web/civilization/list?isMenu=${isMenu}&isone=${isone}&pageNo=${newslist.upPage}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}">&lt;
							上一页</a>
						<c:forEach items="${newslist.navigatepageNums}" var="nav">
							<c:choose>
								<c:when test="${nav == pageList.pageNo}">
									<!-- 1当前页面 -->
									<a class="navlinks"
										style="border-color: #eaeef1; background-color: #e8eff0;"
										href="${pageContext.request.contextPath}/web/civilization/list?isMenu=${isMenu}&isone=${isone}&pageNo=${nav}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}">
										${nav}</a>
								</c:when>
								<c:otherwise>
									<a class="navlinks"
										href="${pageContext.request.contextPath}/web/civilization/list?isMenu=${isMenu}&isone=${isone}&pageNo=${nav}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}">
										${nav}</a>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<a class="navlinks"
							href="${pageContext.request.contextPath}/web/civilization/list?isMenu=${isMenu}&isone=${isone}&pageNo=${newslist.nextPage}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}">下一页
							></a>
							
							
							 每页显示${newslist.pageSize}行 － 当前页${newslist.pageNo}页 － 共${newslist.totalPage}页
					</div> 
			            </ul>
			            
			            </div>
			            
			           
			            
		        </div>
    </div>
</div>

  		
</div>




			<div class="clearfix"></div>
			<%@include file="public/footer.jsp"%>
			
		</div>
<!-- accordion -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/web/civilization/js/accordion/custom.js"></script>

<!-- REVOLUTION SLIDER -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/web/civilization/js/revolutionslider/rs-plugin/js/custom.js"></script>
</body>
</html>

