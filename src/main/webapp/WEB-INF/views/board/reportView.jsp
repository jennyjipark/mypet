<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>MyPet :: 신고하기 게시판</title>

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
        height: 1100px;
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
    	min-height: 200px;
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
    
    .comment {
    	width: 1050px;
    	height: 50px;
    }
    
    .btn {
    	margin-left: 1100px;
    }

</style>


    <div id="content">
    	<div class="btn-group">
    		<input type="button" class="btn common-btn" value="목록">
    		<input type="button" class="btn common-btn" value="수정">
        	<input type="button" class="btn common-btn" value="삭제">
    	</div>
    
        <table class="table table-condensed">
        	<tr class="headtr">
        		<td class="firstth" colspan="1">제목</td>
        		<td class="firsttd" colspan="9">${rdto.title }</td>
        	</tr>
        	<tr class="headtr">
        		<td class="firstth" colspan="1">작성자</td>
        		<td class="firsttd" colspan="9">${rdto.name }</td>
        	</tr>
        	<tr class="headtr">
        		<td class="firstth" colspan="1">작성일</td>
        		<td class="firsttd" colspan="9">${rdto.writedate }</td>
        	</tr>
        	<tr class="headtr">      	
        		<td class="firsttd" colspan="10" style="padding: 30px 50px">
        			<div class="board-content">${rdto.content }</div>        		
        		</td>
        	</tr>
      	</table>

	<form method="post" action="/mypet/reportBoard/commentOk.action">
		<div id="comments" value="${rdto.seqReportBoard}">
			<table class="table table-bordered">
				<c:forEach items="${clist}" var="dto">
					<tr>
						<td colspan="1">${dto.name}</td>
						<td colspan="9">${dto.comments}</td>
						<td>${dto.writedate }</td>
					</tr>
				</c:forEach>
			</table>
			<input type="text" cols="175" rows="3" placeholder="허위 사실 기재시 처벌이 있을수 있습니다." class="comment" name="comment">
			<input type="submit" class="btn btn-outline-secondary" type="button" id="btnComment" value="등록">
		</div>
 	</form>

</div>
   



<script>

	var seqReportBoard = $("#comments").attr('value');
	
	$("#btnComment").click(function() {

		$(".comment").val($(".comment").val() + "," + seqReportBoard);
		console.log($(".comment").val());

	});
	
</script>
