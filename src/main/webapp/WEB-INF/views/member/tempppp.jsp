<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jquery -->
<script src="/mypet/resources/js/jquery-1.12.4.js"></script>

<!-- SocketJS CDN -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<title>MyPet::채팅하기</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">




<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: NanumSquare;
	font-size: 16px;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.container {
	width: 350px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.card {
	margin: 20px auto;
	width: 340px !important;
	min-height: 550px !important;
	max-height: 550px !important;
	border-radius: 16px !important;
	box-shadow: rgba(81, 99, 120, 0.3) 0px 6px 60px 0px !important;
	overflow: hidden !important;
	animation: 0.25s ease-out 0s 1 normal none running jZyQVL !important;
}

.info {
	height: 70px;
	/* display: flex; */
	-webkit-box-align: center;
	align-items: center;
	border-top-left-radius: 16px;
	border-top-right-radius: 16px;
	color: white;
	background: linear-gradient(103deg, #FAB018 0%, rgb(255, 179, 38) 50%,
		#F6DA42) 100% center;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px 0px;
	z-index: 1;
	position: absolute;
	top: -80px;
	right: 0px;
	left: 0px;
	padding: 14px 15px;
	transform: translateZ(0px);
	font-family: 'Jal_Onuel';
}

.info span {
	font-size: 13px;
	font-family: 'Jal_Onuel';
}

.title {
	width: 100%;
	font-size: 16px;
	font-family: 'Jal_Onuel';
	font-weight: bold;
}

.send {
	position: static;
	bottom: 0px;
	right: 0px;
	left: 0px;
	/* z-index: 1; */
	transform: translateZ(0px);
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	min-height: 54px;
	border-top: 1px solid rgb(228, 228, 229);
	background-color: rgb(255, 255, 255);
	/* box-shadow: rgba(0, 0, 0, 0.05) 0px 2px 6px 0px; */
	padding: 0;
}

.table-bordered>tbody>tr>td {
	border: 0;
}

.table-bordered {
	border: 0;
}

.chatfooter {
	width: 100%;
	min-height: 20px;
	max-height: 200px;
	line-height: 20px;
	font-size: 16px;
	letter-spacing: -0.1px;
	min-width: 0px;
	border: none;
	resize: none;
	margin: auto;
	padding-left: 0px;
	white-space: pre-wrap;
	overflow: auto;
	background-color: transparent;
	height: 50px;
	outline: none;
	white-space: pre-wrap;
	top: 10px;
	position: relative;
}

}
td .chatfooter {
	-webkit-box-align: left;
	align-items: left;
}

.content {
	height: 75%;
	margin-top: 80px;
}

.sendBtn {
	width: 46px;
	display: flex;
	align-self: stretch;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	cursor: pointer;
	z-index: 20;
	outline: none;
	color: white;
	background-color: #B27208;
	top: 20px;
	position: relative;
	font-size: 13px;
	left: 14px;
}

#chatout {
	width: 30px;
	float: right;
	position: relative;
	top: -40px;
	cursor: pointer;
}

.title_admin {
	
}

.title_user {
	text-align: right;
}

.chat_title {
	font-weight: bold;
}

.chattime {
	font-size: 14px;
	margin-left: 5px;
	font-weight: normal;
}

.chat_content {
	margin-bottom: 20px;
	font-size: 14px;
	background-color: #F4F4F4;
	padding: 8px 8px;
	border-radius: 12px;
	width: fit-content;
	max-width: 260px;
}

.content_admin {
	
}

