<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<title>MyPet::입양하기</title>
	
<style>
	
	/* content */
    #content{
        width: 1300px;
        height: auto;
        margin: 0px auto;
        margin-top: 210px;
        padding: 20px 50px;
        /* border: 1px solid black; */
       	font-family: 'NanumSquare';
    }
    
    .title {
    	margin-top: 130px;
    	margin-bottom: 50px;
    	font-size: 30px;
        font-family: 'Jal_Onuel';
        text-align: center;
        display: block;
    	
    }
    
    
    /* 지도 & 검색창 */
    .map-search {
    	/* border: 1px solid black; */
    	margin-left: 100px;
    	width: 1000px;
    	height:	700px;
    	margin-bottom: 100px;
    }
    
    #map {
    	/* border: 1px solid black; */
    	width: 1000px;
    	height: 500px;
    	margin-bottom: 50px;    
    }
    
    .map-search > input[type=text] {
    	width: 425px;
    	float: left;
    	margin-right: 16px;
    	margin-left: 239px;
    }
    
    .map-search > input[type=button] {
    	width: 80px;
    	float: left;
    	color: white;
    	background-color: #b27208;
    	font-size: 16px;
    	border: 0px;
    	font-family: 'Jal_Onuel';    	
    }
    
    .map-search > input[type=button]:hover {
    	background-color: #F6DA42;
    	color: #301b01;
    }
    
    
    .common-btn {
    	background-color: #b27208;
    	color: white;
    	font-family: 'Jal_Onuel';
    	margin-bottom: 20px;
    	float: right;
    	position: relative;
    	left: -89px;
    	width: 80px;
    	
    }
    
    .common-btn:hover {
    	background-color: #F6DA42;
    	color: #301b01;
    	
    }
    
    .form-control {
    	color: #9c9c9c;
  	  	width: 550px;
    	margin-left: 170px;
		float: left;
    }
    
    #search-btn {
    	margin-left: 110px;
    	float: left;
    }
    
    /* 동물 종류 검색 */
    
    .search-box {
    	/* border: 1px solid black; */
    	width: 1000px;
    	height: 100px;
    }
    
    .pet-radio {
    	/* border: 1px solid black; */
    	width: 1000px;
    	height: 80px;
    	padding: 0px 170px;
    }
    
    .pet-radio > input[type="radio"] {
    	display: none;
    }
    
    .pet-radio > label {
    	border: 1px solid #eee;
    	width: 130px;
    	height: 45px;
    	float: left;
    	border-right: 0px;
    	font-size: 16px;
    	font-family: 'NanumSquare';
    	text-align: center;
    	padding: 10px;
    }
    
    
    .pet-radio > label:last-child {
    	border-right: 1px solid #eee;
    }
    
    
    
    input[type="radio"]:checked + label {
		background-color: #fab018;
		color: white;
	}
    
    
    /* 입양글 리스트 */
    .list {
    	/* border: 1px solid black; */
    	width: 1200px;
    	height: auto;
    	clear: both;
    	
    }
    
    .list-detail {
    	border: 1px solid #eee;
    	width: 281px;
    	height: 440px;
    	float: left;
    	margin-left: 90px;
    	margin-bottom: 120px;    
    	color: #301b01;	
    }
    
    .list-detail > span {
    	margin-left: 5px;
    }
    
    .pet-seq {
    	/* border: 1px solid black; */
    	margin-left: 5px;
    	margin-top: 10px;
	    font-size: 12px;	    
	    height: 40px;
	    /* float: left; */
    }
    
    .list-detail > .state {
    	display: block;
    	background-color: #f9820f;
    	width: 80px;
    	height: 30px;
    	color: white;
    	text-align: center;
    	margin-left: 100px;
    	margin-top: 20px;
    	border-radius: 5px;
    	font-family: 'Jal_Onuel';
    	padding: 6px;
    	opacity: .8;
    }
    
    .img {
    	/* border: 1px solid black; */
    	width: 280px;
    	height: 280px;
    	cursor: pointer;
    	
    }
    
    .img-pet {
    	width: 279px;
    	height: 280px;
    	background-size: cover;
    	background-position: 50% 50%;
    }
    
    .pet-title {
    	font-size: 16px;
    	font-family: 'NanumSquare';
    	display: block;
    	height: 50px;
    	margin-top: 10px;
    	margin-left: 5px;
    	margin-bottom: 10px;
    	font-weight: bold;
    	cursor: pointer;
    	
    }
	
	.pet-address {
		font-size: 13px;
    	font-family: 'NanumSquare';
    	display: block;
    	margin-top: 5px;
    	margin-left: 5px;
	}
	
	.like {
		/* border: 1px solid black; */
	    width: 28px;
	    height: 28px;
	    background-image: url(/mypet/resources/images/like.png);
	    background-size: cover;
	    background-position: 50% 50%;
	    /* margin-top: -45px; */
	    margin-left: 170px;
	    background-color: transparent;
	    cursor: pointer;
	    float: left;
	}
	
	.like:hover {
		background-image: url(/mypet/resources/images/heart.png);
	}
	
	.likes-count {
		display: block;
	    float: left;
	    margin-top: 3px;
    	font-size: 14px;
    	margin-left: 10px;
	}
	
	.no {
		margin-top: 6px;
	}
	
	
	/* 검색창 & 버튼 박스 */
    .pageSearch {
        /* border: 1px solid black; */
        width: 1200px;
        height: 130px;
        margin-top: 50px;
        padding: 0px 360px;
        text-align: center;
    }
	
	/* 페이지바 */
	
    .pagination {
       /*  width: 700px; */
        height: 40px;
        margin-top: 60px;
        /* text-align: center; */
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
    

    /* 게시판 검색창 공통 클래스 */
    .search-text {
        width: 340px;
        float: left;
        margin-right: 20px;
        font-size: 16px;
    }
    
  
  	/* 모달 */
    
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
	

    
    
    /* 모달창 */
       
    .modal-footer #check, .modal-footer #cancel {
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
	
	
	.modal-footer #check{ background-color: #b27208; }
	.modal-footer #cancel{ background-color: #fab018; }
	
    }
    
    
