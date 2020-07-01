<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String account = (String) request.getAttribute("account");
	String password = (String) request.getAttribute("password");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UnearthLogin</title>

  <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style_login.css">


</head>

<body>

<%@ include file="/front-end/front-end-nav.jsp"%>


<main>
<form class="login-form " action="<%=request.getContextPath()%>/mbrpf/mbrpf.do" method="post">
<div class="login-form ">
     <h1><img src="<%=request.getContextPath()%>/image/tomcat.png" width="100" height="100" border="0"></h1>
     <div class="form-group ">
       <input type="text" class="form-control" name="account" placeholder="�b�� " id="UserName">
       <i class="fa fa-user"></i>
     </div>
     <div class="form-group log-status">
       <input type="password" class="form-control" name="password" placeholder="�K�X" id="Passwod">
       <i class="fa fa-lock"></i>
     </div>
      <span class="alert">�K�X���~</span>
      <a class="link" href="#">�ѰO�K�X?</a>
      <input type="hidden" name="action" value="tryLogin">
     <input type="submit" class="log-btn" value="�|���n�J">
     <h3>  </h3>
     <button type="button" class="sign-btn" >�|�����U</button>
       <!-- <a class="linksignup" href="#">�|�����U</a> -->
     
    
   </div>
   </form>
  </main>
  
   
   
<!-- partial -->
  <script  src="<%= request.getContextPath()%>/js/script_login.js"></script>

  


</body>
</html>