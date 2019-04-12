<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>日常报修</title>

  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>
	
	<!-- 动态表格 -->
	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<body>
    <div id="wrapper">
     <!-- .aside left menu -->
	<%@include file="../../public/left.jsp" %>
        <div id="page-wrapper" class="gray-bg dashbard-1">
        <!-- .aside top jsp -->
           <%@include file="../../public/top.jsp" %>
            <div class="wrapper wrapper-content">
                <div class="row">
                    <!-- 内容 -->
                     <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>日常报修</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <p>
                                        <button onclick="addFormValue();" class="btn btn-primary " type="button"
                                        data-toggle="modal" data-target="#myModal5"
                                        ><i class="fa fa-plus" 
                                        ></i>&nbsp;我要报修</button>
                       			
                            </p>

                            <p>
                             <table class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                        <th>报修类型</th>
                                        <th>报修人</th>
                                        <th>报修地点</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                               <c:forEach items="${pageList}" var="item" varStatus="status">
                                    <tr class="gradeX">
                                        <td>${item.type}</td>
                                        <td>${item.name}</td>
                                        <td>${item.repairsAddredd}</td>
                                        <td>
                                        <c:choose>
                                        	<c:when test="${item.status == 1}">
                                        		等待审核
                                        	</c:when>
                                        	<c:otherwise>
                                        		审核通过
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                        </td>
                                        <td class="center">
                                         	<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                                         	 onclick="updateFormValue('${item.id}','${item.name}','${item.repairsAddredd}',
                                         	 '${item.type}','${item.message}')">编辑</button>
                                             <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                                             onclick="deleteAlert('${item.id}')">删除</button>
                                              <!-- 审核通过与驳回 -->
                                             <c:choose>
                                             <c:when test="${item.status == 1}">
	                                        		<a href="auditInformation?id=${item.id}&idCode=${item.idCode}&status=2">
	                                        			<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1">审核通过</button>
	                                        		</a>
                                        	</c:when>
                                        	<c:otherwise>
	                                        	<a href="auditInformation?id=${item.id}&idCode=${item.idCode}&status=1">
	                                        		<button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1">
	                                        			驳回
	                                        		</button>
	                                             </a>
                                        	</c:otherwise>
                                        </c:choose>
                                             
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                    </div>
                </div>
            </div>
                    
                  
                </div>
            </div>
        </div>
    </div>
    
    <!-- 删除弹出层提示 -->
    <div class="modal inmodal fade" id="deleteModal6" tabindex="-1" role="dialog"  aria-hidden="true" style="padding: 15%">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            	<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <span style="float: left;color: red;font-size: 18px;">删除提示</span>
                </div>
                <div class="modal-body">
                 <h3>您确认是否要删除此记录吗?</h3>
                </div>
                <input type="hidden" id="delete-id"> 
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="deleteById();" class="btn btn-primary delete-confirm-btn">确认</button>
                </div>
            </div>
        </div>
    </div>
    
 <!-- 弹出层－添加 -->
  <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="panelTitle"> </h4>
                </div>
                 <form id="add-news-form" action="${pageContext.request.contextPath}/school/application/createOrUpdateToFind" 
                 method="post" class="form-horizontal">
                <div class="modal-body">
                      <div class="row">
                      	<div class="col-lg-12">
	                      	 <div class="form-group">
	                            <label class="col-sm-2 control-label">报修人</label>
	                            <div class="col-sm-10">
	                                <input required="" aria-required="true" type="text" 
	                                id="name" name="name" class="form-control" placeholder="报修人" value="${sessionScope.loginUser.name}">
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">设备类型</label>
	                            <div class="col-sm-10">
	                            <select class="form-control" name="type" id="type">
	                            	<option value="多媒体">多媒体</option>
	                            	<option value="桌子">桌子</option>
	                            	<option value="板凳">板凳</option>
	                            	<option value="电脑">电脑</option>
	                            	<option value="其他">其他</option>
	                            </select>
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label class="col-sm-2 control-label">报修地址</label>
	                            <div class="col-sm-10">
	                                <input aria-required="true" type="text" 
	                                id="repairsAddredd" name="repairsAddredd" class="form-control" placeholder="报修地址" >
	                            </div>
                        	</div>
                      	</div>
                      	
                      </div>
                      <div class="row">
                      <div class="col-lg-12">
                      		 <div class="form-group">
                            <label class="col-sm-2 control-label">理由</label>
                            <div class="col-sm-10">
                            	<textarea id="message" name="message" data-rangelength="[2,1000]" placeholder="报修内容" class="form-control parsley-validated" rows="6"></textarea>
                            </div>
                        </div>
                        </div>
                      </div>
                </div>
                	<!-- 隐常ID,更新时使用 -->
					<input id="id" name="id" type="hidden">
					<!-- idcode=1 表示是请假 -->
					<input id="idCode" name="idCode" type="hidden" value="2">
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="submit" id="save-btn-news" class="btn btn-primary">保存</button>
                </div>
                </form>
            </div>
        </div>
    </div>
 <!-- 更新内容是传值 -->
 <script type="text/javascript">
 	//更新内容传值
 	//onclick="updateFormValue('${item.id}','${item.name}','${item.repairsAddredd}',
    //                                     	 '${item.type}','${item.message}')">编辑</button>
 	function updateFormValue(id,name,repairsAddredd,type,message){
 		$('#myModal5').modal('show');
 		$("#id").val(id);
		$("#name").val(name);
		$("#repairsAddredd").val(repairsAddredd);
		//$("#type").val(type);
		$("#message").val(message);
		
		 $("#type").find("option[value='"+type+"']").attr("selected", "selected");
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("更新通知"); 
 	}
 	//添加时－清空值
 	function addFormValue(){
 		
 		$("#id").val('');
		$("#repairsAddredd").val('');
		$("#message").val('');
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("请假申请"); 
 	}
 	
 	
 	var deleteId;
 	//删除提示窗口
 	function deleteAlert(id) {
 		 $('#deleteModal6').modal('show');
 		deleteId=id;
 		
 	}
 	//删除记录
 	function deleteById() {
 		//idCode用于标识删除后，跳转到相应的页面
 		window.location.href = "delete?idCode=2&id="+deleteId;
 	}
 	
 	
 	
 	
 </script>
 
