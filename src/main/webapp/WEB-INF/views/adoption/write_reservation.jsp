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

#hd1 {	
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
}

#hd2 {
	font-size: 16px; 
	color: #F9820F;
	display: block;
}

/* 입양예약신청서 관련 css 끝 */

.btnself {
	font-family: 'Jal_Onuel';
	background-color: #b27208;
	color: white;
} 

.btnself:hover {
	background-color: #b27208;
	color: white;
}

.vets:hover {
	background-color: #b27208;
	cursor: pointer;
}

</style>

<!-- 바디역할 div 시작 -->
<div style="width: 1300px; /* border: 5px solid green; */ margin: auto; padding-top: 300px;">
	
	<!-- form 태그 시작 -->
	<form method="POST" action="/mypet/adoption/viewreservation.action">
	<div id="imgbox" style="background-image:url(/mypet/resources/images/intro/1.jpg); margin-bottom: 100px;">
		<div id="filter"></div>
	</div>
	
	<div class="page-header" id="hd1">
		입양예약신청서 작성
		<small id="hd2">
			<span class="glyphicon glyphicon-exclamation-sign" style="margin-right: 10px;"></span>
			아래의 모든 입력값을 작성해야 다음단계로 이동이 가능합니다.
		</small>
	</div>
	<div id="textcontainer">
		<table id="tbl1" style="margin: auto; margin-top: 50px; margin-bottom: 100px; width: 800px;">
			<tr>
				<th>성명</th>
				<td>
					<input type="text" id="name" name="name" class="form-control input-form" readonly value="${dto.name}">
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" id="birthDate" name="birthDate" class="form-control input-form" readonly value="${dto.birthDate }" }>
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="tel" name="tel" class="form-control input-form" readonly value="${dto.tel }">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>
					<input type="text" id="address" name="address" class="form-control input-form" readonly value="${dto.address }">
				</td>
			</tr>
			
			<tr>
				<th>직장명</th>
				<td>
					<input type="radio" name="rd1" id="jobok" value="1" checked>
					<label for="jobok">직장있음</label>
					<input type="radio" name="rd1" id="jobno" value="0" style="margin-left: 50px;">
					<label for="jobno">직장없음</label>
					<input type="text" id="companyName" name="companyName" class="form-control input-form">
				</td>
			</tr>
			
			<tr>
				<th>축종</th>
				<td>
					<input type="text" id="species" name="species" class="form-control input-form" readonly value="강아지">
					<input type="text" id="breed" name="breed" class="form-control input-form" readonly value="푸들">
				</td>
			</tr>
			
			<tr>
				<th>일련(관리)번호</th>
				<td>
					<input type="text" id="seqPet" name="seqPet" class="form-control input-form" readonly value="1">
				</td>
			</tr>
			
			<tr>
				<th>입양하려는 이유</th>
				<td>
					<input type="text" id="reason" name="reason" class="form-control input-form" placeholder="ex) 자녀의 심리적 안정감을 위해서">
				</td>
			</tr>
			
			<tr>
				<th>자주찾는 동물병원</th>
				<td>
					<input type="text" id="hospitalName" name="hospitalName" style="float:left;" class="form-control input-form" placeholder="검색 버튼을 눌러주세요." readonly>
					<button type="button" id="search" class="btn btn-default">검색</button>
					<input type="hidden" id="seqVet" name="seqVet">
				</td>								
			</tr>
			
			<tr>
				<th rowspan="2">주거 형태</th>
				<td>
					<input type="radio" name="seqHouseType" id="h1" value="1" checked>
					<label for="h1">단독주택</label>								
				
					<input type="radio" name="seqHouseType" id="h2" value="2">
					<label for="h2">다세대주택</label>								
					
					<input type="radio" name="seqHouseType" id="h3" value="3">
					<label for="h3">전원주택</label>
				</td>								
			</tr>
			
			<tr>
				<td>
					<input type="radio" name="seqHouseType" id="h4" value="4">
					<label for="h4">아파트</label>						
				
					<input type="radio" name="seqHouseType" id="h5" value="5">
					<label for="h5">기타</label>
				</td>						
			</tr>
			
			<tr>
				<th>가족 동의</th>
				<td>
					<input type="radio" name="familyagree" id="agree1" value="1" checked>
					<label for="agree1">동의</label>						
				
					<input type="radio" name="familyagree" id="disagree1" value="0">
					<label for="disagree1">동의안함</label>						
				</td>			
			</tr>
			
			<tr>
				<th>반려동물 입양경험</th>
				<td>
					<input type="radio" name="adoptionExperience" id="agree2" value="1" checked>
					<label for="agree2">있음</label>						
				
					<input type="radio" name="adoptionExperience" id="disagree2" value="0">
					<label for="disagree2">없음</label>						
				</td>			
			</tr>
			
			<tr>
				<th>중성화수술 동의</th>
				<td>
					<input type="radio" name="neutralizationSurgery" id="agree3" value="1" checked>
					<label for="agree3">동의</label>						
				
					<input type="radio" name="neutralizationSurgery" id="disagree3" value="0">
					<label for="disagree3">동의안함</label>						
				</td>			
			</tr>
			
		</table>
		
		<div id="btnwrap" style="text-align: center; margin-bottom: 100px;">
			<button type="submit" class="btn btnself">신청서 등록</button>
			<button type="button" class="btn btnself">취소</button>
		</div>
		
		
	
	</div>

	<hr style="margin: 50px;">
	
	<!-- form태그 끝 -->
	</form>
	
	<div class="modal" tabindex="-1" role="dialog" id="deletemodal">
	    	<div class="modal-dialog" role="document">
	    		<div class="modal-content" id="modal-content" style="width: 800px; height:400px;">
	   				<div class="modal-header">
	           			<h5 class="modal-title">동물병원 검색하기</h5>
	           			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	             		<span aria-hidden="true">&times;</span>
	           			</button>
	        		</div>
	         		<div class="modal-body">
	           			<div>동물병원을 선택하세요.</div>
	           			<table class="table table-bordered">
	           				<tr>
	           					<th>병원명</th>
	           					<th>위치</th>
	           					<th>진료목록</th>
	           					<th>진료시간</th>
	           				</tr>
	           				<c:if test="${empty list}">
           					<tr >
           						<td colspan="4">병원이 없습니다.</td>
           					</tr>
	           				</c:if>
	           				<c:forEach items="${list}" var="dto2" varStatus="status">
	           				<tr id="vets${status.count}" class="vets">
	           					<td>
	           					${dto2.name}
	           					<input type="hidden" id="hdnvetname${status.count}" value="${dto2.name}">
	           					<input type="hidden" id="hdnvetseq${status.count}" value="${dto2.seqVet}">
	           					</td>
	           					<td>${dto2.address}</td>
	           					<td>${dto2.treatment}</td>
	           					<td>${dto2.time}</td>
	           				</tr>
	           				</c:forEach>
	           			</table>
	         		</div>
	         		<div class="modal-footer">
	            		<button type="submit" class="btn" id="delete">삭제</button>
	           			<button type="button" class="btn" id="cancel" data-dismiss="modal" >취소</button>           
	         		</div>
	      		</div>
	     	</div>
	   </div>
		
	
	
 <!-- 바디역할 끝 -->
