<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>课题办公</title>

  
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
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-9">
                    <h2>联系人</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">主页</a>
                        </li>
                        <li>
                            页面
                        </li>
                        <li>
                            <strong>联系人</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-3"  style="padding-top: 40px;">
                	<a href="${pageContext.request.contextPath}/workClasses/createFind">
	                   	<button  class="btn btn-sm btn-primary pull-right m-t-n-xs" type="button">
	                   		<strong>添加课题</strong>
                     	</button>
                    </a>
                </div>
            </div>
            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                 
                    <c:forEach items="${pageList}" var="item" varStatus="status">
	                    <div class="col-lg-4">
	                        <div class="contact-box">
	                            
	                                <div class="col-sm-4">
	                                    <div class="text-center">
	                                        <img alt="image" class="img-circle m-t-xs img-responsive" 
	                                        src="${pageContext.request.contextPath}/assets/admin/img/a2.jpg">
	                                        <div class="m-t-xs font-bold">共：人</div>
	                                    </div>
	                                </div>
	                                <div class="col-sm-8">
	                                    <h3><strong>
	                                   ${item.title}
	                                    </strong></h3>
	                                    
	                                    			<address>
				                            		创建人:张老师<br>
				                            		开始日期: ${item.sDate}<br>
				                            		结束日期: ${item.eDate}<br>
				                            		参与人数: ${fn:length(item.listTeacher)}人<br>
				                        			</address>
	                                    			<address>
				                            		<strong>状态：进行中</strong><br>
				                        			</address>
	                                    
	                        			
	                                </div>
	                                <div class="clearfix">
	                                
	                                	<a href="${pageContext.request.contextPath}/workClasses/find?id=${item.id}">
		                                	<button style="margin-left: 30px;" class="btn btn-sm btn-primary pull-right m-t-n-xs" type="button">
	                                         	<strong>资料详细</strong>
	                                         </button>
                                         </a>
                                         
                                         <a href="${pageContext.request.contextPath}/workClasses/find?id=${item.id}">
		                                	<button  class="btn btn-sm btn-primary pull-right m-t-n-xs" type="button">
		                                		<strong>管理</strong>
	                                         </button>
                                         </a>
                                         
	                                </div>
	                           
	                        </div>
	                    </div>
                  </c:forEach> 
                </div>
            </div>
            <div class="footer">
                <div class="pull-right">
                    By：<a href="http://www.zi-han.net" target="_blank">zihan's blog</a>
                </div>
                <div>
                    <strong>Copyright</strong> H+ &copy; 2014
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
