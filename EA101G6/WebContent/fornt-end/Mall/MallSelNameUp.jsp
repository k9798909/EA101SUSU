<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.mall.model.*"%>
<%@ page import="com.gmTypeDt.model.*"%>
<%@ page import="com.gmType.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700" rel="stylesheet">
<!-- �n�J�ϥ� -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/owl.theme.default.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/aos.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/style.css">
<!-- �ӤHCSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/MallGetAllUpFornt.css">



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
								src="<%=request.getContextPath()%>/fornt-end/images/add-icon.png">���U
						</span></a>
					</div>

					<div class="float-right">
						<a href="#" class="text-white"><span class="d-md-inline-block">
								<img class="icon"
								src="<%=request.getContextPath()%>/fornt-end/images/User-icon.png">�|���n�J
						</span></a> <a href="#" class="text-white"> <span
							class="d-md-inline-block"><img class="icon"
								src="<%=request.getContextPath()%>/fornt-end/images/man-icon.png">���a�n�J</span></a>
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
						class="text-primary">Unearth</span></a>
				</div>

				<div class="col-12">
					<nav class="site-navigation text-right ml-auto " role="navigation">

						<ul
							class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
							<li><a href="" class="nav-link">����</a></li>

							<li class="has-children"><a href="" class="nav-link">�|���M��</a>
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

							<li><a href="#mall" class="nav-link">�ӫ�</a></li>
							<li><a href="#shop" class="nav-link">����</a></li>
							<li><a href="#play" class="nav-link">���ΰ�</a></li>
							<li><a href="#store" class="nav-link">���a�C��</a></li>
							<li><a href="#forum" class="nav-link">�Q�װ�</a></li>
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

	<main class="mall">
		<div class="seldiv">
			<form action="<%=request.getContextPath()%>/Mall/ForntMallServlet" method="post">
				<input placeholder="�п�J�ӫ~�W��" type="text" name="selName" class="selinput">
				<input type="hidden" name="action" value="selName">
				<input type="submit" value="�j�M�ӫ~">
			</form>
		</div>



		<%
			//�s�brequest��incule �������]�i�H���� 
			//���O�OGmTypeService  MallService
			GmTypeService gmTypeSvc = new GmTypeService();
			request.setAttribute("gmTypeSvc", gmTypeSvc);
			MallService mallSvc = new MallService();
			request.setAttribute("mallSvc", mallSvc);
		%>

		
		<div class="container commMain">
			<div class="row">
				

				
				<c:forEach var="mallVo" items="${selMallVoList}">
					<div class="col-lg-3 col-6 comm">
						<a href="<%=request.getContextPath()%>/fornt-end/Mall/MallGetOne.jsp?commNo=${mallVo.commNo}">
							<div class="imgdiv"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></div>
							<p> ${mallVo.commName} </p>
							<div class="dt"><p><b>$${mallVo.price}</b></p></div>
						</a>
					</div>
				</c:forEach>
				
			</div>
		</div>

		<button class="shopcar">
			<img src="<%=request.getContextPath()%>/fornt-end/images/supermarket.png">
		</button>

	</main>






	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery-3.3.1.min.js"></script>
	<!-- �ݰ_�ӨS���� -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/bootstrap.min.js"></script>
	<!-- ���n�s�i�ɭ� -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/owl.carousel.min.js"></script>
	<!-- �ݰ_�ӨS���� -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.sticky.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.animateNumber.min.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.fancybox.min.js"></script>
	<!-- �W�����s���ʵe -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.easing.1.3.js"></script>
	<!-- ���n�s�i�ɭ� -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/aos.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- �d�߮ɦ����~�Ұ� -->
<c:if test="${not empty selErroMsg}">
	<script>swal({text:"${selErroMsg}" });</script>
	<%session.removeAttribute("selErroMsg"); %>
</c:if>	


</body>
</html>