<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>MyPet::동물병원 수정</title>	
<style>

    /* content */
    #content{
        width: 1300px;
        margin: 0px auto;
        margin-top: 210px;
        padding: 20px 50px;
        border: none;
        height: auto;
       
    }


/*     #contentnav {
        border: 1px solid black;
        width: 1200px;
        height: 100px;
        padding: 20px 20px;
    } */
    
/* --------------------------------------------------------------------------- */

	/* 페이지타이틀 */
    #board-title{
    	font-size : 30px;
    	text-align : center;
    	display: block;
    	margin-top: 130px;
    	margin-bottom: 50px;
    	font-family: 'Jal_Onuel';
    	/* font-family: 'JSDongkang-Regular'; */
    	/* font-family: 'JSDongkang-Bold'; */
    	color: #301b01;
    }
    
    /* 테이블 */
    .table{
    	width :1000px;
    	margin :10px auto;
    }
    
    .table th, .table td, .table input[type="text"]{
 		font-family: 'NanumSquare', sans-serif !important;
 		font-size: 16px;
 	   	
    }
    
    .table th, .table #list {
    	width : 30%;
    	padding-left : 50px;
    	vertical-align: middle;
    	
    }
    .table td {width : 70%;}
    
    
    /* 버튼 */
    
    .btns{
    	font-family: 'Jal_Onuel';
    	text-align: center;
    	margin-bottom : 100px;
    
    }
    .btn {
    	width : 70px;
    	margin : 10px;
    	padding : 10px 12px;
		border : none;
	    color: white;   
	    outline: none !important;
    }
    
    .btns #edit{
    	background-color: #b27208;   	
    }
    
    .btns #cancel{
    	background-color: #fab018;   	
    }
    
    
</style>

<div id="content">
	<!-- <div id="contentnav">개인 서브네비입니다.</div> -->
	<div id="board-title">${vdto.name} 수정하기</div>
	
	<form method="POST" action="/mypet/vet/editok.action">
		<table class="table table-default">
			<tr>
				<th id="list">이름</th>
				<td><input type="text" class="form-control" value="${vdto.name}"></td>
			</tr>
			<tr>
				<th id="list">주소</th>
				<td><input type="text" class="form-control" value="${vdto.address}"></td>
			</tr>
			<tr>
				<th id="list">전화번호</th>
				<td><input type="text" class="form-control" value="${vdto.tel}"></td>
			</tr>
			<tr>
				<th id="list">진료시간</th>
				<td><input type="text" class="form-control" value="${vdto.time}"></td>
			</tr>
			<tr>
				<th id="list">진료목록</th>
				<td><input type="text" class="form-control" value="${vdto.treatment}"></td>
			</tr>
			<tr>
				<th id="list">로고 or 이미지</th>
				<td><input type="file" class="form-control"></td>
			</tr>
			
		</table>
	
		<div class="btns">
	      	<input type="submit" class="btn" value="수정" id="edit">
	      	<input type="button" class="btn" value="취소" id="cancel" onclick="location.href='/mypet/vet/view.action?seq=${vdto.seqVet}'">
	    </div>
	    <input type="hidden" name="seq" value="${vdto.seqVet}">
	</form>
</div>








