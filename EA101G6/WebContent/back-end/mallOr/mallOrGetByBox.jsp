<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">

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
	
	input.dtbtn {
	margin-top:2px;
    background-color: #ffffff;
    border-radius: 2px; 
    color: black;
    border: none;
    padding: 0px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    width:40px;
	}
	
	input.dtbtn:hover {
    background-color: #e7e7e7;
    border-radius: 4px; 
    color: black;
    border: solid;
    padding: 0px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
	}
	
	input.box{
	margin-top:2px;
	margin-left:5px;
    border-radius: 2px; 
    color: black;
     border: solid 1px;
    padding: 0px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    width:35px;
	}

</style>

  

  
</head>
<body>







<main>

	<div class="container orMain">
		<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
				<thead class="table-warning">
				<tr>
				<th >訂單編號</th>
				<th >付款狀態</th>
				<th >出貨狀態</th>
				<th >訂單狀態</th>
				<th >詳細資訊</th>
				</tr>	
				
				<tbody>
				
				<c:forEach var="mallOr" items="${mallOrSvc.findByBoxStatus(0)}">
				<tr>
				<td>${mallOr.mallOrNo}</td>
				<td>${mallOr.payStatus=="1"?"已付款":"未付款"}</td>
				<td>
				${mallOr.boxStatus=="1"?"已出貨":"未出貨"}
				<!-- 有付款才可出貨 -->
				<c:if test="${mallOr.payStatus=='1'}">
				<form style="display:inline-block;" action="<%= request.getContextPath()%>/MallOr/MallOrServlet" method="post">
				<input class="box" type="submit" value="出貨" >
				<input type="hidden" name="mbrNo" value="${mallOr.mbrNo}" >
				<input type="hidden" name="mallOrNo" value="${mallOr.mallOrNo}" >
				<input type="hidden" name="status" value="${mallOr.status}" >
				<input type="hidden" name="boxStatus" value="${mallOr.boxStatus}" >
				<input type="hidden" name="payStatus" value="${mallOr.payStatus}" >
				<input type="hidden" name="action" value="updateBox" >
				</form>
				</c:if>
				</td>
				<td>${mallOr.status=="1"?"已完成":mallOr.status=="2"?"已取消":"未完成"}</td>

				<td><form action="<%= request.getContextPath()%>/MallOr/MallOrServlet" method="post">
					<input type="hidden" name="mallOrNo" value="${mallOr.mallOrNo}">
					<input type="hidden" name="action" value="selectone">
					<input class="dtbtn" type="submit" value="觀看">
				</form></td>
				</tr>
				</c:forEach>
				
				</tbody>
				
			</table>
			</div>
		</div>
	</div>	


</main>


	<script
		src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	
	

</body>
</html>