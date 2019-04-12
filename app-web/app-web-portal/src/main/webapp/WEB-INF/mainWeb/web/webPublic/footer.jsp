<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>

<style type="text/css">
.side-bar a,.chat-tips i {background: url(${pageContext.request.contextPath}/assets/web/right_bg.png) no-repeat;}
.side-bar {width: 66px;position: fixed;bottom: 20px;right: 25px;font-size: 0;line-height: 0;z-index: 100;}
.side-bar a {width: 66px;height: 66px;display: inline-block;background-color: #669fdd;margin-bottom: 2px;}
.side-bar a:hover {background-color: #ddd;}
.side-bar .icon-qq {background-position: 0 -62px;}
.side-bar .icon-chat {background-position: 0 -130px;position: relative;}
.side-bar .icon-chat:hover .chat-tips {display: block;}
.side-bar .icon-blog {background-position: 0 -198px;}
.side-bar .icon-mail {background-position: 0 -266px;}
.side-bar .icon-totop {background-position: 0 -334px;}
.chat-tips {padding: 20px;border: 1px solid #d1d2d6;position: absolute;right: 78px;top: -55px;background-color: #fff;display: none;}
.chat-tips i {width: 9px;height: 16px;display: inline-block;position: absolute;right: -9px;top: 80px;background-position:-88px -350px;}
.chat-tips img {width: 138px;height: 138px;}


</style>


	<script>
		var _hmt = _hmt || [];
		(function() {
		  var hm = document.createElement("script");
		  hm.src = "//hm.baidu.com/hm.js?ad866fa754d54dcb0605c9a04dbdc0d4";
		  var s = document.getElementsByTagName("script")[0]; 
		  s.parentNode.insertBefore(hm, s);
		})();
	</script>
</head>
<body>
	   <div id="footer" style="color: #fff;border-top: 10px solid #1791CA;">
      <div class="footer_bottom" style="background: #277C9C;">
       
      	<div class="footer_bottom_in" style=" text-align:center;width:100%;">
      	
	      	<div class="footer_bottom_in" style=" text-align:left;width:70%;float: right;">
		      	<a target="_blank"  href="http://www.fxedu.cn/" style="color: #ffffff;"> 奉贤教育 </a>  |  
		      	<a target="_blank"  href="http://xfyh.21shte.net/"  style="color: #ffffff;"> 教师教育平台 </a>  |  
		      	<a target="_blank"  href="http://www.21shte.net/main/"  style="color: #ffffff;"> 上海教师教育网 </a>  |   
		      	<a target="_blank"  href="http://www.sherc.net/sherc/indexnew/"  style="color: #ffffff;"> 上海教育资源库 </a> |  
		      	<a target="_blank"  href="http://jypt.fxedu.cn/ziyuan/jypt/default.htm"  style="color: #ffffff;"> 区教研平台 </a>   |   
		      	<a target="_blank"  href="http://www.secsa.cn/Index.html" style="color: #ffffff;"> 上海学生活动网 </a>
		      	<br>
					 地址：奉贤区四团镇鹏程东街50号 邮编：201412 电话：57533472    
<%
Integer counter = (Integer)application.getAttribute("counter");    //先从application里面获取计数器的key的值
 if(counter==null){
      //如果该值为null，说明第一次访问
     application.setAttribute("counter",1);
     counter=(Integer)application.getAttribute("counter");
     }else {
     //如果该值不为空，取出来进行累加
     int i = counter.intValue();
     i++;
     application.setAttribute("counter",i);//累加后再放进去
     }
%>	
	网站的访问量：${sessionScope.traffic}
					<br> ◆上海市奉贤区四团小学版权所有◆ Copyright ＠ 2010 All rights reserved 沪教Y6-20130022
			</div>
			<div class="footer_bottom_in" style=" text-align:right;width:30%;float: right;">
				 <script type="text/javascript">document.write(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript src='http://dcs.conac.cn/js/02/035/0000/40786621/CA020350000407866210003.js' type='text/javascript'%3E%3C/script%3E"));</script>
			</div>
        </div>
      </div>
</div>



<div class="side-bar"> 
	<a href="#" class="icon-chat">微信<div class="chat-tips"><i></i>
	<img style="width:138px;height:138px;" src="${pageContext.request.contextPath}/assets/web/st_wechat.jpg" alt="微信订阅号"></div></a> 
	<a target="_blank" href="#" class="icon-blog">微博</a> 
</div>
</html>