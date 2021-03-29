<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* 인트로 이미지 관련 css 시작 */

#imgbox {
	margin:auto;
	width: 1300px;
	height: 500px;
	
	background-size: cover;
	background-position: 0px, -40px;
	
}
#filter {
    width: 1300px;
    height: 500px;
    background-color: white;
    opacity: .5;
} 

/* 인트로 이미지 관련 css 끝 */

/* 머릿글 관련 css 시작 */

.hd1 {
	font-family: 'Jal_Onuel';
	font-size: 24px;
	padding-left : 40px;
	margin-top: 150px;
	margin-bottom: 100px;
	text-align: center;
}
#hd1 > span {
	padding-right: 20px;
}

/* 머릿글 관련 css 끝 */


/* 입양예약신청서 관련 css 시작 */
#textcontainer{
	font-size: 16px;
	font-family: 'JSDongkang-Bold';
}

#tbl1 th {
	height: 50px;
	font-size: 18px;
	color: black;
}

#tbl1 tr {
	height: 70px;
	border-bottom: 1px solid #bbb;
}

.input-form {
	width: 400px;
}

#textcontainer {
	margin: auto;
	width: 1000px;
	border: 1px solid #333;
	border-radius: 10px;
	box-shadow: 5px 5px 5px 5px gray;
	margin-bottom: 100px;
}

.hd2 {
	font-size: 16px; 
	color: #F9820F;
	display: block;
}

.hd3 {
	margin-bottom: 30px;
}
/* 입양예약신청서 관련 css 끝 */

/* 궁서체 쓸 곳 */
.infobox {
	margin: auto;
	width: 800px;
	height: 500 px;
	border: 5px solid #166517;
	border-radius: 10px;
	font-size: 24px;
	text-align: center;
	font-weight: bold;
	color: #166517;
	font-family: 'MapoGoldenPier';
	box-shadow: 5px 5px 5px 5px gray;
	margin-bottom: 100px;
}

.imptext {
	padding: 20px;
}

/* 동의서 관련 CSS 시작 */
.impt {
	font-weight: bold;
	color: tomato;
}

.numbering {
	font-weight: bold;
	font-size: 26px;
	color: #301b01;
}


.form-check-input{
	width: 15px;
	height: 15px;
}

