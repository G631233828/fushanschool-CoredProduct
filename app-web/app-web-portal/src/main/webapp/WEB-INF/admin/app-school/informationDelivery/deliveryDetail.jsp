<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>个人信息</title>

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
						<section class="scrollable padder ">
							<div class="m-b-md">
							</div>
							<div class="row">
								<div class="col-sm-6" style="width: 100%;">
										<section class="panel panel-default">
											
											<div class="panel-body">
												<p class="text-muted"></p>
				
<div class="panel">
                        <h4 class="font-thin padder">系统公告</h4>
                       <ul class="list-group">
                       <!--超级管理员发送的信息-->
                     
                          <li class="list-group-item">
                              <center><p>${informationDelivery.title }(${informationDelivery.contentType })</p></center>
                               <small>${informationDelivery.content }</small>
                              <small class="block text-muted" style="margin-top: 10px;">
                              <i class="fa fa-clock-o"></i>：<fmt:formatDate value="${informationDelivery.setDate }" type="date"/>
                              <div style="float:right;"><i class="fa icon-user">：</i>${informationDelivery.author}</div>
                              </small>
                          </li>
                      
                       	 		
           
              
                       
                        </ul>
                      </div>
												<input id="schoolid" name="schoolid"
													value="${sessionScope.SSchool.id}" type="hidden">
											</div>
										</section>
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
