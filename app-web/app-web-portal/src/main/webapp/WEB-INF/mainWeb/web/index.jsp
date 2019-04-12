<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>奉贤区四团小学</title>

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/web/title.ico">
	
	
<style type="text/css">
img.wp-smiley,img.emoji {
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


<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/mainWeb/style/style2.css" />
<link href="${pageContext.request.contextPath}/assets/web/mainWeb/e/templates/150714/style.css" type="text/css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/assets/web/mainWeb/js/jq.js"></script>
<script src="${pageContext.request.contextPath}/assets/web/mainWeb/js/jq1.js"></script>
</head>

<body>

<%@include file="webPublic/top.jsp" %>

<div class="sy_xw">
  <div class="sy_xw_1">
  	<%@include file="webPublic/IndexImg.jsp" %>
  </div>
   <c:forEach items="${listWMB}" var="items" varStatus="status">
  <c:if test="${items.name == '校园新闻' }">
    <div class="sy_xw_2">
    <div class="tit">
      <span class="a">校园新闻</span><span class="b">
      <a target="_blank"  href="${pageContext.request.contextPath}/web/list?superid=${items.superDirectory}&id=${items.sameDirectory}&moduleId=${items.id}&menuName=${items.name}">
      more+</a></span>
    </div>
    <div><div class="article">
<ul>

   <c:forEach items="${items.listNew}" var="news" varStatus="status">
    <c:if test="${status.count <=7}"><!--第一个资源只要一张图片，然后跳出循环 -->
  	<li><span class="title">
		<a target="_blank"  href="${pageContext.request.contextPath}/web/find?superid=${items.superDirectory}&id=${items.sameDirectory}&newsId=${news.id}&menuName=${news.title}" 
		target="_self" title="${news.title}" style="">
		<c:choose>
				<c:when test="${fn:length(news.title)<18}">
					${news.title}
				</c:when>
				<c:otherwise>
					${fn:substring(news.title,0,18)}…
				</c:otherwise>
		</c:choose>
		
		</a></span>
		<span class="date">${news.createDate}</span>
	</li>
	</c:if>
	</c:forEach>
</ul></div>
</div>
  </div>
 	</c:if>
  </c:forEach> 
  
  
  
<div class="sy_xw_3">
	<a target="_blank" href="${pageContext.request.contextPath}/user/login">
	    <div class="sy_3_0" style="padding-top: 20px;">
	     <div class="sy_3_1">
	       <div>校园办公</div>
	       <div style="color:#826682">Campus office</div>
	     </div>
     </a>
     <a target="_blank" href="../../cored-repository/index">
	     <div class="sy_3_2">
	       <div>资源库</div>
	       <div  style="color:#826682">The repository</div>
	     </div>
     </a>
     <a target="_blank" href="../../sysgallery/web/index">
	     <div class="sy_3_3">
	       <div>图片系统</div>
	       <div style="color:#826682;">Image system</div>
	     </div>
     </a>
    </div>
    
    
   </div>
</div>

<div  class="sy_xw">
	<img alt=""  src="${pageContext.request.contextPath}/assets/web/mainWeb/image/ye.png">
</div>



<div class="sy_xw">
  <c:forEach items="${listWMB}" var="items" varStatus="status">
  <c:if test="${items.name == '每周工作' }">
<div class="sy_xw_1">
    <div class="tit">
      <span class="a">每周工作</span><span class="b">
       <a target="_blank"  href="${pageContext.request.contextPath}/web/list?superid=${items.superDirectory}&id=${items.sameDirectory}&moduleId=${items.id}&menuName=${items.name}">
      more+</a></span>
    </div>
    <div><div class="article">
<ul>

   <c:forEach items="${items.listNew}" var="news" varStatus="status">
    <c:if test="${status.count <=7}"><!--第一个资源只要一张图片，然后跳出循环 -->
  	<li><span class="title">
		<a target="_blank"  href="${pageContext.request.contextPath}/web/find?superid=${items.superDirectory}&id=${items.sameDirectory}&newsId=${news.id}&menuName=${news.title}" 
		target="_self" title="${news.title}" style="">
		<c:choose>
				<c:when test="${fn:length(news.title)<18}">
					${news.title}
				</c:when>
				<c:otherwise>
					${fn:substring(news.title,0,18)}…
				</c:otherwise>
		</c:choose>
		</a></span>
		<span class="date">${news.createDate}</span>
	</li>
	</c:if>
	</c:forEach>

</ul></div>
</div>
  </div>
	</c:if>
  </c:forEach>

 <c:forEach items="${listWMB}" var="items" varStatus="status">
  <c:if test="${items.name == '各类通知' }">
    <div class="sy_xw_1">
    <div class="tit">
      <span class="a">各类通知</span><span class="b">
      <a target="_blank"  href="${pageContext.request.contextPath}/web/list?superid=${items.superDirectory}&id=${items.sameDirectory}&moduleId=${items.id}&menuName=${items.name}">
      more+</a></span>
    </div>
    <div><div class="article">
<ul>
   <c:forEach items="${items.listNew}" var="news" varStatus="status">
    <c:if test="${status.count <=7}"><!--第一个资源只要一张图片，然后跳出循环 -->
  	<li><span class="title">
		<a target="_blank"  href="${pageContext.request.contextPath}/web/find?superid=${items.superDirectory}&id=${items.sameDirectory}&newsId=${news.id}&menuName=${news.title}" 
		target="_self" title="${news.title}" style="">
		<c:choose>
				<c:when test="${fn:length(news.title)<18}">
					${news.title}
				</c:when>
				<c:otherwise>
					${fn:substring(news.title,0,18)}…
				</c:otherwise>
		</c:choose>
		
		</a></span>
		<span class="date">${news.createDate}</span>
	</li>
	</c:if>
	</c:forEach>
  
</ul></div>
</div>
  </div>
	</c:if>
  </c:forEach>
  
  

 <c:forEach items="${listWMB}" var="items" varStatus="status">
  <c:if test="${items.name == '教研科研' }">
  <div class="sy_xw_2">
    <div class="tit">
      <span class="a">教师发展</span><span class="b">
      <a target="_blank"  href="${pageContext.request.contextPath}/web/list?superid=${items.superDirectory}&id=${items.sameDirectory}&moduleId=${items.id}&menuName=${items.name}">
      more+</a></span>
    </div>
    <div><div class="article">
<ul>

   <c:forEach items="${items.listNew}" var="news" varStatus="status">
    <c:if test="${status.count <=7}"><!--第一个资源只要一张图片，然后跳出循环 -->
  	<li><span class="title">
		<a target="_blank"  href="${pageContext.request.contextPath}/web/find?superid=${items.superDirectory}&id=${items.sameDirectory}&newsId=${news.id}&menuName=${news.title}" 
		target="_self" title="${news.title}" style="">
		<c:choose>
				<c:when test="${fn:length(news.title)<18}">
					${news.title}
				</c:when>
				<c:otherwise>
					${fn:substring(news.title,0,18)}…
				</c:otherwise>
		</c:choose>
		
		</a></span>
		<span class="date">${news.createDate}</span>
	</li>
	</c:if>
	</c:forEach>

</ul></div>
</div>
  </div>

	</c:if>
  </c:forEach>
</div>




<div id="Categories_hd">
      <div class="Categories_hd_in">
           <b>特色网站</b>
           <p>our services / products</p>
      </div>
</div>
<div id="Categories_bd" style="padding: 0px 0;">
	<div class="Categories_bd_in">
    	<a target="_blank" href="${pageContext.request.contextPath}/web/civilization/index">
            <span>
            <div class="hold"> </div>
            <img src="${pageContext.request.contextPath}/assets/web/mainWeb/image/vertical-logo5.jpg" />
            </span>
             <h2>文明创建</h2>
         </a>
         <a target="_blank"  href="${pageContext.request.contextPath}/web/feature/index#">
            <span>
            <div class="hold"> </div>
            <img src="${pageContext.request.contextPath}/assets/web/mainWeb/image/vertical-logo4.jpg" />
            </span>
             <h2>校园特色课程</h2>
         </a>
         <a target="_blank" href="${pageContext.request.contextPath}/web/ruralChildrenPalace/index">
            <span>
            <div class="hold"> </div>
            <img src="${pageContext.request.contextPath}/assets/web/mainWeb/image/vertical-logo3.jpg" />
            </span>
             <h2>乡村少年宫</h2>
         </a>
         <a target="_blank" href="${pageContext.request.contextPath}/web/messageRepositoryWeb/index">
            <span>
            <div class="hold"> </div>
            <img src="${pageContext.request.contextPath}/assets/web/mainWeb/image/vertical-logo2.jpg" />
            </span>
             <h2>微视频</h2>
         </a>
         
	</div>
</div>




<div id="full_bigpic" style="text-align: center;">
      <div class="full_bigpic_hd">
         <h2><b>校园<a>活动</a>展示</b>
          <p>Campus activities to show</p></h2>
<!--          <a class="more" href="#"></a> -->
      </div>
				<div id="loop_big_caj" class="loop_big_caj">
					<ul class="bigpic_loop">
					<c:forEach var="items" items="${listImg}" varStatus="status">
						<c:if test="${status.count >5 || status.count <= 13}">
						<li>
						<a target="_blank"   href="${pageContext.request.contextPath}/web/find?superid=${superid}&id=${pm.id}&newsId=${items.id}&menuName=${items.title}" class="loop_big_a"> 
						<img width="220"
								height="140"
								src="${pageContext.request.contextPath}/files/${items.bananerPic}"
								class="attachment-news-sidbar-thumb wp-post-image" /></a> <b>
								<a target="_blank"   href="${pageContext.request.contextPath}/web/find?superid=${superid}&id=${pm.id}&newsId=${items.id}&menuName=${items.title}"> 
<!-- 								拯救城市再升级 | 暑期五大主题创... -->
								<c:choose>
									<c:when test="${fn:length(items.title) < 18}">
										${items.title}
									</c:when>
									<c:otherwise>
										${fn:substring(items.title,0,18)}…
									</c:otherwise>
								</c:choose>
								</a></b></li>
							</c:if>
							</c:forEach>	
					</ul>

					<div class="loop_big_caj_nav">
						<a class="prve"> 上一张 </a> <a class="next"> 下一张 </a>
					</div>

				</div>
				
				
				
				
				
<script>
$(function() {
$("#loop_big_caj").jCarouselLite({
btnNext: "#loop_big_caj .next",
btnPrev: "#loop_big_caj .prve",
auto:3000,
speed:1000,
visible:4,
onMouse:true,
easing: "easeOutBack"
});
});
</script>
</div>
<%@include file="webPublic/footer.jsp" %>

<script src="${pageContext.request.contextPath}/assets/web/mainWeb/js/d1.js"></script>
<script src="${pageContext.request.contextPath}/assets/web/mainWeb/js/d2.js"></script>





</body>
</html>
