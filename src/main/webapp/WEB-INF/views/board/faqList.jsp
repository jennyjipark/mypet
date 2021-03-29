<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>MyPet::FAQ</title>	

<style>



 body {
        font-family: 'JSDongkang-Regular';
    }

    /* header */
/*     #header{
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 10;
        height: 200px;
        background-color: #F6DA42;
        padding: 20px 100px;
    } */

    .logo {
        margin: 0px auto;
        /* border: 1px solid black; */
        width: 180px;
        height: 180px;
        background-image: url('../image/logo.png');
        background-size: cover;
        background-position: 50% 50%;
    }

    /* content */
 

    #content{        
        width: 1300px;
        margin: 0px auto;
        margin-top: 150px;
        padding: 20px 50px;
        border: none;
        height: auto;
       }



    /* footer */
    #footer{
        clear: both;
        position: relative;
        height: 100px;
        margin-top: 1px;
        padding-top: 34px;
        border-top: 1px solid #eef1f3;
        text-align: center;
        background-color: #F6DA42;
    }

    .board-name {
        /* border: 1px solid black; */
        display: block;
        text-align: center;
        margin-top: 130px;
        margin-bottom: 50px;
        font-size: 30px;
        font-weight : bold;
        /* font-family: 'Jal_Onuel'; */
        /* font-family: 'JSDongkang-Regular'; */
        font-family: 'JSDongkang-Bold';
        color: #301b01;
    }

    /* 테이블 css */
    table {
    	font-family: 'NanumSquare';
        font-size: 16px;
    }

    .tr2:hover{
   		cursor: pointer;
        background-color: #F6DA42;
    }
   
    .firsttd {
        width: 100px;
        text-align: center;
    }

    .sectd {
        width: 200px;
        text-align: center;
    }

    .thirdtd {
        width: 700px;
        text-align: center;
    }

	.tr3 {
		border : 1px solid #F6DA42;
	}
	
	.tr3 #txt{
		text-align: center;
		margin:20px;
	}
	
   
    /* 번호, 날짜, 조회수 */
    .tr2 > td:nth-child(1), td:nth-child(2)/* , td:nth-child(4) */ {
        text-align: center;
    }

    /* 제목 */
    .headtr > td:nth-child(3) {
        text-align: left;
    }

    /* 검색창 & 버튼 박스 */
    .pageSearch {
        /* border: 1px solid black; */
        width: 1200px;
        height: 130px;
        margin-top: 50px;
        padding: 0px 360px;
    }

    /* 게시판 검색창 공통 클래스 */
    .search-text {
        width: 365px;
        float: left;
        margin-right: 20px;
        font-size: 16px;
    }

    /* 버튼 공통 클래스 */

    .btn {
        font-family: 'Jal_Onuel';
		width : 70px;
    	margin : 0px 10px;
    	padding : 10px 12px;
		border : none;
		background-color: #b27208;
	    color: white;
		outline: none !important;	
		border-radius : 5px;
    }
    #add {
        background-color: #b27208;
        color: white;
        float: right;
    }

    .btn:hover {
        color: black;
        outline: none;
    }

    .common-btn:active {
        outline: none !important;
    }
    
    .category #adopt, .category #volunteer, .category #goods, .category #vet, .category #shelter, .category #etc{
    	border: none;
		background-color: transparent;
		text-decoration : none;
		color : #fab018;
		font-weight: bold;
		font-family: 'JSDongkang-Regular';
		font-size : 1.2em;
		padding : 6px 12px;
	}
	
	.category button{
		outline-color: #fab018;
	}
	
	.tr3 .btns{
		text-align: center;
		margin-bottom : 10px;
	}

    /* 페이지바 */

    .pagination {
        width: 700px;
        height: 40px;
    }
    .pagination> li > a {
		border-color : #ccc;
		color: #301b01;
        font-size: 16px;
        float: left;
	}

    .pagination>li>a:hover {
        background-color: #b27208;
        color: white;
    }

    .board-btn {
       /*  border: 1px solid black; */
        height: 50px;
    }

    .board-btn > input:nth-child(1) {
        margin-left: 1125px;
    }
    
	/* 추가 */
    .faqtail {
    	width:500px;
    	position :relative;
    	border : 1px solid #fab018;
    	border-radius : 5px;
    	font-family: 'NanumSquare';
		margin : 20px auto;
    }
    
    .glyphicon{
    	display:block;
    	font-size: 3em;
    	position: absolute;
    	top: 30%;
    	left: 10px;
    	color : #fab018;
    	vertical-align: middle;
    	margin-right:10px;
    	
    }
    /* .faqtail ul {
    	float: left;
    } */
    
    .faqtail #item {
   		font-size: 16px;
   		margin: 10px; 
    }
    
	#chat {
		cursor: pointer;
		color: #fab018;
		font-weight: bold;
	}
	
