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
<title>Gameing on Board</title>

<!-- �ӤHCSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mallCss/mallGetAllUpFornt.css">

</head>
<body>

	<%@ include file="/front-end/front-end-nav.jsp"%>

	<main class="mall">

	<%
	GmTypeService gmTypeSvc = new GmTypeService();
	pageContext.setAttribute("gmTypeSvc", gmTypeSvc);
	
	%>

		<div class="seldiv">
			<form action="<%=request.getContextPath()%>/Mall/FrontMallServlet" method="post">
				<input placeholder="�п�J�ӫ~�W��" type="text" name="selName" class="selinput"> 
				<input type="hidden" name="action" value="selName"> 
				<input class="btn btn-secondary" type="submit" value="�j�M�ӫ~">
			</form>
			<form action="<%= request.getRequestURI()%>" method="post">
				<select name="typeNo">
					<option value="">������</option>
					<c:forEach var="typeVo" items="${gmTypeSvc.all}">
						<option value="${typeVo.typeNo}" ${param.typeNo==typeVo.typeNo?"selected":""}>${typeVo.typeName} </option>				
					</c:forEach>
				</select> 
				<input type="submit" class="btn btn-secondary" style="width:90px;height:35px;" value="�j�M����">
			</form>
		</div>



		<%
		MallService mallSvc = new MallService();
		pageContext.setAttribute("mallSvc", mallSvc);
		String typeNo=request.getParameter("typeNo");
		Set<MallVO> mallVoSet=null;
		if(typeNo==null||typeNo.trim().length()==0){
			mallVoSet = mallSvc.getAllUp();
		}else{
			mallVoSet = mallSvc.findByType(typeNo);
		}
		pageContext.setAttribute("mallVoSet", mallVoSet);
		%>


		<div class="container commMain">
			<div class="row">

				<%@ include file="/front-end/mall/page1.file"%>
				<c:forEach var="mallVo" items="${mallVoSet}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<div class="col-lg-3 col-6 comm">
							<a href="<%=request.getContextPath()%>/front-end/mall/mallGetOne.jsp?commNo=${mallVo.commNo}">
							<div class="imgdiv">
								<img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}">
							</div>
							<p>${mallVo.commName}</p>
							
							<div class="dt"><p><b>$${mallVo.price}</b></p></div>
						</a>
					</div>
				</c:forEach>

			</div>
		</div>
		<div style="text-align: center"><%@ include
				file="/front-end/mall/page2.file"%></div>

		<a href="<%=request.getContextPath()%>/front-end/buyCar/buyCar.jsp"><button
				class="shopcar">
				<img
					src="<%=request.getContextPath()%>/front-end/images/supermarket.png">
			</button></a>

	</main>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</body>
</html>