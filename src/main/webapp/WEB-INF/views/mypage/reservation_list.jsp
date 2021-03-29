<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

/* 폰트 임시 */
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
.nanumsquare {
    font-family: 'NanumSquare', sans-serif !important;
}


/* 바디역할, 전체 관련 css 시작*/
#bodydiv {
	/* border: 1px solid black; */
	width: 1300px;
	margin: auto;
	padding-top: 150px;
	font-family: 'NanumSquare', sans-serif !important;
	text-align: center;
	font-size: 16px;
	color: #301B01;
}
	/* 버튼 css */
	.btnself {
		font-family: 'Jal_Onuel';
		background-color: #b27208;
		color: white;
	} 
	
	.btnself:hover {
		background-color: #b27208;
		color: white;
	}
	/* 버튼 css 끝 */

/* 바디역할 div 관련 css 끝 */


/* 머릿글 관련 css 시작 */

#hd1 {
	font-family: 'Jal_Onuel';
	font-size: 24px;
	margin-top: 150px;
	margin-bottom: 10px;
}

.hd2 {
	font-size: 16px; 
	color: #F9820F;
	display: block;
	margin-bottom: 10px;
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

/* 테이블 관련 css 시작 */

#tbl1 {
	margin-top: 100px;
	
}
#tbl1 th {
	text-align: center;
}

#tbl1 .underlinetxt {
	font-weight: bold;
	text-decoration: underline;
}

#tbl1 tr:hover {
	background-color: #F6DA42;
}


ul, li {
	margin: 0px;
}

.animalimg {
	width: 180px;
}

/* 테이블 관련 css 끝 */
/* 
.dropdown-menu {
	display: block;
} */

</style>


