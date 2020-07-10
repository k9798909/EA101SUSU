<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="connectionpool.*"%>
<%@ page import="redis.clients.*"%>
<%@ page import="com.websocket.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!DOCTYPE html>
<html>
<head>
<title>Chat Room</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
</head>

<style>
	#messagesArea{
		width:500px;
		height:600px;
		padding:20px;
		background-color:#000000;
		color:#ffffff;
		box-sizing:border-box;
		overflow-x:hidden;
		overflow-y:scroll;
	}
/* 	#massageZone{ */
/* 		display:none; */
/* 	} */
	
	#messagesArea div.textDiv{
		margin:10px 5px;
		height:auto;
		font-size:20px;
		border-radius:10px;
		background-color:blue;
		width:auto;
		display:block;
		padding:5px;
		word-wrap:break-word; 
		
	}
	div.inDiv{
		width:200px;
	}
	
	#msgBtn{
		position:absolute;
		right:50px;
		bottom:50px;
	}
	div.customer{
		height:300px;
		border:solid;
		width:80px;
		text-align:center;
	}
	div.customer button.btn{
		width:50px;
		margin-top:3px;
	}
</style>

<body onload="connect();">

	<div id="massageZone">
		<div id="messagesArea">
		<div id="msg_end" style="height:0px; overflow:hidden"></div>
		</div>
		<input id="message" type="text">
		<button id="sendMessage">傳送</button> 
	</div>
	<%
		RedisService RedisSvc =new RedisService();
		pageContext.setAttribute("RedisSvc",RedisSvc);
	%>
	<button id="msgBtn">訊息</button>
	<c:forEach var="unDone" items="${RedisSvc.getUnDone()}">
		<button onclick=getHistory("${unDone}") >${unDone}</button>
	</c:forEach>
	
	
	<div class="customer">
	<button class="btn btn-primary">1</button>
	<button class="btn btn-primary">2</button>
	<button class="btn btn-primary">3</button>
	<button class="btn btn-primary">4</button>
	<button class="btn btn-primary">5</button>
	<button class="btn btn-primary">6</button>
	<button class="btn btn-primary">7</button>
	</div>
	
	   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
	<% 
	request.setAttribute("account","LE00001");
	request.setAttribute("seName","課服");
	%>
	
	<script>

	var messagesArea=document.getElementById("messagesArea");
	var statusOutput = document.getElementById("statusOutput");
	var webSocket;
	
	function connect() {
		let MyPoint = "/MyWebSocket/${account}";
		let host = window.location.host;
		let path = window.location.pathname;
		let webCtx = path.substring(0, path.indexOf('/', 1));
		let endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {

		};

		webSocket.onmessage = function(event) {
			let msgObj = JSON.parse(event.data);
			console.log(event.data);
			let msg_end=document.getElementById("msg_end");
			let tampmsg_end = $(msg_end).clone();
			$(messagesArea).text("");
			$(messagesArea).append(tampmsg_end);
			if(Array.isArray(msgObj)){
				for (var i = 0; i < msgObj.length; i++) {
					let messageObj = JSON.parse(msgObj[i]);
					showMsg(messageObj);
				}
			}else if(msgObj!=null){
				showMsg(msgObj);
			}
			
			
		};

		webSocket.onclose = function(event) {
	
		};
	}

	$("#sendMessage").click(function() {
		let message = $("#message").val().trim() + "\r\n";		
		
		let msgObj = {
			"sender" : "${account}",
			"seName":"${seName}",
			"message" : message,
			"receiver" : "BM00002"
		};
		
		let msg=JSON.stringify(msgObj);
		webSocket.send(msg);
		showMsg(msgObj);
		$("#message").val("");
		$("#message").focus();
		
	})

	function disconnect() {
		webSocket.close();
	}
	
	function getHistory(receiver) {
		let msgObj = {
				"sender" : "${account}",
				"seName":"${seName}",
				"receiver" : receiver,
				"type":"history"
			};
		let msg=JSON.stringify(msgObj);
		webSocket.send(msg);
		
		
	}
	
	function showMsg(msg) {
		let msg_end=document.getElementById("msg_end");
		let message = msg.seName + ":" + msg.message + "\r\n";
		let outDiv=document.createElement("div");
		let inDiv=document.createElement("div");
		let textDiv=document.createElement("div");
		$(inDiv).addClass("inDiv");
		$(outDiv).addClass("outDiv");
		$(textDiv).addClass("textDiv");
		if(msg.sender==="${account}"){
		$(outDiv).css({"text-align":"left",
						"position":"relative",
						"right":"-250px"});
		}
		$(textDiv).text(message);
		$(outDiv).append(inDiv);
		$(inDiv).append(textDiv);
		$(msg_end).before(outDiv);
		msg_end.scrollIntoView(); 
	}

</script>
	
</body>


</html>