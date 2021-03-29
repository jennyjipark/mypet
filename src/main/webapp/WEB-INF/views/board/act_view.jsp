<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<title>MyPet::활동게시판</title>


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
        border: 0;
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
    	min-height: 400px;
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


</style>

    <div id="content">
    
    	<div class="btn-group">
    		<input type="button" class="btn common-btn" onclick="location.href='/mypet/activity/list.action';" value="목록">
    		<input type="button" class="btn common-btn" value="수정">
        	<input type="button" class="btn common-btn act_del" data-toggle="modal" data-target="#act_delete" value="삭제">
    	</div>
    
        <table class="table table-condensed">
        	<tr class="headtr">
        		<td class="firstth" colspan="1">제목</td>
        		<td class="firsttd" colspan="9">${dto.title}</td>
        	</tr>
        	<tr class="headtr">
        		<td class="firstth" colspan="1">작성일</td>
        		<td class="firsttd" colspan="9">${dto.actDate}</td>
        	</tr>
        	
        	<tr class="headtr">
        		<td class="firstth" colspan="1">조회수</td>
        		<td class="firsttd" colspan="9">${dto.viewCount}</td>
        	</tr>
        	
        	<tr class="headtr">      	
        		<td class="firsttd" colspan="10" style="padding: 30px 50px">
        			<div class="board-content">${dto.content}</div>        		
        		</td>
        	</tr>
        	
        	<!-- 첨부파일?! -->
        	<tr class="headtr">      	
        		<td class="firstth" colspan="1">첨부파일</td>
        		<td class="firsttd" colspan="9">없음</td>
        	</tr>
        	
        	<tr class="headtr">      	
        		<td class="firstth" colspan="1">이전글</td>
        		<td class="firsttd" colspan="9">${preDto.title}</td>
        	</tr>
        	
        	<tr class="headtr">      	
        		<td class="firstth" colspan="1" style="border-bottom: 1px solid #e8e8e8">다음글</td>
        		<td class="firsttd" colspan="9" style="border-bottom: 1px solid #e8e8e8">${nextDto.title}</td>
        	</tr>
        </table>
        
        
        <!-- <div class="btn-group">
        	<input type="button" class="btn common-btn" value="목록">
    		<input type="button" class="btn common-btn" value="수정">
        	<input type="button" class="btn common-btn" value="삭제">
    	</div> -->

        
        <!-- <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기"></div> -->
        
    </div>
   


	<div class="modal fade" id="act_delete" tabindex="-1" role="dialog" aria-labelledby="spon_modal" data-backdrop="static">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                	삭제하시겠습니까?
            </div>
            <div class="modal-body">
         		${dto.title} 를 삭제 하시겠습니까?
       
     	   </div>
            <div class="modal-footer">
              <button type="button" class="btn spon_modalbtn_save paycheck" onclick="location.href='/mypet/activity/list.action';" >삭제</button>
              <button type="button" class="btn spon_modalbtn_false" data-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>

<script>

</script>
