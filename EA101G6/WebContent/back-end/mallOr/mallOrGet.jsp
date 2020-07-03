<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">

<style>

div#basicModal div.modal-content{
	width:800px;
	margin:auto;
	
}

div#basicModal{
	margin-left:-100px;
	
}


div#basicModal table.table tbody tr td{
	padding:0px;
	height:40px;
	vertical-align: middle;
}

div#basicModal table.table tbody tr td:first-of-type{
	padding:0px;
	width:100px;
	height:40px;
	vertical-align: middle;
}


div#basicModal table.table{
	width:100%;

}

.margin-center {
  margin:0px auto;
}

h5.modal-title{
	margin-left:40%;
}

</style>


</head>
<body>


  
  <jsp:useBean id="mallOrSvc" class="com.mallOr.model.MallOrService"/>
  



 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">商城訂單</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="<%= request.getContextPath()%>/back-end/mallOr/mallOrGet.jsp?action=getAll">所有訂單 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="<%= request.getContextPath()%>/back-end/mallOr/mallOrGet.jsp?action=getByBox">未出貨 <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  </div>
  
</nav>

<c:if test="${param.action=='getAll'}">
<%@ include file="/back-end/mallOr/mallOrGetAll.jsp"%>
</c:if>

<c:if test="${param.action=='getByBox'}">
<%@ include file="/back-end/mallOr/mallOrGetByBox.jsp"%>
</c:if>


<!-- -- -->

<div id="basicModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">訂單詳細資訊</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      
        <table class="table">
				<thead>
					<tr>
						<th colspan="2" >訂單編號:${mallOrVo.mallOrNo}</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td >訂購人:</td>
						<td >${mbrpfVo.mbrname}</td>
					</tr>
					<tr> 
						<td >訂購日期:</td>
						<td><fmt:formatDate value="${mallOrVo.orDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
					<tr>
						<td >訂單金額:</td>
						<td>${mallOrVo.price}</td>
					</tr>
					<tr>
						<td >處理狀態:</td>
						<td >${mallOrVo.boxStatus==1?"已出貨":"未出貨"}</td>
					</tr>
					<tr>
						<td >付款狀態</td>
						<td>${mallOrVo.payStatus==1?"已付款":"未付款"}</td>
					</tr>
					<tr>
						<td>訂單狀況</td>
						<td>${mallOr.status=="1"?"已完成":mallOr.status=="2"?"已取消":"未完成"}</td>
					</tr>
					<tr>
						<td >取貨方式</td>
						<td >${mallOrVo.take}</td>
					</tr>
					<tr>
						<td >取貨地點</td>
						<td>${mallOrVo.address}</td>
					</tr>
					
				</tbody>
	
			</table>
			
	
	<div class="container dtMain">
		<div class="row">
		<div class="col-12">
			<table class="table text-center margin-center ">
				<thead>
				<tr> <th>商品名稱</th><th>數量</th><th>價錢</th><th>小計</th></tr>
				</thead>
				
				<jsp:useBean id="mallSvc" class="com.mall.model.MallService" />
				
				<tbody>
				<c:forEach var="mallOrDt" items="${mallOrDtSet}" varStatus="count">
				<tr> <td>${mallSvc.findOneByNo(mallOrDt.commNo).commName}</td><td>${mallOrDt.quantity}</td><td>${mallOrDt.price}</td><td>${mallOrDt.price*mallOrDt.quantity}</td></tr>
				</c:forEach>
				</tbody>

			</table>
			</div>
			</div>
		</div>
        
        
        
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


	<script src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>
    <c:if test="${showDetail}">
	 	$("#basicModal").modal({show: true});
	 </c:if>
	</script>



</body>
</html>