<!-- 마이페이지 바디 역할 div -->
<div id="bodydiv">
	
	<!-- form 태그 시작 -->
	<!-- <form method="POST" action=""> -->
	
	<!-- 헤더, 설명글 -->
	<div id="hd1">입양 예약 진행 현황</div>
	<small class="hd2">※ 예약번호를 클릭하면 작성한 입양예약신청서를 볼 수 있습니다.</small>
	
	<!-- main table  -->
	<table class="table table-bordered" id="tbl1">
		<tr style="background-color: #b27208; color: white;">
			<th>예약번호</th>
			<th>축종</th>
			<th>보호소/동물병원</th>
			<th>신청자</th>
			<th>신청일</th>
			<th>상태</th>
		</tr>
		<!-- 응답있음(동물병원이 보호중) -->
		<c:forEach items="${list}" var="dto" varStatus="status">
		<tr>
			<td class="underlinetxt"><a href="/mypet/mypage/reservationview.action?seqReservation=${dto.seqReservation}">${dto.seqReservation}</a></td>
			<td class="underlinetxt" >
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					${dto.species}/${dto.breed}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${dto.seqPet}'"><a>품종 : ${dto.breed}</a><small style="padding-left: 10px;">※ 품종을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>분류 : ${dto.species}</a></li>
						<li><a>나이 : ${dto.age}</a></li>
						<li><a>성별 :
							<c:if test="${dto.gender==0}">
								여자
							</c:if>
							<c:if test="${dto.gender==1}">
								남자
							</c:if> 
						</a></li>
						<li><a>중성화여부 : 
							<c:if test="${dto.neutralization==0}">
								X
							</c:if>
							<c:if test="${dto.neutralization==1}">
								O
							</c:if>
						</a></li>
						<li><a>접종여부 : 
							<c:if test="${dto.vaccination==0}">
								X
							</c:if>
							<c:if test="${dto.vaccination==1}">
								O
							</c:if>
						
						</a></li>
						
					</ul>
				</li>
			</td>
			<td class="underlinetxt">
				<li class="dropdown" >
					<a href="#" id="m${status.count}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" >
					${dto.hospitalName2}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" style="cursor:pointer;" onclick="location.href='/mypet/vet/view.action?seq=${dto.seqVet}'"><a>보호병원명 : ${dto.hospitalName2}</a> <small style="padding-left: 10px;">※ 병원명을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>운영시간 : ${dto.time2}</a></li>
						<li><a>진료과목 : ${dto.treatment2}</a></li>
						<li><a>전화번호 : ${dto.hospitalTel2}</a></li>
						<li><a>지도</a></li>
						<input type="hidden" id="address${status.count}" name="address${status.count}" value="${dto.hospitalAddress2}">
						<input type="hidden" id="name${status.count}" name="name${status.count}" value="${dto.hospitalName2}">
						<div id="map${status.count}" style="width:400px;height:200px;"></div>
						<button type="button" class="btn btnself" style="margin:30px; float:right;" id="btnnav${status.count}">길찾기</button>
					</ul>
				</li>
			</td>
			<td>${dto.name}</td>
			<td>${dto.availableDate}</td>
			<td class="underlinetxt">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					${dto.response}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<c:if test="${dto.response eq '승인'}">
						<li><a> ${dto.failReason}</a></li>
						</c:if>
						<c:if test="${dto.response eq '거절'}">
						<li><a>거절사유 : ${dto.failReason}</a></li>
						</c:if>
					</ul>
				</li>
			</td>
		</tr>
		</c:forEach>
		<!-- 응답없음(동물병원이 보호중) -->
		<c:forEach items="${nlist}" var="ndto" varStatus="status">
		<tr>
			<td class="underlinetxt"><a href="/mypet/mypage/reservationview.action?seqReservation=${ndto.seqReservation}">${ndto.seqReservation}</a></td>
			<td class="underlinetxt" >
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" onclick="petInfo(${ndto.seqPet});">
					${ndto.species}/${ndto.breed}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${ndto.seqPet}'"><a>품종 : ${ndto.breed}</a><small style="padding-left: 10px;">※ 품종을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>분류 : ${ndto.species}</a></li>
						<li><a>나이 : ${ndto.age}</a></li>
						<li><a>성별 :
							<c:if test="${ndto.gender==0}">
								여자
							</c:if>
							<c:if test="${ndto.gender==1}">
								남자
							</c:if> 
						</a></li>
						<li><a>중성화여부 : 
							<c:if test="${ndto.neutralization==0}">
								X
							</c:if>
							<c:if test="${ndto.neutralization==1}">
								O
							</c:if>
						</a></li>
						<li><a>접종여부 : 
							<c:if test="${ndto.vaccination==0}">
								X
							</c:if>
							<c:if test="${ndto.vaccination==1}">
								O
							</c:if>
						
						</a></li>
					</ul>
				</li>
			</td>
			<td class="underlinetxt">
				<li class="dropdown" >
					<a href="#" id="m0${status.count}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" >
					${ndto.hospitalName2}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" style="cursor:pointer;" onclick="location.href='/mypet/vet/view.action?seq=${ndto.seqVet}'"><a>보호병원명 : ${ndto.hospitalName2}</a> <small style="padding-left: 10px;">※ 병원명을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>운영시간 : ${ndto.time2}</a></li>
						<li><a>진료과목 : ${ndto.treatment2}</a></li>
						<li><a>전화번호 : ${ndto.hospitalTel2}</a></li>
						<li><a>지도 </a></li>
						<input type="hidden" id="address0${status.count}" name="address0${status.count}" value="${ndto.hospitalAddress2}">
						<input type="hidden" id="name0${status.count}" name="name0${status.count}" value="${ndto.hospitalName2}">
						<div id="map0${status.count}" style="width:400px;height:200px;"></div>
						<button type="button" class="btn btnself" style="margin:30px; float:right;" id="btnnav0${status.count}">길찾기</button>
					</ul>
				</li>
			</td>
			<td>${ndto.name}</td>
			<td>${ndto.availableDate}</td>
			<td>심사중</td>
		</tr>
		</c:forEach>
		
		<!-- 응답있음(보호소가 보호중) -->
		<c:forEach items="${slist}" var="sdto" varStatus="status">
		<tr>
			<td class="underlinetxt"><a href="/mypet/mypage/reservationview.action?seqReservation=${sdto.seqReservation}">${sdto.seqReservation}</a></td>
			<td class="underlinetxt" >
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" onclick="petInfo(${sdto.seqPet});">
					${sdto.species}/${sdto.breed}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${sdto.seqPet}'"><a>품종 : ${sdto.breed}</a><small style="padding-left: 10px;">※ 품종을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>분류 : ${sdto.species}</a></li>
						<li><a>나이 : ${sdto.age}</a></li>
						<li><a>성별 :
							<c:if test="${sdto.gender==0}">
								여자
							</c:if>
							<c:if test="${sdto.gender==1}">
								남자
							</c:if>
						</a></li>
						<li><a>중성화여부 : 
							<c:if test="${sdto.neutralization==0}">
								X
							</c:if>
							<c:if test="${sdto.neutralization==1}">
								O
							</c:if>
						</a></li>
						<li><a>접종여부 : 
							<c:if test="${sdto.vaccination==0}">
								X
							</c:if>
							<c:if test="${sdto.vaccination==1}">
								O
							</c:if>
						
						</a></li>
					</ul>
				</li>
			</td>
			<td class="underlinetxt">
				<li class="dropdown" >
					<a href="#" id="m00${status.count}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" >
					${sdto.shelterName2}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" style="cursor:pointer;" onclick="location.href='/mypet/shelter/view.action?seq=${sdto.seqShelter}'"><a>보호소명 : ${sdto.shelterName2}</a> <small style="padding-left: 10px;">※ 병원명을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>운영시간 : ${sdto.time2}</a></li>
						<li><a>계좌번호 : ${sdto.account}</a></li>
						<li><a>전화번호 : ${sdto.shelterTel2}</a></li>
						<li><a>지도 </a></li>
						<input type="hidden" id="address00${status.count}" name="address00${status.count}" value="${sdto.shelterAddress2}">
						<input type="hidden" id="name00${status.count}" name="name00${status.count}" value="${sdto.shelterName2}">
						<div id="map00${status.count}" style="width:400px;height:200px;"></div>
						<button type="button" class="btn btnself" style="margin:30px; float:right;" id="btnnav00${status.count}">길찾기</button>
					</ul>
				</li>
			</td>
			<td>${sdto.name}</td>
			<td>${sdto.availableDate}</td>
			<td class="underlinetxt">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					${sdto.response}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<c:if test="${sdto.response eq '승인'}">
						<li><a> ${sdto.failReason}</a></li>
						</c:if>
						<c:if test="${sdto.response eq '거절'}">
						<li><a>거절사유 : ${sdto.failReason}</a></li>
						</c:if>
					</ul>
				</li>
			</td>
		</tr>
		</c:forEach>
		
		<!-- 응답없음(보호소가 보호중) -->
		<c:forEach items="${snlist}" var="sndto" varStatus="status">
		<tr>
			<td class="underlinetxt"><a href="/mypet/mypage/reservationview.action?seqReservation=${sndto.seqReservation}">${sndto.seqReservation}</a></td>
			<td class="underlinetxt" >
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" onclick="petInfo(${sndto.seqPet});">
					${sndto.species}/${sndto.breed}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${sndto.seqPet}'"><a>품종 : ${sndto.breed}</a><small style="padding-left: 10px;">※ 품종을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>분류 : ${sndto.species}</a></li>
						<li><a>나이 : ${sndto.age}</a></li>
						<li><a>성별 : 
							<c:if test="${sndto.gender==0}">
								여자
							</c:if>
							<c:if test="${sndto.gender==1}">
								남자
							</c:if>
						</a></li>
						<li><a>중성화여부 : 
							<c:if test="${sndto.neutralization==0}">
								X
							</c:if>
							<c:if test="${sndto.neutralization==1}">
								O
							</c:if>
						</a></li>
						<li><a>접종여부 : 
							<c:if test="${sndto.vaccination==0}">
								X
							</c:if>
							<c:if test="${sndto.vaccination==1}">
								O
							</c:if>
						
						</a></li>
					</ul>
				</li>
			</td>
			<td class="underlinetxt">
				<li class="dropdown" >
					<a href="#" id="m000${status.count}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" >
					${sndto.shelterName2}
					<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="underlinetxt" style="cursor:pointer;" onclick="location.href='/mypet/shelter/view.action?seq=${sndto.seqShelter}'"><a>보호소명 : ${sndto.shelterName2}</a> <small style="padding-left: 10px;">※ 병원명을 클릭하면 상세페이지로 이동합니다.</small></li>
						<li><a>운영시간 : ${sndto.time2}</a></li>
						<li><a>계좌번호 : ${sndto.account}</a></li>
						<li><a>전화번호 : ${sndto.shelterTel2}</a></li>
						<li><a>지도</a></li>
						<input type="hidden" id="address000${status.count}" name="address000${status.count}" value="${sndto.shelterAddress2}">
						<input type="hidden" id="name000${status.count}" name="name000${status.count}" value="${sndto.shelterName2}">
						<div id="map000${status.count}" style="width:400px;height:200px;"></div>
						<button type="button" class="btn btnself" style="margin:30px; float:right;" id="btnnav000${status.count}">길찾기</button>
					</ul>
				</li>
			</td>
			<td>${sndto.name}</td>
			<td>${sndto.availableDate}</td>
			<td>심사중</td>
		</tr>
		</c:forEach>
		
		
		
	</table>

	<!-- 버튼 -->
	
	<hr style="margin: 200px;">
	
	<!-- form태그 끝 -->
	<!-- </form> -->
	
 <!-- 바디역할 끝 -->
