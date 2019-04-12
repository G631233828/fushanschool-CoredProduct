<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>学生管理</title>
 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}

/* gallery */
.zoomed>.gallery {
	-webkit-filter: blur(3px);
	filter: blur(3px);
}

.gallery {
}

.gallery li {
	float: left;
	margin: 10px;
	width: 80px;
	height: 80px;
}

.gallery li:nth-child(6n) {
	padding-right: 0;
}

.gallery li a, .gallery li img {
	float: left;
}
</style>


	<!-- 上传控件 -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/dropzone.css" rel="stylesheet">
<!--图片弹出层样式 必要样式-->
<link rel="stylesheet"  href="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/Assets/css/zoom.css" media="all" />
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

              <!-- 课题基本信息 -->
                <div class="row  border-bottom white-bg dashboard-header">
                <div class="col-sm-3">
                    <h4>${workClasses.title }</h4>
                    <small>${workClasses.content }</small>
                     <ul class="list-group clear-list m-t">
                        <li class="list-group-item fist-item">
                             开始时间： ${workClasses.sDate }
                        </li>
                        <li class="list-group-item fist-item">
                             结束时间： ${workClasses.eDate }
                        </li>
                        
                        <li class="list-group-item fist-item">
                             距离结束： 还剩 5 天
                        </li>
                      </ul>
                    
                </div>
                <div class="col-sm-6">
                 <h4>参考资源</h4>
                    <div class="row text-left">
                            <div>
       		 			<c:if test="${ not empty workClasses.listClassesMessage}">
	                                <c:forEach items="${workClasses.listClassesMessage}" var="mrFile" varStatus="filestatus"> 
	                                 <c:if test="${fn:substring(mrFile.fileType,0,1)=='d'}">
	                                 	<div style="float: left;text-align: center;">
	                                 		<a href="${pageContext.request.contextPath}/uploadmr/${ mrFile.generateName}">
	                                 			<img style="padding-left: 20px;width:100px;" src="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/document.png" alt=""/>
	                                 		</a>
	                                 		<br>
	                                 		<c:choose>
												<c:when test="${fn:length(mrFile.originalName)<9}">
												${ mrFile.originalName}
												</c:when>
												<c:otherwise>
													${fn:substring(mrFile.originalName,0,9)}
												</c:otherwise>
											</c:choose>
	                                 		
	                                 		
	                                 	</div>
	                                 </c:if>
	                                  <c:if test="${fn:substring(mrFile.fileType,0,1)=='c'}">
	                                 	<div style="float: left;text-align: center;">
	                                 		<a href="${pageContext.request.contextPath}/uploadmr/${ mrFile.generateName}">
	                                 			<img  style="padding-left: 20px;width:100px;"  style="width:100px;" src="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/r_other.png" alt=""/>
	                                 		</a>
	                                 		<br>
	                                 		<c:choose>
												<c:when test="${fn:length(mrFile.originalName)<9}">
												${ mrFile.originalName}
												</c:when>
												<c:otherwise>
													${fn:substring(mrFile.originalName,0,9)}
												</c:otherwise>
											</c:choose>
											
	                                 	</div>
	                                 </c:if>
	                                  <c:if  test="${fn:substring(mrFile.fileType,0,1)=='m'}">
	                                 	<div style="float: left;text-align: center;">
	                                 		<img  style="padding-left: 20px;width:100px;" src="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/music.png" alt=""/>
	                                 		<br>
	                                 		<c:choose>
												<c:when test="${fn:length(mrFile.originalName)<9}">
												${ mrFile.originalName}
												</c:when>
												<c:otherwise>
													${fn:substring(mrFile.originalName,0,9)}
												</c:otherwise>
											</c:choose>
	                                 	</div>
	                                 </c:if>
	                                 <c:if test="${fn:substring(mrFile.fileType,0,1)=='o'}">
	                                 	<div style="float: left;text-align: center;">
	                                 		<a href="${pageContext.request.contextPath}/uploadmr/${ mrFile.generateName}">
	                                 		<img  style="padding-left: 20px;width:100px;" src="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/other.png" alt=""/>
	                                 		</a>
	                                 		<br>
	                                 		<c:choose>
												<c:when test="${fn:length(mrFile.originalName)<9}">
												${ mrFile.originalName}
												</c:when>
												<c:otherwise>
													${fn:substring(mrFile.originalName,0,9)}
												</c:otherwise>
											</c:choose>
	                                 	</div>
	                                 </c:if>
	                                 </c:forEach>
                            </c:if>
                       
       </div>
            
                            
          <div class="gallery" style="width:100%;">	 
			<ul>
			  <c:forEach items="${workClasses.listClassesMessage}" var="mrFile" varStatus="filestatus"> 
		     	<c:if test="${fn:substring(mrFile.fileType,0,1)=='p'}">
					<li><a href="${pageContext.request.contextPath}/uploadmr/${mrFile.generateName}">
					<img style="width: 69px;height: 69px;" src="${pageContext.request.contextPath}/uploadmr/${mrFile.generateName}" />
					</a></li>
				</c:if>
				</c:forEach>
				<!--此处做为备用 -->
				<li><a></a></li>
			</ul>
			 <div class="clear"></div>
		</div>

                    </div>
                </div>
                <div class="col-sm-3">
                        <h4>
                            进度情况
                        </h4>
                        <p>
                            当前已经有 3 位老师提供了知料
                        </p>
                        <div class="row text-center">
                            <div class="col-lg-4">
                                <div >
                                <span class="easypie-text">共${fn:length(workClasses.listClassesMessage)}份</span>
                                </div>
                                <h5>参考资料</h5>
                            </div>
                            <div class="col-lg-4">
                                <div >
                                <span class="easypie-text">共${fn:length(workClasses.listUploadFile)}份</span>
                                </div>
                                <h5>上传资料</h5>
                            </div>
                            <div class="col-lg-4">
                                <div >
                                <span class="easypie-text">共 ${fn:length(workClasses.listComment)}条</span>
                                </div>
                                <h5>评论数</h5>
                            </div>
                        </div>
