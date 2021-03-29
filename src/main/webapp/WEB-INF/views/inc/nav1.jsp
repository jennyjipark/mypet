<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>


	.nav1 {
		border-right: 1px solid #f7f7f7;
    	box-shadow: 0px 0px 15px #c7c7c7;
    	background-color: white;
    	width: 350px;
    	height: 890px;
	}
	
	.nav1 > ul > li > a {
		color: #301b00;
	    font-family: 'nanum-square';
	    font-size: 22px;
	    font-weight: 600;
	}
	
	.nav1 > ul > li > a:hover {
		text-decoration: none;
	}
	
	.nav-start {
		margin-top: 70px;
		padding: 0px;
    	margin-left: 40px;
	}
	
	.nav-start > li {
		/* border: 2px solid #fab018; */
		border-radius: 5px;
		padding: 7px 13px;
		margin: 14px 10px;
		/* background-color: #fab018; */
	}
	
	.li-hover {
		border: 2px solid #fab018;
	}
	
	/* 게시판 서브 메뉴 */
	.nav-start > li > ul {
		display: none;
		border-left: 1px solid #cccccc;
		background-color: white;
		z-index: 999;
		padding: 20px 20px;
		width: 260px;
		height: 240px;
		margin-left: 5px;
	}
	
	.board-sub > li {
		font-size: 16px;
		/* border-bottom: 1px solid black; */
		margin: 0px;
		padding: 5px;
	}
	
	.menu-linear {
		/* border: 1px solid black; */
		width: 200px;
		height: 4px;
		background: linear-gradient(45deg, #F6DA42, #f9820f);
		margin-top: 5px;
		margin-right: 10px;		
		border-radius: 50px;
		position: absolute;
	}
	
	.custom1 {
		width: 220px;
	    height: 40px;
	    position: absolute;
	    left: 70px;
	    top: 550px;
	    margin-bottom: 5px;
	    z-index: -1;
	}
	
	.custom2 {
		width: 220px;
	    height: 40px;
	    position: absolute;
	    left: 70px;
	    top: 590px;
	    margin-bottom: 5px;
	    z-index: -1;
	}
	
	
	.custom > img {
		/* border: 1px solid black; */
		width: 25px;
		height: 25px;
		background-size: cover;
    	background-position: 50% 50%;
    	margin-right: 10px;
	}
	
	.custom > span {
		font-size: 15px;
		font-family: 'nanum-square';
		font-weight: 600;
	}
	
	.nav-etc {
		/* border: 1px solid black; */
	    width: 220px;
	    height: 50px;
	    position: absolute;
	    left: 70px;
	    top: 680px;
	    margin-bottom: 5px;
	    padding: 5px 40px;
	    z-index: -1;
	}
	
	.nav-etc > img {
		width: 25px;
		height: 25px;
		background-size: cover;
    	background-position: 50% 50%;
    	margin-right: 12px;
    	opacity: .8;
	}
	
	.sub-deco {
		width: 10px;
		height: 10px;
		background-color: #fab018;
		border-radius: 50%;
		position: absolute;
	}
	
	
	.board-sub > li > a:hover {
		text-decoration: none;
	}
	
	.board-sub > li > a {
		color: black;
		font-family: 'nanum-square';
	}

</style>
<div class="nav1">
	<ul class="nav-start">
		<li><a href="/mypet/mypetintroduce/introduce.action">마이펫 소개</a></li>
		<li><a href="/mypet/goods/list.action">굿즈 스토어</a></li>
		<li><a href="/mypet/vet/list.action">동물병원/보호소 찾기</a></li>
		<li><a href="/mypet/adoption/list.action">입양하기</a></li>
		<li><a href="/mypet/sponsor/view.action">후원하기</a></li>
		<li class="nav-board"><a href="">게시판</a>
			<ul class="board-sub">
            	<li><a href="/mypet/board/activity/list.action">활동</a></li>
            	<li><a href="/mypet/board/adoptionreviewlist.action">입양후기</a></li>
            	<li><a href="/mypet/board/volunteerList.action">봉사활동신청</a></li>
            	<li><a href="/mypet/board/reportBoard/list.action">유기동물신고</a></li>
            	<li><a href="/mypet/board/noticeList.action">공지사항</a></li>            	
            	<li><a href="/mypet/board/faqList.action">FAQ</a></li>            	
        	</ul>
		</li>
		<li><a href="/mypet/stat/view.action">유기동물 통계</a></li>		
	</ul>
	<div class="custom custom1">
		<img src='/mypet/resources/images/customer.png'>
		<span>1234-5678</span>
	</div>
	<div class="custom custom2">
		<img src='/mypet/resources/images/mail.png'>
		<span>mypet@mypet.com</span>
	</div>
	
	<div class='menu-linear'></div>
	
	<div class='nav-etc'>
		<img src="/mypet/resources/images/facebook2.png">
		<img src="/mypet/resources/images/instagram2.png">
		<img src="/mypet/resources/images/youtube2.png">
	</div>
	<div class="sub-deco"></div>
</div>

<script>

 $(".head_list").click(function() {
     var height = $(document).scrollTop();
     
     if ( height > 130) {
        if ($("#plist_bar1").prop("checked") || $("#plist_bar1-2").prop("checked") || $("#plist_bar1-3").prop("checked"))  {

           $(".nav1").css("left", "0%").css("z-index", "99").css("top",height+10+"px");

        } else {
           $(".nav1").css("left", "-100%");
        }
     }else {
        
        if ($("#plist_bar1").prop("checked") || $("#plist_bar1-2").prop("checked") || $("#plist_bar1-3").prop("checked")) {

           $(".nav1").css("left", "0%").css("z-index", "99").css("top","150px");

        } else {
           $(".nav1").css("left", "-100%");
        }
     }
  });

  
  $(window).scroll(function() {
     var height = $(document).scrollTop();
     //console.log(height);
     
     $("#plist_bar1").prop("checked",false);
     $("#plist_bar1-2").prop("checked",false);
     $("#plist_bar1-3").prop("checked",false);
     $(".nav1").css("background-color", "white");
     $(".nav1").css("left", "-100%");
     
  });
  
  $(document).ready(function() {
	  $(".menu-linear").fadeOut();
	  $(".sub-deco").fadeOut();
  })
  
  
  $(".nav-start > li > a").each(function() {
	  $(this).hover(function() {
		  /* alert($(this).offset().top); */
		  $(this).css("color", "#fab018");
		  $(".nav-start > li > a").not(this).css({color: '#301b01'});
		  $(".menu-linear").css("width", $(this).width());
		  $(".menu-linear").fadeToggle();
		  $(".menu-linear").offset( { left: $(this).offset().left - 0, top: $(this).offset().top + 35 } );
	  })
	  
  });
  
  
  
  $(".nav-board").hover(function() {
	  
	if($(this).find("ul").length) {	    	
		$(this).find("ul").stop().slideToggle().parent().siblings().find("ul:visible").stop().slideUp();
		$(".nav-etc").toggle();
	}

	});
  
  $(".board-sub > li > a").each(function() {
	  $(this).hover(function() {	
		  $(this).css("color", "#fab018");
		  $(".board-sub > li > a").not(this).css({color: '#301b01'});		
		  $(".sub-deco").fadeToggle();
		  $(".sub-deco").offset( { left: $(this).offset().left - 30, top: $(this).offset().top + 7 } );
	  })
  });

</script>