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
<link rel="stylesheet" href="<%= request.getContextPath() %>/back-end/css/mallcss.css">
</head>
<body>

	<div id="commaction">
		<button id="create-user">新增商品</button>
		<div style="display:inline">收尋商品:<form method="post" action="<%= request.getContextPath()%>/Mall/BackMallServlet" style="display:inline"><input type="text" name="selName">
		<input  type="hidden" name="action" value="selectone">
		<input type="submit" value="搜尋">
		</form>
		
		</div>
	</div>
	
	
		<div class="container ">
			<table id="comm" class="table table-bordered ">
				<thead>
					<tr class="">
						<th class="col-md-1"></th>
						<th class="col-md-1">圖片</th>
						<th class="col-md-2">商品名稱</th>
						<th class="col-md-1">售價</th>
						<th class="col-md-1">數量</th>
						<th class="col-md-2">商品詳情</th>
						<th class="col-md-1">適合年齡</th>
						<th class="col-md-1">建議人數</th>
						<th class="col-md-1">遊戲類型</th>
						<th class="col-md-1">上架狀態</th>

					</tr>
				</thead>
				<tbody>
				<jsp:useBean id="gmTypeSvc" class="com.gmType.model.GmTypeService" scope="request"/>
				<jsp:useBean id="mallSvc" class="com.mall.model.MallService" scope="request"/>
					<%	
						//存在request讓incule 的網頁也可以拿到 
						//分別是GmTypeService  MallService
						//GmTypeService gmTypeSvc =new GmTypeService();
						//request.setAttribute("gmTypeSvc", gmTypeSvc);
						//MallService mallSvc = new MallService();
						//request.setAttribute("mallSvc", mallSvc);
						//存session是讓效能好一點不用每次查詢
						if(session.getAttribute("mallVoList")==null){
							List<MallVO> mallVoList = mallSvc.getAll();
							session.setAttribute("mallVoList", mallVoList);
						}
					%>
						
					<c:forEach var="mallVo" items="${mallVoList}">
						<tr>
							<td class="">
								<form action= "<%= request.getContextPath()%>/back-end/Mall/MallGetAll.jsp" method="post">
									<input id="upda" type="submit"value="修改">
									<input type="hidden" name="commNo" value="${mallVo.commNo}">
									<!-- 叫出修改介面 -->
									<input type="hidden" name="showupdate" value="showupdate">
								</form>
							</td>
							<td class="col-md-1"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></td>
							<td class="col-md-2"><div>${mallVo.commName}</div></td>
							<td class="col-md-1">${mallVo.price}</td>
							<td class="col-md-1">${mallVo.quantity}</td>
							<td class="col-md-2"><div>${mallVo.intro}</div></td>
							<td class="col-md-1">${mallVo.age}歲以上</td>
							<td class="col-md-1">${mallVo.player}人</td>
							<td class="col-md-1">
								<div>
									<c:forEach var="typeVo" items="${mallSvc.getType(mallVo.commNo)}">
										${typeVo.typeName} 
									</c:forEach>
								</div>
							</td>
							
							<td class="col-md-1">${(mallVo.status=="1")?"上架中":"下架中" }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>


<%@ include file="/back-end/Mall/MallAdd.jsp" %>
<%@ include file="/back-end/Mall/MallUpdate.jsp" %>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/back-end/js/malljs.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 當點擊修改時會傳的參數 有此參數會呼叫修改頁面 -->
<% pageContext.setAttribute("showupdate",request.getParameter("showupdate")); %>

<!-- 有成功訊息就啟動 -->
<c:if test="${not empty successMsg}">
	<script>swal({text:"${successMsg}" });</script>
	<%session.removeAttribute("successMsg");%>
</c:if>

<!-- 點擊修改時會啟動傳回錯誤訊息時也會啟動 -->
<c:if test="${'showupdate'==showupdate}">
	<%= "<script>$(document).ready(function() {showupdate();});</script>"%>
	<% pageContext.removeAttribute("action"); %>
</c:if>
<!-- 新增有錯誤訊息時啟動叫出新增介面 -->
<c:if test="${not empty erroMsg}">
	<%= "<script>$(document).ready(function() {$('#create-user').click()})</script>"%>
	<%request.removeAttribute("erroMsg"); %>
</c:if>

<!-- 查詢時有錯誤啟動 -->
<c:if test="${not empty selErroMsg}">
	<script>swal({text:"${selErroMsg}" });</script>
	<%session.removeAttribute("selErroMsg"); %>
</c:if>							


</body>
</html>

