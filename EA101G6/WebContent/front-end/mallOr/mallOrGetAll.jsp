<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">

<style>
div.orMain table.table {
	table-layout: fixed;
	word-break: break-all;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 0px;
}

div.orMain table.table td {
	padding: 0px;
	height: 30px;
}

input.dtbtn {
	margin-top: 2px;
	background-color: #ffffff;
	border-radius: 2px;
	color: black;
	border: none;
	padding: 0px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	width: 40px;
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

.dtTbDiv {
	display: none;
	margin-top: 0px;
}

hr {
	background-color: #000000;
}

button.showDtTbBtn {
	height: 20px;
	width: 20px;
	padding: 0px;
	box-sizing: border-box;
	text-align: top;
	font-size: 13px;
}

main {
	margin-top: 10px;
}
</style>


</head>
<body>

	<%@ include file="/front-end/front-end-nav.jsp"%>


	<main>

		<jsp:useBean id="mallOrSvc" class="com.mallOr.model.MallOrService" />
		<jsp:useBean id="mallSvc" class="com.mall.model.MallService" />
		<jsp:useBean id="mallOrDtSvc"
			class="com.mallOrDt.model.MallOrDtService" />

		<div class="container orMain">
			<div class="row">
				<div class="col-12">
					<c:forEach var="mallOr" items="${mallOrSvc.findByMbrNo('BM00001')}">
						<table class="table table-bordered">
							<thead class="bg-warning">
								<tr>
									<th>訂單編號</th>
									<th>下訂日期</th>
									<th>付款狀態</th>
									<th>出貨狀態</th>
									<th>訂單狀態</th>
								</tr>
							<tbody>


								<tr>
									<td>${mallOr.mallOrNo}</td>
									<td><fmt:formatDate value="${mallOr.orDate}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${mallOr.payStatus=="1"?"已付款":"未付款"}</td>
									<td>${mallOr.boxStatus=="1"?"已出貨":mallOr.boxStatus=="2"?"已送達":"未出貨"}</td>
									<td>${mallOr.status=="1"?"已完成":mallOr.status=="2"?"已取消":"未完成"}</td>
								</tr>
							</tbody>
						</table>
						<!-- //未出貨可取消 -->
						<c:if test="${mallOr.boxStatus=='0' && mallOr.status=='0'}">
							<form action="<%=request.getContextPath()%>/MallOr/MallOrServlet" method="post" style="display: inline-block">
								<input type="hidden" name="status" value="2">
								<input type="hidden" name="boxStatus" value="${mallOr.boxStatus}"> 
								<input type="hidden" name="payStatus" value="${mallOr.payStatus}"> 
								<input type="hidden" name="mallOrNo" value="${mallOr.mallOrNo}">  
								<input type="hidden" name="action" value="updateStatus"> 
								<input type="submit" value="取消訂單">
							</form>
						</c:if>
						<!-- //已出貨要領貨 -->
						<c:if test="${mallOr.boxStatus=='2' && mallOr.status=='0'}">
							<form action="<%=request.getContextPath()%>/MallOr/MallOrServlet" method="post" style="display: inline-block">
								<input type="hidden" name="status" value="1">
								<input type="hidden" name="boxStatus" value="${mallOr.boxStatus}"> 
								<input type="hidden" name="payStatus" value="${mallOr.payStatus}"> 
								<input type="hidden" name="mallOrNo" value="${mallOr.mallOrNo}">  
								<input type="hidden" name="action" value="updateStatus"> 
								<input type="submit" value="領貨完成">
							</form>
						</c:if>
						
						<button class="showDtTbBtn btn btn-primary">+</button> 看明細									


						<div class="container dtTbDiv">
							<div class="row">
								<div class="col-8">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>商品名稱</th>
												<th>數量</th>
												<th>價錢</th>
												<th>小計</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="mallOrDt"
												items="${mallOrDtSvc.getByOrNo(mallOr.mallOrNo)}">
												<tr>
													<td>${mallSvc.findOneByNo(mallOrDt.commNo).commName}</td>
													<td>${mallOrDt.quantity}</td>
													<td>${mallOrDt.price}</td>
													<td>${mallOrDt.price*mallOrDt.quantity}</td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<hr>
					</c:forEach>



				</div>
			</div>
		</div>


	</main>


	<script
		src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			$(".showDtTbBtn").click(function() {
				$(this).next(".dtTbDiv").slideToggle();
			});

		})
	</script>
</body>
</html>