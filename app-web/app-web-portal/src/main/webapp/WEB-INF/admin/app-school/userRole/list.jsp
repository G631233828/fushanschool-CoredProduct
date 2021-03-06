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
                    <!-- 内容 -->
                     <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>角色管理</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <p>
                                        <button onclick="addFormValue();" class="btn btn-primary " type="button"
                                        data-toggle="modal" data-target="#myModal5"
                                        ><i class="fa fa-plus" 
                                        ></i>&nbsp;添加角色</button>
                       

                            </p>

                            <p>
                             <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                        <th>角色名称</th>
                                        <th>角色备注</th>
                                        <th>权限</th>
                                        
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                               <c:forEach items="${pageList}" var="item" varStatus="status">
                                    <tr class="gradeX">
                                        <td>${item.name}</td>
                                        <td>${item.remark}</td>
                                         <td>
                                         <form action="updateRolefind" method="post"><!-- 权限菜单更新 -->
                                         <input name="id" type="hidden" value="${item.id}">
                                         <button type="submit"class="btn btn-primary btn-xs edit-news" >权限管理</button>
                                         </form>
                                         </td>
                                       
                                        <td class="center">
                                         	<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                                         	 onclick="updateFormValue('${item.id}','${item.name}','${item.remark}')">编辑</button>
                                             <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                                             onclick="deleteAlert('${item.id}')">删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                    </div>
                </div>
            </div>
                    
                  
                </div>
            </div>
        </div>
    </div>
    
    <!-- 删除弹出层提示 -->
    <div class="modal inmodal fade" id="deleteModal6" tabindex="-1" role="dialog"  aria-hidden="true" style="padding: 15%">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            	<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span style="float: left;color: red;font-size: 18px;">删除提示</span>
                </div>
                <div class="modal-body">
                 <h3>您确认是否要删除此记录吗?</h3>
                </div>
                <input type="hidden" id="delete-id"> 
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="deleteById();" class="btn btn-primary delete-confirm-btn">确认</button>
                </div>
            </div>
        </div>
    </div>
    
 <!-- 弹出层－添加 -->
  <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                     <h4 class="modal-title" id="panelTitle"> </h4>
                </div>
                 <form id="add-news-form" action="createOrUpdateToFind" 
                 method="post" class="form-horizontal">
                <div class="modal-body">
                      <div class="row">
                        	<div class="form-group">
	                            <label class="col-sm-2 control-label">角色名称</label>
	                            <div class="col-sm-10">
	                                <input type="text" id="name" 
	                                name="name" class="form-control" placeholder="角色名称" >
	                            </div>
                      	</div>
                      </div>
                      <div class="row">
                      		 <div class="form-group">
                            <label class="col-sm-2 control-label">角色备注</label>
                            <div class="col-sm-10">
                            	<textarea id="remark" name="remark" data-rangelength="[2,100]" 
                            	placeholder="备注" class="form-control parsley-validated" rows="6"></textarea>
                            </div>
                        </div>
                      </div>
                </div>
                	<!-- 隐常ID,更新时使用 -->
					<input id="id" name="id" type="hidden">
					<input id="schoolId" name="schoolId" type="hidden" value="${sessionScope.loginUser.schooldIds}">
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="submit" id="save-btn-news" class="btn btn-primary">保存</button>
                </div>
                </form>
            </div>
        </div>
    </div>
 <!-- 更新内容是传值 -->
 
 	        <div class="modal inmodal fade" id="myModal10" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">权限模块</h4>
                                        </div>
                                        <div class="modal-body">
                                        
                    <!-- 权限菜单加载 -->
					<c:forEach items="${listLayerMenu}" var="item">

						<h4>${item.permissionMenu.menuName}</h4>
						<!-- 一级菜单 -->
						<c:forEach items="${item.permissionMenu.listPermissionSubMenu}" var="list">
						 <!-- 排除各首页 -->
							<c:if test="${list.menuName ne '乡村少年宫首页' && list.menuName ne '首页' && list.menuName ne '创建动态' && list.menuName ne '课程首页' }">

								<div class="checkbox i-checks col-md-offset-1">
									<label> 
									<input name="check_box" type="checkbox" value="${list.id}">
									<input type="hidden" name="menuName" value="${list.menuName}">
									<input type="hidden" name="token" value="${item.name}">
									<i></i>${list.menuName }</label>
								</div>
								<!-- 二级菜单 -->
								<c:forEach items="${list.listPermissionSubMenu}" var="subMenu">
									<div style="padding-left: 20px;" class="checkbox i-checks col-md-offset-1">
									<label> 
									<input name="check_box" type="checkbox" value="${subMenu.id}">
									<input type="hidden" name="menuName" value="${subMenu.menuName}">
									<input type="hidden" name="token" value="${item.name}">
									<i></i>${subMenu.menuName }</label>
								</div>
								<!-- 三级菜单 -->
									<c:forEach items="${subMenu.listPermissionSubMenu}" var="subMenu2">
										<div style="padding-left: 40px;" class="checkbox i-checks col-md-offset-1">
										<label> 
										<input name="check_box" type="checkbox" value="${subMenu2.id}">
										<input type="hidden" name="menuName" value="${subMenu2.menuName}">
										<input type="hidden" name="token" value="${item.name}">
										<i></i>${subMenu2.menuName }</label>
										</div>
									</c:forEach>
									
								</c:forEach>

							</c:if>
						</c:forEach>
					</c:forEach>


                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary" id="btn-add-news-push">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
 
 
 
 <script type="text/javascript">
 	function udpateRoleMenu(){
		//加载权限菜单
 	$('#myModal10').modal('show');
		
 	}
 
 
 	//更新内容传值
 	function updateFormValue(id,name,remark){
 		$('#myModal5').modal('show');
 		$("#id").val(id);
		$("#name").val(name);
		$("#remark").val(remark);
		
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("更新角色"); 
 	}
 	//添加时－清空值
 	function addFormValue(){
 		$("#id").val('');
		$("#name").val('');
		$("#remark").val('');
		
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("添加角色"); 
 	}
 	
 	
 	var deleteId;
 	//删除提示窗口
 	function deleteAlert(id) {
 		 $('#deleteModal6').modal('show');
 		deleteId=id;
 		
 	}
 	//删除记录
 	function deleteById() {
 		window.location.href = "delete?id="+deleteId;
 	}
 	
 	
 	

 	
 </script>
 
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

<script>
$(document).ready(function () {
    $('.summernote').summernote({
        lang: 'zh-CN',
        onImageUpload: function(files, editor, $editable) {
          sendFile(files[0], editor, $editable);
        }
    });
    $('.dataTables-example').dataTable();//表格

    // validate the comment form when it is submitted
    $("#add-news-form").validate();//初始化from验证
});

</script>

</body>
</html>
