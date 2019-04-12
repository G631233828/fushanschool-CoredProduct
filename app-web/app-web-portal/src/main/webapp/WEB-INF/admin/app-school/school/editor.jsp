<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>学校管理</title>

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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/datepicker/datepicker.css" type="text/css" />
  <script type="text/javascript"> 
		var checkName=false;
		var checkCoredIds=false;
		////验证学校name不为空.
            function check(){
                    $.ajax( { 
                        type : "POST", 
                        url : "ajaxCheckName", 
                        data : "name="+$("#name").val(), 
                        dataType: "text", 
                        success : function(msg) { 
                        	if(msg=="true"){
                        		
                        		if($("#updatename").val()!=$("#name").val()){
                        			checkName=false;
                        	document.getElementById('namealert').innerHTML = "此用户名已经存在";
                    		document.getElementById('namealert').style.cssText="float: right; color: red;";
                        		}
                        	}else{
                        		checkName=true;
                        		document.getElementById('namealert').innerHTML = "用户名可用";
                        		document.getElementById('namealert').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
              }
            //验证学校CoredIds不为空.
            function coredids(){
                $.ajax( { 
                    type : "POST", 
                    url : "ajaxCheckCoredIds", 
                    data : "coredIds="+$("#coredIds").val(), 
                    dataType: "text", 
                    success : function(msg) { 
                    	if(msg=="true"){
                    		if($("#coredIdsalert").val()!=$("#coredIds").val()){
                    			checkCoredIds=false;
                    	document.getElementById('coredIdsalert').innerHTML = "此编号已经存在";
                		document.getElementById('coredIdsalert').style.cssText="float: right; color: red;";
                    		}
                    	}else{
                    		checkCoredIds=true;
                    		document.getElementById('coredIdsalert').innerHTML = "编号可用";
                    		document.getElementById('coredIdsalert').style.cssText="float: right; color: #11AB5A;";
                    	}
                    } 
                }); 
          }
            
            //验证表单
            function checkForm(){  
            	if($("#updatename").val()==$("#name").val()){
            		checkName=true;
            	}
            	if($("#updatecored").val()==$("#coredIds").val()){
            		checkCoredIds=true;
            	}
            	var checkproduct=false;
            	var arrChk=$("input[name='schoolproduct']:checked");
            	var str="";
        	    $(arrChk).each(function(){
        	      str+=this.value;                        
        	    });
            	if(str!=""){
            		checkproduct=true;
            	}else{
            		document.getElementById('schoolproductalert').innerHTML = "请选择学校产品";
            		document.getElementById('schoolproductalert').style.cssText="float: right; color: red;";
            	}
            	
            	if(checkName==false || checkCoredIds==false || checkproduct==false)//当学校名字与学样编号存在时，返因为false.
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
								<h3 class="m-b-none">学校基本信息管理</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form data-validate="parsley" action="createOrUpdateToFind" onsubmit="return checkForm();"
										method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty school}">
															<input name="id" value="${school.id}" type="hidden"
																class="form-control">
																<input id="updatename" value="${school.name}"
																type="hidden">
																<input id="updatecored" value="${school.coredIds}"
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
														<label>学校名称</label> 
														<span id="namealert" style="color: red;"></span> 
														<input name="name" id ="name" onblur="check();" data-rangelength="[2,40]"
															value="${school.name}" type="text" class="form-control"
															data-required="true">
													</div>
													<div class="col-sm-6">
														<label>学校英文名</label> <input value="${school.englishName}" data-rangelength="[3,20]"
															name="englishName" type="text" class="form-control">
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>学校简称</label> <input value="${school.shorts}" data-rangelength="[3,12]"
															name="shorts" type="text" class="form-control">
													</div>
													<div class="col-sm-6">
														<label>学校地址</label> <input value="${school.address}" data-rangelength="[3,40]"
															name="address" type="text" class="form-control"
															data-required="true">
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>电话</label> <input value="${school.telPhone}"
															name="telPhone" type="text" class="form-control"
															data-type="phone"
															data-required="true">
													</div>
													<div class="col-sm-6">
														<label>邮箱</label> <input value="${school.email}" data-rangelength="[6,40]"
															name="email" type="text" class="form-control"
															data-type="email"
															data-required="true">
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>创办时间</label> <input  style="width:100%;height: 34px;"
															value="${school.schoolCreateTime}"
															name="schoolCreateTime" class=" form-control input-sm input-s datepicker-input "
															type="text" data-date-format="dd-mm-yyyy"
															data-required="true">
															
													</div>
													<div class="col-sm-6">
														<label>学校性质</label> 
															<select data-required="true"  name="natrueid"  name="account" class="form-control">
									                          <option value="${school.natrueid.id}">${school.natrueid.name}</option>
									                          <c:forEach items="${listBaseNatrueid}" var="items" varStatus="status">
									                          <c:if test="${school.natrueid.name != items.name}">
									                          <option value="${items.id}">${items.name}</option>
									                          </c:if>
									                          </c:forEach>
									                        </select>
													</div>
												</div>

												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>学校编号</label>
														<span id="coredIdsalert" style="color: red;"></span> 
														<c:choose>
														<c:when test="${not empty school}">
														 <input value="${school.coredIds}"  data-rangelength="[4,10]"
															name="coredIds" id ="coredIds"
															onblur="coredids();"
															 type="text" class="form-control"
															data-required="true" readonly="true">
															</c:when>
															<c:otherwise>
															 <input value="${school.coredIds}"   data-rangelength="[4,10]"
															name="coredIds" id ="coredIds"
															onblur="coredids();"
															 type="text" class="form-control"
															data-required="true" >
															</c:otherwise>
														</c:choose>
														
													</div>
													<div class="col-sm-6">
														<label>学校区域</label> <input value="${school.area}" data-rangelength="[2,15]"
															name="area" type="text" class="form-control">
													</div>
												</div>
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>服务器IP</label> <input value="${school.ipAddress}" data-rangelength="[5,30]"
															name="ipAddress" type="text" class="form-control">
													</div>
													<div class="col-sm-6">
														<label>端口号</label> <input value="${school.port}" data-rangelength="[1,10]"
															name="port" type="text" class="form-control">
													</div>
												</div>

<div class="line line-dashed b-b line-lg pull-in"></div>
												<div class="form-group  ">
													<label>运行状态</label>
												</div>
												<div class="form-group pull-in clearfix">
													<div class="col-sm-6">

														<div class="radio i-checks">
															<label> <c:choose>
																	<c:when test="${school.state=='normalRun'}">
																		<input type="radio" name="state" value="normalRun"
																			checked>
																	</c:when>
																	<c:otherwise>
																	<c:choose>
																	<c:when test="${empty school}">
																		<input type="radio" name="state" value="normalRun" checked>
																		</c:when>
																		<c:otherwise>
																		<input type="radio" name="state" value="normalRun">
																		</c:otherwise>
																	</c:choose>
																	
																	</c:otherwise>
																</c:choose> <i></i> 运行中
															</label>
														</div>
													</div>
													
													<div class="col-sm-6">
														<div class="radio i-checks">
															<label> <c:choose>
																	<c:when test="${school.state=='stopRun'}">
																		<input type="radio" name="state" value="stopRun"
																			checked>
																	</c:when>
																	<c:otherwise>
																		<input type="radio" name="state" value="stopRun">
																	</c:otherwise>
																</c:choose> <i></i> 停用中
															</label>
														</div>
													</div>
												</div>
<div class="line line-dashed b-b line-lg pull-in"></div>
											  <div class="form-group  pull-in clearfix">
						                      <label class="col-sm-2 control-label">请为学校选择产品</label>
						                      <span id="schoolproductalert" style="color: red;"></span> 
						                      <div class="col-sm-10">
						                       <c:forEach items="${listProduct}" var="items" varStatus="status">
						                       		<c:choose>
						                       			<c:when test="${fn:indexOf(school.schoolproduct, items.id)!=-1}">
						                       			<div class="checkbox i-checks">
								                          	<label>
								                            	<input type="checkbox" name ="schoolproduct"  checked value="${items.id}">
								                           	 <i></i>
								                           	${items.menuName}
								                          </label>
								                        </div>
						                       			</c:when>
						                       			<c:otherwise>
						                       			<div class="checkbox i-checks">
								                          	<label>
								                            	<input type="checkbox" name ="schoolproduct"  value="${items.id}">
								                           	 <i></i>
								                           	${items.menuName}
								                          </label>
								                        </div>
						                       			</c:otherwise>
						                       		</c:choose>
									            </c:forEach>
						                       
						                      </div>
						                    </div>

													<div class="form-group pull-in clearfix">
													<div class="col-sm-6">
														<label>用户名</label> 
														<c:choose>
															<c:when test="${empty school}">
														<input value="${school.user.username}" data-rangelength="[6,20]"
															data-required="true" name="username" type="text" class="form-control">
															</c:when>
															<c:otherwise>
															<input value="${school.user.username}" data-rangelength="[6,20]"
															data-required="true" readonly="true" name="username" type="text" class="form-control">
															</c:otherwise>
														</c:choose>
													</div>
													<div class="col-sm-6">
														<label>密码</label> <input value="${school.user.password}" data-rangelength="[6,20]"
															data-required="true" name="password" type="text" class="form-control">
													</div>
												</div>
	<div class="line line-dashed b-b line-lg pull-in"></div>
												<div class="form-group">
											
													<label>备注</label>
													<textarea name="remark"
														class="form-control parsley-validated" rows="6">${school.remark}</textarea>
												</div>


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
	 <!-- datepicker  日期控件js-->
  <script src="${pageContext.request.contextPath}/assets/js/datepicker/bootstrap-datepicker.js"></script>
</body>
</html>
