<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>MyPet::동물병원 더 찾아보기</title>
<style>

	 /* 잘 풀리는 오늘 */
    @font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    }
    
    /* 나눔 스퀘어*/
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	.nanumsquare {
	    font-family: 'NanumSquare', sans-serif !important;
	}
	
    /* content */
    #content{
        width: 1300px;
        margin: 0px auto;
        margin-top: 210px;
        padding: 20px 50px;
        border: none;
        height: auto;
       
    }


     /* 페이지타이틀 */
    .board-title{
    	font-size : 30px;
    	text-align : center;
    	display: block;
    	margin-bottom: 50px;
    	font-family: 'Jal_Onuel';
    	color: #301b01;
    }
    

	/* 테이블 */
	
	.table {
		margin : 10px auto;
		width : 1000px;
		height : auto;
	}
	
	.table th, .table td{
		text-align: center;
	}
	
	.table th:nth-child(1) { width: 200px; }
	.table th:nth-child(2) { width: 200px; }
	.table th:nth-child(3) { width: 200px; }
	.table th:nth-child(4) { width: 400px; }
	
	.table td:nth-child(4) { text-align : left;}
	

	.table #name {
		cursor: pointer;
	} 
  
	

</style>
<div id="content">
	<div class="board-title">동물병원 찾아보기</div>
	
		<div class="well">
			<form method="GET" action="/mypet/vet/more.action">
				<input type="text" name="query" class="form-control" required placeholder="동물병원 이름을 입력해주세요.">
			</form>
		</div>

		<table class="table table-condan">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>도로명주소</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach items="${mlist}" var="dto">
				<tr>
					<td>${dto.category}</td>
					<td><a href="${dto.link}" target="_blank">${dto.title}</a></td>
					<td>${dto.telephone}</td>
					<td>${dto.roadAddress}</td>
				</tr>
			</c:forEach>
				<c:if test="${mlist.size() == 0}">
				<tr>
					<td colspan="4">검색 결과가 없습니다.</td>
				</tr>
				</c:if>	
			</tbody>	
		</table>
	</div>
	
	