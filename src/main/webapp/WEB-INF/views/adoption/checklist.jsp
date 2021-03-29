<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

/* 폰트 임시 */
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
.nanumsquare {
    font-family: 'NanumSquare', sans-serif !important;
}


/* 체크리스트 관련 css 시작*/
#clistcontainer {
	/* border: 1px solid black; */
	font-family: 'NanumSquare', sans-serif !important;
	width : 800px;
	margin: auto;
	font-size: 16px;
	color: #301B01;
}
#flist {
	border-top: 1px solid #301B01;
}

.checklist {
	border-bottom: 1px solid #301B01;
	margin-bottom: 10px;
	height: 70px;
	padding-top: 5px;
}
.form-check-input{
	width: 50px;
	height: 50px;
}

.text {
	padding-top: 10px;
}

#tbl1 {
	width: 800px;
}
.space {
	padding-left: 30px;
	padding-right	: 30px;
}

.checklist:hover {
	background-color: #F6DA42;
}
/* 체크리스트 관련 css 끝 */

/* 인트로 이미지 관련 css 시작 */

#imgbox {
	margin:auto;
	width: 1300px;
	height: 500px;
	background-size: cover;
	
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

#h2 {
	font-size: 16px; 
	color: #F9820F;
	display: block;
}

/* 머릿글 관련 css 끝 */

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
<div style="width: 1300px; margin: auto; padding-top: 300px;">
	
	<!-- form 태그 시작 -->
	<!-- <form method="POST" action=""> -->
	<div id="imgbox" style="background-image:url(/mypet/resources/images/intro/2.jpg); margin-bottom: 100px;">
	<div id="filter"></div>
	</div>
	
	
	<div class="page-header" id="hd1">
	<span class="glyphicon glyphicon-ok-sign"></span>
	입양 전 체크리스트
	<small id="h2"><span class="glyphicon glyphicon-exclamation-sign" style="margin-right: 10px;"></span>체크리스트를 모두 체크하셔야 다음단계로 이동이 가능합니다.</small>
	</div>
	
	<div class="infobox">
		<div class="imptext">유기동물들도 아픔을 딛고</div> 
		<div class="imptext">"새로운 가족"이 될</div>
		<div class="imptext">준비를 하고 있습니다.</div>
	</div>
	


	<div id="clistcontainer">
		<table id="tbl1">
		
			<tr class="checklist" id="flist">
				<td class="space">
				<input type="checkbox" id="ck1" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck1" class="form-check-label">1. 동물을 입양하기 전, 모든 가족 구성원이 동의하고 충분히 생각해 보셨나요?</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck2" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck2" class="form-check-label">2. 개와 고양이의 수명은 약 15년 정도입니다. 살아가면서 질병도 걸릴 수 있고요. 생활패턴이나 환경이 바뀌더라도 오랜 기간 동안 책임지고 잘 돌보아 줄 수 있나요?</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck3" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck3" class="form-check-label">3. 매일 산책을 시켜주거나 함께 있어줄 수 있는 시간이 충분한가요? 개는 물론이고 고양이도 혼자 있으면 외로워하는 사회적 동물입니다.</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck4" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck4" class="form-check-label">4. 식비, 건강검진비, 예방접종과 치료비 등 관리비용을 충당할 수 있을 정도의 경제적 여유를 갖고 계신가요? 매달 소비되는 기본 비용도 생각해 보셨나요?</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck5" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck5" class="form-check-label">5. 동물의 소음(짖거나 울음소리), 냄새(배변 등), 털빠짐 등의 상황이 일어납니다. 또한 물거나 할퀼 수도 있으며 다양한 문제행동을 보일 수도 있습니다.</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck6" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck6" class="form-check-label">6. 그 외 동물들의 특성에 대해서 생각 해 보셨나요? (스크래치, 산책, 훈련, 품종별 특징 등) 또한 사람과 동물의 의사소통방법은 매우 다릅니다. 이에 대한 충분한 공부가 필요해요.</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck7" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck7" class="form-check-label">7. 반려동물의 중성화수술 및 동물등록에 동의하시나요? 동물에 따라 중성화 수술이 되어있는 친구들도 있습니다.</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck8" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck8" class="form-check-label">8. 입양 후 사후관리에 관한 정보를 제공해주실 수 있나요? 반려동물을 키우시면서 온라인과 전화로 사후관리에 관한 모니터링에 응하셔야 합니다.</label>
				</td>
			</tr>
			<tr class="checklist">
				<td class="space">
				<input type="checkbox" id="ck9" class="form-check-input" value="1">
				</td>
				<td>
				<label for="ck9" class="form-check-label">9. 미성년자의 경우 입양예약신청이 반려될 수 있습니다. 분양을 원하는 미성년자는 부모님이 직접 신청하여야 합니다.</label>
				</td>
			</tr>
		</table>
	</div>
	
	<hr style="margin: 50px;">
	
	<div class="infobox">
		<div class="imptext">새 식구로 맞이하기 앞서 체크리스트를 꼼꼼히 읽어보시고</div> 
		<div class="imptext">충분한 고민과 준비를 필요로 합니다. </div>
		<div class="imptext"><small>(위의 체크리스트를 모두 체크하여야 다음단계로 이동합니다.)</small></div>
	</div>
	
	<div id="btnwrap" style="padding-bottom: 100px; text-align: center;">
		<!-- <button type="submit" class="btn btn-warning">예약 신청하기</button> -->
		<button type="button" class="btn btnself" id="btn1">예약 신청하기</button>
		<div style="clear:both;"></div>
	</div>
	
	<!-- form태그 끝 -->
	<!-- </form> -->
	
 <!-- 바디역할 끝 -->
</div>
<script>
	$('#btn1').click(function() {
		if ($('#ck1').prop('checked') && $('#ck2').prop('checked') && $('#ck3').prop('checked') && $('#ck4').prop('checked') && $('#ck5').prop('checked') && $('#ck6').prop('checked') && $('#ck7').prop('checked') && $('#ck8').prop('checked') && $('#ck9').prop('checked')) {
			location.href="/mypet/adoption/writereservation.action";
		} else {
			alert("선택하지 않은 항목이 있습니다!\n확인 후 다시 눌러주세요!");
			$('#ck4').focus();
		}
	});
</script>



	