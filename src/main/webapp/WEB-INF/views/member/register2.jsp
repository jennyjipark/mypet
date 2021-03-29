<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>MyPet::회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

/* content */
#content {
	width: 1300px;
	margin: 0px auto;
	margin-top: 210px;
	padding: 20px 50px;
	/* border: 1px solid rgb(230,229,235); */
	border: 1px solid black;

	/* margin-right: px; */
}

/* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
#content {
	height: 1500px;
	font-family: NanumSquare;
	font-size: 16px;
	padding: 20px 180px;
	border: 1px solid transparent;
}

#contentnav {
	border: 1px solid black;
	width: 1200px;
	height: 100px;
	padding: 20px 20px;
}


/* 본문 */

.maintitle {
	/* border: 1px solid black; */
	display: block;
	text-align: center;
	margin-top: 130px;
	margin-bottom: 40px;
	font-size: 30px;
	font-family: 'Jal_Onuel';
	/* font-family: 'NanumSquare';
        font-weight: bold; */
	color: #301b01;
}

.join_content {
	    width: 400px;
    margin: 5px auto;
    font-family: NanumSquare;
}

span {
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"] {
	
	margin-top: 5px;
	    height: 40px;
}

.subtxt {
	font-size: 13px;
	color: #444;
	margin-bottom: 15px;
}

.custom-select {
	width: 32%;
	margin-top: 5px;
	height: 40px;
    outline: none;
	border: 1px solid #ccc;
    border-radius: 4px;
}

#address_num {
	width: 50%;
    float: left;
    margin-bottom: 6px;
}

#btnaddress {
	float : left;
	margin-left: 8px;
    position: relative;
    top: 5px;
    height: 40px;
}

#btn_register {
	display: inline-block;
	margin-top: 20px;
	width: 100%;
	background-color: #B27208;
	color: white;
	font-family: 'Jal_Onuel';
	height: 5rem;
	font-size: 16px;
}

#btn_mail {
margin-left: 8px;
    position: relative;
    top: 5px;
    height: 40px;
}

#btn_idchk {
margin-left: 8px;
    position: relative;
    top: 5px;
    height: 40px;
}

#email {
	width: 100%;
    float: left;
}

#id {
	width: 77%;
	float: left;
}

.tel {
	font-size: 14px !important;
}

#addr1 {
	width: 77%;
	float: left;
}

#addr2 {
	float: left;
}

#addr3 {
	float: left;
	margin-bottom: 15px;
}

.form-control {
	
}

/* 아이디 중복체크 */
.has-success {
	border-color: #43D329;
}

.has-error {
	border-color: red;
}



/* 채팅 */
.chaticon {
	/* border: 1px solid black; */
	width: 70px;
	height: 70px;
	position: fixed;
	right: 5px;
	bottom: 5px;
	/* margin-left: 30px; */
	background-image: url('/mypet/resources/images/chat/chatimg.png');
	background-size: cover;
	background-position: 50% 50%;
	/* margin-right: 10px; */
	z-index: 100;
	cursor:pointer;
}

</style>

<div id="content">


	<div class="maintitle">회원가입</div>

	<div class="join_content">
		
		<form id="register" method="post" action="/mypet/member/register2.action">

			<!-- 시작 -->

			<div class="infomlist">

				<span>아이디</span> 
				<div style="clear: both;"></div>
				<input type="text" class="form-control form-weight divInputId" id="id" name="id">
				<input type="button" id="btn_idchk" class="btn btn-default" value="중복확인">
				<div style="clear: both;"></div>
				<div class="subtxt">4자~12자리의 영문자, 숫자 / @,#$등 특수문자는 제외</div>	
					
					  
				<span>비밀번호</span> 
				<input type="password" class="form-control form-weight" id="password" name="password"> 
				<div class="subtxt">영문 대문자, 소문자, 숫자, 특수문자를 3가지 이상 사용하여<br> 8자 이상,
   20자 이하로 설정해주세요.</div>
				
				<span>비밀번호확인</span> 
				<input type="password" class="form-control form-weight" id="pw_check" name="pw_check"> 
				<div class="subtxt">비밀번호를 다시 한번 입력해주세요.</div>

				<span>이름</span> 
				<input type="text" class="form-control form-weight" id="name" name="name" style="margin-bottom: 15px;"> 
					
				<span>생년월일</span> 
				<div style="margin-bottom: 15px;">						
				<select name="birth_year" id="birth_year" title="년도" class="custom-select"></select>
				<select name="birth_month" id="birth_month" title="월" class="custom-select"></select>
				<select name="birth_day" id="birth_day" title="일" class="custom-select"></select>
				</div>
				
				
				
				
