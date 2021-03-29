<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style> 

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

/* 버튼 css 시작 */

.btnself {
	font-family: 'Jal_Onuel';
	background-color: #b27208;
	color: white;
} 

.btnself:hover {
	background-color: #b27208;
	color: white;
}

#btnwrap {
	text-align:center;
	margin-bottom: 200px;
}

/* 버튼 css 끝 */



</style>    
    
<div style="width: 1300px; /* border: 5px solid green; */ margin: auto; padding-top: 300px;">
	
	
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
				<td>${dto.seqPet}</td>
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
					${dto.type}
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
		
		
		<div id="btnwrap">
			<button class="btn btnself" onclick="history.back();">뒤로가기</button>
		</div>
	<!-- textcontainer 끝 -->	
	</div>
</div>