<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

/* 폰트 임시 */
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
.nanumsquare {
    font-family: 'NanumSquare', sans-serif !important;
}


/* 바디역할 div 관련 css 시작*/
#bodydiv {
	/* border: 1px solid black; */
	width: 1300px;
	margin: auto;
	padding-top: 150px;
	font-family: 'NanumSquare', sans-serif !important;
	font-size: 16px;
	color: #301B01;
}
/* 바디역할 div 관련 css 끝 */


/* 머릿글 관련 css 시작 */

#hd1 {
	font-family: 'Jal_Onuel';
	font-size: 24px;
	margin-top: 150px;
	margin-bottom: 30px;
	text-align: center;
}
#hd1 > span {
	padding-right: 20px;
}

#h2 {
	font-size: 16px; 
	color: #F9820F;
	display: block;
}

.exptxt {
	text-align: center;
	font-size: 16px;
	color: #aaa;
}

/* 머릿글 관련 css 끝 */

/* 궁서체 쓸 곳 */
.infobox {
	margin: auto;
	width: 800px;
	height: 500 px;
	border: 5px solid #166517;
	border-radius: 10px;
	
	box-shadow: 5px 5px 5px 5px gray;
	margin-bottom: 100px;
}

.imptext {
	font-size: 24px;
	text-align: center;
	font-weight: bold;
	color: #166517;
	font-family: 'MapoGoldenPier';
	padding: 20px;
}
.graything {
	text-align: left;
	color: #999;
	font-size: 16px;
	font-family: 'NanumSquare', sans-serif !important;
	padding: 10px;
}

/* 캐러셀 CSS 시작 */

.carousel-indicators li {
    display: inline-block;
    text-indent: 0;
    cursor: pointer;
    border: none;
    border-radius: 50%;
    background-color: #dcdbd6;
    box-shadow: inset 1px 1px 1px 1px rgba(0,0,0,0.5);
    width: 12px;
    height: 12px;
}
.carousel-indicators .active {
    background-color: #f6da42;
    margin: 1px;
}

.carousel-inner img {
	opacity: .5;
}
.carousel-inner img:hover {
	opacity: 1;
	cursor: pointer;
}

/* 캐러셀 CSS 끝 */



.btnself {
	font-family: 'Jal_Onuel';
	background-color: #b27208;
	color: white;
} 

.btnself:hover {
	background-color: #b27208;
	color: white;
}


</style>

<!-- 바디역할 div 시작 -->
<div id="bodydiv">
	
	<!-- form 태그 시작 -->
	<!-- <form method="POST" action=""> -->
	
	
	<div class="page-header" id="hd1">접수 완료</div>
	
	<div class="infobox">
		<div class="imptext">입양예약신청서 접수가 완료 되었습니다.</div> 
		<div class="imptext">검토 후 결과 반영하겠습니다.</div>
		<div class="imptext" style="margin-bottom: 50px;">결과는 <a href="/mypet/mypage/reservationlist.action">마이페이지</a>에서 확인하세요.</div>
		<div>
			<div class="imptext graything"></div>
			<div class="imptext graything">※ 입양예약 후 절차 안내</div>
			<div class="imptext graything"> - 입양예약신청서 접수 후 입양업무 담당자가 서류심사를 한 후 예약 상태를 승인 시 예약완료 / 거절 시 예약거절로 바꿉니다. ( 마이페이지 > 입양예약진행현황 에서 확인 가능.)</div>
			<div class="imptext graything"> - 입양이 결정된 경우, 보호소 방문 시 신분증과 입양동물의 운송에 필요한 물품(이동가방, 목걸이, 리드줄 등)을 지참하시고, 오후 4시(일요일 및 공휴일 제외)까지 방문해 주셔야 합니다.</div>
			<div class="imptext graything"> - 문의사항은 보호소, 동물병원에 직접 연락하셔도 상담 도와 드리겠습니다.</div>
			<div class="imptext graything"> - <a href="/mypet/board/faqList.action">FAQ 게시판</a>에서도 자주 묻는 질문 확인이 가능합니다.</div>
			<div class="imptext graything"></div>
		</div>
		
	</div>
	
	<div id="hd1">
		판매중인 굿즈 상품
	</div>
	<div class="exptxt"><small>굿즈 판매 수익은 보호동물에게 사용됩니다.</small></div>
	<div class="exptxt"><small>굿즈 구매로 보호동물들을 도와주세요.</small></div>
	
	<!-- 캐러셀 시작 -->
	<div style="width:254px; height:301px; margin:auto;">
		
		<!-- 가운데 o 모양 페이지 표시 -->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" alt="1">
				<c:forEach items="${glist}" var="dto" varStatus="status">
				<div class="item <c:if test="${status.index==0}">active</c:if>" >
					<img src="/mypet/resources/images/goods${dto.image}" >
					<div class="carousel-caption" style="color: #444"><a href="/mypet/goods/goods.action?seqGoods=${dto.seqGoods}">${dto.name}</a></div>
				</div>
				</c:forEach>
			</div>
	
			<!-- 좌 / 우 버튼 -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	<!-- 캐러셀 끝 -->
	</div>
	
	<!-- 버튼 -->
	<div id="btnwrap" style="padding-bottom: 100px; text-align: center;">
		<!-- <button type="submit" class="btn btn-warning">예약 신청하기</button> -->
		<button type="button" class="btn btnself" id="btn1" onclick="location.href='/mypet/goods/list.action';">더 많은 굿즈 보러가기</button>
	</div>
	
	<hr style="margin: 50px;">
	
	<!-- form태그 끝 -->
	<!-- </form> -->
	
 <!-- 바디역할 끝 -->
</div>

<script>
	
	
</script>



	