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

<!-- 個人CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/mallCss/MallGetAllUpFornt.css">

</head>
<body>

<%@ include file="/front-end/front-end-nav.jsp" %>

	<main class="mall">
		<div class="seldiv">
			<form action="<%=request.getContextPath()%>/Mall/ForntMallServlet" method="post">
				<input placeholder="請輸入商品名稱" type="text" name="selName" class="selinput">
				<input type="hidden" name="action" value="selName">
				<input type="submit" value="搜尋商品">
			</form>
		</div>



		<%
			//分別是GmTypeService  MallService
			GmTypeService gmTypeSvc = new GmTypeService();
			pageContext.setAttribute("gmTypeSvc", gmTypeSvc);
			MallService mallSvc = new MallService();
			pageContext.setAttribute("mallSvc", mallSvc);
			List<MallVO> mallVoList = mallSvc.getAllUp();
			pageContext.setAttribute("mallVoList", mallVoList);
		%>

		
		<div class="container commMain">
			<div class="row">
				
				<%@ include file="/front-end/Mall/page1.file" %>	
				<c:forEach var="mallVo" items="${mallVoList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<div class="col-lg-3 col-6 comm">
						<a href="<%=request.getContextPath()%>/front-end/Mall/MallGetOne.jsp?commNo=${mallVo.commNo}">
							<div class="imgdiv"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></div>
							<p> ${mallVo.commName} </p>
							<div class="dt"><p><b>$${mallVo.price}</b></p></div>
						</a>
					</div>
				</c:forEach>
					
			</div>
		</div>
		<div style="text-align:center"><%@ include file="/front-end/Mall/page2.file" %></div>
		
		<a href="<%=request.getContextPath()%>/front-end/BuyCar/BuyCar.jsp"><button class="shopcar">
			<img src="<%=request.getContextPath()%>/front-end/images/supermarket.png">
		</button></a>

	</main>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</body>
</html>