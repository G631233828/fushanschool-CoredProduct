<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>角色管理</title>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/nestable/nestable.css" type="text/css" />
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
                        	document.getElementById('namealert').innerHTML = "已经存在";
                    		document.getElementById('namealert').style.cssText="float: right; color: red;";
                        		}
                        	}else{
                        		checkForms=true;
                        		document.getElementById('namealert').innerHTML = "可用";
                        		document.getElementById('namealert').style.cssText="float: right; color: #11AB5A;";
                        	}
                        } 
                    }); 
              }
			
           
            //验证表单
            function checkForm(){  
            	if($("#updatename").val()==$("#name").val()){
            		checkForms=true;
            	}
            	
            	
            	if(checkForms==true)
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
								<h3 class="m-b-none">学校角色管理</h3>
							</div>
							<div class="row">

								<div class="col-sm-6" style="width: 100%;">
									<form onsubmit="return checkForm();" data-validate="parsley" action="createOrUpdateToFind"
										method="post">
										<section class="panel panel-default">
											<header class="panel-heading">
												<span class="h4"> <c:choose>
														<c:when test="${not empty PR}">
															<input name="id" value="${PR.id}" type="hidden"
																class="form-control">
																<input id="updatename" value="${PR.roleName}" type="hidden"
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

												<div class="form-group">
													<label>角色名称</label>
													 <span id="namealert"
															style="float: right; color: red;">*</span> 
													<textarea onchange="check();" name="name" id="name" data-required="true" data-rangelength="[2,8]"
														class="form-control parsley-validated" rows="1">${PR.roleName}</textarea>
												</div>
												<div class="form-group">
													<label>备注</label>
													<textarea name="remark" data-rangelength="[2,20]"
														class="form-control parsley-validated" rows="4">${PR.remark}</textarea>
												</div>
												<input id="schoolid" name ="schoolId" value="${sessionScope.SSchool.id}" type="hidden">
											<div class="line line-dashed b-b line-lg pull-in"></div>
											
											
											
											<divclass="form-group">		
                <c:forEach items="${listRole.listMenu}" var="items" varStatus="status">
                <div class="col-sm-4">
                  <div class="dd" id="nestable${status.index+1}">
                    <ol class="dd-list">
                      <li class="dd-item" data-id="3">
                          <div class="dd-handle">${items.menuName}
                          	<div class="btn-group" style="float: right;">
                             
                              
                        <label class="checkbox m-n i-checks">
                        <c:choose>
                        	<c:when test="${items.remark == 'trues'}">
                        	  <input type="checkbox" name="prole" value="${items.id}" checked="checked">
                        	</c:when>
                        	<c:otherwise>
                        	  <input type="checkbox" name="prole" value="${items.id}">
                        	</c:otherwise>
                        </c:choose>
                      
                        <i></i></label>
                        
                        
                            </div>
                          </div>
                          <c:if test="${not empty items.listPermissionSubMenu}">
                         
	                          <ol class="dd-list" >
	                           <c:forEach items="${items.listPermissionSubMenu}" var="sub" varStatus="status">
	                              <li class="dd-item" data-id="3">
	                             	<div class="dd-handle">${sub.menuName}
			                          <div class="btn-group" style="float: right;">
			                             <label class="checkbox m-n i-checks">
			                              <c:choose>
                        	<c:when test="${sub.remark == 'trues'}">
                        	     <input type="checkbox" name="prole"  value="${items.id}－${sub.id}" checked="checked">
                        	</c:when>
                        	<c:otherwise>
                        	  <input type="checkbox" name="prole"  value="${items.id}－${sub.id}">
                        	  </c:otherwise>
                        </c:choose>
                      <i></i></label>
			                            </div>
	                             	 </div>
	                             	 
	                             	 
	                             	 
	                             	 <c:if test="${not empty sub.listPermissionSubMenu}">
                         
	                          <ol class="dd-list" >
	                           <c:forEach items="${sub.listPermissionSubMenu}" var="sub3" varStatus="status">
	                              <li data-id="3">
	                             	<div class="dd-handle">${sub3.menuName}
			                          <div class="btn-group" style="float: right;">
			                             
			                            <label class="checkbox m-n i-checks">
			                              <c:choose>
                        	<c:when test="${sub3.remark == 'trues'}">
                        	   <input type="checkbox" name="prole"  value="${items.id}－${sub.id}－${sub3.id}" checked="checked">
                        	</c:when>
                        	<c:otherwise>
                        	 <input type="checkbox" name="prole"  value="${items.id}－${sub.id}－${sub3.id}">
                        	</c:otherwise>
                        </c:choose>
			                            
			                            
                       			<i></i></label>
			                            </div>
	                             	 </div>
	                              </li>
	                               </c:forEach>
	                          </ol>
                       	</c:if>
	                             	 
	                              </li>
	                               </c:forEach>
	                          </ol>
                       	</c:if>
                      </li>
                  </ol>
                  </div>
                </div>
                </c:forEach>
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
</body>
</html>
