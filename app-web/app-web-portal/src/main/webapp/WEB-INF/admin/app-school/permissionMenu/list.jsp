<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!doctype html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>通知管理</title>

  
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="WeChat" />
</head>

<script type="text/javascript">
function show(o,o2,type){
	var val=$(o2).attr("class")
		if(type==0){
			if(val.trim()=='glyphicon glyphicon-plus'){
				//关闭所有节点
				$('[id='+o+']').show();
				$(o2).attr("class","fa fa-minus");
			}
			else if(val.trim()=='fa fa-minus'){ 
				//关闭所有节点
				$('tr[id*='+o+']').hide();
				//$(o2).attr("class","glyphicon glyphicon-plus");
				$('[id='+o+'_top]').attr("class","glyphicon glyphicon-plus");
				$('[id='+o+'_one]').attr("class","glyphicon glyphicon-plus");
				$('[id='+o+'_two]').attr("class","glyphicon glyphicon-plus");
				$('[id='+o+'_three]').attr("class","glyphicon glyphicon-plus");
			}
			
		}
	if(type==1){
	     var os=o.substring(o.indexOf("_")+1,o.lastIndexOf("_"));
	    var oo=o.substring(0,o.indexOf("_"));
		if(val.trim()=='glyphicon glyphicon-plus'){
			//关闭所有节点
			$('[id*='+os+'_second]').show();
			$(o2).attr("class","fa fa-minus");
		}
		else if(val.trim()=='fa fa-minus'){ 
			//关闭所有节点
			$('tr[id*='+os+']').hide();
			//$(o2).attr("class","glyphicon glyphicon-plus");
			$(o2).attr("class","glyphicon glyphicon-plus");
			$('[id='+oo+'_two]').attr("class","glyphicon glyphicon-plus");
			$('[id='+oo+'_three]').attr("class","glyphicon glyphicon-plus");
		}
		
	}
	if(type==2){
		if(val.trim()=='glyphicon glyphicon-plus'){
			//关闭所有节点
			$('[id='+o+']').show();
			$(o2).attr("class","fa fa-minus");
		}
		else if(val.trim()=='fa fa-minus'){ 
			//关闭所有节点
			$('tr[id*='+o+']').hide();
			//$(o2).attr("class","glyphicon glyphicon-plus");
			$(o2).attr("class","glyphicon glyphicon-plus");
			$('[id='+o+'_three]').attr("class","glyphicon glyphicon-plus");
		}
		
	}
	
			
			
			
		
	
	
}

function selectMenu(){
	
var type=$("#type option:selected").val();
var a=type.substring(0,type.indexOf("_"));
if(type=="0"){
	$("#menuType1").prop("checked",false);
	$("#menuType2").prop("checked",false);
	$("#subid").hide();
}else{
	$("#menuType1").prop("checked",true);
	$("#menuType2").prop("checked",false);
	$("#subid").show();
}
if(a=="3"){
	$("#subid").hide();
	$("#menuType1").prop("checked",false);
	$("#menuType2").prop("checked",true);
}
	
	
}
</script>
	