<!-- <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br> -->
<br>
<!-- <input type="text" id="sample6_detailAddress" placeholder="상세주소"> -->
<!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->
				
				
				
				<%-- <c:if test="${#birth_year option:checked && #birth_month option:checked && #birth_day option:checked}">
				<input type="text" id="birthdate" name="birthdate" value=$('#birth_year option:selected).val()' + '$(#birth_year option:selected").val()')>
				</c:if> --%>
				<span>주소</span> 
				<div>
				<!-- <input type="text" class="form-control search-text" name="addr1" id="addr1" readonly="readonly">  -->
				<input type="text" id="addr1" class="form-control search-text" placeholder="우편번호" name="addr1" readonly="readonly">
				<input type="button" id="btnaddress" class="btn btn-default" onclick="execPostCode()" value="주소검색">					
				</div>
				
				<div> 
				<!-- <input type="text" name="addr2" id="addr2" class="form-control" placeholder="도로명주소" readonly="readonly" > -->
				<input type="text" id="addr2" name="addr2" placeholder="도로명주소" class="form-control" readonly="readonly" >
				<input type="text" id="addr3" name="addr3" class="form-control" placeholder="상세주소를 입력해주세요." >
				<!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목" style="margin-bottom: 15px; visibility:hidden;" > -->
				<!-- <input type="text" name="addr3" id="addr3" class="form-control" placeholder="상세주소를 입력해주세요." style="margin-bottom: 15px;"> -->
				</div>
				<div style="clear: both;"></div>
	
				<span>이메일</span> 
				<div style="clear: both;"></div>
				<input	type="text" class="form-control search-text" name="email" id="email" placeholder="e-mail 주소를 입력해주세요." >
				<!-- <input type="button" id="btn_mail" class="btn btn-default" onClick="mail_check();" value="인증하기"> -->
				<div style="clear: both;"></div>
				<div class="promotion"><input type="checkbox" name="receiving" id="receiving"
				value="1" style="margin-bottom: 15px;"> <label for="receiving" style="font-size: 13px; font-weight: normal">정보/이벤트 메일 수신에 동의합니다.</label></div>
	
				
				<span>휴대전화</span>
				<input type="text" class="form-control tel" id="tel"
				maxlength=11 name="tel" placeholder="'-'을 제외하고 입력해주세요." >
					
			</div>

			<input type="button" onclick="validation()" class="btn btn-outline-secondary" type="button" id="btn_register" value="가입하기">
		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  --%>


		</form>
		<!-- join_form -->


	</div>
	<!-- join_content -->

<div class="chaticon" id="chaticon"></div>
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	/* 주소검색창 */
    function execPostCode() {
        
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr2 = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                	addr2 = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                	addr2 = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               // if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    /* if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    } */
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    /* if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    } */
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    /* if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    } */
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
               /*  } else {
                    document.getElementById("sample6_extraAddress").value = '';
                } */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('addr1').value = data.zonecode;
                //document.getElementById("addr2").value = addr2;
                
              /*   $("[name=addr1]").val(data.zonecode);
                $("[name=addr2]").val(addr); */
                
                document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr2').value = addr2;
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr3").focus();
            }
        }).open();
    }
</script>

<script>

/* 채팅 */
var chaticon = document.getElementById("chaticon");


var _width = '350';
var _height = '600';

var _left = Math.ceil(( window.screen.width - _width )/2);
var _top = Math.ceil(( window.screen.width - _height )/2); 

chaticon.onclick = function() {

 	window.open("/mypet/member/chat.action", "a", "width=350, height=600"); 

}

