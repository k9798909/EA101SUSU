<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/bootstrap.min.css">

<style>
	div.orMain table.table{
	 table-layout:fixed;
	 word-break:break-all;
	 text-align:center;
	}
	
	div.orMain table.table td{
		padding:0px;
		height:30px;
	}

</style>


</head>
<body>

<main>

	<div class="container orMain">
		<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
				<thead class="table-primary">
				<tr>
				<th >訂單編號</th>
				<th >會員編號</th>
				<th >付款狀態</th>
				<th >出貨狀態</th>
				<th >訂單狀態</th>
				<th >詳細資訊</th>
				</tr>	
				
				<tbody>
				<tr>
				<td>20200603-0000001</td>
				<td>mb10002</td>
				<td>已付款</td>
				<td>未出貨</td>
				<td>未完成</td>
				<td>觀看</td>
				</tr>
				</tbody>
				
			</table>
			</div>
		</div>
	</div>	


</main>


	<script
		src="<%=request.getContextPath()%>/front-end/js/model/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>