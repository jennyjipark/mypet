<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>MyPet::보호소</title>	
<style>

    /* content */
    #content{
        width: 1300px;
        margin: 0px auto;
        margin-top: 210px;
        padding: 20px 50px;
        border: none;
        height: auto;
    }

    

/*     #contentnav {
        border: 1px solid black;
        width: 1200px;
        height: 100px;
        padding: 20px 20px;
    } */
/* ------------------------------- */   
    /* 페이지타이틀 */
    .board-title{
    	font-size : 30px;
    	text-align : center;
    	display: block;
    	margin-top: 130px;
    	margin-bottom: 50px;
    	font-family: 'Jal_Onuel';
    	/* font-family: 'JSDongkang-Regular'; */
    	/* font-family: 'JSDongkang-Bold'; */
    	color: #301b01;
    }
    
	/* 테이블 */
	
	.table{
		width : 1100px;
		height: auto;
		margin : 10px auto;
		font-size: 16px;
	}
	
	.table > tr {
		padding-top : 3px;
	}
	
	.table #list td, .table #list th {
		margin-top : 30px;
		vertical-align: middle;
	}
	
	.tabl th {
		margin-left: 20px;
	}
	


    /* 로고이미지 */
    
    .logo{
    	width : 400px;
    } 
    
    #img {
    	width : 400px;
    	height: 300px;
	    background-size: contain;
	    background-repeat : no-repeat;
    	padding : 5px;
    	vertical-align: middle;
	    
    }
    
    /* 지도 */
	#map {
		width: 1100px;
		height: 450px;
		text-align: center;
		margin: 10px;
	}
	
	/* 버튼 */
	.btn{
		font-family: 'Jal_Onuel';
		width : 70px;
    	margin : 10px;
    	padding : 10px 12px;
		border : none;
	    color: white;   
		background-color: #b27208;	
		outline: none !important;	
	
	}
	
	#apply{
		width: 150px;
	}
	
	.btns #edit, .btns #delete {		
		text-align: center;
		float : right;
	}
	
	.btns #delete{
		margin-right : 30px;
	}
	
	#vol{
		width :150px;
		margin-left:30px;
	}
	
	
	.listbtn{
		text-align: center;
		margin-top:10px;
		margin-bottom:100px;
		
	}
	
	    /* 모달창 */
    
    .modal-content {
    	overflow: hidden;
    }
    
    .close {
    	position : absolute;
    	top : 20px;
    	right :10px;
    	outline: none !important;	
    }
       
    .modal-header, .modal-title {
    	background-color: #f6da42;
    	font-family: 'Jal_Onuel';
    	font-size: 16px;
    }
    
   	.modal-body{
		font-family: 'NanumSquare';
		text-align: center;
		height : 90px;	
		font-size: 16px;	
	}
	
	.modal-body p {
		margin-top: 25px;
	}
	
	.modal-footer{
		text-align: center;
	}
	
  
    /* 버튼 */
       
    .modal-footer #apply, .modal-footer #cancel {
		font-family: 'Jal_Onuel';
		width : 70px;
    	margin : 0px 10px;
    	padding : 10px 12px;
		border : none;
	    color: white;
		outline: none !important;	
		border-radius : 5px;
	}
	.modal-footer #apply:hover, .modal-footer #cancel:hover{
		color:black;
	}
		
	.modal-footer #apply{ background-color: #b27208; }
	.modal-footer #cancel{ background-color: #fab018; }
	
    }
    

	
	.desc {
		display: block;
		
		
	}
	
</style>

