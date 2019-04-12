<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>四团小学管理后台</title>

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
    
<body>
    <div id="wrapper">
     <!-- .aside left menu -->
	<%@include file="public/left.jsp" %>
        <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
           <%@include file="public/top.jsp" %>
            <div class="wrapper wrapper-content">

             
            
            
            <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2>个人资料</h2>
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.html">主页</a>
                        </li>
                        <li>
                            <strong>个人资料</strong>
                        </li>
                    </ol>
                </div>
                <div class="col-lg-2">

                </div>
            </div>
            <div class="wrapper wrapper-content">
                <div class="row animated fadeInRight">
                    <div class="col-md-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>密码修改</h5>
                            </div>
                            <div>
                            
                                <div class="ibox-content no-padding border-left-right"></div>
                                
                                <div class="ibox-content profile-content">
	                                <form class="form-horizontal m-t" id="signupForm" action="updatePassword">
	                                
                                    <input name="id" value="${user.id}" type="hidden">
                                    
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">旧密码：</label>
                                        <div class="col-sm-8">
                                            <input id="password11" name="password" class="form-control" type="password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">新密码：</label>
                                        <div class="col-sm-8">
                                            <input id="password" name="passwordNew" class="form-control" type="password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">确认密码：</label>
                                        <div class="col-sm-8">
                                            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-8 col-sm-offset-3">
                                            <button class="btn btn-primary" type="submit">提交</button>
                                        </div>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>个人资料</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html#">
                                        <i class="fa fa-wrench"></i>
                                    </a>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">

                                <div>
                                    <div class="feed-activity-list">
										 <form class="form-horizontal m-t" id="signupForm" action="updatePorfile">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">用户名：</label>
                                        <div class="col-sm-8">
                                         <input name="id" value="${sessionScope.loginUser.id}" type="hidden">
                                            <input 
                                            class="form-control" disabled="disabled" type="text" value="${user.username}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">姓 名：</label>
                                        <div class="col-sm-8">
                                            <input id="lastname" name="name" class="form-control" type="text" value="${user.name}"
                                             aria-required="true" aria-invalid="false" class="valid">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">身份证：</label>
                                        <div class="col-sm-8">
                                            <input id="username" name="card" class="form-control" type="text"  value="${user.card}"
                                            aria-required="true" aria-invalid="true" class="error">
                                        </div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">角色：</label>
                                        <div class="col-sm-8">
                                        <c:forEach items="${listRole}" var="role" varStatus="status">
	                            			<c:if test="${role.id == sessionScope.loginUser.role}">
	                            				
	                            				<input disabled="disabled" class="form-control" type="text" value="${role.name}" >
	                            			</c:if>
	                            	</c:forEach>
                                            
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-8 col-sm-offset-3">
                                            <button class="btn btn-primary" type="submit">提交</button>
                                        </div>
                                    </div>
                                </form>
                                    </div>
                                    
                                    
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="pull-right">
                    By：<a href="" target="_blank">zihan's blog</a>
                </div>
                <div>
                    <strong>Copyright</strong> H+ &copy; 2014
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/flot/jquery.flot.symbol.js"></script>

    <!-- Peity -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/hplus.js?v=2.2.0"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/pace/pace.min.js"></script>

    <!-- jQuery UI -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- EayPIE -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/easypiechart/jquery.easypiechart.js"></script>

    <!-- Sparkline -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="${pageContext.request.contextPath}/assets/admin/js/demo/sparkline-demo.js"></script>
 <!-- jQuery Validation plugin javascript-->
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/admin/js/plugins/validate/messages_zh.min.js"></script>
    <script>
         //以下为官方示例
        $().ready(function () {
            // validate the comment form when it is submitted
            $("#commentForm").validate();

            // validate signup form on keyup and submit
            $("#signupForm").validate({
                rules: {
                    firstname: "required",
                    lastname: "required",
                    username: {
                        required: true,
                        minlength: 2
                    },
                    password: {
                        required: true,
                        minlength: 5
                    },
                    confirm_password: {
                        required: true,
                        minlength: 5,
                        equalTo: "#password"
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    topic: {
                        required: "#newsletter:checked",
                        minlength: 2
                    },
                    agree: "required"
                },
                messages: {
                    firstname: "请输入你的姓",
                    lastname: "请输入您的名字",
                    username: {
                        required: "请输入您的用户名",
                        minlength: "用户名必须两个字符以上"
                    },
                    password: {
                        required: "请输入您的密码",
                        minlength: "密码必须5个字符以上"
                    },
                    confirm_password: {
                        required: "请再次输入密码",
                        minlength: "密码必须5个字符以上",
                        equalTo: "两次输入的密码不一致"
                    },
                    email: "请输入您的E-mail",
                    agree: "必须同意协议后才能注册"
                }
            });

            // propose username by combining first- and lastname
            $("#username").focus(function () {
                var firstname = $("#firstname").val();
                var lastname = $("#lastname").val();
                if (firstname && lastname && !this.value) {
                    this.value = firstname + "." + lastname;
                }
            });
        });
    </script>


</body>
</html>
