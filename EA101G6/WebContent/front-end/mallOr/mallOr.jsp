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
		<div class="checkdiv">
			<p id="total">總金額:${totalPrice}</p>
		</div>	
	</div>
	
	
	<form action="<%= request.getContextPath()%>/MallOr/MallOrServlet" method="post">
	<div class="container  order">
		<div class="row justify-content-center">
			<div class="col-12 col-md-6 information border">
				<div>會員姓名:<input type="text" value="吳樹育" readonly></div>
				<div>取貨方式: <input name="take" type="radio" value="超商取貨" ${"超商取貨"==take?"checked":""}>超商取貨    <input name="take" type="radio" value="住家取貨" ${"住家取貨"==take?"checked":""}>住家取貨</div>	
				<div>取貨地點:</div>
				<select name="city" id="縣市1"></select>
				<select name="area" id="鄉鎮市區1"></select>
				<input type="text" name="addr" class="addr" value="${not empty addr?addr:""}" placeholder="請輸入地址">
				<div><p id="total">總金額:${totalPrice}元</p></div>
				<input  type="hidden" name="price" value="${totalPrice}">
			</div>
		</div>
	</div>
	
	<input type="hidden" name="action" value="checkOut">
	<div class="paydiv"><input type="submit" class="paybtn" value="確定付款"><button type="button">取消</button></div>
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
		       //當頁面載完之後，用AddressSeleclList.Initialize()，
		       //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
		       AddressSeleclList.Initialize('縣市1', '鄉鎮市區1');
		       //後面四個參數分別是兩個下拉選單的預設文字跟值
		      AddressSeleclList.Initialize('縣市2', '鄉鎮市區2', 'Please Select City', '0', 'Please Select Area', '0');
		  }

		
		
	</script>

</body>
</html>