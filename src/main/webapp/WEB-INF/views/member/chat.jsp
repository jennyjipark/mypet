 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jquery -->
<script src="/mypet/resources/js/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


<title>MyPet::채팅하기</title>
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
	height: 100px;
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
	top: 0px;
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
	position: relative;
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
	top: 90px;
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

.messages {
	/* height: 75%; */
	margin-top: 0px;
    position: relative;
    top: 100px;
        margin-bottom: 10px;
}

.sendBtn {
	width: 50px;
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
    left: 10px;
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
	text-align: left;
	margin-top: 5px;
	float: left;
	margin-bottom: 8px;
}

.content_user {
	text-align: left;
	margin-top: 5px;
	float: right;
	margin-bottom: 8px;
}

#intochat {
position: absolute;
    z-index: 2;
    top: 65px;
    left: 9px;
    font-size: 13px;
    border: transparent;
    background-color: #B27208;
    color: white;
    width: 95%;
}
</style>
</head>
<body>
    <div class="container">
		<div class="card">
		
		<div class="col-sm-12 col-md-9"	style="padding-right: 0px; padding-left: 0px;">
		
		<div class="info">
					<div class="title">
						마이펫<span><img
							src="/mypet/resources/images/chat/chatimg.png"
							style="width: 20px; margin-left: 4px;"></span>
					</div>
					<span>보통 몇 분 내에 응답합니다.</span>
					<div>
						<img src="/mypet/resources/images/chat/outimg.png" id="chatout"
							name="chatout" onclick="closeSocket();"> <!-- onclick="onClose();"> -->
					</div>

		</div>
		
		<!-- 채팅 시작전에 채팅 시작버튼 꼭 눌러주세요~~ -->
        <button type="button" onclick="openSocket();" class="btn btn-default" id="intochat">채팅 시작</button> 
        <!-- <button type="button" onclick="closeSocket();">대회방 나가기</button> -->
        
        
        
        
        
        <!-- Server responses get written here -->
    <div id="messages" class = "messages" style="width: 100%; height: 360px; padding: 15px; overflow: auto;"> <!-- 기존class - content -->
    <%-- ${list.size()} --%>
    
    	<!-- <div> -->
		<c:forEach items="${list}" var="chatMessageDto">

			<c:if test="${chatMessageDto.sender == 1}">
			<div class="chat_title title_admin">마이펫</div>
			</c:if>
			<c:if test="${chatMessageDto.sender == 0}">
			<div class="chat_title title_user">${chatMessageDto.user_id}님</div>
			</c:if>
			<%-- <div>${chatMessageDto.sender}</div> --%>
			
			<c:if test="${chatMessageDto.sender == 1}">
			<div class="chat_content content_admin">${chatMessageDto.content}</div>
			</c:if>
			
			<c:if test="${chatMessageDto.sender == 0}">
			<div class="chat_content content_user">${chatMessageDto.content}</div>
			</c:if>

			<div style="clear: both;"></div>
	
		</c:forEach>    
    
    </div>
    <!-- messages -->
        
        
        
        
        
        
        
        
        
        
        <div class="send">
			<table class="table table-bordered">
        		<tr>
        		 
					<td style="border-bottom-left-radius: 16px;"><input
						type="text" name="sender" id="sender" value="${sessionScope.id}"
						style="display: none;"></td>
					
					<!-- 오류나면 삭제하기 -->
					<%-- <td style="border-bottom-left-radius: 16px;"><input
						type="text" name="senderseq" id="senderseq" value="${chatMessageDto.seqUser}"
						style="display: none;"></td> --%>
					<!-- 여기까지 seqUser가져오려고 추가한 부분-->	
						
					<td><input type="text" id="messageinput" placeholder="대화내용을 입력하세요." class="chatfooter" ></td>
					
					<td style="border-bottom-right-radius: 16px;"><input
						type="button" name="sendBtn" class="sendBtn btn" id="sendBtn" value="보내기" onclick="send();"></td>
						<!-- <td><button type="button" onclick="javascript:clearText();">대화내용 지우기</button></td> -->
				</tr>
				
        
        
        	</table>
        	<%-- System.out.println(${id}); --%>
        </div>
        <!-- send -->   
        
    	<!-- <br/><br/><br/> -->
  
    </div>
    <!-- col-sm-12 col-md-9 -->
    </div>
    <!-- card -->
    </div>
    <!-- container -->
    
    
    
    
    
    
    
    
    
    
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
//            ws = new WebSocket("ws://localhost:8090/echo.do");
            //ws = new WebSocket("ws://localhost:8090/echo.action");
            ws = new WebSocket("ws://localhost:8090/mypet/member/echo.action");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
                writeResponse("채팅 종료");
            }
            
        }
        
        
        //메시지 보내기
        function send(){
           
           
           //이게 원본
           var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
           
           //오류나면 얘삭제하기
           /*   var text = document.getElementById("messageinput").value;
            var text2 = document.getElementById("sender").value; */ 
            
            
            //원본
            ws.send(text);
            text = "";
 
            //얘삭제
           /*   ws.send(text, text2);
            text = "";
            text2 = "";  */
        }
        
        
        
        
        function closeSocket(){
            self.close();
            ws.close();
        }
        
        //원본
         function writeResponse(text){
//            messages.innerHTML += "<br/>"+text;
//            messages.innerHTML += "<br/>"+ "<div style='font-weight: bold;'>" + text + "</div>";

			if (text.indexOf("님") != -1) {
	            messages.innerHTML += "<div style='font-weight: bold; margin-bottom:8px !important; text-align: right'>" + text + "</div>";

			} else if (text == "마이펫 채팅에 연결 되었습니다.") {
	            messages.innerHTML += "<div style='margin-bottom:15px; text-align: center'>" + text + "</div>";
	            
        	} else if (text.indexOf("마이펫") != -1) { //마이펫 단어가 있으면
        		messages.innerHTML += "<div style='font-weight: bold; margin-bottom:8px !important; text-align: left'>" + text.substr(0,3) + "</div>" + "<div style='margin-bottom: 15px; text-align: left; font-size: 14px; background-color: #F4F4F4; padding: 8px 8px; border-radius: 12px; width: fit-content; max-width: 260px; float: left;'>" + text.substr(3) + "</div> <div style='clear: both;'></div>";
        		
        	
        	 } else if (text.indexOf("마이펫") == -1) {
	            messages.innerHTML += "<div style='margin-bottom: 15px; text-align: right; font-size: 14px; background-color: #F4F4F4; padding: 8px 8px; border-radius: 12px; width: fit-content; max-width: 260px; float: right;'>" + text + "</div> <div style='clear: both;'></div>"; 				
			}
        
        }
        
         /* function writeResponse(text, text2){
//          messages.innerHTML += "<br/>"+text;
          messages.innerHTML += "<br/>"+ "<div>" + text2 + "</div>";
          messages.innerHTML += "<br/>"+ "<div>" + text + "</div>";
      }   */
        
        
        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}
        
        
        
        ////////////////////////////////////////////////////
        
        
        
  </script>
</body>
</html>
 