<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	

	.logo-scroll {
       	background-position: 50% 50%;
       	background-repeat: no-repeat;
    	background-size: contain;
    	margin-top: -7px;
	}
	
	#img-first {
		background-image: url(/mypet/resources/images/info.png);
	}

	#img-sec {
		background-image: url(/mypet/resources/images/like.png);
	}
	
	#img-third {
		background-image: url(/mypet/resources/images/shopping.png);
	}
	
	#img-fourth {
		background-image: url(/mypet/resources/images/volunteer.png);
	}
	
	#img-fifth {
	   	background-image: url(/mypet/resources/images/paw.png);
	}
	
	/* 회원 */
	#img-first2 {
		background-image: url(/mypet/resources/images/info.png);
	}

	#img-sec2 {
		background-image: url(/mypet/resources/images/like.png);
	}
	
	#img-third2 {
		background-image: url(/mypet/resources/images/shopping.png);
	}
	
	#img-fourth2 {
		background-image: url(/mypet/resources/images/volunteer.png);
	}
	
	#img-fifth2 {
	   	background-image: url(/mypet/resources/images/paw.png);
	}
	
	/* 관리자 */
	
	#img-first3 {
		background-image: url(/mypet/resources/images/info.png);
	}

	#img-sec3 {
		background-image: url(/mypet/resources/images/like.png);
	}
	
	#img-third3 {
		background-image: url(/mypet/resources/images/shopping.png);
	}
	
	#img-fourth3 {
		background-image: url(/mypet/resources/images/volunteer.png);
	}
	
	#img-fifth3 {
	   	background-image: url(/mypet/resources/images/paw.png);
	}
	
	
</style>

<!-- ########################## header 시작 ########################## -->
<c:if test="${empty id}">
<header id="header">
	<div id="headersub">
		<div id="pheadercontent1" class="pheadercontent">
			<span class="head_list"> <label for="plist_bar1"
				class="menubar"> <input type="checkbox" id="plist_bar1"
					style="display: none;">
			</label>
			</span>
		</div>
		
		<div class="pheadercontent pheadercontent2" onclick="location.href='/mypet/main.action'"></div>
		<div class="pheadercontent pheadercontent3">
			<span class="head_list2"> 
			<label for="plist_bar2" class="menubar2">
				<input type="checkbox" id="plist_bar2" name="plist_bar2" style="display: none;">
			</label>
			<input type="button" value='로그인' class="btn login" onClick="location.href='/mypet/member/auth.action'">
			</span>
		</div>
		
		
		
		 <div class="nav2">
		    <div class="menu">
				<div class="memu-img" id="img-first"></div>
				<span>회원정보</span>
			</div>               
		       <div class="menu">
				<div class="memu-img" id="img-sec"></div>
				<span>찜하기</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-third"></div>
				<span>주문내역</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fourth"></div>
				<span>봉사활동</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fifth"></div>
				<span onclick="location.href='/mypet/mypage/reservationlist.action'">입양예약</span>
			</div> 
		 </div>
	
	
	</div>
</header>
</c:if>


<%-- <c:if test="${not empty id}">
<header id="header2">
	<div id="headersub2">
		<div id="pheadercontent1-2" class="pheadercontent">
			<span class="head_list"> <label for="plist_bar1-2"
				class="menubar"> <input type="checkbox" id="plist_bar1-2"
					style="display: none;">
			</label>
			</span>
		</div>
		
		<div class="pheadercontent pheadercontent2-2"></div>
		<div class="pheadercontent pheadercontent3-2">
			<span class="head_list2">
			<span class="head_id">${id}님</span> 
			
			<label for="plist_bar2-2" class="menubar2" id="menubar2-2">
				<input type="checkbox" id="plist_bar2-2" name="plist_bar2-2" style="display: none;">
			</label>
			<input type="button" value='로그아웃' id="logout" class="btn login" onClick="location.href='/mypet/member/logout.action'">
			</span>
		</div>
		
		
		
		 <div class="nav2">
		    <div class="menu">
				<div class="memu-img" id="img-first2"></div>
				<span>회원정보</span>
			</div>               
		       <div class="menu">
				<div class="memu-img" id="img-sec2"></div>
				<span>찜하기</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-third2"></div>
				<span>주문내역</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fourth2"></div>
				<span>봉사활동</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fifth2"></div>
				<span>추가분</span>
			</div> 
		 </div>
	
	
	</div>
</header>

</c:if> --%>

<!-- 유저로그인 -->
<c:if test="${not empty id and id != 'Administrator1'}">
<header id="header2">
	<div id="headersub2">
		<div id="pheadercontent1-2" class="pheadercontent" >
			<span class="head_list"> <label for="plist_bar1-2"
				class="menubar"> <input type="checkbox" id="plist_bar1-2"
					style="display: none;">
			</label>
			</span>
		</div>
		
		<div class="pheadercontent pheadercontent2"></div>
		<div class="pheadercontent pheadercontent3">
			<span class="head_list2">
			<span class="head_id">${id}님</span> 
			
			<label for="plist_bar2-2" class="menubar2-2" id="menubar2-2">
				<input type="checkbox" id="plist_bar2-2" name="plist_bar2-2" style="display: none;">
			</label>
			<input type="button" value='로그아웃' id="logout" class="btn logout" onClick="location.href='/mypet/member/logout.action'">
			</span>
		</div>
		
		
		
		 <div class="nav2">
		    <div class="menu">
				<div class="memu-img" id="img-first2"></div>
				<span>회원정보</span>
			</div>               
		       <div class="menu">
				<div class="memu-img" id="img-sec2"></div>
				<span>찜하기</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-third2"></div>
				<span>주문내역</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fourth2"></div>
				<span>봉사활동</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fifth2"></div>
				<span>추가분</span>
			</div> 
		 </div>
	
	
	</div>
