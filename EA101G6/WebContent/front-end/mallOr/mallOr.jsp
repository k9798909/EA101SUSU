<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.mall.model.*"%>
<%@ page import="com.mallOr.model.*"%>
<%@ page import="com.mallOrDt.model.*"%>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">
	
	

<style>
		
		main{
		margin:20px 0px;
		}
		
		.table tbody tr{
			height:50px;
		}
		
		.table tbody tr td{
			height:40px;
			padding:0px;
			font-size:16px; 
			text-align: center;
			vertical-align: middle;
		}
		
				
		.table tbody tr th{
			height:40px;
			padding:0px;
		}
		.table tbody tr td.name{
			text-align:left;
		}
		.table tr th{
			text-align: center;
			vertical-align: middle;
			font-size: 18px;
		}

div.paydiv{
	text-align:center;
}

input.paybtn{
	position:relative;
	left:-10%;

}

div.order div{
	margin:10px 0px;
}

div.order input.addr{
	width:300px;
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

</style>


</head>
<body>

<%@ include file="/front-end/front-end-nav.jsp" %>

<main>
	<div class="container">
	<div class="orTitle">�q�����</div>
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
				<c:set var="totalPrice" value="${totalPrice+buyCarMall.quantity*buyCarMall.price}"/>
			</c:forEach>
			</tbody>
		</table>
		<div class="checkdiv">
			<p id="total">�`���B:${totalPrice}</p>
		</div>	
	</div>
	
	
	<form action="<%= request.getContextPath()%>/MallOr/MallOrServlet" method="post">
	<div class="container  order">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6 information border">
				<div>�|���m�W:<input type="text" value="�d��|" readonly></div>
				<div>���f�覡: <input name="take" type="radio" value="�W�Ө��f" ${"�W�Ө��f"==take?"checked":""}>�W�Ө��f    <input name="take" type="radio" value="��a���f" ${"��a���f"==take?"checked":""}>��a���f</div>	
				<div>���f�a�I:</div>
				<select name="city" id="����1"></select>
				<select name="area" id="�m����1"></select>
				<input type="text" name="addr" class="addr" value="${not empty addr?addr:""}" placeholder="�п�J�a�}">
				<div><p id="total">�`���B:${totalPrice}��</p></div>
				<input  type="hidden" name="price" value="${totalPrice}">
			</div>
		</div>
	</div>
	
	<input type="hidden" name="action" value="checkOut">
	<div class="paydiv"><input type="submit" class="paybtn" value="�T�w�I��"><button type="button">����</button></div>
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
		       AddressSeleclList.Initialize('����1', '�m����1');
		       //�᭱�|�ӰѼƤ��O�O��ӤU�Կ�檺�w�]��r���
		      AddressSeleclList.Initialize('����2', '�m����2', 'Please Select City', '0', 'Please Select Area', '0');
		  }

		
		
	</script>

</body>
</html>