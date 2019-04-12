




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
<title>2018福山外语节－“中国改革开放四十周年”文化周</title>

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

			<%@include file="public/top.jsp"%>

	

<div class="m_bg">
	<div class="scd clearfix">
            
		<div class="m_bg" style="width:200px;min-width:200px;float: left;padding-top: 0px;">
	<div class="i_ma clearfix" style="width:200px">
    	<div class="i_mam" style="width:200px">
        	<div class="box_h" style="width:230px">
            	<span>精心推送</span>
            </div>
            <ul class="i_news" style="width:200px">
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
        </div>
	 
        
        	<div class="scd_r">
	        	    <div class="i_mb clearfix" style="width:auto; margin: 0px auto;margin-top: 0px;">
			        <div class="i_mbr">
			        	<div class="box_h">
			            	<span style="width:auto;">查询信息</span>
			                <a href="" >&nbsp;</a>
			            </div>
			           	  <ul class="i_news" style="width:721px;height: 460px;">
							<c:forEach var="news" items="${newslist.datas}">
			            		<li><a target="_blank"  href="${pageContext.request.contextPath}/web/civilization/find?superid=${superid}&id=${pm.id}&newsId=${news.id}&menuName=${news.title}">
			            		<c:if test="${isone=='yes'}">
			            			&lt;${news.moduleName}>
			            		</c:if>
			            		
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
							href="${pageContext.request.contextPath}/web/civilization/select?pageNo=${newslist.upPage}&name=${name}">&lt;
							上一页</a>
						<c:forEach items="${newslist.navigatepageNums}" var="nav">
							<c:choose>
								<c:when test="${nav == pageList.pageNo}">
									<!-- 1当前页面 -->
									<a class="navlinks"
										style="border-color: #eaeef1; background-color: #e8eff0;"
										href="${pageContext.request.contextPath}/web/civilization/select?pageNo=${nav}&name=${name}">
										${nav}</a>
								</c:when>
								<c:otherwise>
									<a class="navlinks"
										href="${pageContext.request.contextPath}/web/civilization/select?pageNo=${nav}&name=${name}">
										${nav}</a>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<a class="navlinks"
							href="${pageContext.request.contextPath}/web/civilization/select?pageNo=${newslist.nextPage}&name=${name}">下一页
							></a>
							
							
							 每页显示${newslist.pageSize}行 － 当前页${newslist.pageNo}页 － 共${newslist.totalPage}页
					</div> 
			            </ul>
			            
			            </div>
			            
			           
			            
		        </div>
		        </div>
    </div>
</div>

  		
</div>




			<div class="clearfix"></div>
			<%@include file="public/footer.jsp"%>
			
		</div>
	</div>
<!-- accordion -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/web/civilization/js/accordion/custom.js"></script>

<!-- REVOLUTION SLIDER -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/web/civilization/js/revolutionslider/rs-plugin/js/custom.js"></script>
</body>
</html>

