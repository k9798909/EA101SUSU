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
<title>Document</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/mallcss.css">
</head>
<body>

	<div id="commaction">
		<button id="callGmType" style="margin-right:10px;">�C������</button><button id="create-user">�s�W�ӫ~</button>
		<div style="display:inline">���M�ӫ~:<form method="post" action="<%= request.getContextPath()%>/Mall/BackMallServlet" style="display:inline"><input type="text" name="selName">
		<input  type="hidden" name="action" value="selectone">
		<input type="submit" value="�j�M">
		</form>
		
		</div>
	</div>
	
	
		<div class="container ">
			<table id="comm" class="table table-bordered ">
				<thead>
					<tr class="">
						<th class="col-md-1"></th>
						<th class="col-md-1">�Ϥ�</th>
						<th class="col-md-2">�ӫ~�W��</th>
						<th class="col-md-1">���</th>
						<th class="col-md-1">�ƶq</th>
						<th class="col-md-2">�ӫ~�Ա�</th>
						<th class="col-md-1">�A�X�~��</th>
						<th class="col-md-1">��ĳ�H��</th>
						<th class="col-md-1">�C������</th>
						<th class="col-md-1">�W�[���A</th>

					</tr>
				</thead>
				<tbody>
				
				<!-- �srequest����P���ள�� -->
				<jsp:useBean id="gmTypeSvc" class="com.gmType.model.GmTypeService" scope="request"/>
				<jsp:useBean id="mallSvc" class="com.mall.model.MallService" scope="request"/>
					
					<%	
					List<MallVO> mallVoList = mallSvc.getAll();
					pageContext.setAttribute("mallVoList", mallVoList);
					// if(session.getAttribute("mallVoList")==null){
 					//		List<MallVO> mallVoList = mallSvc.getAll();
 					//		session.setAttribute("mallVoList", mallVoList);
							
 					//	}
					%>
					<%@ include file="/back-end/mall/page1.file" %>
					<c:forEach var="mallVo" items="${mallVoList}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
						<tr>
							<td class="">
								<form action= "<%= request.getContextPath()%>/back-end/mall/mallGetAll.jsp" method="post">
									<input class="upda" type="submit"value="�ק�">
									<input type="hidden" name="commNo" value="${mallVo.commNo}">
									<!-- �s�X�ק虜�� -->
									<input type="hidden" name="showupdate" value="showupdate">
									<!-- �T�w���� -->
									<% 	String tampWhichPage=request.getParameter("whichPage");
										if(tampWhichPage!=null&&tampWhichPage.length()!=0){
											pageContext.setAttribute("whichPage",tampWhichPage);
										}
									
									%>
									<input  type="hidden" name="whichPage" value="${whichPage}">
								</form>
							</td>
							<td class="col-md-1"><img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}"></td>
							<td class="col-md-2"><div>${mallVo.commName}</div></td>
							<td class="col-md-1">${mallVo.price}</td>
							<td class="col-md-1">${mallVo.quantity}</td>
							<td class="col-md-2"><div>${mallVo.intro}</div></td>
							<td class="col-md-1">${mallVo.age}���H�W</td>
							<td class="col-md-1">${mallVo.player}�H</td>
							<td class="col-md-1">
								<div>
									<c:forEach var="typeVo" items="${mallSvc.getType(mallVo.commNo)}">
										${typeVo.typeName} 
									</c:forEach>
								</div>
							</td>
							
							<td class="col-md-1">${(mallVo.status=="1")?"�W�[��":"�U�[��" }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align:center"><%@ include file="/back-end/mall/page2.file" %></div>
		</div>



<%@ include file="/back-end/mall/mallAdd.jsp" %>
<%@ include file="/back-end/mall/mallUpdate.jsp" %>
<%@ include file="/back-end/gmType/gmTypeGetAll.jsp" %>


<script>var ctx ="<%=request.getContextPath()%>"</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="<%= request.getContextPath() %>/js/malljs.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>


<!-- ���I���ק�ɷ|�Ǫ��Ѽ� �����ѼƷ|�I�s�קﭶ�� -->
<% pageContext.setAttribute("showupdate",request.getParameter("showupdate")); %>

<!-- �����\�T���N�Ұ� -->
<c:if test="${not empty successMsg}">
	swal({text:"${successMsg}" });
	<%session.removeAttribute("successMsg");%>
</c:if>

<!-- �I���ק�ɷ|�ҰʶǦ^���~�T���ɤ]�|�Ұ� -->
<c:if test="${'showupdate'==showupdate}">
	<%= "$(document).ready(function() {showupdate();});"%>
	<% pageContext.removeAttribute("action"); %>
</c:if>
<!-- �s�W�����~�T���ɱҰʥs�X�s�W���� -->
<c:if test="${not empty erroMsg}">
	<%= "$(document).ready(function() {$('#create-user').click()})"%>
	<%request.removeAttribute("erroMsg"); %>
</c:if>

<!-- �d�߮ɦ����~�Ұ� -->
<c:if test="${not empty selErroMsg}">
		swal({text:"${selErroMsg}" });
	<%session.removeAttribute("selErroMsg"); %>
</c:if>							

	  
</script>

</body>
</html>

