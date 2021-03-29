<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>MyPet::봉사활동신청</title>

<style>



	body {
	   font-family: 'NanumSquare';
	   color: #301b01;
	}
     

    #content{        
        width: 1300px;
        margin: 0px auto;
        margin-top: 150px;
        padding: 20px 50px;
    }


    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: auto;
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
    
    table > tbody > tr > .firstth {
    	padding: 10px;
    	border-right: 1px solid #e8e8e8;
    	text-align: center;
    	background-color: #f9f9f9;
    } 
    
    table > tbody > tr > .firsttd {
    	padding: 10px 15px;
    } 
    
   .firstth {
    	width: 150px;
    	padding: 10px;
    }
    
    .board-content {
    	/* border: 1px solid black; */
    	min-height: 800px;
    	width: 1100px;
    	float: left;
    }
    
    .board-content > span {
    	font-size: 24px;
    	font-weight: bold;
    	text-align: center;
    	display: block;
    	margin-top: 100px;
    	margin-bottom: 30px;
    	
    }
    
    
    .info {
    	/* border: 1px solid #e8e8e8; */
	    width: 450px;
	    height: 420px;
	    background-image: url(/mypet/resources/images/volunteer/memo.png);
	    background-size: contain;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    margin-bottom: 120px;
	    margin-left: 320px;
	    padding: 100px 70px;
	    
    }
    
    .info > span {
    	display: block;
	    /* border: 1px solid; */
	    width: 300px;	 
	    margin-bottom: 8px; 
    	
    }
    
    .info > input {
    	margin-top: 30px;
    	margin-left: 120px;
    }
    
    
    .img-volunteer {
    	/* border: 1px solid #e8e8e8; */
	    width: 900px;
	    height: 600px;
	    margin-left: 100px;
    }
    
    .img-volunteer > span {
    	font-size: 24px;
    	font-weight: bold;
    	display: block;
    	text-align: center;
    	/* margin-bottom: 20px; */
    }
    
    .photo-icon {
    	/* border: 1px solid black; */
	    border: 0px;
	    width: 80px;
	    height: 80px;
	    margin-left: -30px;
	    margin-bottom: 20px;
	    margin-right: 20px;
	    background-size: contain;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    opacity: .8;
	    transform: rotate(-15deg);
    }
    
    .img {
    	border: 1px solid #e8e8e8;
	    width: 900px;
	    max-height: 500px;
	    background-size: contain;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
    }
    
    .arrow1 {
    	/* border: 1px solid #e8e8e8; */
    	width: 50px;
    	height: 50px;
    	background-image: url(/mypet/resources/images/volunteer/arrow1.png);
    	background-size: contain;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    float: left;
	    position: relative;
	    left: -70px;
	    top: 280px;
	    opacity: .2;
	    cursor: pointer;
    }
    
    .arrow2 {
    	/* border: 1px solid #e8e8e8; */
    	width: 50px;
    	height: 50px;
    	background-image: url(/mypet/resources/images/volunteer/arrow2.png);
    	background-size: contain;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    float: right;
	    position: relative;
	    right: -70px;
	    top: 280px;
	    opacity: .2;
	    cursor: pointer;
    }
    
    .board-content > .desc {
    	font-size: 16px;
	    font-weight: normal;
	    display: block;
	    margin-top: 200px;
    }

    /* 버튼 공통 클래스 */

    .btn {
        font-family: 'NanumSquare';
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


    .board-btn > input:nth-child(1) {
        margin-left: 1060px;
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
	

    
    
    /* 모달창 */
       
    .modal-footer #check, .modal-footer #cancel {
		font-family: 'Jal_Onuel';
		width : 70px;
    	margin : 0px 10px;
    	padding : 10px 12px;
		border : none;
	    color: white;
		outline: none !important;	
		border-radius : 5px;
	}
	.modal-footer #delete:hover, .modal-footer #cancel:hover{
		color:black;
	}
	
	
	.modal-footer #check{ background-color: #b27208; }
	.modal-footer #cancel{ background-color: #fab018; }
	
    }
	 
	 
    

