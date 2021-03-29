<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

</style>


    <div id="content">
        <span class="board-name">공지사항</span>
        <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기">
        <input type="button" class="btn common-btn" value="삭제"></div>
        <table class="table table-condensed">
            <tr class="headtr">
                <th class="firsttd">번호</th>
                <th class="sectd">제목</th>
                <th class="thirdtd">날짜</th>
                <th class="fourthtd">조회수</th>
            </tr>
            <tr class="tr2">
                <td>1</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>

            <tr class="tr2">
                <td>2</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>3</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>4</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>5</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>6</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>7</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>8</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>9</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>10</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>

            <!-- 10개 vs 15개 -->
            
            <!--
            <tr class="tr2">
                <td>11</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>12</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>13</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>14</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            <tr class="tr2">
                <td>15</td>
                <td>공지사항 제목입니다.</td>
                <td>2021-01-01</td>
                <td>32</td>
            </tr>
            -->
        </table>

        <!-- 글쓰기 버튼 아래 -->
        <!-- <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기"></div> -->
        <!-- 페이지바/검색창 -->
        
        <div class="pageSearch">
            <!-- 페이지바 -->
            <ul class="pagination">
                <li><a href=\"#!\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>
                <li><a>1</a></li>
                <li><a>2</a></li>
                <li><a>3</a></li>
                <li><a>4</a></li>
                <li><a>5</a></li>
                <li><a>6</a></li>
                <li><a>7</a></li>
                <li><a>8</a></li>
                <li><a>9</a></li>
                <li><a>10</a></li>
                <li><a href=\"#!\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a></li>
            </ul>       

            <!-- 검색창 & 검색 버튼 -->
            <input type="textbox" class="form-control search-text">
            <input type="button" class="btn common-btn" value="검색">
        </div>
    </div>
   



    <script>


    </script>
