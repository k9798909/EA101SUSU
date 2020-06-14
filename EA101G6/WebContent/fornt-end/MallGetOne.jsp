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

<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700" rel="stylesheet">
<!-- 登入圖示 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/fonts/icomoon/style.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/owl.theme.default.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/aos.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/model/style.css">
<!-- 個人CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fornt-end/css/MallGetOne.css">


</head>
<body>

  <div class="site-wrap"  id="home-section">

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
            
            <a href="#" class="text-white"><span class="d-md-inline-block"><img class="icon" src="images/add-icon.png">註冊</span></a>
            
            <div class="float-right">
            <a href="#" class="text-white"><span class="d-md-inline-block"><img class="icon" src="images/User-icon.png">會員登入</span></a>
            <a href="#" class="text-white"><span class="d-md-inline-block"><img class="icon" src="images/man-icon.png" >店家登入</span></a>
            </div>

          </div>
          
        </div>
        
      </div>
    </div>
      
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center position-relative">
          
            
            <div class="site-logo">
              <a href="index.html" class="text-black"><span class="text-primary">Unearth</span></a>
            </div>
            
            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                <li><a href="" class="nav-link">首頁</a></li>

                  <li class="has-children">
                  <a href="" class="nav-link">會員專區</a>
                  <ul class="dropdown arrow-top">
                    <li><a href="#team-section" class="nav-link">Team</a></li>
                    <li><a href="#pricing-section" class="nav-link">Pricing</a></li>
                    <li><a href="#faq-section" class="nav-link">FAQ</a></li>
                    <li class="has-children">
                      <a href="#">More Links</a>
                      <ul class="dropdown">
                        <li><a href="#">Menu One</a></li>
                        <li><a href="#">Menu Two</a></li>
                        <li><a href="#">Menu Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li><a href="#mall" class="nav-link">商城</a></li>
                <li><a href="#shop" class="nav-link">市集</a></li>
                <li><a href="#play" class="nav-link">揪團區</a></li>
                <li><a href="#store" class="nav-link">店家列表</a></li>
                <li><a href="#forum" class="nav-link">討論區</a></li>
              </ul>
              </nav>
          
            </div>

          <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
    </header>
    	
    	<% 
    		String commNo=request.getParameter("commNo"); 
    		MallService mallSer = new MallService();
			request.setAttribute("mallSer", mallSer);	
    	   	if(commNo!=null){
    	   		MallVO mallVo = (MallVO)session.getAttribute(commNo);
    	   		request.setAttribute("mallVo", mallVo);
    	   		System.out.println("asdasdad");
    	   }
    	%>
    	
		<main>
			<div class="container commmain">
				<div class="row justify-content-around" >
				<div class="col-12 col-lg-5 commimg"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></div>
				
				<div class="col-12 col-lg-6  comm">
					<h1> ${mallVo.commName} </h1>
				<div class="type">遊戲類型:<p class="d-inline-block">
					<c:forEach var="typename" items="${mallSer.getType(mallVo.commNo)}">
						${typename.typeName}
					</c:forEach>
				</p></div>
				<div class="d-inline-block price"><p><b> $${mallVo.price} </b></p></div>	
				
				<div class="player">遊玩人數: ${mallVo.player} 人</div>
				<div class="age">建議年齡: ${mallVo.age} 歲以上</div>
				
				<div class="intro">遊戲介紹:
					<div> ${mallVo.intro} </div>
				</div>
				
				<div class="left">剩餘數量: ${mallVo.quantity}</div>
				<div class="quantity">數量:<button id="minus">-</button><input type="text" id="buyQuantity" value="1"><button id="plus">+</button></div>
				<button class="bybtn">購買</button> <button class="carbtn">加入購物車</button>
						
				</div>
				</div>
			</div>
			
			
		</main>
    <button class="shopcar"><img src="<%=request.getContextPath()%>/fornt-end/images/supermarket.png"></button>
	
	
	
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery-3.3.1.min.js"></script>
	<!-- 看起來沒屁用 -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/bootstrap.min.js"></script>
	<!-- 重要廣告界面 -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/owl.carousel.min.js"></script>
	<!-- 看起來沒屁用 -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.sticky.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.animateNumber.min.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.fancybox.min.js"></script>
	<!-- 上介面連結動畫 -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/jquery.easing.1.3.js"></script>
	<!-- 重要廣告界面 -->
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/aos.js"></script>
	<script src="<%=request.getContextPath()%>/fornt-end/js/model/main.js"></script>
	<script>
		$(document).ready(function(){
			var quantity=1;
			var maxquantity=parseInt("${mallVo.quantity}");
			$("#minus").click(function(){
				if(quantity>1)
					$("#buyQuantity").attr("value",--quantity)	
			})
			
			$("#plus").click(function(){
				if(maxquantity>quantity)
					$("#buyQuantity").attr("value",++quantity)
			})
			
		})
	
	</script>
	
	
	
</body>
</html>