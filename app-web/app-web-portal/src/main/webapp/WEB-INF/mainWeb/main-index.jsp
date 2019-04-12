<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<body class="top-navigation">
    <div id="wrapper">
        <div id="page-wrapper" class="gray-bg">
     	  <%@include file="public/top.jsp" %>
            <div class="wrapper wrapper-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>${name}-列表</h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content">
                                    <p>
                                     <input type="hidden" id="moduleId" name="moduleId" value="${param.moduleId}">
                     				   <input type="hidden" id="menuName" name="menuName" value="${param.menuName}">
                     				     <input type="hidden" id="token" name="token" value="${param.token}">
                                        <button class="btn btn-primary " type="button"
                                       id="add-news-btn"
                                        ><i class="fa fa-check" 
                                        ></i>&nbsp;添加新闻</button>
                       

                            </p>

                            <p>
                             <table id="table-news" class="table table-striped table-bordered table-hover dataTables-example">
                                <thead>
                                    <tr>
                                    <th></th>
                                        <th>标题</th>
                                        <th >日期</th>
                                        <th>作者</th>
                                        <th>浏览次数</th>
                                        <th>学校ID</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 
                                <c:forEach var="news" items="${newslist}">
                                    <tr class="gradeX">
                                    <th></th>
                                        <td>${news.title}</td>
                                        <td>${news.createDate}</td>
                                        <td>${news.author}</td>
                                        <td class="center">${news.browseTimes}</td>
                                        <td class="center">${news.schoolId}</td>
                                        <td class="center">
                                            <button type="button" class="btn btn-primary btn-xs edit-news" data-id="${news.id}">编辑</button>
                                             <button type="button" class="btn  btn-warning btn-xs delete-news" data-id="${news.id}"
                                             >删除</button>
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
            <div class="modal inmodal fade" id="deleteModal6" tabindex="-1" role="dialog"  aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                         <h3>是否删除当前新闻？</h3>
                                        </div>
                                        <input type="hidden" id="delete-id"> 
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary delete-confirm-btn">确认</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

    
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
<script src="${ctx}/assets/admin/js/jquery-2.1.1.min.js"></script>
<script src="${ctx}/assets/admin/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${ctx}/assets/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/assets/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/assets/admin/js/plugins/jeditable/jquery.jeditable.js"></script>
    <!-- Data Tables -->
<script src="${ctx}/assets/admin/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${ctx}/assets/admin/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- Custom and plugin javascript -->
<script src="${ctx}/assets/admin/js/hplus.js?v=2.2.0"></script>
<script src="${ctx}/assets/admin/js/plugins/pace/pace.min.js"></script>

<!-- SUMMERNOTE -->
<script src="${ctx}/assets/admin/js/plugins/summernote/summernote.min.js"></script>
<script src="${ctx}/assets/admin/js/plugins/summernote/summernote-zh-CN.js"></script>
<script type="text/javascript">
       function sendFile(file, editor, welEditable) {
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "${ctx}/webSchool/editImgUpload",
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                      editor.insertImage(welEditable, data.data);
                }
            });
        }


$(document).ready(function () {

    $('.dataTables-example').dataTable();




//删除当前的新闻时
$('#table-news').delegate(".delete-news","click",function(e){
    $('#deleteModal6').modal('show');
    var newsId=$(this).attr("data-id");
    $("#delete-id").val(newsId);
  
});
//确认删除新闻按钮事件
$(".delete-confirm-btn").click(function(){
    var data={"newsId":$("#delete-id").val()};
    $.get("${ctx}/webSchool/deletenews",data,function(data){
        if(data!=null&&data.returnCode=="ok"){
      	    var url =encodeURI("${ctx}/webSchool/findnews?moduleId=${param.moduleId}&menuName=${param.menuName}&token=${param.token}"); 
            window.location.href=url;
        }
    });
});
$("#add-news-btn").click(function(){
	var moduleId=$("#moduleId").val();
	var menuName=$("#menuName").val();
	var token=$("#token").val();
	var url = encodeURI("${ctx}/webSchool/addnews-view?moduleId="+moduleId+"&menuName="+menuName+"&token="+token); 	
	window.location.href=url;
	
});
$("#table-news").delegate(".edit-news","click",function(e){
	var newsId=$(this).attr("data-id");
	var moduleId=$("#moduleId").val();
	var menuName=$("#menuName").val();
	var token=$("#token").val();
	var url = encodeURI("${ctx}/webSchool/editfindnews?moduleId="+moduleId+"&menuName="+menuName+"&newsId="+newsId+"&token="+token); 	
	window.location.href=url;
	
});
//打开时窗口时
$('#myModal5').on('show.bs.modal', function (e) {
   var editId=$("#edit-id").val();
   if(editId==null||editId==""){
        $('.summernote').code("<p>请输入文字</p>");
    }else {
      var data={"newsId":editId}
       $.get("${ctx}/webSchool/editfindnews",data,function(data){
            if(data!=null&&data.returnCode=="ok"){
                $('.summernote').code(data.data.content);
             	$("#title").val(data.data.title);
            	$("#state").val(data.data.state);
            	$("#news-id").val(editId);
            
            }
        });
}
  

})

});
</script>
    </body>

    </html>