</div>
<script>
	$("input:radio[name=rd1]").click(function() {
		if($("input:radio[name=rd1]:checked").val() =="1"){
			$("#companyName").attr("readonly",false);
		} else if($("input:radio[name=rd1]:checked").val() =="0") {
			$("#companyName").attr("readonly",true);
			$("#companyName").val("직장없음");
		}
	});
	

	/* 모달 */
   $('#search').click(function(e){
      e.preventDefault();
      $('#deletemodal').modal("show");
   });
	
	$('#vets1').click(function(){
		$('#deletemodal').modal("hide");
		$('#hospitalName').val($('#hdnvetname1').val());
		$('#seqVet').val($('#hdnvetseq1').val());
		
	})
	$('#vets2').click(function(){
		$('#deletemodal').modal("hide");
		$('#hospitalName').val($('#hdnvetname2').val());
		$('#seqVet').val($('#hdnvetseq2').val());
		
	})
	$('#vets3').click(function(){
		$('#deletemodal').modal("hide");
		$('#hospitalName').val($('#hdnvetname3').val());
		$('#seqVet').val($('#hdnvetseq3').val());
		
	})
	
	$('#disagree1').click(function(){
		alert("가족의 동의가 없으면 입양이 불가합니다.");
		$('#agree1').prop('checked',true);
	})
	
	$('#disagree3').click(function(){
		alert("중성화수술에 동의하지 않으면 입양이 불가합니다.");
		$('#agree3').prop('checked',true);
	})
	
	
</script>



	