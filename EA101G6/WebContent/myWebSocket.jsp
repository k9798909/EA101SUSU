<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Chat Room</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
</style>

<body onload="connect();" onunload="disconnect();">
	                                                                                                      
	<div id="massageZone">
		<div id="messagesArea">
		<div id="msg_end" style="height:0px; overflow:hidden"></div>
		</div>
		<input id="message" type="text">
		<button id="sendMessage">傳送</button> 
	</div>
	
	<button id="msgBtn">訊息</button>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<% 
	request.setAttribute("account","BM00001");
	request.setAttribute("seName","煩死了");
%>
<script>
	var MyPoint = "/MyWebSocket/${account}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var messagesArea=document.getElementById("messagesArea");
	var statusOutput = document.getElementById("statusOutput");
	var msg_end=document.getElementById("msg_end");
	var webSocket;
	
	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {

		};

		webSocket.onmessage = function(event) {
			var msgList = JSON.parse(event.data);
			for (var i = 0; i < msgList.length; i++) {
				let messageObj = JSON.parse(msgList[i]);
				showMsg(messageObj);
			}
		};

		webSocket.onclose = function(event) {
		
		};
	}

	$("#sendMessage").click(function() {
		let message = $("#message").val().trim() + "\r\n";		
		
		var msgObj = {
			"sender" : "${account}",
			"seName":"${seName}",
			"message" : message,
			"receiver" : "LE00001"
		};
		
		let msg=JSON.stringify(msgObj);
		webSocket.send(msg);
		showMsg(msgObj);
		
		$("#message").val("");
		$("#message").focus();
		
	})

	function showMsg(msg) {
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
	
	$("#msgBtn").click(function(){
		$("#massageZone").toggle();
	})

	//function updateStatus(newStatus) {
	//	statusOutput.innerHTML = newStatus;
	//}
</script>
</html>