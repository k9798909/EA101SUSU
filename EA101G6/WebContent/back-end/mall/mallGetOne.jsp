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
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mallcss.css">
</head>
<body>

	<div id="commaction">
		<button onclick="javascript:location.href='<%= request.getContextPath() %>/back-end/mall/mallGetAll.jsp'">�ӫ~����</button>
	</div>
	
	
		<div class="container ">
			<table id="comm" class="table table-bordered ">
				<thead>
					<tr class="">
						<th class="col-md-1"></th>
						<th class="col-md-1">�Ϥ�</th>
						<th class="col-md-2">�ӫ~�W��</th>
						<th class="col-md-1">���</th>
						<th class="col-md-1">�ƶq</th>
						<th class="col-md-2">�ӫ~�Ա�</th>
						<th class="col-md-1">�A�X�~��</th>
						<th class="col-md-1">��ĳ�H��</th>
						<th class="col-md-1">�C������</th>
						<th class="col-md-1">�W�[���A</th>

					</tr>
				</thead>
				<tbody>

					<jsp:useBean id="gmTypeSvc" class="com.gmType.model.GmTypeService" scope="request"/>
					<jsp:useBean id="mallSvc" class="com.mall.model.MallService" scope="request"/>					
					<c:forEach var="mallVo" items="${selNameMallVoSet}">
						<tr>
							<td class="col-md-1">
							<form action= "<%= request.getContextPath()%>/back-end/mall/mallGetOne.jsp" method="post">
							<input id="upda" type="submit"value="�ק�">
							<input type="hidden" name="commNo" value="${mallVo.commNo}">
							<!-- �s�X�ק虜�� -->
							<input type="hidden" name="showupdate" value="showupdate">
							<!-- ��update�T�{�Ogetone -->
							<input  type="hidden" name="isGetOne" value="isGetOne">
							</form></td>
							<td class="col-md-1"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></td>
							<td class="col-md-2"><div>${mallVo.commName}</div></td>
							<td class="col-md-1">${mallVo.price}</td>
							<td class="col-md-1">${mallVo.quantity}</td>
							<td class="col-md-2"><div>${mallVo.intro}</div></td>
							<td class="col-md-1">${mallVo.age}���H�W</td>
							<td class="col-md-1">${mallVo.player}�H</td>
							<td class="col-md-1"><div>
							
							<c:forEach var="typeVo" items="${mallSvc.getType(mallVo.commNo)}">
							${typeVo.typeName} 
							</c:forEach>
							</div></td>
							<td class="col-md-1">${(mallVo.status=="1")?"�W�[��":"�U�[��" }</td>

						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>



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