</style>


    <div id="content">
    
    	<div class="btn-group">
    		
    		<!-- 회원 & 비회원일 경우 -->
    		<c:if test="${empty seqUser or seqUser > 5}">
    		<input type="button" class="btn common-btn" style="margin-left: 140px;" value="목록" onclick="location.href='/mypet/board/volunteerList.action'">
    		</c:if>
    		    	    
    		<!-- 관리자일 경우 -->
    		<c:if test="${seqUser < 6}">
    		<input type="button" class="btn common-btn" value="목록" onclick="location.href='/mypet/board/volunteerList.action'">
    		<input type="button" class="btn common-btn" value="수정" onclick="location.href='/mypet/board/volunteerEdit.action?seqVolunteer=${seqVolunteer }'">
        	<input type="button" class="btn common-btn" value="삭제" onclick="location.href='/mypet/board/volunteerDelete.action?seqVolunteer=${seqVolunteer }'">
        	</c:if>
        	
    	</div>
    
    	<c:forEach items="${list }" var="dto">
    	<input type="hidden" class="seq" name="seqUser" value="${seqUser }">
    	<input type="hidden" class="seq" name="seqVolunteer" value="${dto.seqVolunteer }">
    	
        <table class="table table-condensed">
        	<tr class="headtr">
        		<td class="firstth" colspan="1">제목</td>
        		<td class="firsttd" colspan="9">[${dto.name }] ${dto.title }</td>
        	</tr>
        	<tr class="headtr">
        		<td class="firstth" colspan="1">작성일</td>
        		<td class="firsttd" colspan="9">${dto.writeDate }</td>
        	</tr>
        	<tr class="headtr">
        		<td class="firstth" colspan="1">마감현황</td>
        		<td class="firsttd" style="width: 700px">${dto.state }</td>        		
        		<td class="firstth" colspan="1">조회수</td>
        		<td class="firsttd" colspan="1">${dto.count }</td>
        	</tr>
        	<tr class="headtr">      	
        		<td class="firsttd" colspan="10" style="padding: 30px 50px">
        			
        			<div class="board-content">
        				
        				<!-- 봉사활동 기본정보 -->
        				<span>봉사활동 안내</span>
        				
        				<div class="info">
        					<span><b>봉사활동명:</b> ${dto.name }</span>
        					<span><b>기간:</b> ${dto.startDate } ~ ${dto.endDate }</span>
        					<span><b>모집인원:</b> ${dto.recruit }</span>
        					<span><b>신청인원:</b> ${dto.apply }</span>
        					<span><b>보호소:</b> ${dto.nameS }</span>
        					<span><b>주소:</b> ${dto.address }</span>
        					
        					<input type="button" id="ok" class="btn common-btn" value="신청하기">
        				</div>
        				        	
        				<div class="img-volunteer">
        								
        					<span><img class="photo-icon" src="../resources/images/photo.png">쫑쫑보호소 봉사활동 앨범</span>
        					
        					 <!-- 이미지 split -->			  
        					<c:set var="keyword" value="${dto.image }"></c:set>
							<c:set var="arr" value="${fn:split(keyword,',')}"></c:set>
							
							<c:forEach var="img" items="${arr }">
								<input type="hidden" name="img-split" value="${img }"> 
							</c:forEach>	
							
        					<div class="arrow1"></div>
        					<div class="arrow2"></div>             					        												

        					<img class="img" src="../resources/images/volunteer/${arr[0] }">
        					
        				</div>
        				
        				<span class="desc">${dto.content }</span>

        			</div>     
        			
        		</td>
        	</tr>
        	
        	<!-- 첨부파일?! -->
        	<tr class="headtr">      	
        		<td class="firstth" colspan="1">첨부파일</td>
        		<td class="firsttd" colspan="9">첨부파일이 존재하지 않습니다.</td>
        	</tr>
        	
        	<c:forEach items="${fornext }" var="fdto">
	        	<c:if test="${dto.seqVolunteer > fdto.seqVolunteer }">
	        	<tr class="headtr" style="cursor: pointer" onclick="location.href='/mypet/board/volunteerView.action?seqVolunteer=${fdto.seqVolunteer }'">      	
	        		<td class="firstth" colspan="1">이전글</td>
	        		<td class="firsttd" colspan="9">[${fdto.name}] ${fdto.title }</td>
	        	</tr>
	        	</c:if>        	       
        	
        	
        	<!-- 이전글 & 다음글 존재하지 않을 때 -->
        	<c:forEach items="${maxmin }" var="mdto">
	        	<c:if test="${dto.seqVolunteer == mdto.min }">
	        	<tr class="headtr">      	
	        		<td class="firstth" colspan="1">이전글</td>
	        		<td class="firsttd" colspan="9">이전글이 존재하지 않습니다.</td>
	        	</tr>
	        	</c:if>
	        	
	        	<c:if test="${dto.seqVolunteer == mdto.max }">
	        	<tr class="headtr">      	
	        		<td class="firstth" colspan="1">다음글</td>
	        		<td class="firsttd" colspan="9">다음글이 존재하지 않습니다.</td>
	        	</tr>
	        	</c:if>        	
        	</c:forEach>
        	
        	
        	
        	
	        	<c:if test="${dto.seqVolunteer < fdto.seqVolunteer }">
	        	<tr class="headtr" style="cursor: pointer" onclick="location.href='/mypet/board/volunteerView.action?seqVolunteer=${fdto.seqVolunteer }'">      	
	        		<td class="firstth" colspan="1" style="border-bottom: 1px solid #e8e8e8">다음글</td>
	        		<td class="firsttd" colspan="9" style="border-bottom: 1px solid #e8e8e8">[${fdto.name}] ${fdto.title }</td>
	        	</tr>
	        	</c:if>
        	</c:forEach>
        	
        	
        	
        	
        </table>
        </c:forEach>
               
    </div>
    
    
    
    <c:forEach items="${list }" var="dto">
	<div class="modal" tabindex="-1" role="dialog" id="modal">
		<div class="modal-dialog" role="document">
		  <div class="modal-content" id="modal-content">
		     <div class="modal-header">
		       <h5 class="modal-title">봉사활동 신청하기</h5>
		       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         <span aria-hidden="true">&times;</span>
		       </button>
		     </div>
		     
		     <div class="modal-body">
		       <p>[${dto.name }] 봉사활동 신청하시겠습니까?</p>
		     </div>
		     
		     <div class="modal-footer">
		      <button type="submit" class="btn" id="check">확인</button>
		       <button type="button" class="btn" id="cancel" data-dismiss="modal" >취소</button>	        
		     </div>
		   </div>
		 </div>
	</div>
	
	
	<div class="modal" tabindex="-1" role="dialog" id="okmodal">
		<div class="modal-dialog" role="document">
		  <div class="modal-content" id="modal-content">
		     <div class="modal-header">
		       <h5 class="modal-title">신청완료</h5>
		       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         <span aria-hidden="true">&times;</span>
		       </button>
		     </div>
		     <div class="modal-body">
		       <p>[${dto.name }] 신청이 완료되었습니다.</p>
		     </div>
		     <div class="modal-footer">
		       <button type="button" class="btn" id="check" data-dismiss="modal">확인</button>	        
		     </div>
		   </div>
		 </div>
	</div>
