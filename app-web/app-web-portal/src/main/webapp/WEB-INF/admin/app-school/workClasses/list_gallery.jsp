<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>相册管理</title>

  
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
                  <c:choose>
                  	<c:when test="${type == 'Classes' }">
                  		<h2>班级名称：${classesMessage.yearNumber}年${classesMessage.name}班</h2>
	                    <ol class="breadcrumb">
	                        <li>
	                            <a href="＃">主页</a>
	                        </li>
	                        <li>
	                            <strong>班级相册</strong>
	                        </li>
	                    </ol>
                  	</c:when>
                  	<c:when  test="${type == 'Persion' }">
                  		<h2>名称：${studentMessage.name}</h2>
	                    <ol class="breadcrumb">
	                        <li>
	                            <a href="＃">主页</a>
	                        </li>
	                        <li>
	                            <strong>${studentMessage.name}－宝宝相册</strong>
	                        </li>
	                    </ol>
                  	</c:when>
                  </c:choose>
                   
                    
                </div>
            </div>
            <div class="wrapper wrapper-content">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div class="file-manager">
                                    <h5>相册管理：</h5>
                                    <a href="#" class="file-control">全选</a>
                                    <a href="#" class="file-control">反选</a>
                                    <a href="#" class="file-control">批量删除</a>
                                    
                                    <a href="#" class="file-control">按时间排序</a>
                                    <div class="hr-line-dashed"></div>
                                   	<div class="text-center">
                                    	<a data-toggle="modal" class="btn btn-primary" href="form_basic.html#modal-form">
                                    	上传图片</a>
                                	</div>
                                   
<!--                                     <div class="hr-line-dashed"></div> -->
<!--                                     <h5>文件夹</h5> -->
                                    
<!--                                     <h5 class="tag-title">标签：</h5> -->
<!--                                     <ul class="tag-list" style="padding: 0"> -->
<!--                                         <li><a href="file_manager.html">校活活动</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="file_manager.html">工作</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="file_manager.html">家庭</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="file_manager.html">孩子</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="file_manager.html">假期</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="file_manager.html">音乐</a> -->
<!--                                         </li> -->
<!--                                         <li><a href="file_manager.html">照片</a> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                     <div class="clearfix"></div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 animated fadeInRight">
                        <div class="row">
                            <div class="col-lg-12">
                            <c:forEach items="${listPhoto}" var="item" varStatus="status">
                                <div class="file-box" >
                                    <div class="file">
                                            <span class="corner"></span>

                                            <div class="image" style="height: 150px;">
                                                <img alt="image" class="img-responsive" 
                                                src="${pageContext.request.contextPath}/uploadmr/min_${item.generateName}">
                                            </div>
                                            <div class="file-name" style="text-align: center;">
                                            	<c:choose>
													<c:when test="${fn:length(item.originalName)<10}">
														${item.originalName}
													</c:when>
													<c:otherwise>
														${fn:substring(item.originalName,0,10)}...
													</c:otherwise>
												</c:choose>
												
												<span style="float:right;font-size: 9px;"> 
													<a href="${pageContext.request.contextPath}/photo/delete?id=${item.id}&type=${type}&capid=${param['id']}">
														删除
													</a>
												</span>
                                                <br/>
                                                <small>添加时间：${item.createDate}</small>
                                            </div>

                                    </div>
                                </div>
                               </c:forEach>

                            </div>
                        </div>
                    </div>
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





<!-- 上传图片控件 -->
    <div id="modal-form" class="modal fade" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                       <div class="ibox-content">
                            <form  id="my-awesome-dropzone" class="dropzone" action="uploadFile">
                                <div class="dropzone-previews"></div>
                                <c:if test="${type=='Classes'}">
                                	<input type="hidden" value="${classesMessage.id}" name="classesAndPersionId">
                                </c:if>
                                <c:if test="${type=='Persion'}">
                                 	<input type="hidden" value="${studentMessage.id}" name="classesAndPersionId">
                                </c:if>
                                
                                <button onclick="uploadFile()"  type="submit" class="btn btn-primary pull-right">上传文件</button>
                            </form>
                            <div>
                                <div class="m">您可以在些上传“图片”，视频，文档等</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

		<!-- 主要的 scripts -->
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/jeditable/jquery.jeditable.js"></script>
		<!-- 动态表格数据 -->
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/jquery.dataTables.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/dataTables.bootstrap.js"></script>
		<!-- 定制的javascript和插件 -->
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/hplus.js?v=2.2.0"></script>
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/pace/pace.min.js"></script>
		<!-- 全文搜索与查询 -->
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>


  <!-- DROPZONE -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>

    <script>
    
    var check="";
    
    //当上传的DIV隐常的时候，重新加载相册
    $("#modal-form").bind("click", function(event) {
    	if(check=="SUCCESS"){
    		
    	}
    });
    
        $(document).ready(function () {

            Dropzone.options.myAwesomeDropzone = {

                autoProcessQueue: false,
                uploadMultiple: true,
                parallelUploads: 100,
                maxFiles: 100,
                // Dropzone settings
                init: function () {
                    var myDropzone = this;
                    this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                    	
                        e.preventDefault();
                        e.stopPropagation();
                        myDropzone.processQueue();
                    });
                    this.on("sendingmultiple", function () {
                    });
                    this.on("successmultiple", function (files, response) {
                    	location.href = "${pageContext.request.contextPath}/photo/classesGallery?id=${param['id']}&type=${type}";
                    });
                    this.on("errormultiple", function (files, response) {
                    	
                    });
                }

            }

        });
    </script>


</body>
</html>
