<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>信息化资源库－修改</title>


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
											<li><a data-toggle="tab" href="#tab-1">${mr.name}-修改</a></li>
										</ul>
									</div>
								</div>

								<div class="panel-body">
									<div class="tab-content">
										
										
										<!-- 上传基本资料 -->
										<div id="tab-1" class="tab-pane active">
										<!-- 我要上传 -->
														<div class="row">
														<!-- 上传文件 -->
										                    <div class="col-lg-7">
										                        <div class="ibox float-e-margins">
										                            <div class="ibox-title">
										                                <h5>继续添加文件</h5>
										                                <div class="ibox-tools">
										                                    <a class="collapse-link">
										                                        <i class="fa fa-chevron-up"></i>
										                                    </a>
										                                    
										                                </div>
										                            </div>
										                            <div class="ibox-content">
										                                <form  id="my-awesome-dropzone" class="dropzone" action="uploadFile">
										                                     <div class="dropzone-previews"><strong style="color:red;">
										                                    1. 点击此处，选择所需要的文件（可以是视频、图片、word等，数量不限）</strong>
										                                    
										                                    </div>
<!-- 										                                    <button onclick="uploadFile()"  type="submit" class="btn btn-primary pull-right">上传文件</button> -->
										                                </form>
										                                <div>
										                                    <div class="m"><strong style="color:red;">2. 点击右处 上传文件按扭
										                                    <button id ='upf' name="upf" onclick="uploadFile()"  type="button" class="btn btn-primary pull-right">上传文件</button>
										                                     </strong></div>
										                                </div>
										                                <div>
										                                
										                            </div>
										                        </div>
										                        </div>
										                        
										                         <div class="row"> 
										                           <c:forEach items="${mr.file}" var="file" varStatus="status">
										                            
										                                   <div class="col-lg-6">
												                                <div class="ibox float-e-margins">
												                                    <div class="ibox-title">
												                                    <h5>
																				       <c:choose>
																							<c:when test="${fn:length(file.originalName)<12}">
																								${file.originalName}
																							</c:when>
																							<c:otherwise>
																								${fn:substring(file.originalName,0,12)}…(${file.extension})
																							</c:otherwise>
																						</c:choose>
																						
																					</h5>
												                                        
												                                        <div class="ibox-tools">
												                                            <a href="deleteSubFile?id=${mr.id}&subFile=${file.id}" class="close-link">
												                                                <i class="fa fa-times"></i>
												                                            </a>
												                                        </div>
												                                    </div>
												                                </div>
												                            </div>
												                            
												                      </c:forEach>
										                        </div>
										                    </div>
										                    
										                    <!-- 文件信息 -->
										                    <div class="col-lg-5">
										                    	<div class="ibox float-e-margins">
																<div class="ibox-title">
																	<h5>资源信息-修改</h5>
																	<div class="ibox-tools">
																		<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
																		</a>
				
																	</div>
																</div>
																<div class="ibox-content">
														<div class="row">
							                                <form  action="createOrUpdateToFind" class="form-horizontal m-t" id="commentForm" method="post">
							                                    <div class="form-group">
							                                        <label class="col-sm-3 control-label">标题：</label>
							                                        <div class="col-sm-8">
							                                            <input id="name" name="name"  value="${mr.name}"
							                                            minlength="2" type="text" class="form-control" required="" aria-required="true">
							                                        </div>
							                                    </div>
							                                    <div class="form-group">
							                                        <label class="col-sm-3 control-label">类别：</label>
							                                        <div class="col-sm-8">
																	<select id="menuId" class="form-control m-b"
																		name="menuId">
																		<c:forEach items="${listMenu}" var="item"
																			varStatus="status">
																			<c:forEach items="${item.listPermissionSubMenu}"
																				var="subitems" varStatus="status">
																				<c:choose>
																					<c:when test="${subitems.menuType=='2' }">
																						<c:forEach
																							items="${subitems.listPermissionSubMenu}"
																							var="subitems2" varStatus="status">
																							<option value="${subitems2.id}">${subitems2.menuName}</option>
																						</c:forEach>

																					</c:when>

																					<c:otherwise>
																						<c:if test="${subitems.menuName !='首页'}">
																							<option value="${subitems.id}">${subitems.menuName}</option>
																						</c:if>

																					</c:otherwise>
																				</c:choose>

																			</c:forEach>
																		</c:forEach>
																	</select>
																</div>
							                                    </div>
							                                    
							                                    
							                                    <div class="form-group">
							                                        <label class="col-sm-3 control-label">年级：</label>
							                                        <div class="col-sm-8">
							                                           <select id="gradeName" class="form-control m-b" name="gradeName">
							                                                <option selected="selected">全部</option>
																              <option value="一年级">一年级</option>
																              <option value="二年级">二年级</option>
																              <option value="三年级">三年级</option>
																              <option value="四年级">四年级</option>
																              <option value="五年级">五年级</option>
							                                            </select>
							                                        </div>
							                                    </div>
							                                    
							                                     <div class="form-group">
							                                        <label class="col-sm-3 control-label">学科/分类：</label>
							                                        <div class="col-sm-8">
																	<select id="subjectName" class="form-control m-b"
																		name="subjectName">
																		<c:forEach items="${subjectList}" var="item" varStatus="status">
																			<option value="${item.name}">${item.name}</option>
																		</c:forEach>
																	</select>
																</div>
							                                    </div>
							                                    <div class="form-group">
							                                        <label class="col-sm-3 control-label">范围：</label>
							                                        <div class="col-sm-8">
							                                           <select id="state" class="form-control m-b" name="state">
							                                                <option value="1">对外共享</option>
							                                                <option value="2">校内私有</option>
							                                            </select>
							                                        </div>
							                                    </div>
							                                    <div class="form-group">
							                                        <label class="col-sm-3 control-label">名师/执教者：</label>
							                                        <div class="col-sm-8">
							                                           <input value="${mr.mentor}" id="mentor" type="text" class="form-control" name="mentor" required="" aria-required="true">
							                                        </div>
							                                    </div>
							                                     <div class="form-group">
							                                        <label class="col-sm-3 control-label">作者：</label>
							                                        <div class="col-sm-8">
							                                            <input value="${mr.author}" id="author" type="text" class="form-control" name="author" value="" required="" aria-required="true">
							                                        </div>
							                                    </div>
							                                    <div class="form-group">
							                                        <label class="col-sm-3 control-label">内容：</label>
							                                        <div class="col-sm-8">
							                                            <textarea  id="message" name="message" class="form-control">${mr.message}</textarea>
							                                        </div>
							                                    </div>
							                                    <div class="form-group">
							                                        <div class="col-sm-4 col-sm-offset-3">
							                                          <input type="hidden" value="${mr.id}" id="id" name="id">
							                                            <button class="btn btn-primary" type="submit">提交</button>
							                                        </div>
							                                    </div>
							                                </form>
							                        </div>
														</div>
													
												</div>
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

                    this.element.querySelector("button[type=submit]").addEventListener("click", function (e) {
                        e.preventDefault();
                        e.stopPropagation();
                        myDropzone.processQueue();
                    });
                    this.on("sendingmultiple", function () {});
                    this.on("successmultiple", function (files, response) {});
                    this.on("errormultiple", function (files, response) {});
                }

            }

        });
    </script>

		<script>
$(document).ready(function () {
	//选择科目，菜单，年级,状态
	$("#menuId").find("option[value='${mr.menuId}']").attr("selected", "selected");
	$("#gradeName").find("option[value='${mr.gradeName}']").attr("selected", "selected");
	$("#subjectName").find("option[value='${mr.subjectName}']").attr("selected", "selected");
	$("#state").find("option[value='${mr.state}']").attr("selected", "selected");
	
	
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
