<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <title>MyPet::입양하기</title>
 
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
        height: 1300px;
    }

	
	.title {
		display: block;
		margin-bottom: 40px;		
		font-size: 30px;
        font-family: 'Jal_Onuel';
        text-align: center;        
	}
	
	.form-control {
		margin-bottom: 13px;
	}
	
	.board-write > select {
		width: 300px;
		float: left;
		margin-right: 10px;
	}
	
	.board-write {
		/* border: 1px solid black; */
		height: 850px;
		padding: 0px 190px;		
		margin-top: 170px;
	}
	
	.board-write > .board-content {
		min-height: 500px;
		resize: none;
		color: #9c9c9c;
		margin-top: 10px;
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
    
	
	.board-write > .common-form {		
		width: 266px;
		margin-right: 10px;
		float: left;
	}
	
	.board-write > .last {
		margin-right: 0px;
	}
	
	#age {
		/* margin-right: 10px; */
	}
	
	.count {
		display: block;
		margin-top: 20px;
	}
	
	
	/* 성별 & 입양여부 */
	.gender, .adoption {
		border: 2px solid #fab018;
		width: 196px;
		height: 40px;
		border-radius: 3px;
		text-align: center;
		padding: 8px 0px;
		cursor: pointer;
		margin-right: 5px;	
	}
	
	#no2 {
		margin-right: 0px;
	}
	
	.radio-btn {		
		/* border: 1px solid black; */		
		text-align: center;		
		
	}
	
	
	.radio-btn > input[type="radio"] {
		display: none;
	}
	
	
	input[type="radio"]:checked + label {
		background-color: #fab018;
		color: white;
	}
	

    /* 버튼 공통 클래스 */
	
	.board-btn {
		/* border: 1px solid black;  */
		height: 80px;
		margin-top: 30px;
		padding: 0px 300px;
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
	
	.btn-vet {
		border: 1px solid #ccc;
		background-color: transparent;
		color: #9c9c9c;
		
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
    
    
   /* 모달 */
    
    .modal-content {
    	overflow: visible;
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
		height : 200px;	
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
    
    .headtr > .vet-radio {
    	display: inline;
    }
    
    .headtr > th {
    	text-align: center;
    }

</style>


    <div id="content">
		
		<div class="board-write">
			<span class="title">입양하기 글쓰기</span>
	        <input type="text" class="form-control board-title" onclick="this.value=''" placeholder="제목을 입력해주세요.">
	        <select class="form-control multiple species common-form">
	        	<option selected disabled>동물종류를 선택해주세요.</option>
	        	<option value="0">강아지</option>
	        	<option value="1">고양이</option>
	        	<option value="2">토끼</option>
	        	<option value="3">기타동물</option>	        	
	        </select>    
	         	      	            	     
	        <input type="text" class="form-control common-form" placeholder="품종을 입력해주세요." id="breed">
	        <input type="text" class="form-control common-form last" placeholder="나이를 입력해주세요." id="age">	       	   
	       	
	       	<!-- 크기 -->
	       	<select class="form-control multiple common-form">
	        	<option selected disabled>크기를 선택해주세요.</option>
	        	<option value="소형동물">소형동물</option>
	        	<option value="중형동물">중형동물</option>
	        	<option value="대형동물">대형동물</option>	    	        
	        </select>    
	        
	        <!-- 접종 유무 -->
	        <select class="form-control multiple common-form">
	        	<option selected disabled>접종유무를 선택해주세요.</option>
	        	<option value="0">접종 완료</option>
	        	<option value="1">접종 안함</option>    	        
	        </select>    
	        
	        <!-- 중성화 유무 -->
	        <select class="form-control multiple common-form last">
	        	<option selected disabled>중성화유무를 선택해주세요.</option>
	        	<option value="0">중성화 완료</option>
	        	<option value="1">중성화 안함</option>    	        
	        </select>  
	        
	        <div class="radio-btn" style="clear: both">
		        <!-- 성별 -->	   
		       	<input type="radio" class="gender" id="m" name="gender" value="0" checked>
		       	<label for="m" class="gender">남아</label>
		       	
		       	<input type="radio" class="gender" id="f" name="gender" value="1">
		       	<label for="f" class="gender">여아</label>
		       	
		       	<!-- 입양여부 -->	   
		       	<input type="radio" class="adtoption" id="yes" name="adtoption" value="0" checked>
		       	<label for="yes" class="gender">입양가능</label>
		       	
		       	<input type="radio" class="adoption" id="no" name="adtoption" value="1">
		       	<label for="no" class="gender" id="no2">입양완료</label>		       			       
	       	</div>
	       		       
	        <!-- 상세내용 -->
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
	
	
	$(".btn-vet").click(function() {
		$("#modal").modal("show");
	})
	
	
    
    
    </script>
