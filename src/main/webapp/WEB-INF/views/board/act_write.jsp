<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<title>MyPet::활동게시판</title>

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
        /* border: 1px solid rgb(230,229,235); */
        border: 0;
     }


    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: 1100px;
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
	
	.board-write .board-content {
		min-height: 500px;
		resize: none;
		color: #9c9c9c;
	}
	
	.board-write input[type="text"] {

		color: #9c9c9c;
	}
	
	
	
	/* 게시판 선택 select 박스 */
	.board-write > select {
    	color: #9c9c9c;
    }
    
    .board-write > select > option {
    	color: #301b01;
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
			<span class="title">글쓰기</span>
			
			<!-- 각자 본인의 게시판에 들어가면 option이 selected 되어있도록?! 해보고싶어서 넣어봤어요. -->
			
			<select class="form-control multiple" disabled >
				<option disabled hidden>게시판을 선택해주세요.</option>
				<option value="1">공지사항</option>
				<option value="2" selected>활동</option>		
				<option value="3">봉사활동신청</option>
				<option value="4">입양후기</option>
				<option value="5">자주하는질문</option>
				<option value="6">유기동물신고</option>			
			</select>
			
			<form method="GET" action="/mypet/activity/writeok.action">
		        <input type="text" class="form-control board-title" name="title" onclick="this.value=''" placeholder="제목을 입력해주세요.">	        	
		        <textarea class="form-control board-content" name="content" onclick="this.value=''" placeholder="내용을 입력해주세요."></textarea> 	    	                      		           		        
		        
		        <div class="photo">	        	
		        	<input type="file" id="file" class="board-file">	
		        	<label for="file"></label>	
		        	<span>사진</span>	  	       		
		       	</div>
		        
		        <div class="board-btn">
		        	<input type="button" class="btn common-btn delete" onclick="location.href='/mypet/activity/list.action'" value="취소">
		        	<input type="submit" class="btn common-btn ok"  value="등록">		        		        	      
		        </div>
	       	</form>
	       
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
	

    
    
    </script>