<%-- 	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/summernote/summernote.css" rel="stylesheet"> --%>
<%-- 	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/summernote/summernote-bs3.css" rel="stylesheet"> --%>
	<!-- 动态表格 -->
	<link href="${pageContext.request.contextPath}/assets/admin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<body>

   <c:if test="${not empty error }">
                            <div class="alert alert-danger alert-dismissable __web-inspector-hide-shortcut__">
                            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                          <b style="margin-left: 40%;">  ${error }</b>
                        </div>
                            </c:if>


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
                                    <h5>通知信息</h5>
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
                                        ></i>添加菜单</button>
                       			

                            </p>

                            <p>
                         
                            
                            
                              <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>菜单类型</th>
                                        <th>菜单名称</th>
                                        <th>图标</th>
                                        <th>url</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                  <c:forEach items="${pageList}" var="item" varStatus="status">
                       <tr class="gradeX" >
                         <td>
                           <c:if test="${not empty item.listPermissionSubMenu}">
                               <i class=" glyphicon glyphicon-plus" id="${item.id }_top" onclick="return show('${item.id}',this,0)">功能菜单</i>
                           </c:if>
                           <c:if test="${empty  item.listPermissionSubMenu}">功能菜单</c:if>
                         </td>
                         <td>${item.menuName}</td>
                         <td></td>
                         <td>${item.menuUrl}</td>
                         <td class="center">
                         <button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                          onclick="updateFormValue('${item.id}','${item.menuName }','${item.icon }','${item.menuUrl }','${item.id }','${item.orderby }','${item.menuType }')">编辑</button>
                         <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                          onclick="deleteAlert('${item.id}','0')">删除</button>
                         </td>
                        </tr>
                     <!-- 一级菜单 -->
                     <c:forEach items="${item.listPermissionSubMenu}"  var="item1" varStatus="status">
                                     <tr class="gradeX " id="${item.id }"  style="display: none;">
                                       <td>
                                       <c:if test="${not empty item1.listPermissionSubMenu}">
                                       	 <i class="glyphicon glyphicon-plus " id="${item.id }_one" onclick="return show('${item.id }_${item1.id }_second',this,1)"  style="margin-left: 20px;">一级菜单</i>
                                       	</c:if>
                                       	<c:if test="${empty  item1.listPermissionSubMenu}"><i style="margin-left: 20px;"></i>&nbsp;一级菜单</c:if>
                                       
                                       </td>
                                       <td>${item1.menuName}</td>
                                       <td>${item1.icon }</td>
                                       <td>${item1.menuUrl}</td>
                                        <td class="center">
                                         	<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                                         	 onclick="updateFormValue('${item1.id}','${item1.menuName }','${item1.icon }','${item1.menuUrl }','1_${item.id }','${item1.orderby }','${item1.menuType }')">编辑</button>
                                             <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                                             onclick="deleteAlert('${item1.id}','1_${item.id }')">删除</button>
                                        </td>
                                    </tr>
                                     <!-- 二级菜单 -->
                                    	<c:forEach items="${item1.listPermissionSubMenu}" var="item2" varStatus="status">
                                     	<tr class="gradeX" id="${item.id }_${item1.id}_second" style="display: none;">
                                       <td>
                                       <c:if test="${not empty item2.listPermissionSubMenu}">
                                       	 <i class="glyphicon glyphicon-plus " id="${item.id }_two" onclick="return show('${item.id }_${item1.id }_${item2.id }',this,2)"  style="margin-left: 40px;">二级菜单</i>
                                       	</c:if>
                                       	<c:if test="${empty  item2.listPermissionSubMenu}"><i style="margin-left: 40px;"></i>二级菜单</c:if>
                                       
                                       </td>
                                       <td>${item2.menuName}</td>
                                       <td>${item2.icon }</td>
                                       <td>${item2.menuUrl}</td>
                                        <td class="center">
                                         	<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                                         	 onclick="updateFormValue('${item2.id}','${item2.menuName }','${item2.icon }','${item2.menuUrl }','2_${item.id }_${item1.id }','${item2.orderby }','${item2.menuType }')">编辑</button>
                                             <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                                             onclick="deleteAlert('${item2.id}','2_${item.id }_${item1.id }')">删除</button>
                                        </td>
                                    </tr>
                                    <!-- 三级菜单 -->
                                    	<c:forEach items="${item2.listPermissionSubMenu}" var="item3" varStatus="status">
                                     	<tr class="gradeX" id="${item.id }_${item1.id }_${item2.id }" style="display: none;">
                                       <td>
                                       <c:if test="${not empty item3.listPermissionSubMenu}">
                                       	 <i class="glyphicon glyphicon-plus " id="${item.id }_three"   style="margin-left: 60px;">三级菜单</i>
                                       	</c:if>
                                       	<c:if test="${empty  item3.listPermissionSubMenu}"><i style="margin-left: 60px;"></i>三级菜单</c:if>
                                       
                                       </td>
                                       <td>${item3.menuName}</td>
                                       <td>${item3.icon }</td>
                                       <td>${item3.menuUrl}</td>
                                        <td class="center">
                                         	<button type="button" class="btn btn-primary btn-xs edit-news" data-id="1"
                                         	 onclick="updateFormValue('${item3.id}','${item3.menuName }','${item3.icon }','${item3.menuUrl }','3_${item.id }_${item2.id }','${item3.orderby }','${item3.menuType }')">编辑</button>
                                             <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="1"
                                             onclick="deleteAlert('${item3.id}','3_${item.id }_${item2.id }')">删除</button>
                                        </td>
                                    </tr>
                              	  </c:forEach>
                              	  </c:forEach>
                                </c:forEach>
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
                 <form id="add-news-form" action="${pageContext.request.contextPath}/permissionMenu/createOrUpdateToFind" 
                 method="post" class="form-horizontal">
                <div class="modal-body">
                      <div class="row">
	                      	 <div class="form-group">
	                            <label class="col-sm-3 control-label">菜单名称</label>
	                            <div class="col-sm-6">
	                                <input required="" aria-required="true" type="text" 
	                                id="menuName" name="menuName" class="form-control" placeholder="标题" >
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">菜单图标</label>
	                            <div class="col-sm-6">
	                                <input type="text" 
	                                id="icon" name="icon" class="form-control" placeholder="菜单图标" >
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <label class="col-sm-3 control-label">排序</label>
	                            <div class="col-sm-6">
	                                <input  type="text" 
	                                id="orderby" name="orderby" class="form-control" placeholder="排序" >
	                            </div>
	                        </div>
	                      
	                       
	                        <div class="form-group"  >
	                            <label class="col-sm-3 control-label">上级菜单</label>
	                            <div class="col-sm-6">
	                                <select class="form-control" name="type" id="type" onchange="return selectMenu();" >
	                            	<option value="0">----顶级目录----</option>
	                            	<c:forEach items="${pageList}" var="item" varStatus="status">
	                            			<option value="1_${item.id }">--${item.menuName}</option>
	                            		<c:forEach items="${item.listPermissionSubMenu}" var="item1" varStatus="status">
	                            		<c:if test="${item1.menuType=='2'}">
	                            			<option value="2_${item.id }_${item1.id }">----${item1.menuName}</option>
	                            			</c:if>
	                            				<c:forEach items="${item1.listPermissionSubMenu}" var="item2" varStatus="status">
	                            				<c:if test="${item2.menuType=='3'}">
	                            				<option value="3_${item.id }_${item2.id }">-------${item2.menuName}</option>
	                            						</c:if>
	                            	
	                            				</c:forEach>
	                            		</c:forEach>
	                            	</c:forEach>
	                            </select>
	                            </div>
	                        </div>
	                         <div class="form-group" id="edit" style="display: none;" >
	                            <label class="col-sm-3 control-label">菜单类型</label>
	                            <div class="col-sm-6">
	                                <select class="form-control"   id="type2" disabled="disabled">
	                            	<option value="0">功能菜单</option>
	                            	<option value="1">一级菜单</option>
	                            	<option value="2">二级菜单</option>
	                            	<option value="3">三级菜单</option>
	                            </select>
	                            </div>
	                        </div>
	                          <div class="form-group"  id="subid" style="display: none;">
	                            <label class="col-sm-3 control-label">是否允许子菜单</label>
	                            <div class="col-sm-6" style="margin-top: 5px;">
                                                <input type="radio" name="menuType" id="menuType1" value="2">
                                                <label for="radio1">
                                                    是
                                                </label>
                                                <input type="radio" name="menuType" id="menuType2" value="1">
                                                <label for="radio2">
                                                    否
                                                </label>
	                            </div>
	                        </div>
	                        
                      		 <div class="form-group">
	                            <label class="col-sm-3 control-label">URL地址</label>
	                            <div class="col-sm-6">
	                                <input required="" aria-required="true" type="text" 
	                                id="url" name="url" class="form-control" placeholder="URL" >
	                            </div>
                        	</div>
							
                      </div>
                </div>
                	<!-- 隐常ID,更新时使用 -->
					<input id="id" name="id" type="hidden">
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
 	function updateFormValue(id,menuName,icon,url,type,orderby,menuType){
 		$('#myModal5').modal('show');
 		$("#id").val(id);
		$("#menuName").val(menuName);
		$("#icon").val(icon);
		$("#url").val(url);
		$("#orderby").val(orderby);
		
		var a=type.substring(0,type.indexOf("_"));
		if(a==""){
			 $("#type").find("option[value='"+0+"']").attr("selected", "selected");
		}else{
			 $("#type").find("option[value='"+type+"']").attr("selected", "selected");
		}
		//$("#type").attr("disabled","disabled");
		 $("#type2").find("option[value='"+a+"']").attr("selected", "selected");
		 
		 if(menuType=="1"){
			 if(a!="3"){
			 $("#menuType2").prop("checked",true);
			$("#menuType1").prop("checked",false);
				$("#subid").show();
			 }
		 }else if(menuType=="2"){
			 if(a!="3"){
			 $("#menuType2").prop("checked",false);
				$("#menuType1").prop("checked",true);
					$("#subid").show();
			 }
		 }
		 
		 
		 
		
		$("#edit").show();
		$("#add").hide();
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("修改菜单"); 
 	}
 	//添加时－清空值
 	function addFormValue(){
 		$("#add").show();
 		$("#id").val('');
 		$("#url").val('');
		$("#menuName").val('');
		$("#orderby").val('');
		$("#icon").val('');
		//标题设置，先清空再添加
		$("#panelTitle").empty();
		$("#panelTitle").append("添加菜单"); 
		$("#edit").hide();
		$("#type").attr("disabled",false);
 	}
 	
 	
 	var deleteId;
 	var deltype;
 	//删除提示窗口
 	function deleteAlert(id,type) {
 		 $('#deleteModal6').modal('show');
 		deleteId=id;
 		deltype=type;
 		
 		
 	}
 	//删除记录
 	function deleteById() {
 		window.location.href = "delete?id="+deleteId+"&type="+deltype;
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
    $("#add-news-form").validate();//初始化from验证
});
</script>

</body>
</html>
