<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<style>
 .form-group{
 margin-bottom: 5px !important;
 }
   .m-b{
 margin-bottom: 5px !important;
 }

</style>
<body class="top-navigation">
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg">
			<%@include file="public/top.jsp"%>
			<div class="wrapper wrapper-content">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>${name}编辑</h5>
									<div class="ibox-tools">
										<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										</a> <a class="close-link"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="ibox-content">
									<div class="modal-body">
										<p>
										<form id="add-news-form" action="${ctx}/webSchool/updatenews"
											method="post" class="form-horizontal"
											enctype="multipart/form-data">
											<div class="form-group">
												<label class="col-sm-2 control-label">标题</label>
												<div class="col-sm-10">
													<input type="text" name="title" id="title" value="${news.title}"
														class="form-control" placeholder="标题">
												</div>
											</div>
														<div class="form-group">
												<label class="col-sm-2 control-label">作者</label>
												<div class="col-sm-10">
													<input type="text" name="author" id="author"
														class="form-control" placeholder="作者" value="${news.author}">
												</div>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">来源</label>
												<div class="col-sm-10">
													<input type="text" name="source" id="source"
														class="form-control" placeholder="来源" value="${news.source}">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">置顶</label>
												<div class="col-sm-10">
													<select class="form-control m-b" name="top" id="top">
														<option value="2">是</option>
														<option value="1">否</option>
													</select>
												</div>
											</div>
											    <div class="form-group">
			                                    <label class="col-sm-2 control-label">创建时间</label>
			                                    	   <div class="col-sm-10">
				                                        <input type="text" id="createTime" name="createDate" value="${news.createDate}" class="form-control">
				                                    </div>
			                              	  </div>
			                                	<div class="form-group">
			                                    <label class="col-sm-2 control-label">接受时间</label>
			                                    	   <div class="col-sm-10">
				                                        <input type="text" id="acceptTime" name="acceptDate" value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${news.acceptTime }" />" class="form-control">
				                                    </div>
			                              	  </div>
											<div class="hr-line-dashed"></div>
											<div class="form-group">
												<label class="col-sm-2 control-label">标题图片</label>
												<div class="col-sm-10">
													<input type="file" name="file" id="file"
														class="form-control" placeholder="图片"> <span
														class="help-block m-b-none">推送到bananer的主题图片</span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">推送到bananer</label>
												<div class="col-sm-10">
													<select class="form-control m-b" name="state" id="state">
														<option value="0">是</option>
														<option value="1">否</option>
													</select>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">是否需要登录</label>
												<div class="col-sm-10">
													<select class="form-control m-b" name="privates">
													<c:choose>
														<c:when test="${news.privates=='0'}">
															<option value="0">是</option>
															<option value="1">否</option>
														</c:when>
														<c:otherwise>
															<option value="1">否</option>
															<option value="0">是</option>
														</c:otherwise>
													</c:choose>
														
													</select>
												</div>
											</div>
											<div class="hr-line-dashed"></div>
											
											
											
											<div class="hr-line-dashed"></div>
											<input type="hidden" name="moduleId" value="${moduleId}"> 
											<input type="hidden" name="menuName" value="${menuName}">
											<input type="hidden" name="token" value="${token}">
											<input type="hidden" id="edit-id" name="id" value="${news.id}"/>
											
											<textarea name="content" id="content" style="display: none"></textarea>
										
											<div class="form-group">
												<label class="col-sm-2 control-label">内容</label>
												<div class="col-sm-10">
													<div class="summernote">
												${news.content}
													</div>
												</div>
											</div>
										<div class="form-group">
											<div class="text-center">
												<button type="button" class="btn btn-primary btn-lg" id="add-news-btn">保存</button>
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

			<div class="footer">
				<div class="pull-right">
					By：<a href="http://www.zi-han.net" target="_blank">zihan's blog</a>
				</div>
				<div>
					<strong>Copyright</strong> H+ &copy; 2014
				</div>
			</div>

		</div>
	</div>

	<!-- Mainly scripts -->
	<script src="${ctx}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
	<!-- SUMMERNOTE -->
	<script
		src="${ctx}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
	<script
		src="${ctx}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>
			<script src="${ctx}/assets/admin/js/plugins/datapicker/bootstrap-datepicker.js"></script>

	<script>
		function sendFile(file, editor, welEditable) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "${ctx}/webSchool/editImgUpload",
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					var fileUrl="${ctx}"+data.data;
					editor.insertImage(welEditable, fileUrl);
				}
			});
		}

		$(document).ready(function() {
			$('.summernote').summernote({
				lang : 'zh-CN',
				height: 400,
				 minHeight: 400,             // set minimum height of editor
				  maxHeight: 700,
				onImageUpload : function(files, editor, $editable) {
					sendFile(files[0], editor, $editable);
				}
			});
			$("#add-news-btn").click(function(){
				   var newsContent=$('.summernote').code();
				     var textareaContent=$("#content").html(newsContent);
				     $("#add-news-form").submit();
				
			});
		    $('#createTime').datepicker({
		    	startView: 2,
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                language: 'zh-CN',
                format:'yyyy-mm-dd',
                forceParse: false,
                autoclose: true,
                todayHighlight: true
            }); 
			
		    $('#acceptTime').datepicker({
		    	startView: 2,
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                language: 'zh-CN',
                format:'yyyy-mm-dd',
                forceParse: false,
                autoclose: true,
                todayHighlight: true
            }); 
			$("#state").val("${news.state}");
			$("#top").val("${news.top}");
		
		});
	</script>
</body>

</html>
