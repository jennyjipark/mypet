<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>MyPet::공지사항</title>
<style>
body {
	font-family: 'NanumSquare';
}

#content {
	width: 1300px;
	margin: 0px auto;
	margin-top: 150px;
	padding: 20px 50px;
	/* border: 1px solid rgb(230,229,235); */
	border: 1px solid transparent;
}

/* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
#content {
	height: 1000px;
}

.board-name {
	/* border: 1px solid black; */
	display: block;
	text-align: center;
	margin-top: 130px;
	margin-bottom: 50px;
	font-size: 30px;
	font-family: 'Jal_Onuel';
	/* font-family: 'NanumSquare';
        font-weight: bold; */
	color: #301b01;
}

/* 테이블 css */
table {
	font-size: 16px;
}

.tr2:hover {
	background-color: #F6DA42;
}

.firsttd {
	width: 100px;
	text-align: center;
}

.sectd {
	width: 600px;
	text-align: center;
}

.thirdtd {
	width: 200px;
	text-align: center;
}

.fourthtd {
	width: 100px;
	text-align: center;
}

/* 번호, 날짜, 조회수 */
.tr2>td:nth-child(1), td:nth-child(3), td:nth-child(4) {
	text-align: center;
}

/* 제목 */
.headtr>td:nth-child(2) {
	text-align: left;
}

/* 검색창 & 버튼 박스 */
.pageSearch {
	/* border: 1px solid black; */
	width: 1200px;
	height: 130px;
	margin-top: 50px;
	padding: 0px 360px;
}

a {
	color: #222;
}

a:hover {
	color: #222;
	text-decoration: none;
}

/* 게시판 검색창 공통 클래스 */
.search-text {
	width: 340px;
	float: left;
	margin-right: 20px;
	font-size: 16px;
}

/* 버튼 공통 클래스 */
.btn {
	font-family: 'Jal_Onuel';
	cursor: pointer;
}

.common-btn {
	background-color: #b27208;
	color: white;
	float: right;
	margin-right: 10px;
	font-family: 'Jal_Onuel';
}

.common-btn:hover {
	color: white;
	outline: none;
}

.common-btn:active {
	outline: none !important;
}

/* 검색결과 */
#searchResult {
	width: auto;
	position: relative;
	margin-top: 20px;
	display: inline-block;
	left: -40px;
}

/* 목록 */
#basic-addon4 {
	outline: none;
	position: relative;
	float: right;
	top: -58px;
	left: -135px;
	width: 65px;
}

/* 페이지바 */
.pagination {
	/* width: 700px; */
	height: 40px;
	margin: 20px auto;
}

.pagination>li>a {
	border-color: #ccc;
	color: #301b01;
	font-size: 16px;
	float: left;
}

.pagination>.active>a {
	background-color: #b27208;
	border-color: #b27208;
}

.pagination>li>a:hover {
	background-color: #b27208;
	color: white;
}

.board-btn {
	/*  border: 1px solid black; */
	height: 50px;
}

.board-btn>input:nth-child(1) {
	margin-left: 1060px;
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
	<span class="board-name">공지사항</span>

	<%-- <c:if test="${not empty search}">
		<div class="message well well-sm" id="searchResult">
			'${search}'(으)로 ${noticeList.size()}건의 게시물을 검색했습니다.
		</div>
	</c:if> --%>

	<div class="board-btn">
	
		<c:if test="${id == 'Administrator1'}">
		<input type="button" class="btn common-btn" value="글쓰기" onclick="location.href='/mypet/board/noticeWrite.action';"> 
		<!-- <input type="button" class="btn common-btn" value="삭제"> -->
		</c:if>
	</div>
	<table class="table table-condensed">
		<tr class="headtr">
			<th class="firsttd">번호</th>
			<th class="sectd">제목</th>
			<th class="thirdtd">날짜</th>
			<th class="fourthtd">조회수</th>
		</tr>
		
		<%-- <c:if test="${noticeList.size() == 0}">
			<tr>
				<td colspan="5" style="text-align: center;">게시물이 없습니다.</td>
			</tr>
		</c:if> --%>
		<c:forEach items="${noticeList}" var="noticeDTO">
			<tr class="tr2">
				<td>${noticeDTO.seqNotice}</td>
				<td><a
					href="/mypet/board/noticeView.action?seqNotice=${noticeDTO.seqNotice}">${noticeDTO.title}</a></td>
				<td>${fn:substring(noticeDTO.writeDate,0,10)}</td>
				<td>${noticeDTO.viewCount}</td>
			</tr>
		</c:forEach>

	</table>

	<div class="pageSearch">
		<!-- 페이지바 -->
		<div style="text-align: center;">
			<nav class="pagebar">
				<ul class="pagination" id="page_bar">${pagebar}
				</ul>
			</nav>
		</div>
		<div style="width: 100%;">
			<button type="button" class="btn btn-default" id="basic-addon4"
				onclick="location.href='/mypet/board/noticeList.action';">목록</button>
		</div>
		<div style="clear: both;"></div>

		<!-- 검색창 : 시간되면 추가해보기.. -->


	<%-- 	<form id="searchForm" method="GET"
			action="/mypet/board/noticeList.action">

			<input type="textbox" class="form-control search-text"
				placeholder="제목, 내용을입력해주세요." id="search" name="search" required
				value="${search}"> <input type="button"
				class="btn common-btn" value="검색"
				onclick="$('#searchForm').submit();">
		</form>
		<div style="clear: both;"></div> --%>

	</div>
</div>



<div class="chaticon" id="chaticon"></div>
<script>


/* 채팅 */
var chaticon = document.getElementById("chaticon");

chaticon.onclick = function() {

 	window.open("/mypet/member/chat.action", "a", "width=350, height=600"); 

}
	
</script>
