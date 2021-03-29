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
	margin-top: 200px;
	padding: 20px 50px;
	/* border: 1px solid rgb(230,229,235); */
	border: 1px solid transparent;
}

/* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
#content {
	height: 1700px;
}

/* 제목 */
.table {
	/* border: 1px solid black; */
	/* 버튼 아래 있을 때 */
	/* margin-top: 170px; */
	/* 버튼 위에 있을 때 */
	margin-top: 20px;
	font-size: 16px;
	ont-family: 'NanumSquare';
	color: #301b01;
}

table>tbody>tr>.firstth {
	padding: 10px;
	border-right: 1px solid #e8e8e8;
	text-align: center;
	background-color: #f9f9f9;
}

table>tbody>tr>.firsttd {
	padding: 10px 15px;
}

.firstth {
	width: 150px;
	padding: 10px;
}

.board-content {
	min-height: 300px;
}

/* 버튼 공통 클래스 */
.btn {
	font-family: 'NanumSquare';
}

.userbtn {
	
	position: relative;
    margin-bottom: 10px;
    left: 1130px;
}
}

}
.btn-group {
	/* 
    	아래 있을 때
    	margin-top: 20px;
        margin-bottom: 50px;
        margin-left: 1050px; */
	/* 위에 있을 때 */
	margin-top: 130px;
	/* margin-bottom: 50px; */
	margin-left: 1000px;
	
}

.btns1 {
	left: 1010px;
}

.common-btn {
	background-color: #b27208;
	color: white;
	float: left;
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

.board-btn>input:nth-child(1) {
	margin-left: 1060px;
}

/* 이미지 */
.imgbox {
	margin: 15px auto;
	width: 100%;
	text-align: center;
}

/* 삭제 모달 */
.modal-header {
	min-height: 16.42857143px;
	padding: 15px;
	border-bottom: 1px solid #e5e5e5;
	background-color: #F6DA42;
	font-family: 'Jal_Onuel';
}

.modal-body {
	position: relative;
	padding: 15px;
	font-family: 'NanumSquare';
	text-align: center;
}

.modal-footer {
	padding: 15px;
	text-align: center;
	border-top: 1px solid #e5e5e5;
	color: white;
}

.spon_modalbtn_save {
	background-color: #B27208;
	font-family: 'Jal_Onuel';
}

.spon_modalbtn_false {
	background-color: #FAB018;
	font-family: 'Jal_Onuel';
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
	cursor: pointer;
}
</style>


<div id="content">

	<c:if test="${id == 'Administrator1'}">
		<div class="btn-group btns1">
			<input type="button" class="btn common-btn"
				onclick="location.href='/mypet/board/noticeList.action';" value="목록">
			<input type="button" class="btn common-btn" value="수정"> <input
				type="button" class="btn common-btn act-del" data-toggle="modal"
				data-target="#act_delete" value="삭제">
		</div>
	</c:if>

	<c:if test="${id != 'Administrator1'}">
		<div class="btn-group2">
			<input type="button" class="btn common-btn userbtn"
				onclick="location.href='/mypet/board/noticeList.action';" value="목록">
		</div>
	</c:if>

	<table class="table table-condensed">
		<tr class="headtr">
			<td class="firstth" colspan="1">제목</td>
			<td class="firsttd" colspan="9">${ndto.title}</td>
		</tr>
		<tr class="headtr">
			<td class="firstth" colspan="1">작성일</td>
			<td class="firsttd" colspan="9">${ndto.writeDate}</td>
		</tr>
		<tr class="headtr">
			<td class="firstth" colspan="1">조회수</td>
			<td class="firsttd" colspan="9">${ndto.viewCount}</td>
		</tr>

		<%-- <c:if ${ndto.image != null} > --%>
		<c:if test="${ndto.image != null}">
			<tr class="headtr" style="border-bottom: none;">
				<td class="firsttd" colspan="10"
					style="padding: 30px 50px; border-bottom: 1px solid transparent;">
					<div class="imgbox">
						<img class="image"
							src="/mypet/resources/images/notice${ndto.image}" alt="noticeimg">
					</div>
				</td>
			</tr>
		</c:if>

		<tr class="headtr">
			<td class="firsttd" colspan="10" style="padding: 30px 50px">
				<div class="board-content">${ndto.content}</div>
			</td>
		</tr>



		<!-- 첨부파일?! -->
		<!-- <tr class="headtr">      	
        		<td class="firstth" colspan="1">첨부파일</td>
        		<td class="firsttd" colspan="9">일단 넣었습니다~</td>
        	</tr>
 -->

		<tr class="headtr">
			<td class="firstth" colspan="1">이전글</td>
			<c:if test="${ndto.seqNotice!=1}">
				<td class="firsttd" colspan="9"><a
					href="/mypet/board/noticeView.action?seqNotice=${ndto.seqNotice-1}">이전글로
						가기</a></td>
			</c:if>
			<c:if test="${ndto.seqNotice==1}">
				<td class="firsttd" colspan="9">이전글이 존재하지 않습니다.</td>
			</c:if>
		</tr>
		<tr class="headtr">
			<td class="firstth" colspan="1"
				style="border-bottom: 1px solid #e8e8e8">다음글</td>
			<c:if test="${ndto.lseq!=ndto.seqNotice}">
				<td class="firsttd" colspan="9"
					style="border-bottom: 1px solid #e8e8e8"><a
					href="/mypet/board/noticeView.action?seqNotice=${ndto.seqNotice+1}">다음글로
						가기</a></td>
			</c:if>
			<c:if test="${ndto.lseq==ndto.seqNotice}">
				<td class="firsttd" colspan="9"
					style="border-bottom: 1px solid #e8e8e8">다음글이 존재하지 않습니다.</td>
			</c:if>
		</tr>

	</table>

	<%-- <c:if test="${ndto.prevNum ne 0 }">
			<a href="detail.action?seqNotice=${ndto.prevNum}">이전글</a>
		</c:if> 
		
		<c:if test="${ndto.nextNum ne 0 }"> 
			<a href="detail.action?seqNotice=${ndto.nextNum}">다음글</a>
		</c:if>	  --%>


	<!-- <div class="btn-group">
        	<input type="button" class="btn common-btn" value="목록">
    		<input type="button" class="btn common-btn" value="수정">
        	<input type="button" class="btn common-btn" value="삭제">
    	</div> -->


	<!-- <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기"></div> -->

</div>

<div class="modal fade" id="act_delete" tabindex="-1" role="dialog"
	aria-labelledby="spon_modal" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				삭제하시겠습니까?
			</div>
			<div class="modal-body">${ndto.title} 를 삭제 하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn spon_modalbtn_save paycheck"
					onclick="location.href='/mypet/board/noticeList.action';">삭제</button>
				<button type="button" class="btn spon_modalbtn_false"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>



<div class="chaticon" id="chaticon"></div>
<script>
	window.onload = function() {

		if ($(".image").width() > 600) {
			$(".image").width(1000);
		}
	}

	/* 채팅 */
	var chaticon = document.getElementById("chaticon");

	chaticon.onclick = function() {

		window.open("/mypet/member/chat.action", "a", "width=350, height=600");

	}
</script>
