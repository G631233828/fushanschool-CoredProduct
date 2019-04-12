<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>创建课题管理</title>

  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
	<!-- 上传控件 -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/dropzone.css" rel="stylesheet">
	   <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
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
                    <div class="row">
                    <div class="col-lg-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>所有表单元素 <small>包括自定义样式的复选和单选按钮</small></h5>
                            </div>
                            <div class="ibox-content">
                                <form method="post" class="form-horizontal" onsubmit="return checkUploadFile() " action="createOrUpdateToFind">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">标题</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="title" placeholder="标题" class="form-control"
                                            required=""  aria-required="true">
                                        </div>
                                    </div>
                                    <div class="form-group" id="data_1">
                                           <label class="col-sm-2 control-label">开始日期</label>
                                        <div class="col-sm-10 input-group date">
                                           <span class="input-group-addon">
                                           <i class="fa fa-calendar"></i></span>
                                        <input name="sDate" type="text" class="form-control" value="${sDate}">
                                        </div>
                                    </div>
                                    
                                     <div class="form-group" id="data_1">
                                           <label class="col-sm-2 control-label">结束日期</label>
                                        <div class="col-sm-10 input-group date">
                                           <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input  name="eDate" style="width:96%;" type="text" class="form-control" value="${eDate}">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">描述</label>
                                        <div class="col-sm-10">
                                            <textarea id="content"
                                             name="content" class="form-control" required="" placeholder="描述详情" 
                                             aria-required="true"></textarea>
                                        </div>
                                    </div>
                                      <div class="hr-line-dashed"></div>
                                    
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">参与人</label>

                                        <div class="col-sm-10">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="teacherName" id="teacherName">
                                                  <input type="hidden" class="form-control" name="teacherId" id="teacherId">
                                                <span class="input-group-btn">
                                                <a data-toggle="modal" class="btn btn-primary" href="form_basic.html#modal-form">添加</a>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                 
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-6 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">保存内容</button>
                                            <button class="btn btn-white" type="submit">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 上传 -->
                    
                    <!-- 上传资源信息 -->
					<script type="text/javascript">
						var file=null;
						function uploadFile(){
							file="Yes";
						}
					
						function checkUploadFile(){
							if(file=="Yes"){
								return true;
							}
							alert("请您选择文件并且上传!");
							return false;
						}						
					</script>
                    <div class="col-lg-6">
                    <!-- 上传图片控件 -->
					   <div class="ibox float-e-margins">
                          <div class="ibox-title">
                              <h5>文件上传</h5>
                              <div class="ibox-tools">
                                  <a class="collapse-link">
                                      <i class="fa fa-chevron-up"></i>
                                  </a>
                                  
                              </div>
                          </div>
                          <div class="ibox-content">
                              <form method="POST" enctype="multipart/form-data"  id="my-awesome-dropzone" name="my-awesome-dropzone" class="dropzone" action="uploadFile">
                                  <div class="dropzone-previews"><strong style="color:red;">
                                  1. 点击此处，选择所需要的文件（可以是视频、图片、word等，数量不限）</strong>
                                  
                                  </div>
<!-- 										                                     <button onclick="uploadFile()"  type="submit" class="btn btn-primary pull-right">上传文件</button>  -->
                              </form>
                              <div>
<!-- 										                                上传文件 -->
                                  <div class="m"><strong style="color:red;">2. 点击右处 上传文件按扭
                                  <button id ='upf' name="upf" onclick="uploadFile()"  type="button" class="btn btn-primary pull-right">上传文件</button>
                                   </strong></div>
                              </div>
                          </div>
                      </div>
                    </div>
                    
                </div>
                </div>
            </div>
        </div>
    </div>
    
  <!-- 人员选择 -->
    <div id="modal-form" class="modal fade" aria-hidden="true">
    
    					<div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">同步模块</h4>
                                        </div>
                                        <div class="modal-body">
                                        
					                   <c:forEach items="${listTeacher}" var="item" varStatus="status">
			                    		<label class="checkbox-inline i-checks">
			                            <input type="checkbox" name="check_box" value="${item.id}">${item.name}
			                            <input type="hidden" name="1212" value="${item.name}"></label>
			                   			 </c:forEach>

                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary" id="btn-add-news-push">保存</button>
                                        </div>
                                    </div>
                                </div>

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
  <!-- 上传控件-->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>
 <!-- 日期控件 -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/bootstrap-datepicker.js"></script>
 <!-- 更新内容是传值 -->
 <script type="text/javascript">
 $("#btn-add-news-push").click(function(){
		var attrChk="";
		var moduleNames="";
		$("#modal-form input[name='check_box']:checked").each(function(){
			attrChk+=$(this).val() +',';
			moduleNames+=$(this).next().val()+",";
			
		});
		
		var moduleIds=attrChk.substring(0,attrChk.length-1);
		var moduleName=moduleNames.substring(0,moduleNames.length-1);
		console.info(moduleIds);
		console.info(moduleName);
		$("#teacherId").val(moduleIds);
		$("#teacherName").val(moduleName);
		
		
	    $('#modal-form').modal('hide');
	});
 	
 </script>
 
 
 
    <script>
        $(document).ready(function () {

            $('#data_1 .input-group.date').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });

        });
    </script>
    
    <script>
        $(document).ready(function () {

            Dropzone.options.myAwesomeDropzone = {

                autoProcessQueue: false,
                uploadMultiple: true,
                parallelUploads: 100,
                maxFiles: 100,
                // Dropzone settings
                init: function () {
                    var myDropzone = this;
                    
                    document.getElementById("upf").addEventListener("click", function(e){
                    	e.preventDefault();
                        e.stopPropagation();
                        myDropzone.processQueue();
                    });
                    
                    /* this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    	
                        e.preventDefault();
                        e.stopPropagation();
                        myDropzone.processQueue();
                    }); */
                    this.on("sendingmultiple", function () {
                    });
                    this.on("successmultiple", function (files, response) {
                    });
                    this.on("errormultiple", function (files, response) {
                    	
                    });
                }

            }

        });
    </script>
	
	
	
	
	
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
   // $("#add-news-form").validate();//初始化from验证
});
</script>

</body>
</html>
