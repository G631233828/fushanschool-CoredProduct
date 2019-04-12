<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<style>
 .form-group{
 margin-bottom: 5px !important;
 }
   .m-b{
 margin-bottom: 5px !important;
 }

</style>


<html>

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
									<h5 id="add-title">${name}添加</h5>
									<div class="ibox-tools">
										<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										</a> <a class="close-link"> <i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="ibox-content">
									<div class="modal-body">
										<p>
										<form id="add-news-form" action="${ctx}/webSchool/addnews"
											method="POST" class="form-horizontal"
											enctype="multipart/form-data">
											<div class="form-group">
												<label class="col-sm-2 control-label">标题</label>
												<div class="col-sm-10">
													<input type="text" name="title" id="title"
														class="form-control" placeholder="标题">
												</div>
											</div>
												<div class="form-group">
												<label class="col-sm-2 control-label">作者</label>
												<div class="col-sm-4">
													<input type="text" name="author" id="author"
														class="form-control" placeholder="作者" value="${author}"/>
												</div>
												<label class="col-sm-2 control-label">来源</label>
												<div class="col-sm-4">
													<input type="text" name="source" id="source" value="http://"
														class="form-control" placeholder="来源">
												</div>
											</div>
											 	<div class="form-group">
												<label class="col-sm-2 control-label">同步到其它栏目</label>
													<div class="col-sm-8">
													<input type="text"  id="modelsource" 
														class="form-control" placeholder="同步到其它栏目">
												
												</div>
												<div class="col-sm-2">
													<button type="button" class="btn btn-primary btn-sm" id="select-model">选择模块</button>
												</div>
												
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">置顶</label>
												<div class="col-sm-10">
													<select class="form-control m-b" name="top">
														<option value="1">否</option>
														<option value="2">是</option>
													</select>
												</div>
											</div>
											    <div class="form-group">
			                                    <label class="col-sm-2 control-label">创建时间</label>
			                                    	   <div class="col-sm-10">
				                                        <input type="text" value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${simpleDate}" />" id="createTime" name="createDate" class="form-control">
				                                    </div>
			                              	  </div>
			                                	<div class="form-group">
			                                    <label class="col-sm-2 control-label">接受时间</label>
			                                    	   <div class="col-sm-10">
				                                        <input type="text" id="acceptTime" name="acceptDate" value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${simpleDate}" />" class="form-control">
				                                    </div>
			                              	  </div>
											<div class="hr-line-dashed"></div>
											<div class="form-group">
												<label class="col-sm-2 control-label">标题图片</label>
												<div class="col-sm-10">
													<input type="file" name="file" id="file"
														class="form-control" placeholder="图片"> <span
														class="help-block m-b-none">主题图片</span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">推送到bananer</label>
												<div class="col-sm-10">
													<select class="form-control m-b" name="state">
														<option value="1">否</option>
														<option value="0">是</option>
													</select>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">是否需要登录</label>
												<div class="col-sm-10">
													<select class="form-control m-b" name="privates">
														<option value="1">否</option>
														<option value="0">是</option>
													</select>
												</div>
											</div>		
											<!-- 批量添加图片 -->
											<div class="form-group">
												<label class="col-sm-2 control-label">批量添加图片</label>
													<div class="col-sm-8" id="imgid">
													
													待添加
												
												</div>
												<div class="col-sm-2">
													<a data-toggle="modal" class="btn btn-primary" href="form_basic.html#modal-form">上传图片</a>
												</div>
												
											</div>									
											
											<div class="hr-line-dashed"></div>
											<input type="hidden" name="moduleId"
												value="${moduleId}"> 
												<input type="hidden"
											name="menuName" value="${name}">
												<input type="hidden"
											name="token" value="${token}">
											<input id="moduleIds" name="moduleIds" type="hidden"/>
											<input id="moduleNames" name="moduleNames" type="hidden"/>
											<input id="tokens" name="tokens" type="hidden" />
											<textarea name="content" id="content" style="display: none"></textarea>
											<input type="hidden" id="edit-id" />
											<div class="form-group">
												<label class="col-sm-2 control-label">内容</label>
												<div class="col-sm-10">
													<div class="summernote"></div>
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
	
	
	<!-- 弹出层 -->
	        <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">同步模块</h4>
                                        </div>
                                        <div class="modal-body">
                                        
                    <!-- 菜单加载 -->
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
                                
                                <button  type="submit" class="btn btn-primary pull-right">上传文件</button>
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
	<!-- Mainly scripts -->
	<script src="${ctx}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
	<!-- SUMMERNOTE -->
	<script
		src="${ctx}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
	<script
		src="${ctx}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>
	<script src="${ctx}/assets/admin/js/plugins/datapicker/bootstrap-datepicker.js"></script>
	
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
                    this.on("sendingmultiple", function () {
                    });
                    this.on("successmultiple", function (files, response) {
                    	document.getElementById("imgid").innerHTML=response;  
                    });
                    this.on("errormultiple", function (files, response) {
                    	
                    });
                }

            }

        });
    </script>
	
	
	
	
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
			$('#select-model').click(function(e){
			    $('#myModal5').modal('show');
			});
			$("#btn-add-news-push").click(function(){
				var attrChk="";
				var moduleNames="";
				var token="";
				$("#myModal5 input[name='check_box']:checked").each(function(){
					attrChk+=$(this).val() +',';
					moduleNames+=$(this).next().val()+",";
					token+=$(this).next().next().val()+",";
					}
				);
				var moduleIds=attrChk.substring(0,attrChk.length-1);
				var moduleName=moduleNames.substring(0,moduleNames.length-1);
				var tokens=token.substring(0,token.length-1);
				console.info(moduleIds);
				console.info(moduleName);
				console.info(tokens);
				$("#moduleIds").val(moduleIds);
				$("#modelsource").val(moduleName);
				$("#moduleNames").val(moduleName);
				$("#tokens").val(tokens);
			    $('#myModal5').modal('hide');
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
			    
		});
		
	</script>
</body>

</html>
