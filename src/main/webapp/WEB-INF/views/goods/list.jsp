<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title>MyPet :: 굿즈스토어</title>

<style>

    /* content */
    #content{
        width: 1300px;
        margin-top: 210px;
        /* border: 1px solid rgb(230,229,235); */
        /* border: 1px solid black; */
        padding: 20px 50px;
        /* margin-right: px; */
    }

    /* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
    #content{
        height: 850px;
    }

    #contentnav {
        border: 1px solid black;
        width: 1200px;
        height: 70px;
        padding: 20px 20px;
        background-color: #B27208;
        border-radius: 30px;
    }
    
    #contentnav > ul li {
    	list-style-type: none;
    	float: left;
    	margin-top: -25px;
    	margin-left:30px;
    	padding-left: 15px;
    }
    
    #category > li a:hover {
    	color:black;
    }
    
    
    #list {
    	/* border:1px solid black; */
    	width: 1200px;
    	height: 600px;
    	padding: 20px 50px;
    	margin-top: 25px;
    	clear: both;
    }
    
    .item {
    	border: 1px solid #EBEBEB;
    	width: 200px;
    	height: 200px;
    	margin-left: 15px;
    	margin-top: 30px;
    	float: left;
    	margin-bottom: 25px;
    }
    
    .pagination {
    	clear:both;
    	margin-left: 500px;
    }
    
    .image {
    	width: 150px;
    	height: 150px;
     	padding-left: 35px;
    	padding-top: 25px;
    }
    
    .name, .price {
    	padding-left: 55px;
    }
    
    category > li, a {
    	color: white;
    	font-size: 20px;
    }
    
    
</style>

<div id="content">
	<div id="contentnav">
		<ul id="category" class="list-group list-group-flash">
			<li class="li"><a href="/mypet/goods/list.action?">전체보기</a></li>
			<li class="li"><a href="/mypet/goods/list.action?category=1">패션</a></li>
			<li class="li"><a href="/mypet/goods/list.action?category=2">악세서리</a></li>
			<li class="li"><a href="/mypet/goods/list.action?category=3">반려용품</a></li>
			<li class="li"><a href="/mypet/goods/list.action?category=4">매거진</a></li>
		</ul>
	</div>
	<div id="list">
		<c:forEach items="${list }" var="dto">
			<div class="item" onclick="location.href='/mypet/goods/goods.action?seqGoods=${dto.seqGoods }'">
				<div>
					<img class="image" src="/mypet/resources/images/goods${dto.image }">
				</div>
				<div class="name">${dto.name }</div>
				<div class="price">${dto.price }</div>
			</div>
		</c:forEach>
	</div>
   <ul class="pagination">
   		${pagebar }
   </ul>
</div>

<script>

	//이미지 확대
	$(".image").mouseover(function() {
		 $(this).css({'transform':'scale(1.5)'});
	});
	
	//이미지 본래크기로
	$(".image").mouseout(function() {
		 $(this).css({'transform':'scale(1)'});        
	});

</script>