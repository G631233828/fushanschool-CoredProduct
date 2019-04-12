<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2016福山外语节－迪士尼文化周</title>

</head>
<body>
<div class="copyright_info" style="text-align: center;background-color: #883997;color: #fff;">
<div class="container" style="text-align: center;">
        <p style="text-align: center;">◆上海市浦东新区福山外国语小学◆ Copyright ＠ 2016 All rights reserved 沪教Y6-20130022</p>
        <p style="text-align: center;">地址：浦东新区福山路48弄1号 邮编：200120 电话：58827950</p>
    
</div>
</div><!-- end copyright info -->
   
<!-- ######### JS FILES ######### -->
<!-- get jQuery from the google apis -->
<!-- mega menu -->
<script src="${pageContext.request.contextPath}/assets/web/civilization/js/mainmenu/fhmm.js"></script>
<script type="text/javascript">
	// Menu drop down effect
	$('.dropdown-toggle').dropdownHover().dropdown();
	$(document).on('click', '.fhmm .dropdown-menu', function(e) {
	  e.stopPropagation()
	})
</script>
<!-- sticky menu -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/web/civilization/js/mainmenu/sticky.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/web/civilization/js/mainmenu/modernizr.custom.75180.js"></script>
</body>
</html>