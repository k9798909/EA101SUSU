<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		width:100%;
		height:400px;
		padding:20px;
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
		word-break: break-all;
		
	}
	div.inDiv{
		width:200px;
	}
	

	div.customer{
		height:300px;
		width:100px;
		text-align:center;
	 	transform:rotate(180deg);
	 	position:absolute;
		right:50px;
		bottom:100px;
		display:none;
	}
	div.customer button.btn{
		width:100px;
		margin-top:3px;
		transform:rotate(180deg);
	}
	
	button#msgBtn{
		position:absolute;
		right:50px;
		bottom:50px;
		border:0px;
		border-width: 0px;
	}
	
	img.msgicon{
		width:40px;
		height:40px;
		border-radius:40px;
	}
	
	input#message{
		width:320px;
	}
</style>

<body onload="connect();" onunload="disconnect();">

<div id="basicModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   		<div id="massageZone">
			<div id="messagesArea">
				<div id="msg_end" style="height:0px; overflow:hidden"></div>
			</div>
		</div>
      </div>
      
      <div class="modal-footer">
      	<input id="message" type="text">
		<button id="sendMessage" class="btn btn-primary">傳送</button> 
      </div>
    </div>
  </div>
</div>

	<div class="customer">
	</div>
	<button id="msgBtn"><img class="msgicon" src="<%=request.getContextPath()%>/image/message-icon.png"></button>


	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<% 	
	request.setAttribute("account","BM00006");
	request.setAttribute("seName","客戶");
%>
<script>
	var messagesArea=document.getElementById("messagesArea");
	var statusOutput = document.getElementById("statusOutput");
	var webSocket;
	
	$("#msgBtn").click(function(){
		$("#basicModal").modal({show: true});
		$("h5.modal-title").text("客服訊息");
		
	})
		
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

			if(Array.isArray(msgObj)){
				//聊天室窗初始化
				let msg_end=document.getElementById("msg_end");
				let tampmsg_end = $(msg_end).clone();
				$(messagesArea).text("");
				$(messagesArea).append(tampmsg_end);
				//歷史訊息
				for (let i = 0; i < msgObj.length; i++) {
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
	//傳送訊息changeReceiver是變動的隨點及變動
	$("#sendMessage").click(function() {
		let message = $("#message").val().trim();		
		
		if(message.length==0)
			return;
			
		let msgObj = {
			"sender" : "${account}",
			"seName":"${seName}",
			"message" : message,
			"receiver" :"LE00001"
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
						"right":"-220px"});
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