<div id="content">
	<!-- <div id="contentnav">개인 서브네비입니다.</div> -->
	<div class="board-title">${sdto[0].name} 상세정보</div>
	<div class="btns"> 
		<input type="button" value="삭제" id="delete" class="btn">
		<input type="button" value="수정" id="edit" class="btn" onclick="location.href='/mypet/shelter/edit.action?seq=${sdto[0].seqShelter}';">
	</div>
	<table class="table table-default">
		<tr id="list">
			<td rowspan='6' class="logo">
				<div id="img" style="background-image:url('/mypet/resources/images/shelter/${sdto[0].image}');"></div>
			</td>
			<th>이름</th>
			<td>${sdto[0].name}</td>
		</tr>		
		<tr id="list">
			<!-- <td></td> -->
			<th>주소</th>
			<td>${sdto[0].address}</td>
		</tr>
		<tr id="list">
			<!-- <td></td> -->
			<th>전화번호</th>
			<td>${sdto[0].tel}</td>
		</tr>
		<tr id="list">
			<!-- <td></td> -->
			<th>진료시간</th>
			<td>${sdto[0].time}</td>
		</tr>
		<tr id="list">
			<!-- <td></td> -->
			<th>후원계좌</th>
			<td>${sdto[0].account} (${sdto[0].name})</td>
		</tr>

		<form id="applyForm" method="POST" action="/mypet/shelter/applyok.action">
			<tr id="list">
				<!-- <td></td> -->
				<th>봉사활동</th>
				<td>
				<c:forEach items="${sdto}" var="dto">
					<table>
						<tr>
							<td style="width:20px;"><input type="checkbox" id="volunteerCb" name="cb"></td>
							<td>${dto.startDate} ~ ${dto.endDate}</td>
						</tr>
					</table>
				</c:forEach>
				
	<!-- 			<input type="button" class="btn" value="봉사예약하기" id="vol" onclick="$('#searchForm').submit();"> -->
				<button id="apply" class="btn" onclick="check()">봉사신청하기</button>
				<div class="modal" tabindex="-1" role="dialog" id="applymodal">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content" id="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">${sdto[0].name} 봉사 신청하기</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>${sdto[0].name} 봉사활동을 신청하시겠습니까?</p>
				      </div>
				      <div class="modal-footer">
				      	<button type="submit" class="btn" id="apply">신청</button>
				        <button type="button" class="btn" id="cancel" data-dismiss="modal" >취소</button>	        
				      </div>
				    </div>
				  </div>
				</div>
				</td>
			</tr>
		</form>

		<tr id="list">
			<td colspan='3' class="map"><div id="map"></div></td>
			<!-- <th></th> -->
			<!-- <td></td> -->
		</tr>
	</table>
	
	<div class="listbtn"> 
		<input type="button" value="목록" id="listbtn" class="btn" onclick="location.href='/mypet/shelter/list.action'">
	</div>
	
</div>

<!-- 삭제하기 모달 -->
<div class="modal" tabindex="-1" role="dialog" id="deletemodal">
  <div class="modal-dialog" role="document">
    <div class="modal-content" id="modal-content">
      <div class="modal-header">
	        <h5 class="modal-title">${sdto[0].name} 삭제하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>${sdto[0].name} 정말 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	      	<button type="submit" class="btn" id="deleteok">삭제</button>
	        <button type="button" class="btn" id="cancel" data-dismiss="modal" >취소</button>	        
	      </div>
	    </div>
	  </div>
	</div>

<!-- 봉사활동 신청 -->
<script>
	/* 삭제 */
	$('#delete').click(function(e){
		e.preventDefault();
		$('#deletemodal').modal("show");
	});
	
	$('#apply').click(function(e){
		e.preventDefault();
		$('#applymodal').modal("show");
	});

	function check(){
		var form = document.applyForm
		var checkcount = 0;
		
		for(i=0; i<form.elements.length; i++){
			if(form.elements[i].name == "cb"){
				if(form.elements[i].checked == true){
					checkcount++;
			}
			}
		}
		
		if(checkcount == 0){
			alert("한 개 이상의 봉사활동을 선택하셔야 합니다.");
			return;
		}
		applyForm.submit();
		
		
	}

	
</script>


<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a71ed926053f00dc51c27f804020abc9&libraries=services"></script>
	
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.499293, 127.033236),
		level : 4
	};
	
	
	var map = new kakao.maps.Map(container, options); //객체 생성 -> 지도 출력
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${sdto[0].address}', function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${sdto[0].name}</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 	
	});
</script>