</c:forEach>

<script>
	
	/* 이미지 파일명 */
	var list = new Array();
	
	/* 회원번호, 봉사활동 번호 */
	var seqUser = $("input[name='seqUser']").val();
	var seqVolunteer = $("input[name='seqVolunteer']").val();
	
	var i = 0;		
	
	$(document).ready(function() {
		
		$("input[name=img-split]").each(function(index, item) {
			list.push($(item).val());    		    		
		});
				
	});

	
	/* 봉사활동 신청 모달 */
	$('#ok').click(function(e){
		if (seqUser== null || seqUser < 6) {
			$(".modal-title").html("알림");
    		$("p").html("회원만 이용가능합니다.");
    		$('#okmodal').modal("show");
		} else {
			e.preventDefault();
			$('#modal').modal("show");
		}
		
		
	});
	
	$('#check').click(function(e){
		e.preventDefault();
		
		location.href='/mypet/board/volunteerOk.action?seqVolunteer=' + seqVolunteer + '&seqUser=' + seqUser;
		
		$('#okmodal').modal("show");
		$('#modal').modal("hide");
	});

   

    /* 화살표 누르면 사진 바꾸기 */        
    $(".arrow2").click(function() {
    	
    	i++;
    	    	    
    	if(i == list.length) {
    		$(".modal-title").html("알림");
    		$("p").html("마지막 이미지입니다.");
    		$('#okmodal').modal("show");
    		i--;
    	}
    	
    	$(".img").prop("src", "../resources/images/volunteer/"+ list[i]);
    });
    
    
    
    
    $(".arrow1").click(function() {
   		
    	i--;
    	
    	if(i < 0) {
    		$(".modal-title").html("알림");
    		$("p").html("이전 이미지가 없습니다.");
    		$('#okmodal').modal("show");
    		i++;
    	}
    	
    	$(".img").prop("src", "../resources/images/volunteer/"+ list[i]);
    })

    
    </script>
