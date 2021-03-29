<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>MyPet::관리자로그인</title>




<!--  이거는 스타일 수정 -->
<style>

body {
	background-color: #F0F0F0;
}

#content {
	font-size: 16px;
	border: 1px solid transparent !important;
}


/* Auth css */
.loginbox {
	/* border: 1px solid #e2e2e2; */
	height: 600px;
	margin: 100px auto;
	padding: 50px 40px;
	width: 600px;
	border-radius: 30px;
	/* margin-left: 60px; */
	/* box-shadow: 0px 5px 15px #e4e4e4; */
	box-shadow: rgba(81, 99, 120, 0.3) 0px 6px 60px 0px;
	background-color: white;
	font-family: NanumSquare;
	
}

.loginbox2 {
	margin: 25px auto;
	width: 450px;
	position: relative;
	
}

.loginbox>input {
	margin-bottom: 20px;
}

 .form-control {
	width: 100%;
	height : 5rem;
	position: relative;
	margin-bottom: 10px;
	font-size: 16px;
}

.inputs {
	width: 100%;
	display: inline-block;
	
}

#btn-login {
	/* margin-left: 120px; */
	display: inline-block;
	margin-top: 20px;
	width: 100%;
	background-color: #F6DA42;
	color: white;
	font-family: 'Jal_Onuel';
	height: 5rem;
	font-size: 16px;
}

.login-title {	
    width: 100%;
    height: 80px;
    margin-bottom: 10px;
	padding-left: 10px;
	font-size: 35px;
	font-family: 'Jal_Onuel';
	color: #F6DA42;
	margin-left: 100px;
	margin-top: 70px;
}

 .login-title>span {
	display: block;
	float: left;
	margin-top: -15px;
}

.logo {
	/* border: 1px solid black; */
	width: 80px;
	height: 80px;
	float: left;
	/* margin-left: 30px; */
	background-image: url('/mypet/resources/images/logo.png');
	background-size: cover;
	background-position: 50% 50%;
	margin-right: 10px;
}

.search {
	/* border: 1px solid black; */
	width: 100%;
	height: 4rem;
	text-align: center;
	font-family: NanumSquare;
	padding: 10px;
	
}

.search>a {
	color: #202020;
}

.search>span {
	margin: 0px 10px;
	color: #cacaca;
}

.chaticon {
	/* border: 1px solid black; */
	width: 70px;
	height: 70px;
	position: fixed;
	right: 5px;
	bottom: 5px;
	/* margin-left: 30px; */
	background-image: url('/mypet/resources/images/chat/chatimg.png');
	background-size: cover;
	background-position: 50% 50%;
	/* margin-right: 10px; */
	z-index: 100;
	cursor:pointer;
}



</style>

<!-- 요 칸안에 내용작성하세요 -->
<div id="content">

	<div class="loginbox">
	<%-- <c:if test="${member == null}"> --%>

		<form action='/mypet/member/login.action' method="post">
		<div class="loginbox2">
			<div class="login-title">
				<span class="logo"></span>로그인
			</div>
			<div class="inputs">
			<input type="text" class="form-control readonly" id="id" name="id" placeholder="아이디" required></div>
			<div class="inputs">
			<input type="password" class="form-control readonly" id="pw" name="password" placeholder="패스워드" required></div>
	
			<div class="search">
				<a href="/#">아이디 찾기</a> <span>|</span> <a href="/#">비밀번호 찾기</a> <span>|</span> <a href="/#">회원가입</a>
			</div>
	
	
			<input type="submit" class="btn btn-outline-secondary" type="button"
				id="btn-login" value="로그인">
		</div>
		</form>
		<%-- </c:if> --%>
		
		
		
		
		<!--  -->
		<%-- <c:if test="${member != null}">
		<c:redirect url="/mypet/member/register.action"></c:redirect>
		</c:if> --%>



		
		






		<!-- 테스트용 -->
		<!-- <button type="button" class="btn" onclick="test('ccu7678','ccu7678nt');">이제위</button> -->

		<%-- <div>${empty id ? "익명" : id}</div> --%>

		<!-- <div><a href="/mypet/member/logout.action">로그아웃</a></div> -->

	</div>

	<!-- <div>
		<button>
			<a href="/mypet/member/login.action?id=hong">홍길동</a>
		</button>
	</div> -->


	<div class="chaticon" id="chaticon"></div>






<script>

/* 채팅 */
var chaticon = document.getElementById("chaticon");

var _width = '350';
var _height = '600';

// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기.. 오른쪽 아래 하단에 두는건..? right=0 bottom=0으로 두는데 왜 안되지??
var _left = Math.ceil(( window.screen.width - _width )/2);
var _top = Math.ceil(( window.screen.width - _height )/2); 

chaticon.onclick = function() {

 	window.open("/mypet/member/chat.action", "a", "width=350, height=600"); 

}

</script>


</div>