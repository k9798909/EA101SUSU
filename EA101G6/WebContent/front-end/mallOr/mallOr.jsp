<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.mall.model.*"%>
<%@ page import="com.mallOr.model.*"%>
<%@ page import="com.mallOrDt.model.*"%>
<%@ page import="com.mbrpf.model.*"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���b�q��</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">
	
	

<style>
		
input.mbrName{
	height:24px;
	margin-right:10px;
	width:100px;
}

 div.paydiv{ 
 	text-align:center; 
 } 

 #msform input.paybtn{ 
 	display:inline-block;
	width:20%;
	height:40px;
	vertical-align:middle;
	padding:0px;
	margin-right:30px;
	background-color:#007bff;
	color:#ffffff;
	border:none;
	border-radius: 4px;
 }
 
  #msform input.paybtn:hover{ 
opacity:0.8;
 } 
  
#msform input.cancel{ 
 	display:inline-block;
 	width:20%;
 	height:40px;
 	vertical-align:middle;
 	padding:0px;
 	margin-left:30px;
 	background-color:#007bff;
	color:#ffffff;
	border:none;
	border-radius: 4px;
 	}
 	#msform input.cancel:hover{ 
opacity:0.8;
 	}  

#msform div{
	margin:10px 0px;
}

#msform input.addr{
	width:400px;
	height:25px;
}

		.table img{
			width: 40px;
			height:40px;
			border: solid 1px;
			display: inline-block;
			margin:0px 10px; 
		}
		
	div.orTitle{
		text-align:center;
		margin:10px 0px;
		font-size:18px;
	}
	
	div.checkdiv{
		text-align:right;
	}
	
		div.checkdiv p{
			display: inline-block;
			margin:0px 30px;
			font-size: 26px;
		}
		

/*form styles*/
#msform {
	width: 630px;
	margin: 20px auto;
	position: relative;
}
#msform fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	
	/*stacking fieldsets above each other*/
	position: relative;
}


</style>


</head>
<body>

<%@ include file="/front-end/front-end-nav.jsp" %>

<main>
	
	
	<div class="container">
	<div class="orTitle"><h4>�q�����</h4></div>
		<table class="table table-striped table-bordered">
			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">�ӫ~�W��</th>
					<th scope="col">�ƶq</th>
					<th scope="col">����</th>
					<th scope="col">�p�p</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="buyCarMall" items="${buyCarList}" varStatus="count" >
				<tr>
					<th scope="row">${count.count}</th>
					<td class="name"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${buyCarMall.commNo}">${buyCarMall.commName}</td>
					<td>${buyCarMall.quantity}</td>
					<td>${buyCarMall.price}</td>
					<td>${buyCarMall.quantity*buyCarMall.price}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="checkdiv">
			<p id="total">�`���B:${totalPrice}��</p>
		</div>	
	</div>
	
	
		<%	
			String mbract = (String)session.getAttribute("account");
			MbrpfService mbrpfSvc = new MbrpfService();
			MbrpfVO mbrpfVo=mbrpfSvc.checkLogin(mbract);
			pageContext.setAttribute("mbrpfVo",mbrpfVo);
		%>
		
		
<form id="msform" action="<%= request.getContextPath()%>/MallOr/MallOrServlet" method="post">
  <fieldset>
    <h4 class="fs-title">�q���T</h4>
    	<div>
			<label>�|���m�W�G<input class="mbrName" type="text" value="${mbrpfVo.mbrname}" readonly>
			���f�覡�G <input name="take" type="radio" value="�W�Ө��f" ${"�W�Ө��f"==take?"checked":""}>�W�Ө��f      <input style="margin-left:3px;" name="take" type="radio" value="��a���f" ${"��a���f"==take?"checked":""}>��a���f</label>	
			<label>���f�a�I�G
			<select name="city" id="����2"></select>
			<select name="area" id="�m����2"></select>
			</label>
						<input type="text" name="addr" class="addr" value="${not empty addr?addr:''}" placeholder="�п�J�a�}">
			<div><p id="total">�`���B�G${totalPrice}��</p></div>
		</div>
				<input  type="hidden" name="price" value="${totalPrice}">
				<input type="hidden" name="action" value="checkOut">
    <div class="paydiv"><input type="submit" class="paybtn" value="�T�w�I��"><a href="<%= request.getContextPath()%>/front-end/mall/mallGetAllUp.jsp"><input type="button" class="cancel" value="����"></a></div>
  </fieldset>
</form>
		
	
</main>	
	<script
		src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/address.js"></script>	
	
	
	
	<script>
		
		<c:if test="${not empty erroList}">	
		 	var erromsg="";
			<c:forEach var="erromsg" items="${erroList}">
					erromsg+="${erromsg}\n"
			</c:forEach>
			swal({text:erromsg });
		</c:if>
		
		
		   window.onload = function () {
		       //������������A��AddressSeleclList.Initialize()�A
		       //�ǤJ�n�j�w�������U�Կ��ID�ζm���ϤU�Կ��ID
		       //AddressSeleclList.Initialize('����1', '�m����1');
		       //�᭱�|�ӰѼƤ��O�O��ӤU�Կ�檺�w�]��r���
		      AddressSeleclList.Initialize('����2', '�m����2', '�п�ܿ���', '0', '�п�ܦa��', '0');
		      <c:if test="${not empty erroList}">
		      	AddressSeleclList.erroAdd("${city}","${area}")
		      </c:if> 
		  }

		  
		
	</script>

</body>
</html>