.content_user {
	text-align: left;
	margin-top: 5px;
	float: right;
}
</style>
</head>
<body>

	<div class="container">
		<div class="card">

			<div class="col-sm-12 col-md-9"
				style="padding-right: 0px; padding-left: 0px;">

				<div class="info">
					<div class="title">
						마이펫<span><img
							src="/mypet/resources/images/chat/chatimg.png"
							style="width: 20px; margin-left: 4px;"></span>
					</div>
					<span>보통 몇 분 내에 응답합니다.</span>
					<div>
						<img src="/mypet/resources/images/chat/outimg.png" id="chatout"
							name="chatout"> <!-- onclick="onClose();"> -->
					</div>

				</div>

				<div class="content">
					<div id="output"
						style="width: 100%; height: 380px; padding: 15px; overflow: auto;">
						<div class="chat_admin">
							<div class="chat_title title_admin">
								<span><img src="/mypet/resources/images/chat/chatpic.png"
									style="width: 25px; margin-right: 4px; padding-bottom: 6px;"></span>마이펫<span
									class="chattime">11:56 PM</span>
							</div>
							<div class="chat_content content_admin">안녕하세요. 마이펫
								채팅서비스입니다. 무엇을 도와드릴까요?</div>
						</div>
						<!-- chat_admin -->

						<div class="chat_user">
							<div class="chat_title title_user">
								홍길동<span class="chattime">11:57 PM</span>
							</div>
							<div class="chat_content content_user">유기동물 신고는 어떻게 하나요?</div>
						</div>
						
						<div class="well" id="chatdata">
				    		<!-- User Session Info Hidden -->
				    		<input type="hidden" value='${id}' id="sessionuserid">
				    	</div>
						<!-- chat_user -->
					</div>
					<!--output  -->
				</div>
				<!-- content -->

				<div class="send">
					<table class="table table-bordered">
						<tr>
							<td style="border-bottom-left-radius: 16px;"><input
								type="text" name="message" id="message"
								placeholder="대화내용을 입력하세요." class="chatfooter"></td>
							<td style="border-bottom-right-radius: 16px;"><input
								type="button" name="sendBtn" class="sendBtn btn" id="sendBtn" value="보내기"></td>
						</tr>
					</table>
						
				</div>

			</div>

		</div>

	</div>
	<script>
		var chatout = document.getElementById("chatout");
		
		chatout.onclick = function() {
		 	self.close();
		}
		
		///////////////////////////////////////////////////
		
		//websocket을 지정한 URL로 연결
		var sock= new SockJS("<c:url value="/echo"/>");
		//var sock= new SockJS("/mypet/echo");
		
		//const sock = "ws://localhost:8090/mypet/member/chat.action";
		
		//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
		sock.onmessage = onMessage;
		//websocket 과 연결을 끊고 싶을때 실행하는 메소드
		sock.onclose = onClose;
		
		var sendBtn = document.getElementById("sendBtn");
		
		
		sendBtn.onclick = function() {
			console.log('send message...');
	        sendMessage();
		};
		
		/* $(function(){
			$("#sendBtn").click(function(){
				console.log('send message...');
		        sendMessage();
		    });
		}); */
		        
		function sendMessage(){      
			//websocket으로 메시지를 보내겠다.
		  	sock.send($("#message").val());     
		}
		            
		//evt 파라미터는 websocket이 보내준 데이터다.
		function onMessage(evt){  //변수 안에 function자체를 넣음.
			var data = evt.data;
			var sessionid = null;
			var message = null;
			
			//문자열을 splite//
			var strArray = data.split('|');
			
			for(var i=0; i<strArray.length; i++){
				console.log('str['+i+']: ' + strArray[i]);
			}
			
			//current session id//
			var currentuser_session = $('#sessionuserid').val();
			console.log('current session id: ' + currentuser_session);
			
			sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
			message = strArray[1]; //현재 메세지를 저장//
			
			//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
			if(sessionid == currentuser_session){
				var printHTML = "<div class='well'>";
				printHTML += "<div class='alert alert-info'>";
				printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				
				$("#chatdata").append(printHTML);
			} else{
				var printHTML = "<div class='well'>";
				printHTML += "<div class='alert alert-warning'>";
				printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
				printHTML += "</div>";
				printHTML += "</div>";
				
				$("#chatdata").append(printHTML);
			}
			
			console.log('chatting data: ' + data);
			
		  	/* sock.close(); */
		}
		
		
		function onClose(evt){
/* 			var data = evt.data;
 			$("#data").append("연결 끊김");
 */			console.log('일단..보류');
 			
		} 
		
		</script>
		</body>
		</html> --%>


