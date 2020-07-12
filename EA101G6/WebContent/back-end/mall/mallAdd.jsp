<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="com.gmType.model.*"%>
<%@ page import="com.gmTypeDt.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="commDiv" id="addDiv" title="mallAdd">

		<form method="post" action="<%= request.getContextPath()%>/Mall/BackMallServlet" enctype="multipart/form-data">
			<fieldset>		
				<div>--新增商品--</div>
				
				<!-- //有錯誤就自動展開  -->
				<c:if test="${not empty erroMsg}">
					<c:forEach var="msg" items="${erroMsg}">
						<p class="erroMsg" style="color:red;"> ${msg} </p>
					</c:forEach>
				</c:if>
				
				<label for="name">商品名稱:</label> 
					<input name="commName" type="text" class="text" value="${tempmallVo.commName}">
				<label for="price">售價:</label> 
					<input name="price" type="text" class="text" value="${tempmallVo.price}">
				<label for="password">數量:</label>  
					<input name="quantity" type="text" class="text" value="${tempmallVo.quantity}">
				<label for="password">商品介紹:</label>
					<textarea name="intro" cols="32" rows="5" class="text" style="resize: none;">${tempmallVo.intro}</textarea>
				<label class="age">適合年齡: 
					<input  name="age" type="text" value="${tempmallVo.age}">歲以上</label>
				<label class="player" >建議人數: 
					<input  name="player" type="text" value="${tempmallVo.player}">人 格式:1-6 or 1~6</label>
				
				<!-- gmTypeSvc在首頁已經創了 ，tampTypeNolist是在新增時有錯誤會回傳之前勾選的type -->
				<!-- 在用foreach如果tampTypeNolist的type=typeNo就checked -->
				 <label class="d-block other">遊戲類型:</label>
					<c:forEach var="gmTypeVo" items="${gmTypeSvc.getAll()}">
						<div class="box">
							<input  type="checkbox" name="typeNo" value="${gmTypeVo.typeNo}" 
								<c:forEach var="typeNo" items="${tampTypeNolist}">
								${typeNo==gmTypeVo.typeNo?"checked":"" }
								</c:forEach> >${ gmTypeVo.typeName }
						</div>
					</c:forEach>
				
				
				<label class="other">上下架狀態: 下架
				<input type="checkbox"class="check-switch check-switch-anim" name="status" value="1" >
						上架
				</label>
			
				 <label class="other">上傳商品圖片:<input type="file" name="img" accept="image/*"
					class="upload"></label>
				<div class="showimg"></div>
				<input type="hidden" name="action" value="mallAdd">
				<!-- 確定頁面 -->
				<input  type="hidden" name="whichPage" value="${param.whichPage}">
				<input type="submit" value="新增" class="btn">
				<button class="btn cancel" type="button">取消</button>

			</fieldset>
		</form>
	</div>


</body>
</html>