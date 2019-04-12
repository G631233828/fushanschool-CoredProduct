<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>字典配置</title>

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/logo_title.png" 
   type="image/x-icon" />
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/nestable/nestable.css" type="text/css" />
<script src="${pageContext.request.contextPath}/assets/js/nestable/jquery.nestable.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/nestable/demo.js"></script>

<body>


  <section class="vbox">
   <!-- .top-->
<%@include file="../../public/top.jsp" %>
    <section>
      <section class="hbox stretch">
        <!-- .aside left menu -->
<%@include file="../../public/left.jsp" %>
        <!-- /.aside -->
       <!-- /.aside -->
  <section id="content">
          <section class="vbox">
            <header class="header bg-light b-b">
              <p>字典配置</p>
            </header>
			  <div class="row" >
                <div class="col-sm-6" style="width: 100%;">
                 <c:choose>
                  <c:when test="${menuType=='superMenu'}"><!-- 更新一级菜单  -->
                         <form data-validate="parsley" action="udpateToList" method="post">
                         <input type="hidden"  name="id"  class="form-control" data-required="true" value="${kd.id}"> 
                   </c:when>
                   <c:when test="${menuType=='subMenu'}"><!-- 更新子菜单  -->
                         <form data-validate="parsley" action="createSubToList" method="post">
                          <input type="hidden"  name="id"  class="form-control" data-required="true" value="${kd.id}"> 
                          <input type="hidden"  name="superid"  class="form-control" data-required="true" value="${superid}"> 
                   </c:when>
                   
                    <c:when test="${menuType=='ThreeLeve'}"><!-- 更新三子菜单  -->
                         <form data-validate="parsley" action="createSubThreeLevelToList" method="post">
                          <input type="hidden"  name="id"  class="form-control" data-required="true" value="${kd.id}"> 
                          <input type="hidden"  name="superid"  class="form-control" data-required="true" value="${superid}"> 
                         <input type="hidden"  name="subid"  class="form-control" data-required="true"
                         value="${subid}">
                   </c:when>
                    <c:otherwise><!-- 添加子菜单 -->
                    <c:choose>
                    	<c:when test="${not empty subid}">
                    	 <form data-validate="parsley" action="createSubThreeLevelToList" method="post">
                            <input type="hidden"  name="superid"  class="form-control" data-required="true"
                         value="${id}"> 
                          <input type="hidden"  name="subid"  class="form-control" data-required="true"
                         value="${subid}">
                    	</c:when>
                          <c:otherwise>
                           <form data-validate="parsley" action="createSubToList" method="post"><!-- 添加二级菜单 -->
                            <input type="hidden"  name="superid"  class="form-control" data-required="true"
                         value="${id}"> 
                          </c:otherwise>
                       </c:choose>  
                    </c:otherwise>
                   </c:choose>
                
                 
                    <section class="panel panel-default">
                      <header class="panel-heading">
                        <span class="h4">
                        ${state}</span>
                      </header>
                      <div class="panel-body">
                        
                          
                        <div class="form-group">
                          <label>字典名字</label>
                          <input value="${kd.name}" type="text"  name="name"  class="form-control" data-required="true">                        
                        </div>
                      
                      </div>
                      <footer class="panel-footer text-right bg-light lter">
                        <button type="submit" class="btn btn-success btn-s-xs">保存</button>
                      </footer>
                    </section>
                  </form>
                </div>
              </div>
             
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
    </section>    
  </section>
</body>
</html>