<!--                         <div class="m-t"> -->
<!--                             <small>请尽快完成相关项目的开发、测试工作</small> -->
<!--                         </div> -->

                </div>

            </div>
            
            
            
            
             <!-- 已上传的资料列表 -->
             <div class="row">
                    <div class="col-lg-3">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div class="file-manager">
                                    <h5>上传资料管理：</h5>
                                    <a href="#" class="file-control"></a>
                                    右边是各位老师上传的资料信息!
                                    <div class="hr-line-dashed"></div>
                                   	<div class="text-center">
                                    	<a data-toggle="modal" class="btn btn-primary" href="form_basic.html#modal-form">
                                    	我要上传附件</a>
                                	</div>
                                   
                                    <div class="hr-line-dashed"></div>
 									
 									<!-- 课题参与人 -->
								 <h5 class="tag-title">${workClasses.title}－参与的老师</h5>
                                    <ul class="tag-list" style="padding: 0">
                                     <c:forEach items="${workClasses.listTeacher}" var="teacher" varStatus="filestatus"> 
                                        <li>
                                        <a href="">${teacher.name}</a>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                    <div class="clearfix"></div>
                                    <br/>
                                    <!-- 评论日志 -->
                                    <h5>最新动态</h5>
                                    <ul class="folder-list" style="padding: 0">
                                    <c:forEach items="${workClasses.listComment}" var="comment" varStatus="filestatus"> 
                                        <li><a href="">
                                        ${comment.name} : ${comment.message}</a>
                                        </li>
                                        </c:forEach>
                                       
                                        <li>
                                         <div class="hr-line-dashed"></div>
                                        </li>
	                                    <li>
	                                     <form  id="form" action="commentMessage" method="post">
	                                    	<input type="text" placeholder="我要留言..." class="form-control" name="message">
	                                    	<input type="hidden" value="${workClasses.id}" name="workClassesId">
	                                    	<button type="submit" class="btn btn-primary btn-block m-t">添加评论</button>
	                                    	</form>
	                                    </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 animated fadeInRight">
                        <div class="row">
                            <div class="col-lg-12">
                            <c:forEach items="${workClasses.listUploadFile}" var="superFile" varStatus="status">
                            	 <c:forEach items="${superFile.listUploadMessage}" var="item" varStatus="status">
                                <div class="file-box" >
                                    <div class="file">
                                            <span class="corner"></span>
											<c:choose>
												<c:when test="${fn:substring(item.fileType,0,1)=='p'}">
													  <div class="image" title="图片－${item.generateName}">
			                                                <img alt="image" class="img-responsive" 
			                                                src="${pageContext.request.contextPath}/uploadmr/min_${item.generateName}">
			                                            </div>
												</c:when>
												<c:when test="${fn:substring(item.fileType,0,1)=='d'}">
													 <div class="icon" title="文件－${item.generateName}">
													 <!-- 文件 -->
		                                                <i class="fa fa-file"></i>
		                                            </div>
												</c:when>
												<c:when test="${fn:substring(item.fileType,0,1)=='v'}">
													 <div class="icon" title="视频－${item.generateName}">
													 <!-- 视频 -->
		                                                <i class="img-responsive fa fa-film"></i>
		                                            </div>
												</c:when>
												<c:when test="${fn:substring(item.fileType,0,1)=='m'}">
													  <div class="icon" title="音乐－${item.generateName}">
													  <!-- 音乐 -->
			                                                <i class="fa fa-music"></i>
			                                            </div>
												</c:when>
												<c:when test="${fn:substring(item.fileType,0,1)=='c'}">
													 <div class="icon" title="压缩包－${item.generateName}">
		                                                <i class="fa fa-book"></i>
		                                            </div>
												</c:when>
												<c:otherwise>
												<div class="icon" title="其他－${item.generateName}">
		                                                <i class="fa fa-bar-chart-o"></i>
		                                            </div>
												</c:otherwise>
											</c:choose>
                                            
                                            <div class="file-name" style="text-align: center;">
                                            	${superFile.name}-
                                            	<c:choose>
													<c:when test="${fn:length(item.originalName)<10}">
														${item.originalName}
													</c:when>
													<c:otherwise>
														${fn:substring(item.originalName,0,10)}...
													</c:otherwise>
												</c:choose>
												
                                                <br/>
                                                <small style="padding-right: 30%">
                                                  <a target="_" href="${pageContext.request.contextPath}/uploadmr/${item.generateName}">
                                                	下载
                                                 </a>
                                                </small>
                                                 <small>
	                                                 <a href="${pageContext.request.contextPath}/photo/delete?id=${item.id}&type=${type}&capid=${param['id']}">
	                                                 	删除
	                                                 </a>
                                                 </small>
                                            </div>

                                    </div>
                                </div>
                                </c:forEach>
                               </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>   
               
            </div>
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
                                	<input type="hidden" value="${workClasses.id}" name="workClassesId">
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
<script src="${pageContext.request.contextPath}/assets/web/messageRepositoryWeb/Assets/js/zoom.min.js"></script>

  <!-- 上传控件-->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dropzone/dropzone.js"></script>
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
                this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                	
                    e.preventDefault();
                    e.stopPropagation();
                    myDropzone.processQueue();
                });
                this.on("sendingmultiple", function () {
                });
                this.on("successmultiple", function (files, response) {
                	location.href = "${pageContext.request.contextPath}/workClasses/find?id=${param['id']}";
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
    $("#add-news-form").validate();//初始化from验证
});
</script>

</body>
</html>
