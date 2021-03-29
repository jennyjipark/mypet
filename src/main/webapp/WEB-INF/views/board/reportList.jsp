<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>MyPet :: 신고하기 게시판</title>
<style>

 body {
      font-family: 'NanumSquare';
    }
    

    /* header */
    #header{
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 10;
        height: 200px;
        background-color: #F6DA42;
        padding: 20px 100px;
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
        /* border: 1px solid rgb(230,229,235); */
        border: 1px solid black;
       }




    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: 1000px;
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
         font-family: 'NanumSquare';
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
    
	#modal {
	  display:none;
	  position:relative;
	  width:100%;
	  height:100%;
	  z-index:1;
	}
	
	#modal h2 {
	  margin:0;   
	}
	
	#modal button {
	  display:inline-block;
	  width:100px;
	  margin-left:calc(100% - 100px - 10px);
	}
	
	#modal .modal_content {
	  width:300px;
	  margin:100px auto;
	  padding:20px 10px;
	  background:#fff;
	  border:2px solid #666;
	}
	
	#modal .modal_layer {
	  position:fixed;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  z-index:-1;
	}
	
	.pagination {
		margin-left: 500px;
	}

</style>


    <div id="content">
        <span class="board-name">신고하기 게시판</span>
        <div class="board-btn"><input type="button" class="btn common-btn" id="btnWrite" value="글쓰기">
        <input type="button" class="btn common-btn" value="삭제"></div>
        <table class="table table-condensed">
            <tr class="headtr">
                <th class="firsttd">번호</th>
                <th class="sectd">제목</th>
                <th class="thirdtd">작성자</th>
                <th class="fourthtd">날짜</th>
            </tr>
            <c:forEach items="${list}" var="dto">
	            <tr value="${dto.seqReportBoard }">
 	                <td>${dto.seqReportBoard }</td>
 	                <%-- <td><a href="/reportBoard/view.action?seq=${dto.seqReportBoard}">${dto.title }</a></td> --%>
 	                <td class="modal_open">${dto.title }</td>
 	                <td>${dto.name }</td>
	                <td>${dto.writedate }</td> 
	            </tr>
	        </c:forEach>
        </table>
        
		
		<form method="post" action="/mypet/reportBoard/viewOk.action">
			<div id="modal">
			    <div class="modal_content">
			        <p>패스워드 입력</p>
					<input type="text" name="password" id="password" value="">
			        <input type="submit" class="btn btn-outline-secondary" type="button" id="btnPassword" value="입력">
			    </div>
			    <div class="modal_layer"></div>
			</div>
		</form>


        <!-- 글쓰기 버튼 아래 -->
        <!-- <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기"></div> -->
        <!-- 페이지바/검색창 -->
        
	   <ul class="pagination">
	   		${pagebar}
	   </ul>
    </div>
   

<script>

	var seqReportBoard = [];
	var value
	
	<c:forEach items="${list}" var="dto">
		seqReportBoard.push("${dto.seqReportBoard}");
	</c:forEach>
	
	$(".modal_open").click(function(){
		value = seqReportBoard[$(this).parent('tr').attr('value') - parseInt(1)];
		//console.log(value);
	    $("#modal").attr("style", "display:block");
	});
	
	 $("#btnPassword").click(function(){
		$("#password").val($("#password").val() + "," + value);
		console.log($("#password").val());
	    $("#modal").attr("style", "display:none");
	});
	 
	 $("#btnWrite").click(function() {
		 location.href= '/mypet/reportBoard/write.action';
	 });
	 
</script>
