<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>管理后台</title>

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

               
            <div class="footer">
                <div class="pull-right">
                    By：<a href="http://www.zi-han.net" target="_blank">zihan's blog</a>
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



</body>
</html>
