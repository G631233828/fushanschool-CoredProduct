<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>四团小学管理后台</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  	<link href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <!-- Morris -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="${pageContext.request.contextPath}/assets/admin/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/style.css" rel="stylesheet">
    <style type="text/css">
		.modal.fade .user-modal-dialog {
			padding: 5%;
		}
	</style>	
<body>
<nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                	   <li class="nav-header">

                        <div class="dropdown profile-element"> 
                        	<span style="float: left;padding-right: 10px;">
                           	 <img alt="image" class="img-circle" 
                           	 src="${pageContext.request.contextPath}/assets/admin/img/profile_small.jpg" />
                             </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">
                                ${sessionScope.loginUser.name}
                                </strong>
                             </span>  <span class="text-muted text-xs block">
                             <c:choose>
                             	<c:when test="${sessionScope.loginUser.type=='superManager'}">
                             		超级管理员
                             	</c:when>
                             	<c:when test="${sessionScope.loginUser.type=='teacherUser'}">
                             		校园老师
                             	</c:when>
                             	<c:when test="${sessionScope.loginUser.type=='studentUser'}">
                             		学生
                             	</c:when>
                             	<c:when test="${sessionScope.loginUser.type=='otheruser'}">
                             		其他
                             	</c:when>
                             </c:choose>
                             
                             <b class="caret"></b></span> </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="#">修改头像</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/user/profile">个人资料</a>
                                </li>
                                <li><a href="#">联系我们</a>
                                </li>
                                <li><a href="#">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/web/index">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            H+
                        </div>

                    </li>
                	
                  <!-- 动态权限菜单 -->
                 <c:if test="${ not empty sessionScope.roleMenu}">	 
                	  <c:forEach items="${sessionScope.roleMenu.listPermissionSubMenu}" var="subm" varStatus="status"> 
                	<!-- 检用户是否有子菜单，如果没有子菜单 -->
                	<c:choose>
                		<c:when test="${subm.menuType == 2}">
                		<!-- 有只菜单 -->
	                		<li>
		                        <a href="${pageContext.request.contextPath}/${subm.menuUrl}"><i class="fa fa ${subm.icon}">
		                        </i> <span class="nav-label">${subm.menuName}</span><span class="fa arrow"></span></a>
		                        <ul class="nav nav-second-level">
		                         <c:forEach items="${subm.listPermissionSubMenu}" var="subm2" varStatus="status">
		                         	<!-- 检查是否有第三级子菜单 -->
		                         	<c:choose>
                						<c:when test="${subm2.menuType == 2}">
                							<li>
						                        <a href="${pageContext.request.contextPath}/${subm2.menuUrl}"><i class="fa fa ${subm2.icon}"> </i> 
						                        <span class="nav-label">${subm2.menuName}</span><span class="fa arrow"></span></a>
							                        <ul class="nav nav-second-level">
							                         <c:forEach items="${subm2.listPermissionSubMenu}" var="subm3" varStatus="status">
								                         <li>
						                            		<a href="${pageContext.request.contextPath}/${subm3.menuUrl}">${subm3.menuName}</a>
						                            	</li>
							                         </c:forEach>
							                           </ul>
							                    </li>  
		                            	</c:when>
		                            <c:otherwise>
		                            	<li>
		                            		<a href="${pageContext.request.contextPath}/${subm2.menuUrl}">${subm2.menuName}</a>
		                            	</li>
		                            </c:otherwise>
                					</c:choose>
                						
		                            </c:forEach>
		                        </ul>
		                    </li>  
                		</c:when>
                		
                		<c:otherwise>
                		<!-- 无子菜单 -->
                			<li>
                			<c:choose>
                				<c:when test="${subm.menuName=='资源云库平台'}">
                					<a target="_blank" href="${pageContext.request.contextPath}/../cored-repository/loginTeacherinfoSOS?username=${sessionScope.loginUser.name}">
                        			<i class="fa ${subm.icon}"></i> <span class="nav-label">${subm.menuName}</span></a>
                				</c:when>
                				<c:when test="${subm.menuName=='图片系统'}">
                					<a target="_blank" href="${pageContext.request.contextPath}/../sysgallery/admin/loginSOS?username=${sessionScope.loginUser.name}">
                        			<i class="fa ${subm.icon}"></i> <span class="nav-label">${subm.menuName}</span></a>
                				</c:when>
                				
                				<c:otherwise>
                				<a href="${pageContext.request.contextPath}/${subm.menuUrl}">
                        		<i class="fa ${subm.icon}"></i> <span class="nav-label">${subm.menuName}</span></a>
                				</c:otherwise>
                				
                			</c:choose>
                        		
                    		</li>
                		</c:otherwise>
                	</c:choose>
                	
  					</c:forEach>
                    </c:if> 
            <%--          <li>
		                        <a href="/app-web-portal/#"><i class="fa fa fa-sitemap">
		                        </i> <span class="nav-label">网站管理</span><span class="fa arrow"></span></a>
		                        <ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
		                         
		                         	<!-- 检查是否有第三级子菜单 -->
		                         	
                						
		                            
		                            	<li>
		                            		<a href="${pageContext.request.contextPath}//permissionMenu/list">网站菜单配置</a>
		                            	</li>
		                            
                					
                						
		                            
		                        </ul>
		                    </li> --%>
                </ul>

            </div>
        </nav>
</body>
</html>