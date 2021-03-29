<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>MyPet::로그인</title>




<!--  이거는 스타일 수정 -->
<style>

body {
	background-color: #F0F0F0;
}

#content {
	font-size: 16px;
	border: 1px solid transparent !important;
	height: 1000px;
	
	width: 1300px;
    margin: 0px auto;
    margin-top: 210px;
    padding: 20px 50px;
        
        
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

#loginbox_admin {
 z-index: 6;
}

#loginbox_user {
position: relative;
    top: -700px;
    z-index: 5;
}
/* 
#loginbox_user {
 z-index: 6;
}

#loginbox_admin {
position: relative;
    top: -700px;
    z-index: 5;
} */



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

/* 유저 로그인버튼 */
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

/* 관리자 로그인버튼 */
#btn-login2 {
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

/* 관리자 로그인 타이틀 */
#title2 {
	left: -40px;
    position: relative;
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

.login_type {
	font-family: NanumSquare;
	color: #444;
	font-size: 12px;
	position: relative;
	top: -15px;   
    width: 100%;
    text-align: right;
    left: -40px;
    cursor: pointer;
}

/* 임시 로그인키 */
.temp {
	position: relative;
    top: -780px;
    left: 720px;
}

/* 채팅아이콘 */
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

<div id="content">

		<div class="loginbox" id="loginbox_admin">
		
		<form action='/mypet/member/login_admin.action' method="post" id="form_admin" name="form_admin">
		<div class="loginbox2">
			<div class="login-title" id="title2">
				<span class="logo"></span>관리자로그인
			</div>
			<div class="inputs">
			<input type="text" class="form-control readonly" id="id_admin" name="id" placeholder="아이디" required></div>
			<div class="inputs">
			<input type="password" class="form-control readonly" id="pw_admin" name="password" placeholder="패스워드" required></div>
	
			<input type="submit" class="btn btn-outline-secondary" type="button"
				id="btn-login2" value="로그인">
		</div>
		</form>
		
		<div class="login_type" id="login_user">회원 로그인</div>

	</div>


	<div class="loginbox" id="loginbox_user">
	<%-- <c:if test="${member == null}"> --%>

		<form action='/mypet/member/login.action' method="post" id="form_user" name="form_user">
		<div class="loginbox2">
			<div class="login-title">
				<span class="logo"></span>로그인
			</div>
			<div class="inputs">
			<input type="text" class="form-control readonly" id="id" name="id" placeholder="아이디" required></div>
			<div class="inputs">
			<input type="password" class="form-control readonly" id="pw" name="password" placeholder="패스워드" required></div>
	
			<div class="search">
				<a href="">아이디 찾기</a> <span>|</span> <a href="">비밀번호 찾기</a> <span>|</span> <a href="/mypet/member/register2.action">회원가입</a>
			</div>
	
	
			<input type="submit" class="btn btn-outline-secondary" type="button"
				id="btn-login" value="로그인">
		</div>
		
		
		</form>
		
		<div class="login_type" id="login_admin">관리자 로그인</div>
		
		</div>

	 <div class="temp">
		<button onclick="temp_loginuser('red1234','rkskek1234');" style="background-color: #F6DA42; color: white; outline: none; font-family: 'Jal_Onuel'; border:none; padding:10px;">
			김지수(회원)
		</button>
		<button onclick="temp_loginadmin('Administrator1','rhksflwk1');" style="background-color: #F6DA42; color: white; outline: none; font-family: 'Jal_Onuel'; border:none; padding:10px;">
			관리자
		</button>
	</div> 


	<div class="chaticon" id="chaticon"></div>






<script>

/* 채팅 */
var chaticon = document.getElementById("chaticon");

chaticon.onclick = function() {

 	window.open("/mypet/member/chat.action", "a", "width=350, height=600"); 

}


/* var _left = Math.ceil(( window.screen.width - _width )/2);
var _top = Math.ceil(( window.screen.width - _height )/2); 
 */


/* 로그인 타입 바꾸기 */
var login_admin = document.getElementById("login_admin");
var login_user = document.getElementById("login_user");

var loginbox_user = document.getElementById("loginbox_user");
var loginbox_admin = document.getElementById("loginbox_admin");



login_admin.onclick = function() {
	loginbox_admin.style.visibility = 'visible';
	loginbox_user.style.visibility = 'hidden';	
}

login_user.onclick = function() {
	loginbox_user.style.visibility = 'visible';	
	loginbox_admin.style.visibility = 'hidden';
}


/* 로그인 임시 키 */
function temp_loginuser(id, password) {
	$("#id").val(id);
	$("#pw").val(password);
	$("#form_user").submit();
}

function temp_loginadmin(id, password) {
	$("#id_admin").val(id);
	$("#pw_admin").val(password);
	$("#form_admin").submit();
}

</script>


</div>