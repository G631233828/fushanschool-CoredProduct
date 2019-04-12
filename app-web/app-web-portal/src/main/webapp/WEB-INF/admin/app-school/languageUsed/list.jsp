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
              <p>菜单配置</p>
            </header>
            <section class="scrollable wrapper">
            
            <div class="row m-b">
             <div class="row wrapper">
                	<!-- 添加和删除 -->
                  <div class="col-sm-5 m-b-xs">
                  <a href="${pageContext.request.contextPath}/kindergartenCase/updateOrCreate">
                    <button class="btn btn-sm btn-default">添加</button> 
                   </a>
                    </div>
                  </div>
                </div>
                <c:forEach items="${listForm}" var="items" varStatus="status">
                <div class="col-sm-4">
                  <div class="dd" id="nestable${status.index+1}">
                    <ol class="dd-list">
                      <li class="dd-item" data-id="3">
                          <div class="dd-handle">${items.name}
                          	<div class="btn-group" style="float: right;">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
                              <ul class="dropdown-menu pull-right">
                                <li><a href="${pageContext.request.contextPath}/kindergartenDictionary/createSub?id=${items.id}">添加子菜单</a></li>
                                <li class="divider"></li>
                               <li><a href="${pageContext.request.contextPath}/kindergartenDictionary/update?id=${items.id}">修改</a></li>
                              </ul>
                            </div>
                          </div>
                          <c:if test="${not empty items.dictionarys}">
                         
	                          <ol class="dd-list" >
	                           <c:forEach items="${items.dictionarys}" var="sub" varStatus="status">
	                              <li class="dd-item" data-id="3">
	                             	<div class="dd-handle">${sub.name}
			                          <div class="btn-group" style="float: right;">
			                              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
			                              <ul class="dropdown-menu pull-right">
			                               <li><a href="${pageContext.request.contextPath}/kindergartenDictionary/createSub?id=${items.id}&subid=${sub.id}">添加子菜单</a></li>
			                               <li><a href="${pageContext.request.contextPath}/kindergartenDictionary/update?id=${items.id}&subid=${sub.id}">修改</a></li>
			                               <li class="divider"></li>
			                               <li><a href="${pageContext.request.contextPath}/kindergartenDictionary/deleteThreeLeve?subid=${sub.id}&superid=${items.id}">删除</a></li>
			                              </ul>
			                            </div>
	                             	 </div>
	                             	 
	                             	 
	                             	 
	                             	 <c:if test="${not empty sub.dictionarys}">
                         
	                          <ol class="dd-list" >
	                           <c:forEach items="${sub.dictionarys}" var="sub3" varStatus="status">
	                              <li data-id="3">
	                             	<div class="dd-handle">${sub3.name}
			                          <div class="btn-group" style="float: right;">
			                              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
			                              <ul class="dropdown-menu pull-right">
			                                <li><a href="${pageContext.request.contextPath}/kindergartenDictionary/updateThreeLeve?id=${sub3.id}&subid=${sub.id}&superid=${items.id}">修改</a></li>
			                                <li class="divider"></li>
			                                <li><a href="${pageContext.request.contextPath}/kindergartenDictionary/deleteThreeLeve?id=${sub3.id}&subid=${sub.id}&superid=${items.id}">删除</a></li>
			                              </ul>
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
              </section>
             
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
    </section>    
  </section>
  
</body>
</html>
