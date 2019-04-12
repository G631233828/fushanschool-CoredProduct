<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>信息发布</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="apple-mobile-web-app-title" content="WeChat" />
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_title.png" 
   type="image/x-icon" />
</head>
<!-- datepicker  日期控件css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/js/datepicker/datepicker.css"
	type="text/css" />

<body>


	<section class="vbox">
		<!-- .top-->
		<%@include file="../../public/top.jsp"%>
		<section>
			<section class="hbox stretch">
				<!-- .aside left menu -->
				<%@include file="../../public/left.jsp"%>
				<!-- /.aside -->
				<!-- /.aside -->
				<section id="content">
					<section class="vbox">
						<section class="scrollable padder">
							<div class="m-b-md">
								<h3 class="m-b-none">信息发布管理</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form data-validate="parsley"  action="createOrUpdateToFind"
										method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty informationDelivery}">
															<input name="id" value="${informationDelivery.id}" type="hidden"
																class="form-control">								
                        										修改操作
                        								</c:when>
														<c:otherwise>
                        										添加操作
                        								</c:otherwise>
													</c:choose>

												</span>
											</header>
											<div class="panel-body">
												<p class="text-muted"></p>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label></label>
														<label> <span style="float: left;">消息标题</span>
														</label> <span id="dishesnamealert"
															style="float: right; color: red;">*</span> 
														 <input  name="title" id="title" value="${informationDelivery.title}" type="text" 
														class="form-control" data-required="true" maxlength="20">
												</div>
			
												<div class="col-sm-6">
												
														<label>接收人群</label> 
														  <select name="receive" id="receive"	class="form-control" data-required="true">
															<c:choose>
																<c:when test="${not empty informationDelivery}">
																	<c:if test="${informationDelivery.receive=='teacherUser'}">
																	<option value="${informationDelivery.receive}">所有老师</option>
																	</c:if>
																	<c:if test="${informationDelivery.receive=='all'}">
																	<option value="${informationDelivery.receive}">所有用户</option>
																	</c:if>
																	<c:if test="${informationDelivery.receive=='SchoolManager'}">
																	<option value="${informationDelivery.receive}">学校管理员</option>
																	</c:if>
																	<c:if test="${informationDelivery.receive=='otheruser'}">
																	<option value="${informationDelivery.receive}">其他用户</option>
																	</c:if>
																</c:when>
															</c:choose>
															<option value="">请选择</option>
															<c:if test="${UserType=='superManager'}"><!-- 如果用户的类型为超级管理员 -->
															<c:if test="${informationDelivery.receive!='all'}">
																<option value="all">所有用户</option>
															</c:if>
															<c:if test="${informationDelivery.receive!='SchoolManager'}">
																<option value="SchoolManager">学校管理员</option>
															</c:if>
															<c:if test="${informationDelivery.receive!='teacherUser'}">
																	<option value="teacherUser">所有老师</option>
															</c:if>
																
															
															<!-- 	<option value="otheruser">其他用户</option> -->
															</c:if>
															<c:if test="${UserType=='SchoolManager'||UserType=='teacherUser'||UserType=='otheruser'}"><!-- 如果用户的类型为学校管理员 -->
																<c:if test="${informationDelivery.receive!='all'}">
																<option value="all">所有用户</option>
															</c:if>
															<c:if test="${informationDelivery.receive!='teacherUser'}">
																	<option value="teacherUser">所有老师</option>
															</c:if>
													<!-- 			<option value="otheruser">其他用户</option> -->
															</c:if>
														</select>
													</div>
												</div>
												
													<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>消息类型</label> 
														  <select name="contentType" id="contentType"	class="form-control" data-required="true">
															<c:choose>
																<c:when test="${not empty informationDelivery}">
																	<option value="${informationDelivery.contentType}">${informationDelivery.contentType}</option>
																</c:when>
															</c:choose>
															<option value="">请选择</option>
																<c:if test="${informationDelivery.contentType!='系统更新维护'}">
																		<c:if test="${UserType=='superManager'}">//如果用户的类型为超级管理员
																<option value="系统公告">系统公告</option>
															</c:if>
															</c:if>
															<c:if test="${informationDelivery.contentType!='普通消息'}">
															<option value="普通公告">普通公告</option>
															</c:if>
														</select>
													</div>

													<div class="col-sm-6">
													<c:choose>
														<c:when test="${not empty informationDelivery }">
														<label>发布人</label> <input value="${informationDelivery.author}"
															name="author" type="text" class="form-control" data-required="true" >
														</c:when>
														<c:otherwise>
														<label>发布人</label> <input value="${UserName}"
															name="author" type="text" class="form-control" data-required="true" >
														</c:otherwise>
													</c:choose>
													</div>
													
												</div>
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>检查日期</label> <input data-type="dateIso"
															style="width: 100%"
															class="input-sm input-s datepicker-input form-control"
															name="setDate" placeholder="选择日期" size="16" type="text"
															value="<fmt:formatDate value="${informationDelivery.setDate}" type="date" pattern="yyyy-MM-dd"/>"
															data-date-format="yyyy-mm-dd" data-required="true">
													</div>
													
												</div>
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
													<label>消息内容</label>
												<textarea name="content" placeholder="消息内容" 
													class="form-control parsley-validated" rows="7" style="width:200%;">${informationDelivery.content}</textarea>
													</div>
												</div>
												
											

											</div>
												<input id="schoolId" name ="schoolId" value="${sessionScope.SSchool.id}" type="hidden">
											<footer class="panel-footer text-right bg-light lter">
												<button type="submit" class="btn btn-success btn-s-xs">提交</button>
											</footer>
										</section>
									</form>
								</div>
							</div>

						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
</body>
<script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
</html>
