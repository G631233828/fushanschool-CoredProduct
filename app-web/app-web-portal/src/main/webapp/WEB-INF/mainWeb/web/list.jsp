<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<script src="${pageContext.request.contextPath}/assets/web/mainWeb/js/jq1.js"></script>

<body>

	<%@include file="webPublic/top.jsp"%>

	<div class="sy_xw">
		<div class="main_box main_box_style1">
			<div class="main_box_inner">
				<div class="main_box_inner_left">
					<%@include file="webPublic/subleft.jsp"%>
				</div>
				<div class="main_box_inner_right">
					<div class="current_location current_location_547">
						<ul>
							<li class="current_location_1">当前位置：
							<a target="_blank"  href="${pageContext.request.contextPath}/web/index"/>首页</a> 
							 &gt;<a class="cl_1">
							 <c:if test="${isone !='yes'}">
							  ${pm.menuName}&gt;
							 </c:if>
							 ${param["menuName"]}</a> 
							</li>
						</ul>
					</div>
					<div class="sublanmu_box sublanmu_box_547">
						<div class="sublanmu_content sublanmu_content_article">
							<ul class="article">
								<c:forEach var="news" items="${newslist.datas}">
									<li><span class="title"> <a target="_blank" 
											href="${pageContext.request.contextPath}/web/find?superid=${superid}&id=${pm.id}&newsId=${news.id}&menuName=${news.title}"
											 title="${news.title}" style="">
												<c:choose>
														<c:when test="${fn:length(news.title)<38}">
															${news.title}
														</c:when>
														<c:otherwise>
															${fn:substring(news.title,0,38)}…
														</c:otherwise>
												</c:choose> 
												
												</a></span> <span class="date"> ${news.createDate}</span></li>
								</c:forEach>
							</ul>

						</div>
						
						
						
						<!-- 分页功能 -->
						<div class="pager" style="text-align: center;">
						<small class="text-muted inline m-t-sm m-b-sm" style="float: left;">
							 每页显示${newslist.pageSize}行 － 当前页${newslist.pageNo}页 － 共${newslist.totalPage}页
						</small>
						
						<c:if test="${not empty newslist.navigatepageNums}">
						<a href="${pageContext.request.contextPath}/web/list?isone=${isone}&pageNo=1&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}" class="extend">第一页</a>
						<a href="${pageContext.request.contextPath}/web/list?isone=${isone}&pageNo=${newslist.upPage}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}">上一页</a>
						
						<c:forEach items="${newslist.navigatepageNums}" var="nav">
                        <c:choose>
                        	<c:when test="${nav == newslist.pageNo}">
								<a href="#" class="current">${nav}</a>
							</c:when>
                        	<c:otherwise>
	                        	<a href="${pageContext.request.contextPath}/web/list?isone=${isone}&pageNo=${nav}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}">
	                        	${nav}</a>
                        	</c:otherwise>
                        </c:choose>
                        </c:forEach>
                        
						<a href="${pageContext.request.contextPath}/web/list?isone=${isone}&pageNo=${newslist.nextPage}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}">下一页</a>
						<a href="${pageContext.request.contextPath}/web/list?isone=${isone}&pageNo=${newslist.totalPage}&superid=${superid}&id=${id}&moduleId=${moduleId}&menuName=${pm.menuName}" class="extend">最后一页</a>
					</c:if>
			</div>
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