.cblue {
	color: cornflowerblue;
}
/* 동의서 관련 CSS 끝 */


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
<div style="width: 1300px; /* border: 5px solid green; */ margin: auto; padding-top: 300px;">
	
	<!-- form 태그 시작 -->
	<!-- <form method="POST" action=""> -->
	<div id="imgbox" style="background-image:url(/mypet/resources/images/intro/3.jpg); margin-bottom: 100px;">
	<div id="filter"></div>
	</div>
	
	<div class="page-header hd1">
		입양예약신청서 확인
		<small class="hd2">
			<span class="glyphicon glyphicon-exclamation-sign" style="margin-right: 10px;"></span>
			입력하신 예약신청서의 기입내용을 다시 확인하고 전송버튼을 눌러 신청서를 전송하세요.
		</small>
	</div>
	<div id="textcontainer">
		<div style="text-align: center; margin: 50px;"><h1>입양 예약 신청서</h1></div>
		<table id="tbl1" style="margin: auto; margin-top: 50px; margin-bottom: 100px; width: 800px;">
			<tr>
				<th>성명</th>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${dto.birthDate}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${dto.tel}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.address}</td>
			</tr>
			<tr>
				<th>직장명</th>
				<td>${dto.companyName}</td>
			</tr>
			<tr>
				<th>축종</th>
				<td>${dto.species}/${dto.breed}</td>
			</tr>
			<tr>
				<th>일련(관리)번호</th>
				<td>${dto.seqPet }</td>
			</tr>
			<tr>
				<th>입양하려는 이유</th>
				<td>${dto.reason}</td>
			</tr>
			<tr>
				<th>자주찾는 동물병원</th>
				<td>${dto.hospitalName}</td>								
			</tr>
			<tr>
				<th>주거 형태</th>
				<td>
					<c:if test="${dto.seqHouseType==1}">
					단독주택
					</c:if>
					<c:if test="${dto.seqHouseType==2}">
					다세대주택
					</c:if>
					<c:if test="${dto.seqHouseType==3}">
					전원주택
					</c:if>
					<c:if test="${dto.seqHouseType==4}">
					아파트
					</c:if>
					<c:if test="${dto.seqHouseType==5}">
					기타
					</c:if>
				</td>						
			</tr>
			<tr>
				<th>가족 동의</th>
				<td>동의함</td>			
			</tr>
			<tr>
				<th>반려동물 입양경험</th>
				<td>
					<c:if test="${dto.adoptionExperience==1}">
						있음
					</c:if>
					<c:if test="${dto.adoptionExperience==0}">
						없음
					</c:if>
				</td>			
			</tr>
			<tr>
				<th>중성화수술 동의</th>
				<td>
					<c:if test="${dto.neutralizationSurgery==1}">
						동의함
					</c:if>
					<c:if test="${dto.neutralizationSurgery==0}">
						동의안함
					</c:if>
				</td>			
			</tr>
			
		</table>
		
	<!-- textcontainer 끝 -->	
	</div>
	
	
	<div class="page-header hd1 hd3">
		<small class="hd2">
			<span class="glyphicon glyphicon-exclamation-sign" style="margin-right: 10px;"></span>
			동의서를 읽어보시고 체크 하세요.
		</small>
	</div>
	<div class="infobox">
		<div class="imptext numbering">사용자 동의서</div>
		<hr>
		<div class="imptext numbering">하나.</div> 
		<div class="imptext">입양예약서에 입력한 내용이 사실이 아닐 경우</div> 
		<div class="imptext">예약이 <span class="impt">"거절"</span> 될 수 있음을 인지하고 있습니다.</div>
		<div class="imptext numbering">둘.</div>
		<div class="imptext">사용자 본인의 허위 내용 기입 등의 사유에 의해</div>
		<div class="imptext">진행된 입양에서 파양으로 진행 될 경우</div>
		<div class="imptext">파양 과정에서 발생하는 <span class="impt">"모든 비용"</span> 을 책임 지겠습니다.</div>
		<div class="imptext"></div>
		<div class="imptext numbering">셋.</div>
		<div class="imptext">상황에 따라 <span class="impt">"법률적 책임"</span> 까지 질 수 있음을 인지하고 있습니다.</div>
		<div class="imptext"></div>
		<hr>
		<div class="imptext">
			<input type="checkbox" id="agree1" class="form-check-input" value="1">
			<label for="agree1" class="form-check-label cblue">위 예약서 내용이 사실임을 증명합니다.</label>
			</div>
		<div class="imptext">
			<input type="checkbox" id="agree2" class="form-check-input" value="1">
			<label for="agree2" class="form-check-label cblue">위 동의서 내용에 동의합니다.</label>
		</div>
	</div>
	
	<form method="POST" action="/mypet/adoption/sendreservation.action">
		<div id="hiddenwrap">
			<input type="hidden" name="seqUser" value="${seqUser}">
			<input type="hidden" name="seqPet" value="${dto.seqPet}">
			<input type="hidden" name="seqHouseType" value="${dto.seqHouseType}">
			<input type="hidden" name="seqVet" value="${dto.seqVet}">
			<input type="hidden" name="reason" value="${dto.reason}">
			<input type="hidden" name="companyName" value="${dto.companyName}">
			<input type="hidden" name="adoptionExperience" value="${dto.adoptionExperience}">
			<input type="hidden" name="neutralizationSurgery" value="${dto.neutralizationSurgery}">
		</div>
	
		<div id="btnwrap" style="text-align: center; margin-bottom: 100px;">
			<button id="btnsend" type="submit" class="btn btnself" disabled>전송</button>
			<button type="button" class="btn btnself">취소</button>
		</div>
	</form>

	<hr style="margin: 50px;">
	
	<!-- form태그 끝 -->
	<!-- </form> -->
	
 <!-- 바디역할 끝 -->
</div>
<script>
	$('#agree1').click(function() {
		if ($('#agree1').is(':checked')==true && $('#agree2').is(':checked')==true) {
			$('#btnsend').attr('disabled', false);
		} else {
			$('#btnsend').attr('disabled', true);
		}
	})
	$('#agree2').click(function() {
		if ($('#agree1').is(':checked')==true && $('#agree2').is(':checked')==true) {
			$('#btnsend').attr('disabled', false);
		} else {
			$('#btnsend').attr('disabled', true);
		}
	})
	
	
</script>



	