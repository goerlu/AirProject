<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<<<<<<< HEAD
	
	<link rel="stylesheet" href="./css/pagination.css" />
	<style type="text/css">
		body{font-size:84%; color:#333333; line-height:1.4;}
		a{color:#34538b;}
		#Searchresult{width:300px; padding:20px; background:#f0f3f9;}
	</style>
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/jquery.pagination.js"></script>
	<script type="text/javascript">
$(function(){
	//总数目
	var length = 100;
	//从表单获取分页元素参数
	$("#Pagination").pagination(length, {
			num_edge_entries: 1, //边缘页数
			num_display_entries: 4, //主体页数
			callback: pageselectCallback,
			items_per_page: 1, //每页显示1项
			prev_text: "前一页",
			next_text: "后一页"
		});
		
});
function pageselectCallback(page_index, jq){
		console.log(page_index+1);
	}
function clickevent(){
$("#Pagination").pagination(200, {
			num_edge_entries: 1, //边缘页数
			num_display_entries: 4, //主体页数
			callback: pageselectCallback,
			items_per_page: 1, //每页显示1项
			prev_text: "前一页",
			next_text: "后一页"
		});
};
</script>
	</head>
  
  <body>
   <h1>jQuery Pagination分页插件ajax demo</h1>
<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
<h3>列表内容显示</h3>
<div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
<div id="hiddenresult" style="display:none;">
	<!-- 列表元素 -->
    <script type="text/javascript">
		var html = "";
		for(var i=1; i<101; i+=1){
			html += '<dl class="show"><dt><strong>这是标题'+i+'</strong></dt><dd>这是标题'+i+'下的内容1</dd><dd>这是标题'+i+'下的内容2</dd></dl>';	
		}
		document.getElementById("hiddenresult").innerHTML = html;
	</script>
</div>
<input type="button" value="点击" onclick="clickevent()"/>
=======
  </head>
  
  <body>
    This is my JSP page. <br>
    <%-- <jsp:include page="Include.jsp"></jsp:include> --%>
    <%@include file="Include.jsp" %>
>>>>>>> branch 'master' of https://github.com/goerlu/AirProject.git
  </body>
</html>
