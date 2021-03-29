<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
        height: 1400px;
    }


    .board-name {
        /* border: 1px solid black; */
        display: block;
        text-align: center;
        margin-top: 80px;
        /*top 한번 수청 했음..기존 130px -> 80px*/
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

/* 달력 css */
      #tblcal{
          width: 1200px;
          height: 300px;
          margin: 0px auto;
          border: 1px solid #999;
   	border-collapse: collapse;
      }

      #tblcal th, #tblcal td {
          border: 1px solid #999;
      }

      #tblcal th {
          background-color: #b27208;
          color: white;
          padding: 5px;
          font-size: 18px;
          text-align: center;
      }

      #tblcal td {
          height: 80px;
          width: 115px;
          vertical-align: top;
          padding: 15px;
          padding-top: 25px;
          padding-bottom: 5px;
          position: relative;
      		text-align: justify;
      }
      
      #tblcal td a:link{
      	color:black;
      	text-decoration: none;	
      }
      
      #tblcal td a:visited{
      	color:black;
      	text-decoration: none;	
      }

      #tblcal td a:hover{
      	color:#8B00FF;	
      }
     
      
      #tblcal td:hover{
          background-color: #f6da42;
    
      }

      #tblcal .no {
          position: absolute;
          right: 10px;
          top: 9px;
      }
      
      #tblcal td div {
          font-size: 16px;
          height: 70px;
          overflow: hidden;
      }
      
      #tblcal td:first-child .no {
          color: red;
          font-weight: bolder; 
      }
      
      #tblcal td:last-child .no {
          color: blue;
          font-weight: bolder;
      }



</style>


    <div id="content">
        <span class="board-name">MyPet_발자국   <small id="today"></small></span>

        
        <table id="tblcal">
            <thead>
                <tr>
                    <th>SUN</th>
                    <th>MON</th>
                    <th>TUE</th>
                    <th>WED</th>
                    <th>THU</th>
                    <th>FRI</th>
                    <th>SAT</th>
                </tr>
            </thead>
            <tbody id='tbody1'>

            </tbody>
        </table>

		<hr>


        <div class="board-btn"><input type="button" class="btn common-btn" onclick="location.href='/mypet/activity/write.action'"  value="글쓰기">
        <input type="button" class="btn common-btn" value="삭제"></div>
        <table class="table table-condensed">
            <tr class="headtr">
                <th class="firsttd">번호</th>
                <th class="sectd">제목</th>
                <th class="thirdtd">활동일</th>
                <th class="fourthtd">조회수</th>
            </tr>
            
			<c:forEach items="${list}" var="dto">
				 <tr class="tr2">
	                <td>${dto.seqActivity}</td>
	                <td><a href="/mypet/activity/view.action?seqActivity=${dto.seqActivity}"> ${dto.title}</a></td>
	                <td>${dto.actDate}</td>
	                <td>${dto.viewCount}</td>
	             </tr>
			</c:forEach>


            <!-- 10개 vs 15개 -->
    
        </table>

        <!-- 글쓰기 버튼 아래 -->
        <!-- <div class="board-btn"><input type="button" class="btn common-btn" value="글쓰기"></div> -->
        <!-- 페이지바/검색창 -->
        
        <div class="pageSearch">
            <!-- 페이지바 -->
            <ul class="pagination">
            ${pagebar}
            <!-- 
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
            -->
            </ul>       
			<form method="GET" action="/mypet/activity/list.action">
            <!-- 검색창 & 검색 버튼 -->
            <input type="textbox" class="form-control search-text" placeholder="검색어 입력" name="search">
            <input type="submit" class="btn common-btn" value="검색">
        	</form>
        </div>
    </div>
   
	<hr>


<script>

	var year = [];  
	var month = [];
	var date = [];
	var txtinfo = [];
	var seq =[];
	let count =0;
	
	<c:forEach items="${listInfo}" var="dto">
		console.log(count);	
		year[count] = ${(dto.actDate).substring(0,4)};
		month[count] = ${(dto.actDate).substring(5,7)};
		date[count] = ${(dto.actDate).substring(8)};
		txtinfo[count] = '${dto.title}';
		seq[count] = ${dto.seqActivity};	
		count++;
	
	</c:forEach>

	
    var now = new Date();
    var lastDay = (new Date(now.getFullYear(), now.getMonth()+1, 0)).getDate(); 
    var firstDay = (new Date(now.getFullYear(), now.getMonth(), 1)).getDay();
    $("#today").text(now.getFullYear() + "." + (now.getMonth() + 1));

    var temp = "";
    temp = "<tr>";
    for (var i=0; i<firstDay; i++) {
        temp += "<td></td>";
    }
    
    for (var i=1; i<=lastDay; i++) {

        var schedule = "";    
    	

    	for( let k = 0; k < year.length ;k++){	
    		
	    	if(year[k] == now.getFullYear() ){	    		
				if( month[k] == (now.getMonth()+1) ){
					if( date[k] == i ){
	    				schedule = '<a href="/mypet/activity/view.action?seqActivity='+seq[k]+'">'+txtinfo[k]+'</a>'; 			
	    			
					}			
				}
				
			}
    	}		
        
     
        
        temp += "<td>";
        temp += "<span class='no'>" + i + "</span>";
        temp += "<div>";
        temp += schedule;
        temp += "</div>";
        temp += "</td>";
        if ((i + firstDay) % 7 == 0) {
            temp += "</tr><tr>";
        }
    }

    var seed = 7;

    if (7 - (lastDay % 7 + firstDay) < 0) {
        seed = 14;
    }

    for (var i=0; i<(seed - (lastDay % 7 + firstDay)); i++) {
        temp += "<td></td>";
    }
    temp += "</tr>";

    tbody1.innerHTML = temp;

    $("#tblcal td a").parent().parent().css("background-color","#f6da42");
	
</script>