</div>

<script>
	/* 드롭다운 안닫히게 하기!!! */
	$('.dropdown-menu').click(function(e) {
	    e.stopPropagation();
	});

</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6202dce93896c77fd3201beee8e88961&libraries=services"></script>
<script>
	/* 카카오지도 api 관련 script */
	$('#m1').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address1').val();
		var name = $('#name1').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav1').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m2').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address2').val();
		var name = $('#name2').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav2').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m3').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address3').val();
		var name = $('#name3').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map3'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav3').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	
	$('#m01').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address01').val();
		var name = $('#name01').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map01'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav01').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m02').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address02').val();
		var name = $('#name02').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map02'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav02').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m03').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address03').val();
		var name = $('#name03').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map03'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav03').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	
	$('#m001').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address001').val();
		var name = $('#name001').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map001'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav001').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m002').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address002').val();
		var name = $('#name002').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map002'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav002').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m0003').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address0003').val();
		var name = $('#name0003').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map0003'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav0003').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	
	$('#m01').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address01').val();
		var name = $('#name01').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map01'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav01').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m02').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address02').val();
		var name = $('#name02').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map02'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav02').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	$('#m03').click(function(){
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var haddress = $('#address03').val();
		var name = $('#name03').val();
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(haddress, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		    	var addr = name+result[0].y+','+result[0].x;
				
		        var mapContainer = document.getElementById('map03'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
		        
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
		        });
		        
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
				$('#btnnav03').click(function(){
					
			       	window.open('https://map.kakao.com/link/to/'+addr);
				})
		    } 
		});    
	})
	
	
	
</script>



	