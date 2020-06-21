<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/bootstrap.min.css">

<style>
.margin-center {
  margin:0px auto;
}
div.dtMain{
 margin:20px auto;
}

div.dtMain table.table th{
 font-size:100px;
}

</style>



</head>
<body>



	<div class="container">
		<div class="row">
			<table class="table col-6 text-center margin-center">
				<thead>
					<tr>
						<th colspan="2">訂單編號:123123132</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>訂購人:</td>
						<td>哈哈哈</td>
					</tr>
					<tr>
						<td>訂購日期:</td>
						<td>2008-10-03 23:20:20</td>
					</tr>
					<tr>
						<td>訂單金額:</td>
						<td>2000</td>
					</tr>
					<tr>
						<td>處理狀態:</td>
						<td>未出貨</td>
					</tr>
					<tr>
						<td>付款狀態</td>
						<td>已付款</td>
					</tr>
				</tbody>

			</table>
			</div>
		</div>
		
	<div class="container dtMain">
		<div class="row">
			<table class="table text-center margin-center ">
				<thead>
				<tr> <th>商品名稱</th><th>數量</th><th>價錢</th><th>小計</th></tr>
				</thead>

				<tbody>

				</tbody>

			</table>
			</div>
		</div>
		



		<script
			src="<%=request.getContextPath()%>/front-end/js/model/jquery-3.3.1.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/front-end/js/model/popper.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/front-end/js/model/bootstrap.min.js"></script>
</body>
</html>