</style>


  <div id="content">
  
    <span class="title">입양하기</span>
    <!-- 지도&검색창 -->
    <div class="map-search">
    	<div id="map">
    		    		
    	</div>  
    	
    	<div class="pet-radio">
    		<c:if test="${empty species }">		
    		<input type="radio" name="species" id="all" checked value="">
    		</c:if>
    		<label for="all" onclick="location.href='/mypet/adoption/list.action?'">전체</label>
    		
    		
    		<c:if test="${species == 0 }">		
    		<input type="radio" name="species" id="dog" checked>
    		</c:if>
    		<label for="dog" onclick="location.href='/mypet/adoption/list.action?species=0'">강아지</label>
    		    	
    		<c:if test="${species == 1 }">	
    		<input type="radio" name="species" id="cat" checked>
    		</c:if>
    		<label for="cat" onclick="location.href='/mypet/adoption/list.action?species=1'">고양이</label>
    		
    		<c:if test="${species == 2 }">	
    		<input type="radio" name="species" id="rabbit" checked>
    		</c:if>
    		<label for="rabbit" onclick="location.href='/mypet/adoption/list.action?species=2'">토끼</label>
    		
    		<c:if test="${species == 3 }">	
    		<input type="radio" name="species" id="etc" checked>
    		</c:if>
    		<label for="etc" onclick="location.href='/mypet/adoption/list.action?species=3'">기타동물</label>    		
    	</div>
    	
    	
    	<div class="search-box">
	    	<form method="GET" action="/mypet/adoption/list.action">
	    		<input type="text" class="form-control" name="search" placeholder="검색 키워드를 입력해주세요." onfocus="this.value=''">
	    		<input type="submit" class="btn common-btn" id="search-btn" value="검색">    
	    	</form>
    	</div>
    	
    </div><!-- map.search -->
    
    
    <!-- 관리자만 보여주기 -->
   	<c:if test="${seqUser < '6'}">
    <input type="button" class="btn common-btn" value="글쓰기" onclick="location.href='/mypet/adoption/write.action'">
    </c:if>
    
    
    <!-- 9개씩 나오기 -->
    <div class="list">    	        	
    
    	<!-- 관리자가 보는 페이지 -->
    	<c:if test="${seqUser < '6'}">
    	<c:forEach items="${list }" var="dto" varStatus="status">
    	<div class="list-detail">    	
    		<div class="img" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${dto.seqAdoption}'"><img class="img-pet" src="../resources/images/adoption/${dto.img }"></div>
    		<span class="pet-title" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${dto.seqAdoption}'">${dto.title }</span>
    		
    		<c:if test="${not empty dto.nameV }">
	    		<span class="pet-address">${dto.addressV }</span>
	    		<span class="pet-address">${dto.nameV }</span>
	    		<input type="hidden" class="location-hidden" value="${dto.addressV }">
    		</c:if>
    		

    		<c:if test="${empty dto.nameV }">
	    		<span class="pet-address">${dto.addressS }</span>
	    		<span class="pet-address">${dto.nameS }</span>
	    		<input type="hidden" class="location-hidden" value="${dto.addressS }">
    		</c:if>
    	

    		<div class="pet-seq">
    			<span class="no" style="float: left">no. ${dto.seqPet }</span>
    			
    			<input type="hidden" name="seqUser" class="seqUser" value="${seqUser }">
    			<c:forEach items="${uList }" var="uList">
    	
    				<input type="hidden" class="seqLike" value="${uList.seqLike }">
    			</c:forEach>
								
   		    			
    			<label class="like" for="like${status.index}" onclick="ck_user(${dto.seqAdoption })"></label>
    			<input type="radio" name="like" class="rd" id="like${status.index}" value="${dto.seqAdoption }" style="display: none">
    			
    			 
    			<span class="likes-count">${dto.likes }</span>
    		</div>
    		<span class="state">${dto.state }</span>    		
    	</div>
		</c:forEach>		
		</c:if>
	
	
	
	
	
	<!-- 회원& 비회원이 보는 페이지 -->
    	<c:if test="${empty seqUser or seqUser >= 6}">
    	<c:forEach items="${userList }" var="udto" varStatus="status">
    	<div class="list-detail">    	
    		<div class="img" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${udto.seqAdoption}'"><img class="img-pet" src="../resources/images/adoption/${udto.img }"></div>
    		<span class="pet-title" onclick="location.href='/mypet/adoption/view.action?seqAdoption=${udto.seqAdoption}'">${udto.title }</span>
    		
    		<c:if test="${not empty udto.nameV }">
	    		<span class="pet-address">${udto.addressV }</span>
	    		<span class="pet-address">${udto.nameV }</span>
	    		<input type="hidden" class="location-hidden" value="${udto.addressV }">
    		</c:if>
    		

    		<c:if test="${empty udto.nameV }">
	    		<span class="pet-address">${udto.addressS }</span>
	    		<span class="pet-address">${udto.nameS }</span>
	    		<input type="hidden" class="location-hidden" value="${udto.addressS }">
    		</c:if>
    	

    		<div class="pet-seq">
    			<span class="no" style="float: left">no. ${udto.seqPet }</span>
    			
    			<input type="hidden" name="seqUser" value="${seqUser }">
    			<c:forEach items="${uList }" var="uList">
    				<input type="hidden" class="seqUser2" value="${uList.seqUser }">
    				<input type="hidden" class="seqLike" value="${uList.seqLike }">
    			</c:forEach>
								
   		    			
    			<label class="like" for="like${status.index}" onclick="ck_user(${udto.seqAdoption })"></label>
    			<input type="radio" name="seqAdoption" class="rd" id="like${status.index}" value="${udto.seqAdoption }" style="display: none">
    			
    			 
    			<span class="likes-count">${udto.likes }</span>
    		</div>
    		
    		<span class="state">${udto.state }</span>    		
    	</div>
		</c:forEach>		
		</c:if>
	
	
	

		
    <c:if test="${list.size() > 0 }">
    <!-- 페이지바 -->
    <div class="pageSearch" style="clear: both">
	      <!-- 페이지바 -->
	       <ul class="pagination">
	            ${pagebar }
	       </ul>     
     </div>
    </c:if>
    
    </div>
    
    
    
	<!-- 모달  -->
	<div class="modal" tabindex="-1" role="dialog" id="modal">
		<div class="modal-dialog" role="document">
		  <div class="modal-content" id="modal-content">
		     <div class="modal-header">
		       <h5 class="modal-title">찜하기</h5>
		       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         <span aria-hidden="true">&times;</span>
		       </button>
		     </div>
		     <div class="modal-body">
		       <p>회원만 이용할 수 있습니다.</p>
		     </div>
		     <div class="modal-footer">
		      <button type="submit" class="btn" id="check">확인</button>	        
		     </div>
		   </div>
		 </div>
    </div>

   <!-- content -->
   </div> 
   
   
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc381e86fe3a181e10d9e43cfc83f97a&libraries=services,clusterer,drawing"></script>
<script>

	
	//찜하기
	var seqLike = $(".seqLike").val();
	var seqUser = $("input[name=seqUser]").val();
	
	var seqAdoption = $('input[name=like]');
	var label = $(".like");
	var no;
	var ck;
	
	
	//라벨 체크 -> 라디오버튼 체크 -> 그 값을 가지고 ok로 넘긴다.
	function ck_user(no) {
		
		if(seqUser == "") {
			$('#modal').modal("show");
		
		} else {
			for(var i=0; i<seqAdoption.length; i++) {
				
				if(no == seqAdoption[i].value) {
									
					seqAdoption[i].checked = true;
					ck = $('input[name=seqAdoption]:checked').val();						
				} 	
			}
			
			$(".modal-body > p").html("찜목록에 추가되었습니다.");
			$('#modal').modal("show");
			
			setTimeout(function() {
				location.href= '/mypet/adoption/likesOk.action?seqAdoption='+ ck + '&seqUser=' + seqUser;
			}, 2000);
									
		}
		
	}					
			
	
	/* 모달 */
	$('#check').click(function(e){
		e.preventDefault();
		$('#modal').modal("hide");
	});

	
	/* 텍스트폼 클릭 시 폰트색 변경 */
	$(".form-control").click(function() {
		$(this).css("color", "#301b01");
	})
	
	
	
	var mapContainer = document.getElementById('map');
	var mapOption = {
	      center: new daum.maps.LatLng(37.499293, 127.033236),
	      level: 5
	};  
	   
	      var map = new daum.maps.Map(mapContainer, mapOption); 
	   
	      var geocoder = new daum.maps.services.Geocoder();
	      
	      var listData = [
	         <c:forEach items="${AllList}" var = "adto">
		      
	         	<c:if test="${not empty adto.nameV}">
		          '${adto.addressV}',
		        </c:if>
		        <c:if test="${empty adto.nameV}">
		          '${adto.addressS}',
		        </c:if>
	          
	         </c:forEach>
	      ];
	      
	      
	      var listDataName = [
	         <c:forEach items="${AllList}" var = "adto">
		         <c:if test="${not empty adto.nameV}">
		          	'${adto.nameV}',
		          </c:if>
		          <c:if test="${empty adto.nameV}">
		          	'${adto.nameS}',
		          </c:if>	         
	         </c:forEach>
	          
	      ];
	      
	 
	      var listDataSeq = [
              
              <c:forEach items="${AllList}" var = "vdto">
	              <c:if test="${not empty vdto.nameV}">
		          	${vdto.seqVet},
		          </c:if>
		          <c:if test="${empty vdto.nameV}">
		          	${vdto.seqShelter},
		          </c:if>	         
	               
              </c:forEach>
              
           ];
	      
	      
           listData.forEach(function(addr, index) {
               geocoder.addressSearch(addr, function(result, status) {
                   if (status === daum.maps.services.Status.OK) {
                       var coords = new daum.maps.LatLng(result[0].y, result[0].x);
        
                       var marker = new daum.maps.Marker({
                           map: map,
                           position: coords
                       });
                       var infowindow = new daum.maps.InfoWindow({
                           content: '<div style="width:150px;text-align:center;padding:6px 0;">' + listDataName[index] + '</div>',
                           disableAutoPan: true
                       });

	                  
	                  //좌표 위치로 이동
	                  map.setCenter(coords);
	                  infowindow.open(map, marker);
	                  
	                 
	                  <c:forEach items="${AllList}" var = "vdto">
		              	<c:if test="${not empty vdto.nameV}">
		                  daum.maps.event.addListener(marker, 'click', function(mouseEvent) {        
		                      location.href='/mypet/vet/view.action?seq=' + listDataSeq[index];
		                  });
		                  
		                  console.log(listDataSeq[index]);
	                  	</c:if>
	                  
		                <c:if test="${empty vdto.nameV}">
		                  daum.maps.event.addListener(marker, 'click', function(mouseEvent) {        
		                      location.href='/mypet/shelter/view.action?seq=' + listDataSeq[index];
		                  });
		                  
		                  console.log(listDataSeq[index]);
	                  	</c:if>
	                  </c:forEach>
	              } 
	          });
	      });
	

	
    
	
	
	
</script>


	

