<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主网站菜单</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/web/title.ico">
</head>
<body>
	<div id="header">
    <div class="top">
        <div class="top_in">
            <span class="tell"><b></b><a>021－57533472</a></span>
            <span class="mail"><b></b><a>shfxstxx@163.com</a></span>
            <span id="Language"><b></b>
            <c:choose>
            	<c:when test="${ not empty sessionScope.loginUser}">
            	<a >${sessionScope.loginUser.name}</a></span>
            	</c:when>
            	<c:otherwise>
            	<a target="_blank" href="${pageContext.request.contextPath}/user/login">用户登录</a></span>
            	</c:otherwise>
            </c:choose>
            
        </div>
    </div>
    <div id="header_in">
        <a class="logo" href="#" style="width: 500px;">
	        <div style=" float: left; ">
	        	<img src="/app-web-portal/assets/web/mainWeb/image/webLogo.png"> 
	        </div>
	        <div style=" float: left; ">
	        	<img src="/app-web-portal/assets/web/mainWeb/image/title.png"> 
	        </div>
        </a>
       
        
         <div class="search">
           <form id="add-news-form" action="select" 
                 method="post" class="form-horizontal">
            <input type="text" placeholder="查找《标题》" name="name" id="name" />
            <input type="hidden" name="menuId" id="menuId">
            <span>
                <em>全部</em>
                <ul>
                    <c:if test="${ not empty sessionScope.webMaminSession}">	 
                	<c:forEach items="${sessionScope.webMaminSession}" var="superItem" varStatus="status">
                	<c:forEach items="${superItem.listMenu}" var="items" varStatus="status">
                	 <c:forEach items="${items.listPermissionSubMenu}" var="subm" varStatus="status"> 
                    <li onclick="menuchange('${subm.id}')" value="${subm.id}">${subm.menuName}</li>
                    </c:forEach>
                    </c:forEach>
                    </c:forEach>
                    </c:if>
                </ul>
            </span><a href="#" class="btn">
            <button type="submit" class="btn" style="width:66px;height: 37px;">搜索</button>
            </a>
            
            </form>
        </div>
         
  </div>
    <div id="nav">
		<div class="menu-%e6%a0%8f%e7%9b%ae-container">
            <ul id="menu-%e6%a0%8f%e7%9b%ae" class="menu_nav">
			  <!-- 动态权限菜单 -->
                 <c:if test="${ not empty sessionScope.webMaminSession}">	 
                	<c:forEach items="${sessionScope.webMaminSession}" var="superItem" varStatus="status">
                	<c:forEach items="${superItem.listMenu}" var="items" varStatus="status">
                	  <c:forEach items="${items.listPermissionSubMenu}" var="subm" varStatus="status"> 
                	<!-- 检用户是否有子菜单，如果没有子菜单 -->
                	<c:choose>
                		<c:when test="${subm.menuType == 2}">
                		<!-- 有只菜单 -->
	                		<li id="menu-item-322" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-322">
	                		<!--如果有子菜单，那么父菜单也应该可以点周 -->
	                		
	                		<a href="${pageContext.request.contextPath}/web/list?isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
	                		${subm.menuName}</a>
		                     
		                     
		                     <ul class="sub-menu">
                    
		                         <c:forEach items="${subm.listPermissionSubMenu}" var="subm2" varStatus="status">
		                         <li id="menu-item-348" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-348">
		                         <!-- "文明创建","特色课程","乡村少年宫","微视频" -->
		                         <c:choose>
		                         	<c:when test="${subm2.menuName == '文明创建'}">
		                         		<a target="_blank" href="${pageContext.request.contextPath}/web/civilization/index">${subm2.menuName}</a>
		                         	</c:when>
		                         	<c:when test="${subm2.menuName == '特色课程'}">
		           						<a target="_blank"  href="${pageContext.request.contextPath}/web/feature/index">${subm2.menuName}</a>              	
		                         	</c:when>
		                         	<c:when test="${subm2.menuName == '乡村少年宫'}">
		                         		<a target="_blank"  href="${pageContext.request.contextPath}/web/ruralChildrenPalace/index">${subm2.menuName}</a>
		                         	</c:when>
		                         	<c:when test="${subm2.menuName == '微视频'}">
		                         		<a target="_blank"  href="${pageContext.request.contextPath}/web/messageRepositoryWeb/index">${subm2.menuName}</a>
		                         	</c:when>
		                         	<c:otherwise>
		                         		<a  href="${pageContext.request.contextPath}/web/list?superid=${items.id}&id=${subm.id}&moduleId=${subm2.id}&menuName=${subm2.menuName}">${subm2.menuName}</a>
		                         	</c:otherwise>
		                         </c:choose>
		                            </li>
		                           
		                           
		                            </c:forEach>
		                        </ul>
		                    </li>  
                		</c:when>
                		
                		<c:otherwise>
                		<!-- 无子菜单 -->
                			<li>
                        		<li id="menu-item-2" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-96">
                        		<a href="${pageContext.request.contextPath}/${subm.menuUrl}">${subm.menuName}</a>
                    		</li>
                		</c:otherwise>
                	</c:choose>
                	
  					</c:forEach>
                    </c:forEach>
                    </c:forEach>
                    </c:if> 
			</ul>
		</div>            
	</div>
</div>
<!-- 导航栏 ，广告区 -->
<div id="pic">
	<ul>
<!-- 		<li> -->
<%-- 			<a  target="_blank" href="${pageContext.request.contextPath}/web/civilization/index"  --%>
<%-- 			style="background:url(${pageContext.request.contextPath}/assets/web/mainWeb/image/stxx_top3.jpg) repeat center center;"> --%>
<!--                 <div class="pic_in"> -->
<!--                 </div> -->
<!-- 			</a> -->

<!-- 		</li> -->
        <li>
			<a href="#" style="background:url(${pageContext.request.contextPath}/assets/web/mainWeb/image/stxx_top2.png) repeat center center;">
			</a>
		</li>
</ul>
<div class="pic_nav"></div>
<a class="prve" style="left: -100px;"></a>
<a class="next" style="right: -100px;"></a>
</div>
</body>
<script>
//给首页的菜单，添加id,值
function menuchange(id){
	$("#menuId").val(id);
}

$(function() {
	$("#pic").jCarouselLite({
	btnNext: "#pic .next",
	btnPrev: "#pic .prve",
	speed:2000,//滚动动画的时间
	auto:4000,//滚动间隔时间
	visible:1,
	onMouse:true,
	start:0,
	easing: "easeInOutBack",
	beforeStart: function(a) {$(".pic_text").animate({"top":"0px",opacity:0},1000,'easeOutQuint'); $(".png_pic").animate({"bottom":"-300px",opacity:0},1000,'easeOutQuint'); },
	afterEnd: function(a) { $(".pic_text").animate({"top":"70px",opacity:1},1000,'easeOutBack');  $(".png_pic").animate({"bottom":"0px",opacity:1},1000,'easeOutQuint') }
	});
});

</script>
</html>