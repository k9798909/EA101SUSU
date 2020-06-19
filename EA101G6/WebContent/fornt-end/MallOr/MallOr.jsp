<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fornt-end/css/model/bootstrap.min.css">

<style>

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
	
		div.checkdiv p{
			display: inline-block;
			margin:0px 30px;
			font-size: 36px;
		}	

</style>


</head>
<body>
	<div class="container">
	<div class="orTitle">訂單明細</div>
		<table class="table table-striped table-bordered">
			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">商品名稱</th>
					<th scope="col">數量</th>
					<th scope="col">價錢</th>
					<th scope="col">小計</th>
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
	</div>
	
	<div class="checkdiv">
		<p id="total">總金額:${totalPrice}</p>
	</div>		
	
	<div class="container order">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6 information">
				<div class="">會員姓名:吳樹育</div>
				<div class="">取貨方式: <input name="take" type="radio">便利商店    <input name="take" type="radio">住家</div>	
				<div class="">取貨地點:</div>
				<input type="text" class="addr">
			</div>
		</div>
	</div>
	
	<div class="paydiv"><input type="submit" class="paybtn" value="確定付款"><button>取消</button></div>
	
	<script
		src="<%=request.getContextPath()%>/fornt-end/js/model/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/fornt-end/js/model/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/fornt-end/js/model/bootstrap.min.js"></script>


</body>
</html>