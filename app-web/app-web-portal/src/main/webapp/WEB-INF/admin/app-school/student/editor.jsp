<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>学生管理</title>

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
 <script type="text/javascript"> 
	var checkForms=false;
            function check(){
                    $.ajax( { 
                        type : "POST", 
                        url : "ajaxCheckIsIds", 
                        data : "ids="+$("#code").val(), 
                        dataType: "text", 
                        success : function(msg) { 
                        	if(msg=="true"){
                        		if($("#updatecode").val()!=$("#code").val()){
                        	document.getElementById('codealert').innerHTML = "已经存在";
                    		document.getElementById('codealert').style.cssText="float: right; color: red;";
                    		checkForms=false;
                        		}
                        	}else{
                        		checkForms=true;
                        		document.getElementById('codealert').innerHTML = "可以使用";
                        		document.getElementById('codealert').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
              }
            //验证表单
            function checkForm(){  
            	if($("#updatecode").val()==$("#code").val()){
            		checkForms=true;
            	}
            	
            	
            	if(checkForms==false)
            		return false;
            	else
            		return true;
            }
            
            function onChangeClasses(){
            	var year = $('#classesId option:selected').text();//选中的文本
            	document.getElementById("entranceYear").value =year.substring(0,4);
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
								<h3 class="m-b-none">学生信息管理</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form   data-validate="parsley" action="createOrUpdateToFind" onsubmit="return checkForm();"
										method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty student}">
															<input name="id" value="${student.id}" type="hidden"
																class="form-control">
															<input id="updatecode" value="${student.code}"
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
														<label>班级</label> 
														<select id="classesId" name="classesId" onblur="onChangeClasses();"
															class="form-control m-b" data-required="true">
															<c:forEach items="${listClasses}" var="items"
																varStatus="status">
																<c:if test="${student.classesId == items.id}">
																	<option value="${items.id}" id="${items.yearNumber}">${items.yearNumber}年${items.name}班</option>
																</c:if>
															</c:forEach>
															<c:forEach items="${listClasses}" var="items"
																varStatus="status">
																<c:if test="${student.classesId!= items.id}">
																	<option value="${items.id}" id="${items.yearNumber}">${items.yearNumber}年${items.name}班</option>
																</c:if>
															</c:forEach>
														</select>
<!-- 														<input name="classesId" -->
<%-- 														placeholder="请选择班级"	value="${student.classesId}" type="text" class="form-control" --%>
<!-- 															data-required="true"> -->
													</div>
													<div class="col-sm-6">
														<label> <span> 姓名</span>
														</label>
														<input value="${student.name}"  id="name" data-rangelength="[2,8]" 
														placeholder="填写姓名"	name="name" type="text" class="form-control" data-required="true">
													</div>
												</div>
												
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>籍贯</label> <input name="nativePlace" data-rangelength="[1,10]" 
														placeholder="请选择学生籍贯"	value="${student.nativePlace}" type="text" class="form-control"
															data-required="true" >
													</div>
													<div class="col-sm-6">
														<label>性别</label> 
<%-- 														<input value="${student.sex}" --%>
<!-- 														placeholder="选择性别"	name="sex" type="text" class="form-control" data-required="true"> -->
														<select name="sex" 
															class="form-control m-b" data-required="true">
															<c:choose>
															<c:when test="${student.sex=='男'}">
																<option value="男">男</option>
																<option value="女">女</option>
															</c:when>
															<c:otherwise>
																<option value="女">女</option>
																<option value="男">男</option>
															</c:otherwise>
															</c:choose>
															
															
															
														</select>
													</div>
												</div>

												<div class="form-group pull-in clearfix">
<!-- 													<div class="col-sm-6"> -->
<%-- 														<label>年龄</label> <input value="${student.age}" data-rangelength="[1,3]"  data-type="number" --%>
<!-- 														placeholder="年龄"	name="age" type="text" class="form-control" data-required="true"> -->
<!-- 													</div> -->
													<div class="col-sm-6">
														<label>证件号</label> <input value="${student.cardId}"
														placeholder="身份证号/护照/其它" data-rangelength="[15,18]"	name="cardId" type="text" class="form-control"
															data-required="true">
													</div>
												</div>
												
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>学籍号</label> <input value="${student.fileCode}" data-rangelength="[3,30]"
														placeholder="学生学籍号"	name="fileCode" type="text" class="form-control" data-required="true">
													</div>
													<div class="col-sm-6">
														<label>学号</label> 
														<span id="codealert"
															style="color: red;float: right;"></span>  
														<input value="${student.code}" data-rangelength="[1,30]" onblur="check();" id="code"
														placeholder="添加学生学号"	name="code" type="text" class="form-control" 
															data-required="true">
													</div>
												</div>
												
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>居住地址</label> <input value="${student.address}" data-rangelength="[3,50]"
														placeholder="现在居住详细地址"	name="address" type="text" class="form-control" data-required="true">
													</div>
													<div class="col-sm-6">
														<label>健康状态</label> 
														<c:choose>
															<c:when test="">
															<input value="${student.health}" data-rangelength="[2,15]"
														placeholder="健康状态"	name="health" type="text" class="form-control"
															data-required="true">
															</c:when>
															<c:otherwise>
															<input value="正常" data-rangelength="[2,15]"
														placeholder="健康状态"	name="health" type="text" class="form-control"
															data-required="true">
															</c:otherwise>
														</c:choose>
													
													</div>
												</div>
												
												<div class="form-group pull-in clearfix">
														
																<div class="col-sm-6">
														<label>联系人</label> <input value="${student.contactsPerson}" data-rangelength="[2,8]"
														placeholder="学生家长/联系人/学生负责人"	name="contactsPerson" type="text" class="form-control"
															data-required="true">
													</div>	
															<div class="col-sm-6">
														<label>入学年份</label> <input id="entranceYear"  value="${student.entranceYear}" data-rangelength="[4,6]"
														placeholder="学生入学的年份"	name="entranceYear" type="text" class="form-control" data-required="true">
													</div>
												</div>
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>联系电话</label> <input value="${student.contactsPhone}"
														placeholder="联系人电话"  data-type="phone"	name="contactsPhone" type="text" class="form-control" data-required="true">
													</div>
													<div class="col-sm-6">
														<label>联系手机</label> <input value="${student.contactsmobile}"
														placeholder="联系人手机"  data-type="phone"	name="contactsmobile" type="text" class="form-control"
															data-required="true">
													</div>
												</div>
												
												<div class="form-group">
													<label>备注</label>
													<textarea name="remark"  placeholder="如果孩子有任何特殊情况,请在备注中说明" data-rangelength="[2,100]"
														class="form-control parsley-validated" rows="6">${student.remark}</textarea>
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
