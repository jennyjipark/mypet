<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>MyPet::마이펫 소개</title>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->

<style>

/* content */
#content {
	width: 100%;
	margin: 0px auto;
	margin-top: 180px;
	/* padding: 20px 50px; */
	/* border: 1px solid rgb(230,229,235); */
	height: 1200px;
	padding: 0 !important;
	border: 1px solid transparent !important;
	font-family: NanumSquare;

	/* margin-right: px; */
}

/* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
#content {
	height: 2800px;
}

.section1 {
	/* background-image: url('/mypet/resources/images/introduce/intro1.jpg'); */
	/* background-size: cover;
	background-position: 50% 50%; */
	height: 800px;
	width: 100%;
	position: relative;
	margin-bottom: 300px;
}

.introtxt {
	
}

.intro1 {
	position: relative;
	width: 100%;
}

.txt1 {
	position: absolute;
	top: 300px;
	font-weight: bold;
	font-size: 35px;
	letter-spacing: -2px;
	padding-left: 30px;
}

.txt2 {
	position: absolute;
	top: 410px;
	letter-spacing: -2px;
	padding-left: 31px;
	font-size: 18px;
}

.txt3 {
	font-family: 'Jal_Onuel';
	font-size: 4rem;
	width: 100%;
	text-align: center;
}

.txt4 {
	/* font-family: NanumSquare; */
	font-family: 'Jal_Onuel';
	font-size: 30px;
	display: inline-block;
	position: relative;
	/* font-weight: bold; */
}

.txt4-1 {
	margin-left: 80px;
}

.txt4-2 {
	margin-right: 80px;
	text-align: right;
	left: 570px;
}

.txt4-3 {
	margin-left: 80px;
}

.txt5 {
	font-family: 'NanumSquare';
	font-size: 20px;
	display: inline-block;
	position: relative;
}

.txt5-1 {
	top: 80px;
	left: -240px;
}

.txt5-2 {
	top: 80px;
	text-align: right;
	left: -90px;
}

.txt5-3 {
	top: 80px;
	lfet: -50px;
	left: -440px;
}

#txt5-1 {
	visibility: hidden;
}

#txt5-2 {
	visibility: hidden;
}

#txt5-3 {
	visibility: hidden;
}

.txt3box {
	background: linear-gradient(103deg, #FAB018 0%, rgb(255, 179, 38) 50%,
		#F6DA42) 100% center;
	/* box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px 0px; */
	border: none;
	height: 20px;
	width: 500px;
	position: relative;
	float: left;
	text-align: center;
	border-radius: 50px;
	display: inline-block;
	margin-bottom: 150px;
	left: 800px;
}

.section2 {
	width: 100%;
}

.intro2 {
	/* border-top-right-radius: 50%;
    	border-bottom-right-radius: 50%; */
	border-radius: 50%;
}

.text-effect p {
	display: inline-block;
	margin: 0;
	letter-spacing: 5px;
	opacity: 0;
	transition: 0.8s all;
}

.img {
	border: none;
	box-shadow: 0 20px 20px rgba(0, 0, 0, 0.2), 0px 0px 50px
		rgba(0, 0, 0, 0.2);
}

.img1 {
	border-radius: 80% 60% 65% 60%/80% 65% 65% 60%;
}

.img2 {
	border-radius: 40% 60% 65% 35%/40% 45% 55% 60%;
}

.img3 {
	border-radius: 80% 60% 65% 60%/60% 60% 75% 75%;
}

.section2img {
	/* float: left; */
	position: relative;
	margin-bottom: 50px;
	padding: 0 100px;
	display: inline-block;
}

.imgbox1 {
	float: left;
}

.imgbox2 {
	float: right;
}

.imgbox3 {
	float: left;
}

.cicle {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: none;
	position: relative;
	padding-bottom: px;
	display: inline-block;
	float: left;
}

.cicle1 {
	background-color: #F6DA42;
	left: 870px;
	top: 130px;
}

.cicle2 {
	background-color: #F6DA42;
	top: 105px;
	float: left;
	left: 565px;
	top: 105px;
}

.cicle3 {
	background-color: #F6DA42;
	float: left;
	top: 130px;
	left: -1 -300px;
	left: 1065px;
}

.change1 {
	background-color: #FAB019;
}

.change2 {
	background-color: #F6DA42;
}

.section3 {
	width: 100%;
	margin-top: 120px;
	margin-bottom: 50px;
	padding-left: 100px;
	padding-right: 100px;
}

#map {
	position: relative;
	/* float: left; */
	width: 800px;
	height: 500px;
	margin: 0 auto;
}