</header>

</c:if>



<!-- 관리자 로그인 -->
<c:if test="${not empty id and id == 'Administrator1'}">
<header id="header3">
	<div id="headersub3">
		<div id="pheadercontent1-3" class="pheadercontent">
			<span class="head_list"> <label for="plist_bar1-3"
				class="menubar"> <input type="checkbox" id="plist_bar1-3"
					style="display: none;">
			</label>
			</span>
		</div>
		
		<div class="pheadercontent pheadercontent2"></div>
		<div class="pheadercontent pheadercontent3">
			<span class="head_list2">
			<span class="head_id2">관리자계정</span> 
			
			<label for="plist_bar2-3" class="menubar2-3" id="menubar2-3">
				<input type="checkbox" id="plist_bar2-3" name="plist_bar2-3" style="display: none;">
			</label>
			<input type="button" value='로그아웃' id="logout2" class="btn logout2" onClick="location.href='/mypet/member/logout.action'">
			</span>
		</div>
		
		
		
		 <div class="nav2">
		    <div class="menu">
				<div class="memu-img" id="img-first3"></div>
				<span>회원정보</span>
			</div>               
		       <div class="menu">
				<div class="memu-img" id="img-sec3"></div>
				<span>찜하기</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-third3"></div>
				<span>주문내역</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fourth3"></div>
				<span>봉사활동</span>
			</div> 
			<div class="menu">
				<div class="memu-img" id="img-fifth3"></div>
				<span>추가분</span>
			</div> 
		 </div>
	
	
	</div>
</header>

</c:if>


<script>


	/* 브라우저 띄웠을 때 네비 없어짐 */
	$(document).ready(function() {
		$(".nav2").hide();
	})
	
	
	$(window).scroll(function() {
	    if($(this).scrollTop() > 100) {
	    	$("header").addClass("header-scroll");
	    	$("#headersub").css("height", "60px");
	    	$("#headersub2").css("height", "60px"); //
	    	$("#headersub3").css("height", "60px"); //
	    	$("#pheadercontent1").css("height", "50px");
	    	$("#pheadercontent2").css("height", "50px");//
	    	$("#pheadercontent3").css("height", "50px");//
	        $(".pheadercontent2").css("height", "35px").css("background-image", "url(/mypet/resources/images/logo2.png)").addClass("logo-scroll");
	        $(".pheadercontent3").css("height", "50px");
	        $(".menubar").addClass("menubar-scroll");
	        $(".menubar2").addClass("menubar2-scroll");
	        $(".menubar2-2").addClass("menubar2-2-scroll");
	        $(".menubar2-3").addClass("menubar2-3-scroll");
	        $(".head_id").addClass("head_id-scroll");
	        $(".head_id2").addClass("head_id2-scroll");
	        $(".login").addClass("login-scroll");
	        $(".logout").addClass("logout-scroll");
	        $(".logout2").addClass("logout2-scroll");
	        $(".nav2").addClass("nav2-scroll");
	        
	    } else {
	        $("header").removeClass("header-scroll");
	        $("#headersub").css("height", "200px");
	        $("#headersub2").css("height", "200px");
	        $("#headersub3").css("height", "200px");
	        $(".pheadercontent2").css("background-image", "url(/mypet/resources/images/logo.png)").css("height", "180px");
	        $(".pheadercontent3").css("height", "180px");
	        $(".menubar").removeClass("menubar-scroll");
	        $(".menubar2").removeClass("menubar2-scroll");
	        $(".menubar2-2").removeClass("menubar2-2-scroll");
	        $(".menubar2-3").removeClass("menubar2-3-scroll");
	        $(".head_id").removeClass("head_id-scroll");
	        $(".head_id2").removeClass("head_id2-scroll");
	        $(".login").removeClass("login-scroll");
	        $(".logout").removeClass("logout-scroll");
	        $(".logout2").removeClass("logout2-scroll");
	        $(".nav2").removeClass("nav2-scroll");
	    }
	});

	
	$("#plist_bar2").click(function() {
	
		if ($("#plist_bar2").prop("checked")) {
			$(".nav2").css("opacity", 1).css("z-index", "99");
			$(".nav2").show();
		} else {
			$(".nav2").hide();
		}
	});
	
	
	$("#plist_bar2-2").click(function() {
		
		if ($("#plist_bar2-2").prop("checked")) {
			$(".nav2").css("opacity", 1).css("z-index", "99");
			$(".nav2").show();
		} else {
			$(".nav2").hide();
		}
	});

	$("#plist_bar2-3").click(function() {
		
		if ($("#plist_bar2-3").prop("checked")) {
			$(".nav2").css("opacity", 1).css("z-index", "99");
			$(".nav2").show();
		} else {
			$(".nav2").hide();
		}
	});
	

	
</script>
<!-- ########################## header 끝 ########################## -->