/* 	.tr3 > td{ display:none;} */



</style>


    <div id="content">
        <span class="board-name">FAQ</span>
      
      <c:if test="${not empty search}">
	        <div class="message well well-sm">
	            '${search}'(으)로 ${list.size()}건의 게시물을 검색했습니다.
        </div>
        </c:if>
        
        <div class="board-btn">
        	<span class="category">
	        	<button class="item" id="adopt">입양</button>
				<button class="item" id="volunteer">봉사</button>
				<button class="item" id="goods">굿즈</button>
				<button class="item" id="vet">동물병원</button>
				<button class="item" id="shelter">보호소</button>
				<button class="item" id="etc">기타</button>
			</span>
			
        	<span><input type="button" class="btn" value="글쓰기" id="add" onclick="location.href='/mypet/board/faqAdd.action'"></span>        
        	
        </div>
  
        <table class="table table-condensed" id="table">
            <tr class="headtr">
                <th class="firsttd">번호</th>
                <th class="sectd">카테고리</th>
                <th class="thirdtd">제목</th>      
            </tr>
            
         <c:forEach items="${list}" var = "fdto">
  			<tr class="tr2">
                <td>${fdto.seqFaq}</td>
                <td>${fdto.category}</td>
                <td>${fdto.title}</td>
            </tr>
            
            <tr class="tr3">
            	<td colspan="3"> 
            	<div id="txt">${fdto.content}</div>
            	<div class="faqtail">
		        	<span class="glyphicon glyphicon-question-sign"></span>
	        		<ul>
	        			<li id="item">추가로 자세한 답변을 원하신다면 <span id="chat" onclick="location.href='/mypet/member/chat.action'">채팅</span>을 이용해주세요.</li>
	        			<li id="item">전화문의를 원하신다면 1234-5678로 연락주세요.</li>
	        		</ul>
	        	</div>
	        	<div class="btns">
        			<input type="button" value="수정" id="edit" class="btn" onclick="location.href='/mypet/board/faqEdit.action?seq=${fdto.seqFaq}&seqCategory=${fdto.seqCategory}';">
           			<input type="button" value="삭제" id="delete" class="btn">           	
            	</div>
            	</td>
            </tr>
            </c:forEach>
        </table>
        </form>

       
        <!-- 페이지바/검색창 -->
        
        <div class="pageSearch">
            <!-- 페이지바 -->
            <%-- <ul class="pagination">
            	${pagebar}
            </ul>   --%>  
            
            <!-- 검색창 & 검색 버튼 -->
	         <form id="searchForm" method="GET" action="/mypet/board/faqList.action">
	           	<input type="textbox" class="form-control search-text">
	           	<input type="button" class="btn common-btn" value="검색" onclick="$('#searchForm').submit();">
	       	 </form>
               

        </div>
        
    </div>
   
</div>

<!-- 삭제하기 모달 -->
	<div class="modal" tabindex="-1" role="dialog" id="deletemodal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" id="modal-content">
	      <div class="modal-header">
		        <h5 class="modal-title">FAQ 삭제하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>FAQ를 정말 삭제하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
		      	<button type="submit" class="btn" id="deleteok">삭제</button>
		        <button type="button" class="btn" id="cancel" data-dismiss="modal" >취소</button>	        
		      </div>
		    </div>
		  </div>
		</div>
		

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	/* 삭제 */
	$('#delete').click(function(e){
		e.preventDefault();
		$('#deletemodal').modal("show");
	});

	/* 상세내용 보여주기 */
    $(document).ready(function(){

    	$("#table tr:odd").addClass("odd");
        $("#table tr:not(.odd)").hide(); 
        $("#table tr:first-child").show(); //열머리글 보여주기

        $("#table tr.odd").click(function(){
            $(this).next("tr").toggle();
            $(this).find(".arrow").toggleClass("up");

        });
       

    }); 
    
    /* $(function(){
    	$("#table .tr2").click(function(){
    		$("#table .tr3 td").slideUp();
    		$('.icon').css('transform','none');
    		if(!$(this).next().is(":visible"))
    		{
    			$(this).next().slideDown();
    			$(this).find('.icon:eq(0)').css('transform','rotate(180deg)');
    		}
    	})
    }) */
    
/*     	var tr2 = document.getElementsByClassName("tr2");
    
    	$("#table .tr2").click(function(){
    		tr2.style.backgroundColor = "#F6DA42";
    	}); */

</script>

    


