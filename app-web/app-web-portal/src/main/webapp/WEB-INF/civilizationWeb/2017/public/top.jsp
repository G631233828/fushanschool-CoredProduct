<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2017福山外语节－儿童的世界.世界的儿童</title>
   <!-- ######### CSS STYLES ######### -->
	 <!-- Google fonts - witch you want to use - (rest you can just remove) -->
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/civilization/css/reset.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/civilization/css/style.css" type="text/css" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/civilization/css/font-awesome/css/font-awesome.min.css">
    
    <!-- responsive devices styles -->
	<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/assets/web/civilization/css/responsive-leyouts.css" type="text/css" />
    
<!-- just remove the below comments witch color skin you want to use -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/civilization/css/colors/blue.css" />
    <!--<link rel="stylesheet" href="css/colors/green.css" />-->
    <!--<link rel="stylesheet" href="css/colors/cyan.css" />-->
    <!--<link rel="stylesheet" href="css/colors/orange.css" />-->
    <!--<link rel="stylesheet" href="css/colors/lightblue.css" />-->
    <!--<link rel="stylesheet" href="css/colors/pink.css" />-->
    <!--<link rel="stylesheet" href="css/colors/purple.css" />-->
    <!--<link rel="stylesheet" href="css/colors/bridge.css" />-->
    <!--<link rel="stylesheet" href="css/colors/slate.css" />-->
    <!--<link rel="stylesheet" href="css/colors/yellow.css" />-->
    <!--<link rel="stylesheet" href="css/colors/darkred.css" />-->

<!-- just remove the below comments witch bg patterns you want to use --> 
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-default.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-one.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-two.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-three.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-four.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-five.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-six.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-seven.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-eight.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-nine.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-ten.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-eleven.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-twelve.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-thirteen.css" />-->

    
    <!-- mega menu -->
    <link href="${pageContext.request.contextPath}/assets/web/civilization/js/mainmenu/sticky.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/web/civilization/js/mainmenu/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/web/civilization/js/mainmenu/fhmm.css" rel="stylesheet">
    
<%--      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/tabs/assets/css/responsive-tabs.css"> --%>
    
    <!-- REVOLUTION SLIDER -->
   	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/revolutionslider/rs-plugin/css/settings.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/revolutionslider/css/slider_main.css" media="screen" />
    
    <!-- cubeportfolio -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/cubeportfolio/cubeportfolio.min.css">
    
	<!-- tabs -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/tabs/assets/css/responsive-tabs.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/tabs/assets/css/responsive-tabs2.css">

	<!-- carousel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/civilization/js/carousel/flexslider.css" type="text/css" media="screen" />
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/carousel/skin.css" />
    
    <!-- accordion -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/web/civilization/js/accordion/accordion.css" type="text/css" media="all">
       
 
    <!-- Lightbox -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/web/civilization/js/lightbox/jquery.fancybox.css" media="screen" />
       
</head>
<body>
<header id="header">

	<!-- Top header bar -->
	<div id="topHeader">
    
	<div class="wrapper">
         
        <div class="top_nav" style="background-color: #883997;color: #fff;">
        <div class="container">
        
        <div class="left">
            
            <ul>
              <li class="link" style="color: #fff;">
              <a  href="${pageContext.request.contextPath}/web/civilization/${year}/index" 
              style="color:#fff;">网站首页</a></li>
                <li><a href="mailto:fxstxx@163.com" style="color: #fff;"><i class="fa fa-envelope"></i> 
                psfshl@163.com</a></li>
                <li><i class="fa fa-phone-square" style="color: #fff;"></i > 021-5882790</li>
            </ul>
            
        </div><!-- end left links -->
        
        <div class="right">
            
            <ul>
          
          		<li class="link">
          		<form id="add-news-form" action="select" method="post" class="form-horizontal">
          			
          			<input type="text" id="name" name="name"/>
          			<button type="submit" style="background-color: #883997;color: #fff;">查找</button>
          			
          		</form>
          		</li>
            </ul>
            
        </div><!-- end right social links -->
        
        </div>
        </div>
            
 	</div>
    
	</div><!-- end top navigation -->
	
    
	<div id="trueHeader">
    
	<div class="wrapper">
    
     <div class="container">
    	<div style=" float: left; ">
	        	<img src="${pageContext.request.contextPath}/assets/web/mainWeb/image/fushang-logo.PNG" width="60" height="60"> 
	        </div>
	        <div style=" float: left; padding-top: 20px; padding-left: 12px;font-size: 20px;">
	        2016福山外语节
