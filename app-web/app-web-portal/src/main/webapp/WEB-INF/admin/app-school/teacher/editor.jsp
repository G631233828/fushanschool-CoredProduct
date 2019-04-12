<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>老师管理</title>

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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/datepicker/datepicker.css" type="text/css" />
 <script type="text/javascript"> 
	var checkForms=false;
            function check(){
                    $.ajax( { 
                        type : "POST", 
                        url : "ajaxCheckName", 
                        data : "name="+$("#name").val(), 
                        dataType: "text", 
                        success : function(msg) { 
                        	if(msg=="true"){
                        		if($("#updatename").val()!=$("#name").val()){
                        	document.getElementById('namealert').innerHTML = "此姓名已经存在";
                    		document.getElementById('namealert').style.cssText="float: right; color: red;";
                    		checkForms=false;
                        		}
                        	}else{
                        		checkForms=true;
                        		document.getElementById('namealert').innerHTML = "姓名可用";
                        		document.getElementById('namealert').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
              }
            var checkFormsids=false;
            function checkIds(){
                $.ajax( { 
                    type : "POST", 
                    url : "ajaxCheckIsIds", 
                    data : "ids="+$("#teachernum").val(), 
                    dataType: "text", 
                    success : function(msg) { 
                    	if(msg=="true"){
                    		if($("#updateteachernum").val()!=$("#teachernum").val()){
                    	document.getElementById('teachernumalert').innerHTML = "此编号已经存在";
                		document.getElementById('teachernumalert').style.cssText="float: right; color: red;";
                		checkFormsids=false;
                    		}
                    	}else{
                    		checkFormsids=true;
                    		document.getElementById('teachernumalert').innerHTML = "编号可用";
                    		document.getElementById('teachernumalert').style.cssText="float: right; color: #11AB5A;";
                    	}
                    } 
                }); 
          }
            
            //验证表单
            function checkForm(){  
            	if($("#updatename").val()==$("#name").val()){
            		checkForms=true;
            	}
            	
            	if($("#updateteachernum").val()==$("#teachernum").val()){
            		checkFormsids=true;
            	}
            	if(checkForms==false || checkFormsids==false)
            		return false;
            	else
            		return true;
            }
        </script>
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
								<h3 class="m-b-none">老师信息管理</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form onsubmit="return checkForm();"  data-validate="parsley" action="createOrUpdateToFind"
										method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty teacher}">
															<input name="id" value="${teacher.id}" type="hidden"
																class="form-control">
															<input id="updatename" value="${teacher.name}"
																type="hidden">
																<input id="updateteachernum" value="${teacher.teachernum}"
																type="hidden">
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
														<label>编号</label>
														<span id="teachernumalert"
															style="color: red;float: right;">*</span> 
														 <input name="teachernum" id="teachernum" onblur="checkIds();"
														placeholder="老师编号" data-rangelength="[1,15]" 	value="${teacher.teachernum}" type="text" class="form-control"
															data-required="true">
													</div>
													<div class="col-sm-6">
													<label> <span> 姓名</span>
														</label> <span id="namealert"
															style="color: red;float: right;">*</span> 
													<input value="${teacher.name}" onblur="check();" data-rangelength="[2,8]" 
														placeholder="填写姓名" id ="name"	name="name" type="text" class="form-control" data-required="true">
													</div>
												</div>
												
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>出生日期</label> 
<!-- 														<input name="birthDate" -->
<%-- 														placeholder="选择日期"	value="${teacher.birthDate}" type="text" class="form-control" --%>
<!-- 															data-required="true" > -->
															
															<input data-type="dateIso" style="width:100%" class="input-sm input-s datepicker-input form-control"  
															name="birthDate" placeholder="选择日期"
															 size="16" type="text" value="${teacher.birthDate}" data-date-format="yyyy-mm-dd" data-required="true">
													</div>
													<div class="col-sm-6">
														<label>性别</label>
<!-- 														 <input  placeholder="选择性别"	type="text" class="form-control" data-required="true"> -->
														<select name="sex" 
															class="form-control m-b" data-required="true">
															<c:choose>
																<c:when test="${teacher.sex=='女'}">
																	<option value="女">女</option>
																	<option value="男">男</option>
																</c:when>
																<c:otherwise>
																	<option value="男">男</option>
																	<option value="女">女</option>
																	
																</c:otherwise>
															</c:choose>
															
														</select>
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>邮件</label> <input value="${teacher.email}"
														placeholder="email邮箱地址"	name="email" data-type="email"  type="text" class="form-control" data-required="true">
													</div>
													<div class="col-sm-6">
														<label>电话</label> <input value="${teacher.telPhone}"
														placeholder="手机号码" data-type="phone" 	name="telPhone" type="text" class="form-control"
															data-required="true">
													</div>
												</div>
												
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>证件号</label> <input value="${teacher.cardId}"
														placeholder="身份证号/护照/有效证件"	name="cardId" 
														data-rangelength="[15,18]"type="text" class="form-control" data-required="true">
													</div>
													<div class="col-sm-6">
														<label>入职时间</label> 
<%-- 														<input value="${teacher.entryTime}" placeholder="选择入职时间"	name="entryTime" type="text" class="form-control" --%>
<!-- 															data-required="true"> -->
															 <input data-type="dateIso" style="width:100%" class="input-sm input-s datepicker-input form-control"  name="entryTime" placeholder="选择入职时间"	
															 size="16" type="text" value="${teacher.entryTime}" data-date-format="yyyy-mm-dd" data-required="true">
													</div>
												</div>
												
												
												<div class="form-group pull-in clearfix">
													
													<div class="col-sm-6">
														<label>部门</label> 
<%-- 														<input value="${teacher.department}" --%>
<!-- 														placeholder="选择部门"	name="department" type="text" class="form-control" -->
<!-- 															data-required="true"> -->
														<select name="department"
															class="form-control m-b" data-required="true">
															<c:forEach items="${listDepartment}" var="items"
																varStatus="status">
																<c:if test="${teacher.department == items.id}">
																	<option value="${items.id}">${items.name}</option>
																</c:if>
															</c:forEach>
															<c:forEach items="${listDepartment}" var="items"
																varStatus="status">
																<c:if test="${teacher.department!= items.id}">
																	<option value="${items.id}">${items.name}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
													<div class="col-sm-6">
														<label>所带班级</label> 
<%-- 														<input value="${teacher.classeTeach}" --%>
<!-- 														placeholder="选择所任班级班主任"	name="classeTeach" type="text" class="form-control" > -->
														<select  class="form-control m-b" name="classeTeach">
															 <c:choose>
															 	<c:when test="${not empty teacher.classeTeach}">
															 	<option value="${teacher.classeTeach.id}">${teacher.classeTeach.yearNumber}年
																${teacher.classeTeach.name}班</option>
															 	</c:when>
															 	<c:otherwise>
															 	<option></option>
															 	</c:otherwise>
															 </c:choose>
															<c:forEach items="${listClasses}" var="items"
																varStatus="status">
																<c:if test="${teacher.classeTeach.id!= items.id}">
																	<option value="${items.id}">${items.yearNumber}年${items.name}班</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label>地址</label> <input value="${teacher.address}" data-rangelength="[3,50]" 
														placeholder="老师所居住的详细地址"	name="address" type="text" class="form-control" data-required="true">
												</div>
												<div class="form-group">
													<label>备注</label>
													<textarea name="remark"  placeholder="" data-rangelength="[2,100]" 
														class="form-control parsley-validated" rows="6">${teacher.remark}</textarea>
												</div>
												<input id="schoolid" name ="schoolId" value="${sessionScope.SSchool.id}" type="hidden">

											</div>
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
  <!-- datepicker  日期控件js-->
  <script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
</html>