<!-- 主要的 scripts -->
<script src="${pageContext.request.contextPath}/assets/admin/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/jeditable/jquery.jeditable.js"></script>
<!-- 动态表格数据 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<!-- 定制的javascript和插件 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/hplus.js?v=2.2.0"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/pace/pace.min.js"></script>
<!-- 全文搜索与查询 -->
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>


<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/assets/admin/js/plugins/datapicker/bootstrap-datepicker.js"></script>

<script>
$(document).ready(function () {
    $('.summernote').summernote({
        lang: 'zh-CN',
        onImageUpload: function(files, editor, $editable) {
          sendFile(files[0], editor, $editable);
        }
    });
    $('.dataTables-example').dataTable();//表格

    // validate the comment form when it is submitted
  //  $("#add-news-form").validate();//初始化from验证
    
    
    $('#sdate').datepicker({
    	startView: 2,
      todayBtn: "linked",
      keyboardNavigation: false,
      forceParse: false,
      language: 'zh-CN',
      format:'yyyy-mm-dd',
      forceParse: false,
      autoclose: true,
      todayHighlight: true
  }); 
	
    $('#edate').datepicker({
    	startView: 2,
      todayBtn: "linked",
      keyboardNavigation: false,
      forceParse: false,
      language: 'zh-CN',
      format:'yyyy-mm-dd',
      forceParse: false,
      autoclose: true,
      todayHighlight: true
  }); 
	
    
});
</script>

</body>
</html>
