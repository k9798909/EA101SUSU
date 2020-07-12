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
				<div>--�s�W�ӫ~--</div>
				
				<!-- //�����~�N�۰ʮi�}  -->
				<c:if test="${not empty erroMsg}">
					<c:forEach var="msg" items="${erroMsg}">
						<p class="erroMsg" style="color:red;"> ${msg} </p>
					</c:forEach>
				</c:if>
				
				<label for="name">�ӫ~�W��:</label> 
					<input name="commName" type="text" class="text" value="${tempmallVo.commName}">
				<label for="price">���:</label> 
					<input name="price" type="text" class="text" value="${tempmallVo.price}">
				<label for="password">�ƶq:</label>  
					<input name="quantity" type="text" class="text" value="${tempmallVo.quantity}">
				<label for="password">�ӫ~����:</label>
					<textarea name="intro" cols="32" rows="5" class="text" style="resize: none;">${tempmallVo.intro}</textarea>
				<label class="age">�A�X�~��: 
					<input  name="age" type="text" value="${tempmallVo.age}">���H�W</label>
				<label class="player" >��ĳ�H��: 
					<input  name="player" type="text" value="${tempmallVo.player}">�H �榡:1-6 or 1~6</label>
				
				<!-- gmTypeSvc�b�����w�g�ФF �AtampTypeNolist�O�b�s�W�ɦ����~�|�^�Ǥ��e�Ŀ諸type -->
				<!-- �b��foreach�p�GtampTypeNolist��type=typeNo�Nchecked -->
				 <label class="d-block other">�C������:</label>
					<c:forEach var="gmTypeVo" items="${gmTypeSvc.getAll()}">
						<div class="box">
							<input  type="checkbox" name="typeNo" value="${gmTypeVo.typeNo}" 
								<c:forEach var="typeNo" items="${tampTypeNolist}">
								${typeNo==gmTypeVo.typeNo?"checked":"" }
								</c:forEach> >${ gmTypeVo.typeName }
						</div>
					</c:forEach>
				
				
				<label class="other">�W�U�[���A: �U�[
				<input type="checkbox"class="check-switch check-switch-anim" name="status" value="1" >
						�W�[
				</label>
			
				 <label class="other">�W�ǰӫ~�Ϥ�:<input type="file" name="img" accept="image/*"
					class="upload"></label>
				<div class="showimg"></div>
				<input type="hidden" name="action" value="mallAdd">
				<!-- �T�w���� -->
				<input  type="hidden" name="whichPage" value="${param.whichPage}">
				<input type="submit" value="�s�W" class="btn">
				<button class="btn cancel" type="button">����</button>

			</fieldset>
		</form>
	</div>


</body>
</html>