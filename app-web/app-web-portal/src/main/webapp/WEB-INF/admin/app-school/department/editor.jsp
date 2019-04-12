<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>部门管理</title>

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
<script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"> 
	var checkForms=false;
			//检查部门名称是否已经重复.
            function check(){
                    $.ajax( { 
                        type : "POST", 
                        url : "ajaxCheckName", 
                        data : "name="+$("#name").val(), 
                        dataType: "text", 
                        success : function(msg) { 
                        	if(msg=="true"){
                        		if($("#updatename").val()!=$("#name").val()){
                        	document.getElementById('namealert').innerHTML = "此部门名称已经存在";
                    		document.getElementById('namealert').style.cssText="float: right; color: red;";
                    		checkForms=false;
                        		}
                        	}else{
                        		checkForms=true;
                        		document.getElementById('namealert').innerHTML = "部门名称可用";
                        		document.getElementById('namealert').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
              }
			
            var checkFormsNum=false;
			//检查部门编号是否已经重复.
            function checkNum(){
                    $.ajax( { 
                        type : "POST", 
                        url : "ajaxCheckNameNum",
                        data : "name="+$("#departmentNum").val(), 
                        dataType: "text", 
                        success : function(msg) { 
                        	if(msg=="true"){
                        		if($("#updatedepartmentNum").val()!=$("#name").val()){
                        			checkFormsNum=false;
                        	document.getElementById('namealert-num').innerHTML = "此编号已经存在";
                    		document.getElementById('namealert-num').style.cssText="float: right; color: red;";
                        		}
                        	}else{
                        		checkFormsNum=true;
                        		document.getElementById('namealert-num').innerHTML = "编号可用";
                        		document.getElementById('namealert-num').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
              }
			
            //验证表单
            function checkForm(){  
            	if($("#updatename").val()==$("#name").val()){
            		checkForms=true;
            	}
            	if($("#updatedepartmentNum").val()==$("#departmentNum").val()){
            		checkFormsNum=true;
            	}
            	
            	
            	if(checkForms==true && checkFormsNum==true)
            		return true;
            	else
            		return false;
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
								<h3 class="m-b-none">部门基本信息管理</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form onsubmit="return checkForm();" data-validate="parsley" action="createOrUpdateToFind"
										method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty department}">
															<input name="id" value="${department.id}" type="hidden"
																class="form-control">
																<input id="updatename" value="${department.name}"
																type="hidden">
																<input id="updatedepartmentNum" value="${department.departmentNum}"
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
														<label> <span style="float: left;"> 部门名称</span>
														</label> <span id="namealert"
															style="float: right; color: red;">*</span> 
														<input name="name" id="name" onblur="check();" data-rangelength="[2,10]"
															value="${department.name}" type="text" class="form-control"
															data-required="true">
													</div>
													<div class="col-sm-6">
														<label> <span style="float: left;"> 部门编号</span>
														</label> <span id="namealert-num"
															style="float: right; color: red;">*</span> 
														
														<input value="${department.departmentNum}" onblur="checkNum();" id="departmentNum"
														 data-rangelength="[2,10]"	name="departmentNum" type="text" class="form-control" data-required="true">
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>部门管理者</label> 
													<select name="manageDepartment"
															class="form-control m-b">
															<option value="${department.manageDepartment.id}">${department.manageDepartment.name}</option>
															<c:forEach items="${listTeacher}" var="items"
																varStatus="status">
																<c:if test="${department.manageDepartment.name!= items.name}">
																	<option value="${items.id}">${items.name}</option>
																</c:if>
															</c:forEach>
														</select>
													
													</div>
													<div class="col-sm-6">
														<label>部门描述</label> <input value="${department.describe}"
															name="describe" type="text" class="form-control"
															 data-rangelength="[2,30]">
													</div>
												</div>

												<div class="form-group">
													<label>备注</label>
													<textarea name="remark" data-rangelength="[2,100]"
														class="form-control parsley-validated" rows="6">${department.remark}</textarea>
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
</html>
