<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="./css/pagination.css" />
	<style type="text/css">
		body{font-size:84%; color:#333333; line-height:1.4;}
		a{color:#34538b;}
	</style>
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script src="http://www.lanrenzhijia.com/ajaxjs/jquery.min.js"></script>
	<script type="text/javascript" src="./js/jquery.page.js"></script>
</head>
  
 <body>
 <table border="1" align="center" bordercolor="yellow" width="50%">   
        <tr>
            <th>序号</th>
            <th>姓名</th>
            <th>年龄</th>
        </tr>
</table>
<div  class="tcdPageCode"><!-- 这里显示分页 --></div>
<script type="text/javascript">
 var totalrows=10;
 var currentpage=1;
 var pagesize =1; 
 var pagecount=10;
 window.onload=function(){
 getajax();
$(".tcdPageCode").createPage({
		pageSize:pagesize,
        pageCount:pagecount,
        current:currentpage,
		backFn:function(p,q){
		pagesize=q;
		currentpage=p;		 
		getajax();
		var argdata={pageCount:pagecount,current:p,pageSize:pagesize};
		funa($(".tcdPageCode"),argdata);
        }
    }); 
 };
   
function getajax(){
	$.ajax({
		type:"GET",
    	url:"userJson",
    	data:{page:currentpage,PageSize:pagesize,date:new Date()},
    	error:function(){alert("失败");},
    	async:false,
    	success:function(data){
    	totalrows=data.userList.allRows;
    	pagecount=Math.ceil(totalrows/pagesize);
    	$("table tr:not(:first)").remove();
    	for(var i=0;i<data.userList.list.length;i++){
    	var htmldata="<tr><td>"+data.userList.list[i].id+"</td><td>"+data.userList.list[i].name+"</td><td>"+data.userList.list[i].password+"</td></tr>";
    		$("table").append(htmldata);
    	}
    	}	
	});
};
</script>
</body>
</html>
