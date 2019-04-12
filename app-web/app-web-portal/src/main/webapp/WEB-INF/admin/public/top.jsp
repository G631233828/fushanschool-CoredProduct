<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page isELIgnored="false"%> 
<!doctype html>
<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2018福山外语节</title>
</head>
<body>
	 <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " ><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span class="m-r-sm text-muted welcome-message">
                            <a href="${pageContext.request.contextPath}/web/index" title="返回首页">
                            <i class="fa fa-home"></i></a>
                            网站首页</span>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                                <i class="fa fa-bell"></i>  <span class="label label-primary">0</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="＃">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有0条未读消息
                                            <span class="pull-right text-muted small">当天</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="＃">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 0条新回复
                                            <span class="pull-right text-muted small">当天</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
<!--                                 <li> -->
<!--                                     <div class="text-center link-block"> -->
<!--                                         <a href=""> -->
<!--                                             <strong>查看所有 </strong> -->
<!--                                             <i class="fa fa-angle-right"></i> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                 </li> -->
                            </ul>
                        </li>


                        <li>
                            <a href="${pageContext.request.contextPath}/user/loginout">
                                <i class="fa fa-sign-out"></i> 退出
                            </a>
                        </li>
                    </ul>

                </nav>
            </div>
</body>
</html>