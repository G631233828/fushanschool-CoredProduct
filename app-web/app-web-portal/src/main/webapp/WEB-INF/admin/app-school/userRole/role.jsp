<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>角色管理</title>
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
	
	<!-- 动态表格 -->
	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<body>
    <div id="wrapper">
     <!-- .aside left menu -->
	<%@include file="../../public/left.jsp" %>
        <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
           <%@include file="../../public/top.jsp" %>
            <div class="wrapper wrapper-content">
                <div class="row">
                 <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                      <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">
                          <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                          <h4 class="modal-title">${userRole.name}-权限模块</h4>
                      </div>
                            
                    <form action="${pageContext.request.contextPath}/schoolPermissionRole/updateRole" method="post">
                    
                    <input name="id" type="hidden" value="${userRole.id}" />
                    
                  <div class="modal-body">
                    <!-- 权限菜单加载 -->
					<c:forEach items="${listLayerMenu}" var="item">
					<div class="col-lg-6">
						<h4>${item.permissionMenu.menuName}</h4>
						<!-- 一级菜单 -->
						<c:forEach items="${item.permissionMenu.listPermissionSubMenu}" var="list">
						 <!-- 排除各首页 -->
							<c:if test="${list.menuName ne '乡村少年宫首页' && list.menuName ne '首页' && list.menuName ne '创建动态' && list.menuName ne '课程首页' }">

								<div class="checkbox i-checks col-md-offset-1">
									<label> 
									<c:choose>
										<c:when test="${list.remark=='check'}">
											<input checked="checked" name="check_box" type="checkbox" value="${list.id}">
										</c:when>
										<c:otherwise>
											<input name="check_box" type="checkbox" value="${list.id}">
										</c:otherwise>
									</c:choose>
									<input type="hidden" name="menuName" value="${list.menuName}">
									<input type="hidden" name="token" value="${item.name}">
									<i></i>${list.menuName }</label>
								</div>
								<!-- 二级菜单 -->
								<c:if test="${list.menuType==2}">
								<c:forEach items="${list.listPermissionSubMenu}" var="subMenu">
									<div style="padding-left: 20px;" class="checkbox i-checks col-md-offset-1">
									<label> 
									<c:choose>
										<c:when test="${subMenu.remark=='check'}">
											<input checked="checked" name="check_box" type="checkbox" value="${subMenu.id}">
										</c:when>
										<c:otherwise>
											<input name="check_box" type="checkbox" value="${subMenu.id}">
										</c:otherwise>
									</c:choose>
									
									<input type="hidden" name="menuName" value="${subMenu.menuName}">
									<input type="hidden" name="token" value="${item.name}">
									<i></i>${subMenu.menuName }</label>
								</div>
								<!-- 三级菜单 -->
									<c:forEach items="${subMenu.listPermissionSubMenu}" var="subMenu2">
										<div style="padding-left: 40px;" class="checkbox i-checks col-md-offset-1">
										<label> 
										
										<c:choose>
										<c:when test="${subMenu2.remark=='check'}">
											<input checked="checked" name="check_box" type="checkbox" value="${subMenu2.id}">
										</c:when>
										<c:otherwise>
											<input name="check_box" type="checkbox" value="${subMenu2.id}">
										</c:otherwise>
									</c:choose>
										
										<input type="hidden" name="menuName" value="${subMenu2.menuName}">
										<input type="hidden" name="token" value="${item.name}">
										<i></i>${subMenu2.menuName }</label>
										</div>
									</c:forEach>
									
								</c:forEach>
								</c:if>
							</c:if>
						</c:forEach>
						</div>
					</c:forEach>
				</div>

                <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" id="btn-add-news-push">保存</button>
                </div>
                </form>
           </div>
       </div>
                          

                  
                </div>
            </div>
        </div>
    </div>
    

 
 	        <div class="modal inmodal fade" id="myModal10" tabindex="-1" role="dialog"  aria-hidden="true">
                               
                            </div>
 
 
 
<!-- 主要的 scripts -->
<script src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/jeditable/jquery.jeditable.js"></script>
<!-- 动态表格数据 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<!-- 定制的javascript和插件 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/hplus.js?v=2.2.0"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/pace/pace.min.js"></script>
<!-- 全文搜索与查询 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>



</body>
</html>
