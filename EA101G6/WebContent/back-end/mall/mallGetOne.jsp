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
		<button onclick="javascript:location.href='<%= request.getContextPath() %>/back-end/mall/mallGetAll.jsp'">�ӫ~����</button>
	</div>
	
	
			<table id="comm" class="table table-bordered ">
				<thead>
					<tr class="">
						<th></th>
						<th>�Ϥ�</th>
						<th>�ӫ~�W��</th>
						<th>���</th>
						<th>�ƶq</th>
						<th>�ӫ~�Ա�</th>
						<th>�A�X�~��</th>
						<th>��ĳ�H��</th>
						<th>�C������</th>
						<th>�W�[���A</th>

					</tr>
				</thead>
				<tbody>

					<jsp:useBean id="gmTypeSvc" class="com.gmType.model.GmTypeService" scope="request"/>
					<jsp:useBean id="mallSvc" class="com.mall.model.MallService" scope="request"/>					
					<c:forEach var="mallVo" items="${selNameMallVoSet}">
						<tr>
							<td>
							<form action= "<%= request.getContextPath()%>/back-end/mall/mallGetOne.jsp" method="post">
							<input id="upda" type="submit"value="�ק�">
							<input type="hidden" name="commNo" value="${mallVo.commNo}">
							<!-- �s�X�ק虜�� -->
							<input type="hidden" name="showupdate" value="showupdate">
							<!-- ��update�T�{�Ogetone -->
							<input  type="hidden" name="isGetOne" value="isGetOne">
							</form></td>
							<td><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></td>
							<td><div>${mallVo.commName}</div></td>
							<td>${mallVo.price}</td>
							<td>${mallVo.quantity}</td>
							<td><div>${mallVo.intro}</div></td>
							<td>${mallVo.age}���H�W</td>
							<td>${mallVo.player}�H</td>
							<td><div>
							
							<c:forEach var="typeVo" items="${mallSvc.getType(mallVo.commNo)}">
							${typeVo.typeName} 
							</c:forEach>
							</div></td>
							<td class="col-md-1">${(mallVo.status=="1")?"�W�[��":"�U�[��" }</td>

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

<!-- �����\�T���N�Ұ� -->
<c:if test="${not empty successMsg}">
	<script>swal({text:"${successMsg}" });</script>
</c:if>

<!-- �I���ק�ɷ|�ҰʶǦ^���~�T���ɤ]�|�Ұ� -->
<c:if test="${'showupdate'==showupdate}">
	<%= "<script>$(document).ready(function() {showupdate();});</script>"%>
	<% pageContext.removeAttribute("action"); %>
</c:if>
<!-- �d�߮ɦ����~�Ұ� -->
<c:if test="${not empty selErroMsg}">
	<script>swal({text:"${selErroMsg}" });</script>
</c:if>							


</body>
</html>

