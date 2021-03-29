<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <!-- 제이쿼리 ui css -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
 <!-- //제이쿼리 ui js -->
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
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
        height: 1200px;
    }

	
	.title {
		display: block;
		margin-bottom: 40px;		
		font-size: 30px;
        font-family: 'Jal_Onuel';
        text-align: center;        
	}
	
	.form-control {
		margin-bottom: 10px;
	}
	
	.board-write > select {
		/* width: 300px; */
	}
	
	.board-write {
		/* border: 1px solid black; */
		height: 850px;
		padding: 0px 200px;		
		margin-top: 170px;
	}
	
	.board-write > .board-content {
		min-height: 500px;
		resize: none;
		color: #9c9c9c;
	}
	
	.board-write > input[type="text"] {

		color: #9c9c9c;
	}
	
	
	
	/* 게시판 선택 select 박스 */
	.board-write > select {
    	color: #9c9c9c;
    }
    
    .board-write > select > option {
    	color: #301b01;
    }
    
	
	/* 날짜 & 모집인원 */
	.form-date {
		float: left;
		width: 264px;
		margin-right: 10px;
	}
	
	#recruit {
		float: left;
		width: 230px;
		margin-right: 5px;
	}
	
	.count {
		display: block;
		margin-top: 20px;
	}
	
	

    /* 버튼 공통 클래스 */
	
	.board-btn {
		/* border: 1px solid black;  */
		height: 80px;
		margin-top: 30px;
		padding: 0px 290px;
	} 
	
    .btn {
        font-family: 'NanumSquare';
    }
    
    
    .common-btn {
    	margin-top: 30px;
	    width: 100px;
	    height: 40px;
	    background-color: #b27208;
	    color: white;
	    font-family: 'Jal_Onuel';
	    float: left;
    }

    .common-btn:hover {
        color: white;
        outline: none;
    }

    .common-btn:active {
        outline: none !important;
    }
    
    
    .common-btn:nth-child(2) {
    	margin-left: 10px;
    }
    
    .delete {
    	background-color: #fab018;    	
    }


    
    /* 파일 */
    
    #file {
    	display: none;
    }
    
    .photo {
		border: 1px solid #ececec;
		width: 50px;
		height: 60px;
		padding: 5px;
	}
	
	.board-file {
		margin-top: 20px;
	}
	
	
    .photo > label {
    	/* border: 1px solid black; */
    	width: 40px;
    	height: 30px;
    	background-image: url(/mypet/resources/images/photo.png);
    	background-size: cover;
    	background-position: 50% 50%;
    }
    
    .photo > span {
    	display: block;
    	margin-top: -6px;
    	text-align: center;
    }
    
    
   

</style>


    <div id="content">
		
		<div class="board-write">
			<span class="title">봉사활동신청 글쓰기</span>
			
			<!-- 각자 본인의 게시판에 들어가면 option이 selected 되어있도록?! 해보고싶어서 넣어봤어요. -->
			<select class="form-control multiple">
				<option disabled hidden>게시판을 선택해주세요.</option>
				<option value="1">공지사항</option>
				<option value="2">활동</option>		
				<option value="3" selected>봉사활동신청</option>
				<option value="4">입양후기</option>
				<option value="5">자주하는질문</option>
				<option value="6">유기동물신고</option>			
			</select>
			<input type="text" class="form-control board-title" onclick="this.value=''" placeholder="봉사활동명을 입력해주세요.">
	        <input type="text" class="form-control board-title" onclick="this.value=''" placeholder="제목을 입력해주세요.">
	        
	        <!-- 날짜 -->
	        <input type="text" class="form-control form-date" placeholder="시작일" id="start_date">
	        <input type="text" class="form-control form-date" placeholder="종료일" id="end_date">
	             
	        <input type="text" class="form-control" placeholder="모집인원" id="recruit"><span class="count">명</span>
	        	
	        <textarea class="form-control board-content" onclick="this.value=''" placeholder="내용을 입력해주세요."></textarea> 	    	                      		           		        
	        
	        <div class="photo">	        	
	        	<input type="file" id="file" class="board-file">	
	        	<label for="file"></label>	
	        	<span>사진</span>	  	       		
	       	</div>
	        
	        <div class="board-btn">
	        	<input type="button" class="btn common-btn delete" value="취소">
	        	<input type="button" class="btn common-btn ok" value="등록">		        		        	      
	        </div>
	       
        </div>	

    </div>
   



    <script>
		
    /* 제목&내용 클릭 했을 때는 기본폰트 색상 */
    
    $(".board-title").click(function() {
		$(this).css("color", "#301b01")
		
	}); 
    
    
	$(".board-content").click(function() {
		$(this).css("color", "#301b01")
	}); 
	
	
	$( function() {
	    $("#start_date").datepicker();
	    $("#end_date").datepicker();
	});
    
    
    </script>
