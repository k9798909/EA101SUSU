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
<meta charset="BIG5">
<title>Insert title here</title>

<style>


div.gmtypezone{
	width:300px;
	background-color:aliceblue;
	text-algin:center;
	border:solid;
	border-radius:5px;
	position:absolute;	
	left:50%;
	margin-left:-150px;
	z-index:998;
	top:50px;
	display:none;
}

div.gmtypezone div{
text-align:center;
margin:10px 0px;
height:40px;
}

div.gmtypezone button{
margin-left:10px;
}

div.gmtypezone p{
 display:inline-block;
 mragin:0px;
}



div#delalert{
	height:100px;
	width:200px;
	background-color:#ffffff;
	text-algin:center;
	border:solid;
	border-radius:5px;
	position:absolute;	
	left:50%;
	margin-left:-100px;
	z-index:999;
	top:150px;
	display:none;
	padding:10px 0px;

}
div#delalert div{
	text-align:center;
	margin:10px 0px;
}

</style>

</head>
<body>


	
		<div class="gmtypezone" title="�C������">
		<c:forEach var="gmType" items="${gmTypeSvc.getAll()}">
  			<div class="${gmType.typeNo}"><p>${gmType.typeName}</p><button class="deltypebtn" value="${gmType.typeNo}">�R��</button></div>
  		</c:forEach>
  		
  		
  		
  			<div id="tampAddDiv">�п�J�n�s�W���C������:<input id="typeNameInput" name="typeName" type="text"></div>
  			<div><button class="confirm" type="submit" class="addtypebtn" >�s�W�C������</button> <button type="button" class="typecancel">����</button></div>
  			
  			
  		
		</div>
	

	<div id="delalert">
	<div>�T�w�n�R��������?</div>
	<div><button class="confirm">�T�w</button><button class="cnacel" style="margin-left:20px;">����</button></div>
	</div>


</body>
</html>