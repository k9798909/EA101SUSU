<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.mall.model.*"%>
<%@ page import="com.gmTypeDt.model.*"%>
<%@ page import="com.gmType.model.*"%>
<%@ page import="com.buyCar.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameing on Board</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700"
	rel="stylesheet">
<!-- 登入圖示 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/aos.css">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/model/style.css">
<!-- 個人CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/css/buyCarCss/BuyCar.css">
<style>
.icon {
	width: 20px;
	height: 20px;
}
</style>



</head>
<body>
	<div class="site-wrap" id="home-section">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
	</div>

	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="float-left">
						<a href="" class="text-white"><span class="d-md-inline-block">
								<img class="icon"
								src="<%=request.getContextPath()%>/front-end/images/add-icon.png">註冊
						</span></a>
					</div>

					<div class="float-right">
						<a href="#" class="text-white"><span class="d-md-inline-block">
								<img class="icon"
								src="<%=request.getContextPath()%>/front-end/images/User-icon.png">會員登入
						</span></a> <a href="#" class="text-white"> <span
							class="d-md-inline-block"><img class="icon"
								src="<%=request.getContextPath()%>/front-end/images/man-icon.png">店家登入</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<header class="site-navbar js-sticky-header site-navbar-target"
		role="banner">

		<div class="container">
			<div class="row align-items-center position-relative">


				<div class="site-logo">
					<a href="index.html" class="text-black"><span
						class="text-primary">Gameing on Board</span></a>
				</div>

				<div class="col-12">
					<nav class="site-navigation text-right ml-auto " role="navigation">

						<ul
							class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
							<li><a href="" class="nav-link">首頁</a></li>

							<li class="has-children"><a href="" class="nav-link">會員專區</a>
								<ul class="dropdown arrow-top">
									<li><a href="#team-section" class="nav-link">Team</a></li>
									<li><a href="#pricing-section" class="nav-link">Pricing</a></li>
									<li><a href="#faq-section" class="nav-link">FAQ</a></li>
									<li class="has-children"><a href="#">More Links</a>
										<ul class="dropdown">
											<li><a href="#">Menu One</a></li>
											<li><a href="#">Menu Two</a></li>
											<li><a href="#">Menu Three</a></li>
										</ul></li>
								</ul></li>

							<li><a href="#mall" class="nav-link">商城</a></li>
							<li><a href="#shop" class="nav-link">市集</a></li>
							<li><a href="#play" class="nav-link">揪團區</a></li>
							<li><a href="#store" class="nav-link">店家列表</a></li>
							<li><a href="#forum" class="nav-link">討論區</a></li>
						</ul>
					</nav>

				</div>

				<div class="toggle-button d-inline-block d-lg-none">
					<a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span
						class="icon-menu h3"></span></a>
				</div>
			</div>
		</div>
	</header>

	<main>
		<div class="container">
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">商品名稱</th>
						<th scope="col">數量</th>
						<th scope="col">價錢</th>
						<th scope="col">小計</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach var="buyCarMall" items="${buyCarList}" varStatus="count">
						<tr id="row${count.count}">
							<th scope="row"></th>
							<td class="name"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${buyCarMall.commNo}">${buyCarMall.commName}</td>
							<td><div class="quantitydiv">
									<select>
										
										<%
											//最大值是此商品的庫存數量
											MallService mallSvc = new MallService();
											pageContext.setAttribute("mallSvc", mallSvc);
										%>
										
										<c:forEach var="i" begin="1"
											end="${mallSvc.findOneByNo(buyCarMall.commNo).quantity}">
											<option value="${i}" ${i==buyCarMall.quantity?"selected":""}>${i}</option>
										</c:forEach>
									</select>
								</div></td>
							<td>${buyCarMall.price}</td>
							<!-- 小計和總金額可能會因ajax浮動所以用jquery運算 -->
							<td class="buyPricePlus"></td>

							<th scope="row"><button class="cancel">取消</button></th>
						</tr>


						<input type="hidden" class="commName" name="commName"
							value="${buyCarMall.commName}">
						<input type="hidden" class="buyPrice" name="price"
							value="${buyCarMall.price}">
						<input type="hidden" class="buyQuantity" name="quantity"
							value="${buyCarMall.quantity}">

					</c:forEach>
				</tbody>
			</table>





			<div class="checkdiv">
				<p id="total">總金額:</p>
				<form method="post" action="<%= request.getContextPath()%>/MallOr/MallOrServlet">
				<input type="hidden" name="action" value="showCheckOut">
				<input type="submit" class="checkbtn" value="結帳">
				</form>
				<a href="<%=request.getContextPath()%>/front-end/Mall/MallGetAllUp.jsp" ><button class="back">繼續購物</button></a>
			</div>
			
			
		</div>



	</main>







	<script
		src="<%=request.getContextPath()%>/front-end/js/model/jquery-3.3.1.min.js"></script>
	<!-- 看起來沒屁用 -->
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/bootstrap.min.js"></script>
	<!-- 重要廣告界面 -->
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/owl.carousel.min.js"></script>
	<!-- 看起來沒屁用 -->
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/jquery.sticky.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/jquery.animateNumber.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/jquery.fancybox.min.js"></script>
	<!-- 上介面連結動畫 -->
	<script
		src="<%=request.getContextPath()%>/front-end/js/model/jquery.easing.1.3.js"></script>
	<!-- 重要廣告界面 -->
	<script src="<%=request.getContextPath()%>/front-end/js/model/aos.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/js/model/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$(document).ready(function() {
		
		<c:forEach var="buyCarMall" items="${buyCarList}" varStatus="count">
			
			$("#row${count.count} .buyPricePlus").text(${buyCarMall.price}*$("#row${count.count} select").val());			
			$("#row${count.count} select").change(function(){
				let buyPrice=${buyCarMall.price};
				$("#row${count.count} .buyPricePlus").text(buyPrice*$(this).val());
				
				$.post('<%=request.getContextPath()%>/BuyCar/BuyCarServlet',{
					action:"update",
					commNo:"${buyCarMall.commNo}",
					commName:"${buyCarMall.commName}",
					buyQuantity:$("#row${count.count} select").val(),
					buyPrice:"${buyCarMall.price}"
					
					},function(data,status){
						if(status="success")
							swal({text:data });
					})
				
				getTotal();
			})
		
			$("#row${count.count} .cancel").click(function(){
				$("#row${count.count}").remove();
				reSetNo();
				getTotal();
				$.post('<%=request.getContextPath()%>/BuyCar/BuyCarServlet',{
					action:"delete",
					commNo:"${buyCarMall.commNo}",
					commName:"${buyCarMall.commName}",
					buyQuantity:"${buyCarMall.quantity}",
					buyPrice:"${buyCarMall.price}"
					
					},function(data,status){
						if(status="success")
							swal({text:data });
					})
				
				
			})
		</c:forEach>
		
		
		//標頭隨tr數量改變	
		reSetNo();
		function reSetNo(){
			for(let i=1;i<=$("table.table tbody tr").length;i++){
				$("#row"+i+" th:first-of-type").text(i);
			}
		}
		//取得總金額
		getTotal();
		function getTotal(){
			let total=0;
			let buyPricePlus =document.getElementsByClassName("buyPricePlus");
			for(let i=0;i<$(".buyPricePlus").length;i++){
				total+=parseInt(buyPricePlus[i].innerText.trim());
			}
			$("#total").text("總金額:"+total);
		}
		
	})
	
	
	<c:if test="${not empty noMallAlert}">
		swal({text:"${noMallAlert}" });
	</c:if>
	</script>

</body>
</html>