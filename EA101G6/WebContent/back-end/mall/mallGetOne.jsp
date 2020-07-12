<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.mall.model.*"%>
<%@ page import="com.gmTypeDt.model.*"%>
<%@ page import="com.gmType.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mallCss/mallcss.css">
</head>
<body>
	
	<div id="commaction">
		<button onclick="javascript:location.href='<%= request.getContextPath() %>/back-end/mall/mallGetAll.jsp'">商品頁面</button>
	</div>
	
	
			<table id="comm" class="table table-bordered ">
				<thead>
					<tr class="">
						<th></th>
						<th>圖片</th>
						<th>商品名稱</th>
						<th>售價</th>
						<th>數量</th>
						<th>商品詳情</th>
						<th>適合年齡</th>
						<th>建議人數</th>
						<th>遊戲類型</th>
						<th>上架狀態</th>

					</tr>
				</thead>
				<tbody>

					<jsp:useBean id="gmTypeSvc" class="com.gmType.model.GmTypeService" scope="request"/>
					<jsp:useBean id="mallSvc" class="com.mall.model.MallService" scope="request"/>					
					<c:forEach var="mallVo" items="${selNameMallVoSet}">
						<tr>
							<td>
							<form action= "<%= request.getContextPath()%>/back-end/mall/mallGetOne.jsp" method="post">
							<input id="upda" type="submit"value="修改">
							<input type="hidden" name="commNo" value="${mallVo.commNo}">
							<!-- 叫出修改介面 -->
							<input type="hidden" name="showupdate" value="showupdate">
							<!-- 讓update確認是getone -->
							<input  type="hidden" name="isGetOne" value="isGetOne">
							</form></td>
							<td><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></td>
							<td><div>${mallVo.commName}</div></td>
							<td>${mallVo.price}</td>
							<td>${mallVo.quantity}</td>
							<td><div>${mallVo.intro}</div></td>
							<td>${mallVo.age}歲以上</td>
							<td>${mallVo.player}人</td>
							<td><div>
							
							<c:forEach var="typeVo" items="${mallSvc.getType(mallVo.commNo)}">
							${typeVo.typeName} 
							</c:forEach>
							</div></td>
							<td class="col-md-1">${(mallVo.status=="1")?"上架中":"下架中" }</td>

						</tr>
					</c:forEach>

				</tbody>
			</table>




<%@ include file="/back-end/mall/mallUpdate.jsp" %>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/js/malljs.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<% pageContext.setAttribute("showupdate",request.getParameter("showupdate")); %>

<!-- 有成功訊息就啟動 -->
<c:if test="${not empty successMsg}">
	<script>swal({text:"${successMsg}" });</script>
</c:if>

<!-- 點擊修改時會啟動傳回錯誤訊息時也會啟動 -->
<c:if test="${'showupdate'==showupdate}">
	<%= "<script>$(document).ready(function() {showupdate();});</script>"%>
	<% pageContext.removeAttribute("action"); %>
</c:if>
<!-- 查詢時有錯誤啟動 -->
<c:if test="${not empty selErroMsg}">
	<script>swal({text:"${selErroMsg}" });</script>
</c:if>							


</body>
</html>

