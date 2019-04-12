<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>网站管理</title>
<link href="${ctx}/assets/admin/css/bootstrap.min.css?v=3.4.0"
	rel="stylesheet">
<link
	href="${ctx}/assets/admin/font-awesome/css/font-awesome.css?v=4.3.0"
	rel="stylesheet">
<link href="${ctx}/assets/admin/css/animate.css" rel="stylesheet">
<link href="${ctx}/assets/admin/css/plugins/summernote/summernote.css"
	rel="stylesheet">
<link
	href="${ctx}/assets/admin/css/plugins/summernote/summernote-bs3.css"
	rel="stylesheet">
	 <link href="${ctx}/assets/admin/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="${ctx}/assets/admin/css/style.css?v=2.2.0" rel="stylesheet">
<link
	href="${ctx}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
	  <link href="${ctx}/assets/admin/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet">


<!-- 上传控件 -->
    <link href="${ctx}/assets/admin/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${ctx}/assets/admin/css/plugins/dropzone/dropzone.css" rel="stylesheet">
	
<style type="text/css">
.modal.fade .user-modal-dialog {
	padding: 5%;
}
</style>
</head>
<body>
	<div class="row border-bottom white-bg">
		<nav class="navbar navbar-static-top" role="navigation">
		<div class="navbar-header">
			<button aria-controls="navbar" aria-expanded="false"
				data-target="#navbar" data-toggle="collapse"
				class="navbar-toggle collapsed" type="button">
				<i class="fa fa-reorder"></i>
			</button>
			<a href="${pageContext.request.contextPath}/user/index" class="navbar-brand">返回系统</a>
		</div>
		<div class="navbar-collapse collapse" id="navbar">
			<ul class="nav navbar-nav">
				<c:if test="${not empty sessionScope.webSchoolMenu}">
					<c:forEach items="${sessionScope.webSchoolMenu}" var="superItem"
						varStatus="status">
						<c:forEach items="${superItem.listMenu}" var="items"
							varStatus="status">
							<c:forEach items="${items.listPermissionSubMenu}" var="subm"
								varStatus="status">
								<c:choose>
                				<c:when test="${subm.menuType == 2}">
								<li class="dropdown"><a aria-expanded="false" role="button"
									href="#" class="dropdown-toggle"
									data-toggle="dropdown">${subm.menuName} <span class="caret"></span></a>
									<ul role="menu" class="dropdown-menu">
									<c:forEach items="${subm.listPermissionSubMenu}" var="subm2" varStatus="status">
										<li><a href="${ctx}/webSchool/findnews?moduleId=${subm2.id}&menuName=${subm2.menuName}&token=${param.token}">${subm2.menuName}</a>
										<!-- 三级菜单 文明创建 -->
										<c:if test="${subm2.menuType == 2}">
											<div style="padding-left: 50px;">
											<c:forEach items="${subm2.listPermissionSubMenu}" var="subm3" varStatus="status">
                                    			<p><a href="${ctx}/webSchool/findnews?moduleId=${subm3.id}&menuName=${subm3.menuName}&token=${param.token}">${subm3.menuName}</a></p>
                                    			</c:forEach>
                                			</div>
										</c:if>
										</li>
										</c:forEach>
									</ul>
								</li>
								</c:when>
								<c:otherwise>
									<c:if test="${fn:indexOf(subm.menuName,'首页')==-1}">
									<li><a href="${ctx}/webSchool/findnews?moduleId=${subm.id}&menuName=${subm.menuName}&token=${param.token}">${subm.menuName}</a></li>
									</c:if>
								</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</c:if>
			</ul>
		</div>
		</nav>
	</div>
</body>
<script src="${ctx}/assets/admin/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	for(var i=0;i<document.links.length;i++){   
		//document.links[i].href=encodeURI(document.links[i].href); 
	} 
});


</script>
</html>