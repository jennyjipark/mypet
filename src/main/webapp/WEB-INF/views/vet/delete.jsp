<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<title>MyPet::동물병원 삭제하기</title>	

<style>

    /* content */
    #content{
        width: 1300px;
        margin: 0px auto;
        margin-top: 210px;
        padding: 20px 50px;
        /* border: 1px solid rgb(230,229,235); */
        border: 1px solid black;
       
        /* margin-right: px; */
    }

    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: 850px;
    }

    #contentnav {
        border: 1px solid black;
        width: 1200px;
        height: 100px;
        padding: 20px 20px;
    }
    
    /* 모달창 */
    
    .modal-content {
    	overflow: hidden;
    }
    
    .close {
    	position : absolute;
    	top : 20px;
    	right :10px;
    	outline: none !important;	
    }
       
    .modal-header, .modal-title {
    	background-color: #f6da42;
    	font-family: 'Jal_Onuel';
    	font-size: 16px;
    }
    
   	.modal-body{
		font-family: 'NanumSquare';
		text-align: center;
		height : 90px;	
		font-size: 16px;	
	}
	
	.modal-body p {
		margin-top: 25px;
	}
	
	.modal-footer{
		text-align: center;
	}
	

    
    
    /* 버튼 */
       
    .modal-footer #delete, .modal-footer #cancel {
		font-family: 'Jal_Onuel';
		width : 70px;
    	margin : 0px 10px;
    	padding : 10px 12px;
		border : none;
	    color: white;
		outline: none !important;	
		border-radius : 5px;
	}
	.modal-footer #delete:hover, .modal-footer #cancel:hover{
		color:black;
	}
	
	
	.modal-footer #delete{ background-color: #b27208; }
	.modal-footer #cancel{ background-color: #fab018; }
	
    }
	

    
</style>

<div id="content">
	<button id="delete" class="btn">삭제</button>
	
	<form method="POST" action="mypet/vet/deleteok.action">
		<div class="modal" tabindex="-1" role="dialog" id="deletemodal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content" id="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">동물병원 정보 삭제하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>동물병원을 정말 삭제하시겠습니까?</p>
		      </div>
		      <div class="modal-footer">
		      	<button type="submit" class="btn" id="delete">삭제</button>
		        <button type="button" class="btn" id="cancel" data-dismiss="modal" >취소</button>	        
		      </div>
		    </div>
		  </div>
		</div>
		<input type="hidden" name="seq" value="${seqVet}">
	</form>
</div>


<script>
	$('#delete').click(function(e){
		e.preventDefault();
		$('#deletemodal').modal("show");
	});
</script>












