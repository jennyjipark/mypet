<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>

    /* content */
    #content{
        width: 1300px;
        margin: 0px auto;
        margin-top: 210px;
        padding: 20px 50px;
        /* border: 1px solid rgb(230,229,235); */
        border: 1px solid black;
       
        /* margin-right: px; */
    }

    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: 850px;
    }

    #contentnav {
        border: 1px solid black;
        width: 1200px;
        height: 100px;
        padding: 20px 20px;
    }
    
    /* 채팅아이콘 */
	 .chaticon {
		width: 70px;
		height: 70px;
		position: fixed;
		right: 5px;
		bottom: 5px;
		background-image: url('/mypet/resources/images/chat/chatimg.png');
		background-size: cover;
		background-position: 50% 50%;
		z-index: 100;
		cursor:pointer;
	} 
    
</style>

<div id="content">
	<div id="contentnav">개인 서브네비입니다.</div>
	메인 컨텐츠입니다.


<!-- 채팅 아이콘 -->
 <div class="chaticon" id="chaticon"></div> 

<script>
	
	/* 채팅 */
	var chaticon = document.getElementById("chaticon");

	var _width = '350';
	var _height = '600';

	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기.. 오른쪽 아래 하단에 두는건..? right=0 bottom=0으로 두는데 왜 안되지?? 차후 팝업위치 수정하겠습니다!
	var _left = Math.ceil(( window.screen.width - _width )/2);
	var _top = Math.ceil(( window.screen.width - _height )/2); 

	chaticon.onclick = function() {

	 	window.open("/mypet/member/chat.action", "a", "width=350, height=600"); 

	}	
</script>

</div>

