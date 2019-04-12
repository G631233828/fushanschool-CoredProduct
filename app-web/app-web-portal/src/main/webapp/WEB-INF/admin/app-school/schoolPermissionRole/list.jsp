<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>角色管理</title>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/delete-tcc/css/reset.css"> <!-- CSS reset -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/delete-tcc/css/style.css"> <!-- Resource style -->
<script src="${pageContext.request.contextPath}/assets/delete-tcc/js/jquery.1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/assets/delete-tcc/js/main.js"></script> <!-- Resource jQuery -->

<script type="text/javascript">
<!--批量删除-->
var gallery_id = "";
function deletes(id) {
	gallery_id = id;

}
function deletesById() {
	if (gallery_id != "") {
		window.location.href = "delete?id="+ gallery_id;
	}else {
		var arrChk=$("input[name='ids']:checked");
		var str="";
	    $(arrChk).each(function(){
	      str+=this.value+",";                        
	    });
 	    if(str!=""){
 	    	  var ids=str.substring(0,str.length-1);
 	    	  window.location.href = "delete?ids="+ids;
 	    }else{
 	    	window.location.href=document.URL;
 	    }
	  
		
	}
}
</script>

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
            <section class="scrollable padder">
              <div class="m-b-md">
                <h3 class="m-b-none">学校角色</h3>
              </div>

              <section class="panel panel-default">
                <header class="panel-heading">
                  角色信息管理
                </header>
                <div class="row wrapper">
                	<!-- 添加和删除 -->
                  <div class="col-sm-5 m-b-xs">
                  <a href="${pageContext.request.contextPath}/schoolPermissionRole/updateOrCreate">
                    <button class="btn btn-sm btn-default">添加</button> 
                   </a>
                    <button class="cd-popup-trigger btn btn-sm btn-default">批量删除</button>                     
                  </div>
                  <!-- 中间空行 -->
                  <div class="col-sm-4 m-b-xs">
                  </div>
                  <div class="col-sm-3">
                  <!-- 查找 -->
                    <div class="input-group">
<!--                       <input type="text" class="input-sm form-control" placeholder="Search"> -->
<!--                       <span class="input-group-btn"> -->
<!--                         <button class="btn btn-sm btn-default" type="button">查找</button> -->
<!--                       </span> -->
                    </div>
                  </div>
                </div>
                <div class="table-responsive">
                  <table class="table table-striped b-t b-light">
                    <thead>
                      <tr>
                        <th style="width:20px;"><label class="checkbox m-n i-checks">
                        <input type="checkbox"><i></i></label></th>
                       
                        <th>角色名称</th>
                        <th>角色备注</th>
                        <th>角色类型</th>
                        <th style="width:30px;"></th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${pageList.datas}" var="items" varStatus="status">
                      <tr>
                        <td><label class="checkbox m-n i-checks">
                        <input type="checkbox" name="ids"  value="${items.id}"><i></i></label></td>
                        <td>${items.roleName}</td>
                        <td>${items.remark}</td>
                        <td>
                       		<c:choose>
                        	<c:when test="${items.schoolRoleType == 'schoolAdminRole'}">
                        		管理员角色
                        	</c:when>
                        	<c:otherwise>
                        		普通角色
                        	</c:otherwise>
                        	</c:choose>
                        </td>
                        <td>
                          <div class="btn-group">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
                              <ul class="dropdown-menu pull-right">
                                <li><a href="${pageContext.request.contextPath}/schoolPermissionRole/updateOrCreate?id=${items.id}">修改</a></li>
                                <li class="divider"></li>
                                <li><a class="cd-popup-trigger" onclick="deletes('${items.id}')">删除</a></li>
                              </ul>
                            </div>
                        </td>
                      </tr>
                     </c:forEach>
                      
                     
                    </tbody>
                  </table>
                </div>
                <footer class="panel-footer">
                  <div class="row">
                    <div class="col-sm-5 hidden-xs">
                    <small class="text-muted inline m-t-sm m-b-sm"> 每页显示${pageList.pageSize}行 － 当前页${pageList.pageNo}页 － 共${pageList.totalPage}页  </small>
                       
                    </div>
                    <div class="col-sm-7 text-right text-center-xs">                
                      <ul class="pagination pagination-sm m-t-none m-b-none">
                        <li><a href="${pageContext.request.contextPath}/schoolPermissionRole/list?pageNo=${pageList.upPage}">
                        <i class="fa fa-chevron-left"></i>
                        </a></li>
                        <c:forEach items="${pageList.navigatepageNums}" var="nav">
                        <c:choose>
                        	<c:when test="${nav == pageList.pageNo}">
                        	<!-- 1当前页面 -->
                        	<li>
                        	<a  style="border-color: #eaeef1;background-color: #e8eff0;" href="${pageContext.request.contextPath}/schoolPermissionRole/list?pageNo=${nav}">${nav}</a>
                        	</li>
                        	</c:when>
                        	<c:otherwise>
                        	<li><a href="${pageContext.request.contextPath}/schoolPermissionRole/list?pageNo=${nav}">${nav}</a></li>
                        	</c:otherwise>
                        </c:choose>
                        
                        </c:forEach>
                        <li><a href="${pageContext.request.contextPath}/schoolPermissionRole/list?pageNo=${pageList.nextPage}">
                        <i class="fa fa-chevron-right">
                        </i></a></li>
                      </ul>
                    </div>
                  </div>
                </footer>
              </section>
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
    </section>    
  </section>
  
  
  <!-- 删除确认 -->
  	<div style="z-index:99999;" class="cd-popup" role="alert" id="alerts">
		<div class="cd-popup-container">
			<p>你确定你要删除吗?</p>
			<ul class="cd-buttons">
				<li><a href="javascript:;" onclick="deletesById()">是</a></li>
				<li><a href="javascript:;"  class="cd-popup" style="position: static !important;width:100%">否</a></li>
			</ul>
			<a href="javascript:;" class="cd-popup-close img-replace">关闭</a>
		</div>
		<!-- cd-popup-container -->
	</div>
</body>
</html>
