<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gmType.model.*"%>
<%@ page import="com.gmTypeDt.model.*"%>
<%@ page import="com.mall.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="updateDiv" title="mallAdd">


		<form method="post" 
		action="<%=request.getContextPath()%>/Mall/MallServlet" 
		enctype="multipart/form-data">
			<fieldset>
			
				<div>--修改商品--</div>
		<%//有錯誤就自動展開 %>
			
			<c:if test="${not empty updateerroMsg}">
				<c:forEach var="msg" items="${updateerroMsg}">
					<p class="erroMsg" style="color: red;">${msg}</p>
					<%request.removeAttribute("updateerroMsg"); %>
				</c:forEach>
			</c:if>
				<!-- 之前再拿圖片的時候就存入session了 -->
				<%
					MallVO updateMallVo = (MallVO) session.getAttribute(request.getParameter("commNo"));
				pageContext.setAttribute("updateMallVo", updateMallVo);
				%>
				
				<input type="hidden" name="commNo" value="<%= request.getParameter("commNo") %>">
				<label for="name">商品名稱:</label> <input name="commName" type="text"
					class="text" value="${updateMallVo.commName}"> <label
					for="price">售價:</label> <input name="price" type="text"
					class="text" value="${updateMallVo.price}"> <label
					for="password">數量:</label> <input name="quantity" type="text"
					class="text" value="${updateMallVo.quantity}"> <label
					for="password">商品介紹:</label>
				<textarea name="intro" cols="32" rows="5" class="text"
					style="resize: none;">${updateMallVo.intro}</textarea>
				<label class="age">適合年齡: <input name="age" type="text"
					value="${updateMallVo.age}">歲以上
				</label> <label class="player">建議人數: <input name="player"
					type="text" value="${updateMallVo.player}">人 格式:1-6 or 1~6
				</label>
				

				<label class="d-block other">遊戲類型:</label>
				<!-- 拿出此vo所有遊戲類型 再用所有遊戲類型去比對如果是的話就選重，gmTypeSer在首頁已經創了-->
				
				
				<c:forEach var="gmTypeVo" items="${gmTypeSer.getAll()}">
					<c:set var="ischeck" value="false"/>
					<c:forEach var="mallVoType" items="${mallSer.getType(updateMallVo.commNo)}">
						<c:if test="${gmTypeVo.typeNo==mallVoType.typeNo}">			
							<c:set var="ischeck" value="true"/>	
						</c:if>
					</c:forEach>
				<div class="box"><input type="checkbox" name="typeNo" value="${gmTypeVo.typeNo}" ${ischeck?"checked":""} >${ gmTypeVo.typeName }</div>
				</c:forEach>
				<%pageContext.removeAttribute("ischeck"); %>
				
				<label class="other">上下架狀態: 下架 <input type="checkbox"
					class="check-switch check-switch-anim" name="status" value="1"
					${(updateMallVo.status=="1")?"checked":"" }> 上架

				</label> <label class="other">上傳商品圖片:<input type="file" name="img"
					class="upload" accept="image/*" value="${updateMallVo.img}"></label>(如無須變更圖片不用上傳)
				<div class="showimg">
					<img
						src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${updateMallVo.commNo}">
				</div>

				<input type="hidden" name="action" value="update"></input> <input
					type="submit" value="修改" class="btn">
				
				<button class="btn cancel" type="button">取消</button>
				
			</fieldset>
		</form>
	</div>


</body>
</html>