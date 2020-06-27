<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

<link rel="stylesheet" href="<%= request.getContextPath()%>/css/jquery-ui.css">
</head>
<body>

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">未出貨</a></li>
    <li><a href="#tabs-2">所有交易紀錄</a></li>
  </ul>
  
  <jsp:useBean id="mallOrSvc" class="com.mallOr.model.MallOrService"/>
  
  <div id="tabs-1">
<%@ include file="/back-end/mallOr/mallOrGetByBox.jsp"%>
  </div>
  <div id="tabs-2">
	<%@ include file="/back-end/mallOr/mallOrGetAll.jsp"%>
  </div>
</div>
 



<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  

  
  </script>


</body>
</html>