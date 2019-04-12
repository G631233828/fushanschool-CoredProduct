<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>信息化资源库－上传</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
<!-- 上传控件 -->
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/basic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dropzone/dropzone.css" rel="stylesheet">
<!-- 动态表格 -->
<link
	href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
<body>
	<div id="wrapper">
		<!-- .aside left menu -->
		<%@include file="../../public/left.jsp"%>
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- .aside top jsp -->
			<%@include file="../../public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="row">

					<div class="row">
						<div class="col-lg-12">
							<div class="panel blank-panel">
								<div class="panel-heading">
									<div class="panel-title m-b-md">
<!-- 										<h4>信息化资源库管理</h4> -->
									</div>
									<div class="panel-options">
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="#tab-1">信息库资源管理</a></li>
											
										</ul>
									</div>
								</div>

								<div class="panel-body">
									<div class="tab-content">
										<!-- 待审核 -->
										<div id="tab-1" class="tab-pane active">
											<div class="ibox float-e-margins">
												<div class="ibox-title">
													<h5 style="color: red;">审核－资源</h5>
													<div class="ibox-tools">
														<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
														</a>
													</div>
												</div>
												<div class="ibox-content">
													<table
														class="table table-striped table-bordered table-hover dataTables-example">
														<thead><tr>
																<th>标题</th>
																<th>学科</th>
																<th>作者</th>
																<th>内容</th>
																<th>操作</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${pageList}" var="item"
																varStatus="status">
																
																<tr class="gradeX">
																	<td>${item.name}</td>
																	<td>${item.subjectName}</td>
																	<td>${item.author}</td>
																	<td>${item.message}</td>
																	<td class="center">
																	<c:if test="${item.isRole == '2' }">
																		<button type="button" class="btn btn-primary btn-xs edit-news"
																		 data-id="1" onclick="approvedAlert('${item.id}')">审核通过</button>
																	</c:if>
																		<button type="button"
																			class="btn  btn-warning btn-xs delete-news"
																			data-id="1" onclick="deleteAlert('${item.id}')">删除</button>
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
						</div>

						<!-- 内容 -->
						<div class="col-lg-12"></div>


					</div>
				</div>
			</div>
		</div>

		<!-- 删除弹出层提示 -->
		<div class="modal inmodal fade" id="deleteModal6" tabindex="-1"
			role="dialog" aria-hidden="true" style="padding: 15%">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<span style="float: left; color: red; font-size: 18px;">删除提示</span>
					</div>
					<div class="modal-body">
						<h3>您确认是否要删除此记录吗?</h3>
					</div>
					<input type="hidden" id="delete-id">
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" onclick="deleteById();"
							class="btn btn-primary delete-confirm-btn">确认</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 审核弹出层提示 -->
		<div class="modal inmodal fade" id="approved" tabindex="-1"
			role="dialog" aria-hidden="true" style="padding: 15%">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<span style="float: left; color: red; font-size: 18px;">审核提示</span>
					</div>
					<div class="modal-body">
						<h3>您确认是否要将此 <span style="color: blue;">"资源" </span>审核通过吗?</h3>
					</div>
					<input type="hidden" id="delete-id">
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" onclick="approvedById();"
							class="btn btn-primary delete-confirm-btn">确认</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 驳回弹出层提示 -->
		<div class="modal inmodal fade" id="rejected" tabindex="-1"
			role="dialog" aria-hidden="true" style="padding: 15%">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<span style="float: left; color: red; font-size: 18px;">驳回提示</span>
					</div>
					<div class="modal-body">
						<h3>您确认是否要将此 <span style="color: red;">"资源" </span>驳回吗?它将无法展示到网站上</h3>
					</div>
					<input type="hidden" id="delete-id">
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
						<button type="button" onclick="rejectedById();"
							class="btn btn-primary delete-confirm-btn">确认</button>
					</div>
				</div>
			</div>
		</div>

	
		<!-- 更新内容是传值 -->
		<script type="text/javascript">
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
 	
 	//资源修改
	function edit(id) {
		window.location.href = "edit?id="+id;
 	}
 	
 	
 
	//审核与驳回
	var rejectedAndapprovedId;
	//驳回
	function rejectedAlert(id) {
		$('#rejected').modal('show');
		rejectedAndapprovedId = id;
	}
	function rejectedById() {
		window.location.href = "audit?id="  + rejectedAndapprovedId+"&isRole=2";
	}
	
	//通过
	function approvedAlert(id) {
		$('#approved').modal('show');
		rejectedAndapprovedId = id;
	}
	function approvedById() {
		window.location.href = "audit?id=" + rejectedAndapprovedId+"&isRole=1";
	}
		</script>

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
                    
//                     this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
//                         e.preventDefault();
//                         e.stopPropagation();
//                         myDropzone.processQueue();
//                     });
                    this.on("sendingmultiple", function () {});
                    this.on("successmultiple", function (files, response) {});
                    this.on("errormultiple", function (files, response) {});
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
