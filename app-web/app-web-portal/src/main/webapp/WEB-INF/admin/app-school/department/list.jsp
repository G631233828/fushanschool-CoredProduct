<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>部门管理</title>

  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
	
<%-- 	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/summernote/summernote.css" rel="stylesheet"> --%>
<%-- 	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/summernote/summernote-bs3.css" rel="stylesheet"> --%>
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
                                    <h5>部门管理</h5>
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
                                        ></i>&nbsp;添加部门</button>
                       

                            </p>

                            <p>
                             <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                        <th>名称</th>
                                        <th>部门编号</th>
                                        <th>部门负责人</th>
                                        <th>部门描述</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                               <c:forEach items="${pageList}" var="item" varStatus="status">
                                    <tr class="gradeX">
                                        <td>${item.name}</td>
                                        <td>${item.departmentNum}</td>
                                        <td>${item.manageDepartment}</td>
                                        <td class="center">${item.describe}</td>
                                        <td class="center">
                                         	<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                                         	 onclick="updateFormValue('${item.id}','${item.name}','${item.departmentNum}',
                                         	 '${item.manageDepartment}','${item.describe}','${item.remark}')">编辑</button>
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
                 <form id="add-news-form" action="${pageContext.request.contextPath}/department/createOrUpdateToFind" 
                 method="post" class="form-horizontal">
                <div class="modal-body">
                      <div class="row">
                      	<div class="col-lg-6">
	                      	 <div class="form-group">
	                            <label class="col-sm-2 control-label">名称</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="text" id="name" name="name" class="form-control" placeholder="部门名称" >
	                            </div>
	                        </div>
	                         <div class="form-group">
                            <label class="col-sm-2 control-label">管理者</label>
                            <div class="col-sm-10">
                                <input type="text" id="manageDepartment" name="manageDepartment" class="form-control" placeholder="部门管理者" >
                            </div>
                        </div>
                      	</div>
                      	<div class="col-lg-6">
                      		 <div class="form-group">
	                            <label class="col-sm-2 control-label">编号</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="text" id="departmentNum" name="departmentNum" class="form-control" placeholder="部门编号" >
	                            </div>
                        	</div>
                         	<div class="form-group">
	                            <label class="col-sm-2 control-label">描述</label>
	                            <div class="col-sm-10">
	                                <input type="text" id="describe" name="describe" class="form-control" placeholder="部门描述" >
	                            </div>
                        	</div>
                      	</div>
                      </div>
                      <div class="row">
                      <div class="col-lg-12">
                      		 <div class="form-group">
                            <label class="col-sm-1 control-label">备注</label>
                            <div class="col-sm-11">
                            	<textarea id="remark" name="remark" data-rangelength="[2,100]" placeholder="备注" class="form-control parsley-validated" rows="6"></textarea>
                            </div>
                        </div>
                        </div>
                      </div>
                </div>
                	<!-- 隐常ID,更新时使用 -->
					<input id="id" name="id" type="hidden">
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="submit" id="save-btn-news" class="btn btn-primary">保存</button>
                </div>
                </form>
            </div>
        </div>
    </div>
 <!-- 更新内容是传值 -->
 <script type="text/javascript">
 	//更新内容传值
 	function updateFormValue(id,name,departmentNum,manageDepartment,describe,remark){
 		$('#myModal5').modal('show');
 		$("#id").val(id);
		$("#name").val(name);
		$("#departmentNum").val(departmentNum);
		$("#manageDepartment").val(manageDepartment);
		$("#describe").val(describe);
		$("#remark").val(remark);
		
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("更新部门"); 
 	}
 	//添加时－清空值
 	function addFormValue(){
 		$("#id").val('');
		$("#name").val('');
		$("#departmentNum").val('');
		$("#manageDepartment").val('');
		$("#describe").val('');
		$("#remark").val('');
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("添加部门"); 
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
