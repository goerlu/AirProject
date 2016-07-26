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
    
    <title>My JSP 'spjk.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="./css/pagination.css" />
	<style type="text/css">
		body{font-size:84%; color:#333333; line-height:1.4;}
		a{color:#34538b;}
		div{border:1px solid black;float:left;}
	</style>
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script src="http://www.lanrenzhijia.com/ajaxjs/jquery.min.js"></script>
	<script type="text/javascript" src="./js/jquery.page.js"></script>
</head>
 <body>
<div class="divvedio" style="width:50%;height:600px;border:1px solid red">

</div>
<div  class="tcdPageCode" style="width:100%"><!-- 这里显示分页 --></div>
<script type="text/javascript">
 var totalrows=10;
 var currentpage=1;
 var pagesize =1; 
 var pagecount=10;
getajax();
fenpin(1);
$(".tcdPageCode").createPage({
		pageSize:pagesize,
        pageCount:pagecount,
        current:currentpage,
		backFn:function(p,q){
		pagesize=q;
		currentpage=p;		 
		getajax();
		fenpin(q);
		var ppp={pageCount:pagecount,current:p,pageSize:pagesize};
		funa($(".tcdPageCode"),ppp);
        }
    });    
function getajax(){
	$.ajax({
		type:"GET",
    	url:"userJson",
    	data:{page:currentpage,PageSize:pagesize},
    	error:function(){alert("失败");},
    	async:false,
    	success:function(data){
    	totalrows=data.userList.allRows;
    	pagecount=Math.ceil(totalrows/pagesize);
    	$("div.divvedio").children().remove();
    	for(var i=0;i<data.userList.list.length;i++){
    	var htmldata="<div></div>";
    		$("div.divvedio").append(htmldata);
    	}
    	}	
	});
};
function fenpin(num){
	var divs=$("div.divvedio").children();
	var wlen='100%';
	var hlen='100%';
	switch(num){
		case 1: wlen='98%'; hlen='98%';
	break;
		case 4: wlen='48%'; hlen='48%';
	break;
		case 9: wlen='32%'; hlen='32%';
	break;
	};
	for(var i=0;i<divs.length;i++){
	divs[i].style.width=wlen;
	divs[i].style.height=hlen;
	}; 
}
</script>
</body>
</html>