.txt6title {
	font-family: 'Jal_Onuel';
    font-size: 30px;
    display: inline-block;
    position: relative;
    border-bottom: 1px solid #ccc;
    width: 100%;
    margin-bottom: 20px;
}

.txt6 {
	/* margin-left: 30px; */
	font-family: NanumSquare;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 10px;
}

.txt6 span   {
	font-weight: normal;
		font-family: NanumSquare;
	font-size: 16px;
}

.txt6-root {
    font-family: NanumSquare;
    font-size: 16px;
    position: relative;
    width: max-content;
    margin: 0 auto;
}

.txt6box {
	width: 100%;
	margin: 50px auto;
	/* left: 500px; */
	position: relative;
	display: inline-block;
}

/* 채팅 */
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

	<div class="section1" style="float: left;">
		<div style="position: relative; width: 100%;">
			<img src="/mypet/resources/images/introduce/intro1_1.jpg"
				style="width: 100%; margin-bottom: 15px;" class="intro1">
		</div>
		<div class="introtxt txt1">
			사지않고 입양하는 문화가<br>유기 동물에게 더 나은 내일을 선물합니다.
		</div>
		<div class="introtxt txt2">
			마이펫은 유기 동물 입양을 장려합니다.<br>새 가족을 맞이하는 여러분의 시작을 마이펫이 함께하겠습니다.
		</div>

	</div>

	<div class="section2" style="float: left;">

		<div class="txt3">안녕하세요! 마이펫은 이런 곳입니다:)</div>
		<div class="txt3box"></div>
		<div style='clear: both;'></div>
		<div class="section2img imgbox1">
			<img src="/mypet/resources/images/introduce/pet1.jpg"
				style="width: 500px; margin-bottom: 15px;" class="img img1"
				id="img1"> <span class="txt4 txt4-1">유기동물 입양 지원</span>
			<div class="cicle cicle1" id="cicle1"></div>
			<div class="txt5 txt5-1" id="txt5-1">
				마이펫은 전국 약 150여개의 보호소와 함께하며<br>매년 1만 마리 이상의 유기동물에게 가족을 찾아주고
				있습니다.
			</div>
		</div>
		<div style='clear: both;'></div>
		<div class="section2img imgbox2">
			<div class="cicle cicle2" id="cicle2"></div>
			<span class="txt4 txt4-2">보호소 봉사활동 연결</span> <span
				class="txt5 txt5-2" id="txt5-2">매년 200명 이상의 자원봉사자들이 봉사활동에
				참여하고 있으며,<br>300건 이상의 보호센터 봉사활동이 진행되고 있습니다.
			</span> <img src="/mypet/resources/images/introduce/pet2.jpg"
				style="width: 500px; margin-bottom: 15px;" class="img img2"
				id="img2">
			<!-- onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" -->
		</div>
		<div style='clear: both;'></div>
		<div class="section2img imgbox3">
			<img src="/mypet/resources/images/introduce/pet3.jpg"
				style="width: 500px; margin-bottom: 15px;" class="img img3"
				id="img3"> <span class="txt4 txt4-3">굿즈 판매 수익 전액 보호 단체
				기부</span>
			<div class="cicle cicle3" id="cicle3"></div>
			<div class="txt5 txt5-3" id="txt5-3">
				2011년부터 꾸준하게 마이펫 자체 굿즈를 제작해<br>수익 전액을 유기동물 보호단체에 기부하고 있습니다.
			</div>
		</div>
		<!-- <div style='clear: both;'> -->
	</div>

	<div class="section3" style="float: left;">

		<div class="txt6title">MYPET INFO</div>
		<div id="map"></div>
		<div class="txt6box">
			<div class="txt6">
				마이펫 본사 위치 : <span>서울시 강남구 역삼동 한독빌딩 8층</span>
			</div>
			<div class="txt6">
				고객센터 : <span>1234-5678</span>
			</div>
			<div class="txt6">찾아오시는 길</div>
			<div class="txt6-root">[지하철 이용시] 2호선 역삼역: 3번출구 도보 3분, 2호선 강남역: 1번출구 도보 5분 거리</div>
			<div class="txt6-root">[버스 이용시] 역삼역 하차: N13, N61, 146, 641, 360, 740, 6000, 6200,
				1100, 1700, 2000, 2000-1, 7007, 8001</div>

		</div>
	</div>










	<div class="chaticon" id="chaticon"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5491549c7f46e20fdab36fe992ee8936"></script>
	<script>
		/* 지도 */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.49931560310978,
					127.03318357587605), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.49931560310978,
				127.03318357587605);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;"><b>마이펫 본사</b><br>Tel.1234-5678</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(37.49931560310978,
				127.03318357587605); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);

		/* 채팅 */
		var chaticon = document.getElementById("chaticon");

		var _width = '350';
		var _height = '600';

		// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기.. 오른쪽 아래 하단에 두는건..? right=0 bottom=0으로 두는데 왜 안되지??
		var _left = Math.ceil((window.screen.width - _width) / 2);
		var _top = Math.ceil((window.screen.width - _height) / 2);

		chaticon.onclick = function() {

			window.open("/mypet/member/chat.action", "a",
					"width=350, height=600");

		}

		/* 이미지 효과 */
		var txt1 = document.getElementById('txt5-1');
		var txt2 = document.getElementById('txt5-2');
		var txt3 = document.getElementById('txt5-3');

		var img1 = document.getElementById('img1');
		var img2 = document.getElementById('img2');
		var img3 = document.getElementById('img3');

		var cicle1 = document.getElementById('cicle1');
		var cicle2 = document.getElementById('cicle2');
		var cicle3 = document.getElementById('cicle3');

		/* function zoomIn(event) {
			event.target.style.transform = "scale(1.15)";
			event.target.style.zIndex = 1;
			event.target.style.transition = "all 0.5s";

		}

		function zoomOut(event) {
			event.target.style.transform = "scale(1)";
			event.target.style.zIndex = 0;
			event.target.style.transition = "all 0.5s";
		} */

		img1.onmouseenter = function() {
			img1.style.transform = "scale(1.15)";
			img1.style.zIndex = 1;
			img1.style.transition = "all 0.5s";

			txt1.style.visibility = 'visible';
			txt2.style.visibility = 'hidden';
			txt3.style.visibility = 'hidden';

			$("#cicle1").addClass("change1");
			$("#cicle1").removeClass("change2");
		}

		img1.onmouseleave = function() {
			img1.style.transform = "scale(1)";
			img1.style.zIndex = 0;
			img1.style.transition = "all 0.5s";

			txt1.style.visibility = 'hidden';

			$("#cicle1").addClass("change2");
			$("#cicle1").removeClass("change1");
		}

		img2.onmouseenter = function() {
			img2.style.transform = "scale(1.15)";
			img2.style.zIndex = 1;
			img2.style.transition = "all 0.5s";

			txt1.style.visibility = 'hidden';
			txt2.style.visibility = 'visible';
			txt3.style.visibility = 'hidden';

			$("#cicle2").addClass("change1");
			$("#cicle2").removeClass("change2");
		}

		img2.onmouseleave = function() {
			img2.style.transform = "scale(1)";
			img2.style.zIndex = 0;
			img2.style.transition = "all 0.5s";

			txt2.style.visibility = 'hidden';

			$("#cicle2").addClass("change2");
			$("#cicle2").removeClass("change1");
		}

		img3.onmouseenter = function() {
			img3.style.transform = "scale(1.15)";
			img3.style.zIndex = 1;
			img3.style.transition = "all 0.5s";

			txt1.style.visibility = 'hidden';
			txt2.style.visibility = 'hidden';
			txt3.style.visibility = 'visible';

			$("#cicle3").addClass("change1");
			$("#cicle3").removeClass("change2");
		}

		img3.onmouseleave = function() {
			img3.style.transform = "scale(1)";
			img3.style.zIndex = 0;
			img3.style.transition = "all 0.5s";

			txt3.style.visibility = 'hidden';

			$("#cicle3").addClass("change2");
			$("#cicle3").removeClass("change1");
		}
	</script>
</div>
<!-- content -->





