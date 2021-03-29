<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<style>

    #content{
    	width: 1900px;
        height: 2100px;
        padding: 0px;
        margin-top: -10px;
    }
    
    #content1{
        width: 100%;
        margin-top: 210px;
        height: 700px;
        /* border: 1px solid black; */
        opacity: .5;
    }
    
    .main-title {
    	position: absolute;
	    top: 600px;
	    left: 60px;
	    color: #301b00;
	    font-size: 40px;
	   	font-family: 'Jal_Onuel';
	    display: block;
	    /* width: 650px; */
	    height: 70px;
	    padding: 5px 27px;
	    /* font-weight: 600; */
    }
    
    .glyphicon-plus {
    	color: #fab018;
    	font-size: 30px;
    	position: absolute;
	    top: 590px;
	    left: 625px;
    }

    .main-btn {
    	background-color: #301b01;
	    position: absolute;
	    top: 690px;
	    left: 90px;
	    color: white;
	    width: 180px;
	    height: 40px;
	    font-size: 20px;
	    font-family: 'Jal_Onuel';
	    border-radius: 10px;
    	
    }
    
    .main-btn2 {
    	background-color: #301b01;	   
	    color: white;
	    width: 180px;
	    height: 40px;
	    font-size: 20px;
	    font-family: 'Jal_Onuel';
	    border-radius: 10px;
	   	margin-left: 690px;
    	
    }
    
    .main-btn:hover {
    	background-color: #fab018;
    	color: #301b01;
    }
    
    .main-btn2:hover {
    	background-color: #fab018;
    	color: #301b01;
    }

    #contentnav {
        border: 1px solid black;
        width: 1200px;
        height: 100px;
        padding: 20px 20px;
    }
    
    .img_area{
    	/* border: 1px solid black; */
    	width: 1;
    	height: 500px;
    	
    	
    }
    
    .review {
    	/* border: 1px solid black; */
    	width: auto;
    	height: 740px;
    	padding: 100px 160px;    
    }
    
    
    .review > .adoption-title {    	
    	/* border: 1px solid black; */
    	display: block;
    	font-size: 24px;
    	font-family: 'Jal_Onuel';
    	width: 100%;
    	height: 50px;    	
    	text-align: center;
    	margin-bottom: 25px;
    }
    
    .review-box {
    	/* border: 1px solid black; */
    	width: 100%;
    	height: 400px;
    	margin-bottom: 40px;
    	padding: 0px 27px;
    	
    }
    
    .review1 {
    	border: 1px solid #ccc;
    	width: 270px;
    	height: 400px;
    	float: left;
    	margin-right: 40px;
    }
    
    .review1:after {
    	clear: both;
    }
    
    
    .review1:last-child {
    	margin-right: 0px;
    }
    
    .review1 > img {
    	/* border: 1px solid #ccc; */
    	width: 269px;
    	height: 275px;
    	margin-bottom: 20px;
    	cursor: pointer;
    }
    
    .review-title {
    	display: block;
    	text-align: center;
    	margin-bottom: 20px;
    	font-weight: 600;
    	cursor: pointer;
    } 
    
    .review-content {
    	display: block;
    	text-align: center;
    	margin-bottom: 20px;
    	padding: 0px 10px;
    }
    
    #slideImg {
    	width: 100%;
    	height: 700px;
    	/* position: absolute;
    	top: 500px; */
    	background-position: 50% 50%;
	    background-repeat: no-repeat;
	    background-size: contain;
    }
    
    .talent {
    	border-top: 1px solid #cccccc;
    	width: 100%;
    	height: 600px;
    	padding: 100px 160px;
    }
    
    .talent > span {
    	display: block;
    	font-size: 24px;
    	font-family: 'Jal_Onuel';
    	width: 100%;
    	height: 50px;    	
    	text-align: center;
    	margin-bottom: 25px;
    }
    
    .img {
    	padding-top: 40px;
    	padding-bottom: 100px;
    	position: absolute;
    }
    
    #img2 {
    	margin-left: -450px;
    }
    
    #img3 {
    	margin-left: -900px;
    }
    
    #img4 {
    	margin-left: -1350px;
    }
    
    
    
</style>

<div id="content">
	<div id="content1">
		<img src="/mypet/resources/images/intro/5.jpg" id="slideImg">		
	</div> 
	<span class="main-title">반려동물과 함께하는 행복플러스</span>
	<span class="glyphicon glyphicon-plus"></span>
	<input type="button" class="btn main-btn" value="입양하러가기" onclick="location.href='/mypet/adoption/list.action'">
	<div class="review">
		<span class="adoption-title">입양후기</span>
		<div class="review-box">
			<c:forEach items="${rlist }" var="rlist" begin="0" end="4">
			<div class="review1">
			<c:set var="keyword" value="${rlist.image }"></c:set>
			<c:set var="arr" value="${fn:split(keyword ,',')}"></c:set>
				<img src="/mypet${arr[0] }" onclick="location.href='/mypet/board/adoptionreviewview.action?seqAdoptionReview=${rlist.seqAdoptionReview}'">
				<span class="review-title" onclick="location.href='/mypet/board/adoptionreviewview.action?seqAdoptionReview=${rlist.seqAdoptionReview}'">${rlist.title }</span>
				<span class="review-content">${rlist.content }</span>
			</div>
			</c:forEach>	
		</div>
		<input type="button" class="btn main-btn2" value="더 보러가기" onclick="location.href='/mypet/board/adoptionreviewlist.action'">
	</div>
	
	<div class="talent">
		<span class="stat-title">마이펫을 방문한 스타들</span>
		<img src="/mypet/resources/images/talent/1.jpg" id="img1" class="img">
		<img src="/mypet/resources/images/talent/2.jpg" id="img2" class="img">
		<img src="/mypet/resources/images/talent/3.jpg" id="img3" class="img">
		<img src="/mypet/resources/images/talent/4.jpg" id="img4" class="img">
	</div>

</div>


<script>


	var imgAry = [5,7,8,9,10,11,12,13];
	var imgIdx = 0;
	
	function changeImg() {
		$("#slideImg").attr("src", "/mypet/resources/images/intro/"+imgAry[imgIdx]+".jpg");
		imgIdx++;
		if(imgIdx >= imgAry.length) {
			imgIdx = 0;
		}
	}
	
	setInterval(changeImg, 3000);
	
    //부모의 넓이
    var width = $(".img").parent().width();
    
    console.log(width)

   // console.log($(".img").width());

    var timer = setInterval(function() {

        $("#img1").css('left', $("#img1").offset().left + 50);
        $("#img2").css('left', ($("#img2").offset().left) + 500);
        $("#img3").css('left', ($("#img3").offset().left) + 950);
        $("#img4").css('left', ($("#img4").offset().left) + 1400);

        if((($("#img1").offset().left)+200) > width) {
        	console.log($("#img1").offset().left+420);
            $("#img1").css('left', -380);
        }
         if((($("#img2").offset().left)+200) > width) {
            $("#img2").css('left', $("#img1").offset().left);
        }
        if((($("#img3").offset().left)+200) > width) {
            $("#img3").css('left', $("#img1").offset().left);
        }
         if((($("#img4").offset().left)+200) > width) {
            $("#img4").css('left', $("#img1").offset().left);
        }
        
    	 
           
    }, 800);
	 


  	
</script>