/* 생년월일 select box */
 $(document).ready(function () {
    setDateBox();
  });

  // select box 연도 , 월 표시
  function setDateBox() {
    var dt = new Date();
    var birth_year = "";
    var com_year = dt.getFullYear();

    // 발행 뿌려주기
    $("#birth_year").append("<option value=''>년도</option>");

    // 올해 기준으로 -50년부터 +1년을 보여준다.
    for (var y = (com_year - 50); y <= (com_year + 1); y++) {
      $("#birth_year").append("<option value='" + y + "'>" + y + "</option>");
    }

    // 월 뿌려주기(1월부터 12월)
    var birth_month;
    $("#birth_month").append("<option value=''>월</option>");
    for (var i = 1; i <= 12; i++) {
      $("#birth_month").append("<option value='" + i + "'>" + i + "</option>");
    }

    // 일 뿌려주기(1일부터 31일)
    var birth_day;
    $("#birth_day").append("<option value=''>일</option>");
    for (var i = 1; i <= 31; i++) {
      $("#birth_day").append("<option value='" + i + "'>" + i + "</option>");
    }

  }
  
  /* 아이디 중복체크 */
  
/*   var token = $("input[name='_csrf']").val();
var header = "X-CSRF-TOKEN"; */


/*   function id_check() {
	  id = $("#id").val();
	  
	  $.ajax({
			url : "/idCheck.action",  
			type: "post",
			dataType : "text",
			data : id,
			contentType : 'text/plain; charset=utf-8;',
			success : function(data) {
				if (data == 0) {
					console.log("아이디 없음");
					alert("사용가능한 아이디입니다.");
				} else {
					console.log("아이디 이미 있음");					
					arert("이미 사용중인 아이디입니다.");
				}
			}
			
	  })
  } */
  
  
  /* 아이디 중복체크 */
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
  var btn_idchk = document.getElementById("btn_idchk");
  var id_check = 0;
  $(function() {
      //idck 버튼을 클릭했을 때 
      $("#btn_idchk").click(function() {
          
          //userid 를 param.
          var id =  $("#id").val(); 
          
          $.ajax({
              async: true,
              type : 'post',
              data : id,


              url : "http://localhost:8090/mypet/member/idCheck.action",
              dataType : "json",
              //dataType : "text",
              //contentType: "application/json; charset=UTF-8",
              success : function(data) {
//                  if (data.count > 0) {
                  if (data > 0) {
                      alert("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
                      //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                      $(".divInputId").addClass("has-error")
                      $(".divInputId").removeClass("has-success")
                      $("#id").focus();
                      
                  
                  } else {
                      alert("사용가능한 아이디입니다.");
                      //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                      $(".divInputId").addClass("has-success")
                      $(".divInputId").removeClass("has-error")
                      $("#userpwd").focus();
                      //아이디가 중복하지 않으면  idck = 1 
                      id_check = 1;
                      
                  }
              },
              error : function(error) {
                  
                  alert("error : " + error);
              }

          });
      
      });
  });
  
  
  
  
  
  
  

  
  
  
  
  
function validation() {
    
    var id = $("#id").val();
    var password = $("#password").val();
    var pw_check = $("#pw_check").val();
    var name = $("#name").val();
    var email = $("#email").val();
    var addr1 = $("#addr1").val();
    var addr2 = $("#addr2").val();
    var addr3 = $("#addr3").val();
    
    if(id.length == 0){
        alert("아이디를 입력해 주세요."); 
        $("#id").focus();
        return false;
    }
    
    if(password.length == 0){
        alert("비밀번호를 입력해 주세요."); 
        $("#password").focus();
        return false;
    }
 
    if(password != pw_check){
        alert("비밀번호가 다릅니다. 비밀번호를 확인해 주세요."); 
        $("#pw_check").focus();
        return false; 
    }
 
    if(name.length == 0){
        alert("이름을 입력해주세요");
        $("#username").focus();
        return false;
    }
    
     if(email.indexOf("@") == -1){
        alert("올바른 이메일 형식이 아닙니다.");
        $("#email").focus();
        return false;
    } 
    
    if(addr1.length == 0 || addr2.length == 0 || addr3.length == 0 ){
        alert("주소를 입력해주세요");
        $("#addr3").focus();
        return false;
    }
    
    if(confirm("회원가입을 하시겠습니까?")){
    	if (id_check == 0) {
    		alert("아이디 중복체크를 해주세요.");
        	return false;
    		
    	} else {
        	alert("가입이 완료되었습니다. 로그인 후 이용해주세요.");
        	$("#register").submit();
    		
    	}
  
    } 
    
     /* if(confirm("회원가입을 하시겠습니까?")){
        alert("가입이 완료되었습니다. 로그인 후 이용해주세요.");
        $("#register").submit();
        return true;
    } */ 
    
}

</script>

</div>
<!-- content -->