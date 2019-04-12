<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>班级管理</title>

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
            function check(){
            	if($("#name").val().length>0 && $("#yearNumber").val()>0){
                    $.ajax( { 
                        type : "POST", 
                        url : "ajaxCheckName", 
                        data : "name="+$("#name").val()+"&yearNumber="+$("#yearNumber").val(), 
                        dataType: "text", 
                        success : function(msg) { 
                        	//alert(msg);
                        	var message=msg.split(",");
                        	if(message[0]=="true"){//
                        		if($("#updatename").val()!=$("#name").val() || $("#updateyearNumber").val()!=$("#yearNumber").val()){
                        	document.getElementById('namealert').innerHTML = message[1]+$("#name").val()+"班 已经存在";
                    		document.getElementById('namealert').style.cssText="float: right; color: red;";
                        		}else{
                        			document.getElementById('namealert').innerHTML =message[1]+$("#name").val()+"班 可用";
                            		document.getElementById('namealert').style.cssText="float: right; color: #11AB5A;";
                        		}
                        		checkForms=false;
                        	}else{
                        		checkForms=true;
                        		document.getElementById('namealert').innerHTML =message[1]+$("#name").val()+"班 可用";
                        		document.getElementById('namealert').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
            	}  
              }
            
            var checkFormsNum=false;
			//检查班级编号是否已经重复.
            function checkNum(){
                    $.ajax( { 
                        type : "POST", 
                        url : "ajaxCheckNameNum",
                        data : "num="+$("#classesnum").val(), 
                        dataType: "text", 
                        success : function(msg) { 
                        	if(msg=="true"){
                        		if($("#updatedepartmentNum").val()!=$("#classesnum").val()){
                        			checkFormsNum=false;
                        	document.getElementById('numalert').innerHTML = "此编号已经存在";
                    		document.getElementById('numalert').style.cssText="float: right; color: red;";
                        		}
                        	}else{
                        		checkFormsNum=true;
                        		document.getElementById('numalert').innerHTML = "编号可用";
                        		document.getElementById('numalert').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
              }
            
            //验证表单
            function checkForm(){  
            	if($("#updatename").val()==$("#name").val() && $("#updateyearNumber").val()==$("#yearNumber").val()){
            		checkForms=true;
            	}
            	if($("#updatenum").val()==$("#classesnum").val() ){
            		checkFormsNum=true;
            	}
            	
            	
            	if(checkForms==false || checkFormsNum==false)
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
								<h3 class="m-b-none">班级信息管理</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form onsubmit="return checkForm();" data-validate="parsley" action="createOrUpdateToFind"
										method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty classes}">
															<input name="id" value="${classes.id}" type="hidden"
																class="form-control">
														<input id="updatename" value="${classes.name}"
																type="hidden">
																<input id="updateyearNumber" value="${classes.yearNumber}"
																type="hidden">
																
																<input id="updatenum" value="${classes.classesnum}"
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
														<label> <span style="float: left;">班级名称</span>
														</label> <span id="namealert"
															style="float: right; color: red;">*</span> 
														 <input onchange="check();" name="name" id="name" 
														placeholder="班级的名称,请输入1－3数字"	value="${classes.name}" type="text" 
														data-type="number" class="form-control" placeholder="number" data-rangelength="[1,3]"
															data-required="true">
													</div>
													<div class="col-sm-6">
														<label>班级编号</label> 
														<span id="numalert"
															style="float: right; color: red;">*</span> 
														<input value="${classes.classesnum}" data-rangelength="[3,10]"  onchange="checkNum();"
														placeholder="填写班级编号"	name="classesnum" id="classesnum" type="text" class="form-control" data-required="true">
													</div>
												</div>
												
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
															<label> <span style="float: left;">班级年份</span>
														</label> <span id="namealert"
															style="float: right; color: red;">*</span> 
															
															
															<select name="yearNumber" id="yearNumber" data-required="true" onchange="check();"
															class="form-control m-b" >
															<c:forEach items="${listSemester}" var="items" 
																varStatus="status">
																<c:if test="${classes.yearNumber== items}">
																	<option value="${items}">${items}</option>
																</c:if>
															</c:forEach>
															
															<c:forEach items="${listSemester}" var="items" 
																varStatus="status">
																<c:if test="${classes.yearNumber!= items}">
																	<option value="${items}">${items}</option>
																</c:if>
															</c:forEach>
															</select>
															
															
															
<!-- 														<input name="yearNumber"  data-rangelength="[4,4]" onblur="check();" id="yearNumber" -->
<%-- 														placeholder="请输入4位数字年份（如：2014）"	value="${classes.yearNumber}" type="text"  --%>
<!-- 														data-type="number" class="form-control" placeholder="number" -->
<!-- 															data-required="true" > -->
													</div>
													<div class="col-sm-6">
														<label>班级人数</label> <input name="personNumber" value="${classes.personNumber}" data-rangelength="[2,3]"
														placeholder="班级上线人数"	 data-type="number" class="form-control" placeholder="number" 
														data-required="true">
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>班主任</label> 
<%-- 														<input value="${classes.teacherDirector}" --%>
<!-- 														placeholder="请选择班主任"	name="teacherDirector" type="text" class="form-control"> -->
														
														<select name="teacherDirector" 
															class="form-control m-b" >
															<option value="${classes.teacherDirector.id}">${classes.teacherDirector.name}</option>
															<c:forEach items="${listTeacher}" var="items"
																varStatus="status">
																<c:if test="${classes.teacherDirector.name!= items.name}">
																	<option value="${items.id}">${items.name}</option>
																</c:if>
															</c:forEach>
														</select>
													
													</div>
													<div class="col-sm-6">
														<label>副班主任</label> 
<%-- 														<input value="${classes.subTeacherDirector}" --%>
<!-- 														placeholder="请选择副班主任"	name="subTeacherDirector" type="text" class="form-control"> -->
														<select name="subTeacherDirector"
															class="form-control m-b" >
															<option value="${classes.subTeacherDirector.id}">${classes.subTeacherDirector.name}</option>
															<c:forEach items="${listTeacher}" var="items"
																varStatus="status">
																<c:if test="${classes.subTeacherDirector.name!= items.name}">
																	<option value="${items.id}">${items.name}</option>
																</c:if>
															</c:forEach>
															</select>
													</div>
												</div>

												<div class="form-group">
													<label>备注</label>
													<textarea name="remark" 
														class="form-control parsley-validated" rows="6">${classes.remark}</textarea>
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
