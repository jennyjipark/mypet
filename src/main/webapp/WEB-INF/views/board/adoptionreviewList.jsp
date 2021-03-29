<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>



 body {
      font-family: 'NanumSquare';
    }
     

    #content{        
        width: 1300px;
        margin: 0px auto;
        margin-top: 150px;
        padding: 20px 50px;
        /* border: 1px solid rgb(230,229,235); */
        border: 1px solid black;
       }




    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: auto;
        border: 0px;
    }


    .board-name {
        /* border: 1px solid black; */
        display: block;
        text-align: center;
        margin-top: 130px;
        margin-bottom: 50px;
        font-size: 30px;
        font-family: 'Jal_Onuel';
        /* font-family: 'NanumSquare';
        font-weight: bold; */
        color: #301b01;
    }

    /* 테이블 css */
    table {
        font-size: 16px;
    }

    .tr2:hover {
        background-color: #F6DA42;
    }
   
    .firsttd {
        width: 100px;
        text-align: center;
    }

    .sectd {
        width: 600px;
        text-align: center;
    }

    .thirdtd {
        width: 200px;
        text-align: center;
    }

    .fourthtd {
        width: 100px;
        text-align: center;
    }

   
    /* 번호, 날짜, 조회수 */
    .tr2 > td:nth-child(1), td:nth-child(3), td:nth-child(4) {
        text-align: center;
    }

    /* 제목 */
    .headtr > td:nth-child(2) {
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
        width: 340px;
        float: left;
        margin-right: 20px;
        font-size: 16px;
    }

    /* 버튼 공통 클래스 */

    .btn {
         font-family: 'Jal_Onuel';
         cursor: pointer;
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
        margin-left: 1060px;
    }
    
    /* 캐러셀 세팅 */
    
    .carousel-indicators li {
    	border: 1px solid #a0a0a0;
    }
    
    .carousel-indicators .active {
    	background-color: #b27208;
    }
    
    .imgitems {
    	width: 254px !important;
    	height: 220px !important;
    	
    }
    
    .titlecover{
    	text-align: center;
    	border: 1px solid #aaa;
    	height: 60px;
    	border-radius: 5px;
    }
    
    .titlecover > div {
    	color: #aaa;
    }
    /* 버튼 css */
    
    
.btnself {
	font-family: 'Jal_Onuel';
	background-color: #b27208;
	color: white;
} 

.btnself:hover {
	background-color: #b27208;
	color: white;
}
table tr {
	display: none;
}

table tr:nth-child(1), table tr:nth-child(2) {
	display: block;
}

</style>


    <div id="content">
        <span class="board-name">입양 후기 게시판</span>

        <table class="table table-condensed">
        	<tr>
        		<c:forEach items="${rlist}" var="dto" varStatus="count">
            	<td>
            		<div class="innerbox">
            			<div style="width:254px; height:301px; margin:auto;">
		
							<!-- 가운데 o 모양 페이지 표시 -->
							<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
								<c:forEach items="${fn:split(dto.image, ',') }" var="img" varStatus="status">
									<div class="item <c:if test="${status.index==0}">active</c:if>">
										<img class="imgitems"src="/mypet${img}"   alt="1">
									</div>
								</c:forEach>
								</div>
								<div class="titlecover">
									<c:set var="TextValue" value="${dto.title}"/>
									<a href="/mypet/board/adoptionreviewview.action?seqAdoptionReview=${dto.seqAdoptionReview}">${fn:substring(TextValue,0,15)}<c:if test="${fn:length(TextValue)>15}">...</c:if><span class="badge">${dto.viewCount}</span></a>
									<c:set var="TextValue2" value="${dto.content}"/>
									<div>${fn:substring(TextValue2,0,15)}<c:if test="${fn:length(TextValue2)>15}">...</c:if></div>
								</div>
							</div>
						</div>
            		</div>
            	</td>
            	<c:if test="${count.count%4==0}">
            		<tr>
            	</c:if>
            	</c:forEach>
            </tr>
            
           
            
        </table>

        <!-- 글쓰기 버튼 아래 -->
        <!-- <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기"></div> -->
        <!-- 페이지바/검색창 -->
        <div class="btnwrap" style="text-align: center;">
        	<button id="btnmore" class="btn btnself" onclick="more()">더보기</button>
            <button id="btnwrite" class="btn btnself" onclick="location.href='/mypet/board/adoptionreviewwrite.action';">글쓰기</button>
        </div>
    </div>
   
   <script>
		
   	let count = 1;
   	
   	function more() {
   		if(count==1) {
	   		$('table tr:nth-child(3)').css("display","block");
	   		count++;
   		} else if(count==2) {
   			$('table tr:nth-child(4)').css("display","block");
	   		count++;
   		} else if(count==3) {
   			$('table tr:nth-child(5)').css("display","block");
	   		count++;
   		} else if(count==4) {
   			$('table tr:nth-child(6)').css("display","block");
	   		count++;
   		} else if(count==5) {
   			$('table tr:nth-child(7)').css("display","block");
	   		count++;
   		} else if(count==6) {
   			$('table tr:nth-child(8)').css("display","block");
	   		count++;
   		} else if(count==7) {
   			$('table tr:nth-child(9)').css("display","block");
	   		count++;
   		} else if(count==8) {
   			$('table tr:nth-child(10)').css("display","block");
	   		count++;
   		} else if(count==9) {
   			$('table tr:nth-child(11)').css("display","block");
	   		count++;
   		} else if(count==10) {
   			$('table tr:nth-child(12)').css("display","block");
	   		count++;
   		} else if(count==11) {
   			$('table tr:nth-child(13)').css("display","block");
	   		count++;
   		} else if(count==12) {
   			$('table tr:nth-child(14)').css("display","block");
	   		count++;
   		}
   		
   	}
		
   </script>



    