<!-- 	        Fengxian Shanghai four primary school -->
	        </div>
		<!-- Logo -->
		
        <!-- Menu -->
        <div class="menu_main">
        
          <nav class="navbar navbar-default fhmm" role="navigation">
             <div class="navbar-header">
          		<button type="button" data-toggle="collapse" data-target="#defaultmenu" class="navbar-toggle">Menu <i class="fa fa-bars tbars"></i></button>
			 </div><!-- end navbar-header -->
        
            <div id="defaultmenu" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
<!--                 civilizationSession -->
				<c:if
					test="${ not empty sessionScope.fuShangSchoolSession}">
					<c:forEach items="${sessionScope.fuShangSchoolSession}"
						var="superItem" varStatus="status">
						<c:forEach items="${superItem.listMenu}" var="items"
							varStatus="status">
							<c:forEach items="${items.listPermissionSubMenu}" var="subm"
								varStatus="status">
								<c:choose>
									<c:when test="${subm.menuType == 2}">
										<!-- 有只菜单 -->
									<c:choose>
										<c:when test="${subm.menuName == '学科专项研究' }">
										<!-- 有三级菜单的 -->
										  <li class="dropdown fhmm-fw"><a href="${pageContext.request.contextPath}/web/civilization/${year}/list?isMenu=one&isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm.id}&menuName=${subm.menuName}" 
										  data-toggle="dropdown" 
										  class="dropdown-toggle">${subm.menuName}</a>
					                        <ul class="dropdown-menu fullwidth">
					                            <li class="fhmm-content">
					                                <div class="row">
					                                	<c:forEach items="${subm.listPermissionSubMenu}"
													var="subm2" varStatus="status">
					                                    <div class="col-sm-3">
					                                    	<h3 class="title">
					                                    	<a href="${pageContext.request.contextPath}/web/civilization/${year}/list?isMenu=two&isone=yes&superid=${subm.id}&id=${subm2.id}&moduleId=${subm2.id}&menuName=${subm2.menuName}" >
					                                    	${subm2.menuName }
					                                    	</a>
					                                    	</h3>
					                                    	
					                                        <ul>
					                                        <c:forEach items="${subm2.listPermissionSubMenu}"
																var="subm3" varStatus="status">
					                                            <li><a href="${pageContext.request.contextPath}/web/civilization/${year}/list?isMenu=three&isone=yes&superid=${subm.id}&id=${subm2.id}&moduleId=${subm3.id}&menuName=${subm3.menuName}">
					                                            
					                                            <i class="fa fa-angle-right"></i> ${subm3.menuName }</a></li>
					                                            </c:forEach>
					                                        </ul>
					                                    </div>
					                                   </c:forEach>
					                                    
					                                </div><!-- end row -->
					                                
												</li><!-- fhmm-content -->
					                        </ul><!-- dropdown-menu -->
					                </li><!-- mega menu -->
										</c:when>
										<c:otherwise>
										<!-- 只有二级菜单 -->
										<li class="dropdown">
										<a href="${pageContext.request.contextPath}/web/civilization/${year}/list?isMenu=one&isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm.id}&menuName=${subm.menuName}"
											data-toggle="dropdown" class="dropdown-toggle">${subm.menuName }</a>
											<ul class="dropdown-menu" role="menu">
												<c:forEach items="${subm.listPermissionSubMenu}"
													var="subm2" varStatus="status">
													<li><a href="${pageContext.request.contextPath}/web/civilization/${year}/list?isone=yes&superid=${items.id}&id=${subm.id}&moduleId=${subm2.id}&menuName=${subm2.menuName}">
													${subm2.menuName }</a></li>
												</c:forEach>

											</ul></li>
										</c:otherwise>
									</c:choose>
										
									</c:when>
									<c:otherwise>
									<!-- 验证是不是首页 -->
									<c:choose>
										<c:when test="${subm.menuName=='首页' || subm.menuName=='创建动态'}">
											<li><a href="${pageContext.request.contextPath}/web/civilization/${year}/index">
										${subm.menuName }</a></li>
										</c:when>
										<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/web/civilization/${year}/list?isone=yes&superid=${items.id}&id=${items.id}&moduleId=${subm.id}&menuName=${subm.menuName}">
										
										${subm.menuName }</a></li>
										</c:otherwise>
										
									</c:choose>
										
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</c:forEach>
					</c:forEach>
				</c:if>

                
                    
                 
                
		</div><!-- end #navbar-collapse-1 -->
            
		</nav>
            
		</div>
        
        </div>
		
	</div>
    
	</div>
    
</header>


<div class="banner" style="height: 250px;">
	<div class="slider" >
        <div class="flexslider"  style="height: 250px;">
<!--           <ul class="slides"> -->
<!--             <li> -->
            <img style="width:1260px;height: 250px;"  
             src="${pageContext.request.contextPath}/assets/web/mainWeb/image/banana2017.jpg" alt=""/>
<!--             </li> -->
<!--           </ul> -->
        </div>
    </div>
</div>
</body>
</html>