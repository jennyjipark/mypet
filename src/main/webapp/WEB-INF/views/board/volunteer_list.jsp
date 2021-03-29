<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>MyPet::봉사활동</title>

<style>



 	body {
        font-family: 'NanumSquare';
	   	color: #301b01;
    }


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
       }




    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: 1000px;
    }


    .board-name {
        /* border: 1px solid black; */
        display: block;
        text-align: center;
        margin-top: 130px;
        margin-bottom: 50px;
        font-size: 30px;
        font-family: 'Jal_Onuel';
        color: #301b01;
    }

    /* 테이블 css */
    table {
        font-size: 16px;
    }
    
    .tr2 {
    	cursor: pointer;
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
        width: 300px;
        text-align: center;
    }
    
    .fifthtd {
        width: 100px;
        text-align: center;
    }

   
    /* 번호, 날짜, 조회수 */
    .tr2 > .center  {
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
        padding: 0px 300px;
        text-align: center;
    }

    /* 게시판 검색창 공통 클래스 */
    .search-text {
    	margin-left: 400px;
        width: 340px;
        float: left;
        margin-right: 20px;
        font-size: 16px;
    }

    /* 버튼 공통 클래스 */

    .btn {
       	font-family: 'Jal_Onuel';
    }
    
    .common-btn {
        background-color: #b27208;
        color: white;
        float: left;
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
       /*  width: 700px; */
        height: 40px;
        margin-top: 60px;
        text-align: center;
    }
    
    .pagination> li {
    	margin: 0px;
    }
    
    
    .pagination> li > a {
		border-color : #ccc !important;
		color: #301b01 !important;
        font-size: 16px !important;
        background-color: transparent !important;    
        cursor: pointer !important;
	}

    .pagination> li > a:hover {
        background-color: #b27208 !important;
        color: white !important;
    }
    
    .pagination> .active > a {
    	background-color: #b27208 !important;
    	color: white !important;
    }

    .board-btn {
       /*  border: 1px solid black; */
        height: 50px;
    }

    .board-btn > input:nth-child(1) {
        margin-left: 1125px;
    }


	#search-btn {
		float: left;	
		
	}
</style>


    <div id="content">
        <span class="board-name">봉사활동신청</span>
        <div class="board-btn">
        	<c:if test="${seqUser < 6 }">
        	<input type="button" class="btn common-btn" value="글쓰기" onclick="location.href='/mypet/board/volunteerWrite.action'">
        	</c:if>
        </div>
        <table class="table table-condensed">
            <tr class="headtr">
                <th class="firsttd">번호</th>
                <th class="sectd">제목</th>
                <th class="thirdtd">마감현황</th>
                <th class="fourthtd">기간</th>           
                <th class="thirdtd">작성일</th>
                <th class="fifthtd">조회수</th>
            </tr>
            <c:forEach items="${list }" var="dto">
            <tr class="tr2" onclick="location.href='/mypet/board/volunteerView.action?seqVolunteer=${dto.seqVolunteer }'">
                <td class="center">${dto.seqVolunteer }</td>
                <td>[${dto.name }] ${dto.title }</td>
                <td class="center">${dto.state }</td>
                <td class="center">${dto.startDate } ~ ${dto.endDate }</td>
                <td class="center">${dto.writeDate }</td>
                <td class="center">${dto.count }</td>
            </tr>
			</c:forEach>
        </table>

        <!-- 글쓰기 버튼 아래 -->
        <!-- <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기"></div> -->
        
        
        <!-- 페이지바/검색창 -->            
        <div class="pageSearch" style="clear: both">
          <c:if test="${list.size() > 0 }">
            <!-- 페이지바 -->
	            <ul class="pagination">
	                 ${pagebar }
	            </ul> 
			</c:if>
        </div>
        
        <!-- 검색창 & 검색 버튼 -->
        <form method="GET" action="/mypet/board/volunteerList.action">
        	<input type="text" name="search" class="form-control search-text">
        	<input type="submit" class="btn common-btn" id="search-btn" value="검색">
        </form>
    </div>
   


    <script>


    </script>
