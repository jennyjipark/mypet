<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>MyPet::회원가입</title>

<style>

/* content */
#content {
	width: 1300px;
	margin: 0px auto;
	margin-top: 210px;
	/* padding: 20px 50px; */
	
	

	/* margin-right: px; */
}

/* main의 너비가 커기면 위의 min-whith도 커져야 footer가 맞습니다.*/
#content {
	height: 1000px;
	font-family: NanumSquare;
	font-size: 16px;
	padding: 20px 180px;
	
	border : 1px solid transparent;
}

#contentnav {
	border: 1px solid black;
	width: 1200px;
	height: 100px;
	padding: 20px 20px;
}

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


/* cheklist */
.terms {
	position: relative;
	overflow: auto;
	height: 88px;
	margin-top: 8px;
	padding: 12px;
	border: 1px solid #dadada;
	background: #fff;
	box-sizing: border-box;
}

.checklist {
	margin-top: 30px;
	font-size: 17px;
}

.btns {

    display: inline-block;
    margin-top: 20px;
    width: 30%;
    font-family: 'Jal_Onuel';
    height: 5rem;
    font-size: 20px;
    padding-top: 12px;
    margin-top: 40px;
    left: 170px;
    position: relative;
    
    
    /* padding: 6px 12px; */
    margin-bottom: 0;
    
    font-weight: normal;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}

#btnCancel {
	margin-right: 10px;
	background-color: #fab018;
	color:white;
	
}

#btnAgree {
	color: white;
	background-color: #b27208;
}

input[type="checkbox"] {
	background-color: #F6DA42;
}

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
		<div class="join_form">
			<form id="join_form" method="GET" action="/#">

				<!-- <form method="post" id="join_form" action="/#"> -->

				<!-- 약관 동의 시작 -->
				<div class="chekall_list">

					
					<div class="checklist"><input type="checkbox" name="chk_all" id="chk_all" value="1">
					<label for="check_all">마이펫 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신(선택)에 모두 동의합니다.</label></div> 
						
						
						<div class="checklist"><input type="checkbox" name="termsService"
						id="termsService" value="1"> <label for="termsService">마이펫
						서비스 이용약관 동의<small>(필수)</small></label></div>
					<div class="terms">여러분을 환영합니다. 마이펫 서비스 및 제품(이하 ‘서비스’)을 이용해
						주셔서 감사합니다. 본 약관은 다양한 마이펫 서비스의 이용과 관련하여 마이펫 서비스를 제공하는 마이펫 주식회사(이하
						‘마이펫’)와 이를 이용하는 마이펫 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의
						마이펫 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 마이펫 서비스를 이용하시거나 마이펫 서비스
						회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의
						깊게 살펴봐 주시기 바랍니다. 마이펫은 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만,
						'청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로
						이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가
						있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다. 회원으로
						가입하시면 마이펫 서비스를 보다 편리하게 이용할 수 있습니다. 여러분은 본 약관을 읽고 동의하신 후 회원 가입을
						신청하실 수 있으며, 마이펫은 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 마이펫 서비스 이용 계정(이하
						‘계정’)을 부여합니다. 계정이란 회원이 마이펫 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로
						관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 마이펫 서비스를 보다 편리하게
						이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 마이펫 회원가입 방법 등에서 확인해
						주세요. 여러분이 제공한 콘텐츠를 소중히 다룰 것입니다. 마이펫은 여러분이 게재한 게시물이 마이펫 서비스를 통해 다른
						이용자들에게 전달되어 우리 모두의 삶을 더욱 풍요롭게 해줄 것을 기대합니다. 게시물은 여러분이 타인 또는 자신이 보게
						할 목적으로 마이펫 서비스 상에 게재한 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로 구성된 각종
						콘텐츠 자체 또는 파일을 말합니다. 마이펫 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다. 마이펫은 여러분이
						마이펫 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 마이펫 서비스를 보다
						안전하게 이용하고 마이펫 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가
						필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 마이펫
						서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다. 회원 가입 시 이름, 생년월일,
						휴대전화번호 등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수
						있도록 관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을
						허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한 상세한
						내용은 계정 운영정책을 참고해 주시기 바랍니다. 타인에 대해 직접적이고 명백한 신체적 위협을 가하는 내용의 게시물,
						타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보, 사생활 등 비공개 개인정보를
						드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물, 성매매를 제안, 알선, 유인 또는
						강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는 내용의 게시물은 제한될 수 있습니다. 관련
						법령상 금지되거나 형사처벌의 대상이 되는 행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이
						확인된 게시물, 관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건 또는 서비스를 홍보, 광고, 판매하는 내용의
						게시물, 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해 또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된
						게시물은 제한될 수 있습니다. 자극적이고 노골적인 성행위를 묘사하는 등 타인에게 성적 수치심을 유발시키거나 왜곡된 성
						의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는 혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의
						게시물, 본인 이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물, 과도한 욕설, 비속어 등을
						계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다. 마이펫은 여러분의
						본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다. 마이펫 서비스에는
						기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관,
						운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관,
						계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의
						개별 서비스 초기 화면에서 확인해 주시기 바랍니다. 본 약관은 한국어를 정본으로 합니다. 본 약관 또는 마이펫 서비스와
						관련된 여러분과 마이펫과의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 마이펫 서비스와 관련하여
						여러분과 마이펫 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.</div>

					<div class="checklist"><input type="checkbox" name="termsPrivacy" id="termsPrivacy"
						value="1"> <label for="termsPrivacy">개인정보 수집 및 이용
						동의<small>(필수)</small></label></div>
					<div class="terms">개인정보보호법에 따라 마이펫에 회원가입 신청하시는 분께 수집하는 개인정보의
						항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을
						안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. 1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보
						검색, 뉴스 보기 등 대부분의 마이펫 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페,
						블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 마이펫은 서비스 이용을 위해 필요한
						최소한의 개인정보를 수집합니다. 회원가입 시점에 마이펫이 이용자로부터 수집하는 개인정보는 아래와 같습니다. • - 회원
						가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가
						입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별,
						중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를
						수집합니다. 2. 수집한 개인정보의 이용 마이펫 및 마이펫 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스
						개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다. • - 회원 가입 의사의
						확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등
						회원관리를 위하여 개인정보를 이용합니다. • - 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석,
						서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형
						서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다. 3. 개인정보의
						보관기간 회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다. 단, 이용자에게 개인정보
						보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안
						개인정보를 안전하게 보관합니다. 이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은
						경우는 아래와 같습니다. • - 부정 가입 및 이용 방지 가입인증 휴대전화번호 또는DI (만14세 미만의 경우
						법정대리인DI) : 수집시점으로부터6개월 보관 탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리))
						: 탈퇴일로부터6개월 보관 • - 전자상거래 등에서 소비자 보호에 관한 법률 계약 또는 청약철회 등에 관한 기록: 5년
						보관 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관 • -
						전자금융거래법 전자금융에 관한 기록: 5년 보관 • - 통신비밀보호법 로그인 기록: 3개월 참고로 마이펫은 ‘개인정보
						유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다. 4.
						개인정보 수집 및 이용 동의를 거부할 권리 이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입
						시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수
						있습니다.</div>

					<div class="checklist"><input type="checkbox" name="termsEmail" id="termsEmail" value="1">
					<label for="termsEmail">프로모션 정보 수신 동의<small>(선택)</small></label></div>
					<div class="terms">마이펫에서 제공하는 이벤트/혜택 등 다양한 정보를 이메일로 받아보실 수
						있습니다. 일부 서비스의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해
						별도로 안내하고 동의를 받습니다.</div>
					<span class="error" id="agreeMsg" style="display: none">네이버
						이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>

				</div>
				<!-- checklist -->

				<!-- <input type="submit" class="btn btn-outline-secondary" type="button" id="btn-register1" value="회원가입"> -->
				<div class="btn_area double">
					<span><a href="#" id="btnCancel"
						class="btns btn-outline-secondary" role="button">취소</a></span> <span><a
						href="/mypet/member/register2.action" id="btnAgree" class="btns btn-outline-secondary" role="button">확인</a></span>
				</div>

			</form>
			<!-- join_form -->

		</div>
		<!-- join_form -->

	</div>
	<!-- join_content -->
	
	<div class="chaticon" id="chaticon"></div>
	
</div>
<!-- content -->

<script>
	$(document).ready(function() {

		$("#chk_all").prop("checked", false);
		setTerms();

		$("#chk_all").click(function() {
			location.hash = 'agreeBottom';
			setTerms();
		})

		$("#btnCancel").click(function(event) {
			clickcr(this, 'tos.disagree', '', '', event);
			submitDisagree();
			return false;
		})

		$("#btnAgree").click(function(event) {
			clickcr(this, 'tos.agree', '', '', event);
			submitAgree();
			return false;
		})

	});

	function setTerms() {
		if ($("#chk_all").is(":checked")) {
			$("#termsService").prop("checked", true);
			$("#termsPrivacy").prop("checked", true);
			$("#termsEmail").prop("checked", true);
		} else {
			$("#termsService").prop("checked", false);
			$("#termsPrivacy").prop("checked", false);
			$("#termsEmail").prop("checked", false);
		}

		return true;
	}

	function checkTerms() {
		var res = true;

		if ($("#termsService").is(":checked") == false
				|| $("#termsPrivacy").is(":checked") == false) {
			$("#agreeMsg").show();
			res = false;
		} else {
			$("#agreeMsg").hide();
		}

		return res;
	}

	function submitAgree() {
		if (checkTerms() != true) {
			return false;
		}

		$("#join_form").submit();
		return true;
	}

	function submitDisagree() {
		location.href = "http://www.naver.com";
		return true;
	}

	function submitAgree() {
		if (checkTerms() != true) {
			return false;
		}

		$("#join_form").submit();
		return true;
	}
	
	
	//채팅
	var chaticon = document.getElementById("chaticon");

var _width = '350';
var _height = '600';

// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기.. 오른쪽 아래 하단에 두는건..? right=0 bottom=0으로 두는데 왜 안되지??
var _left = Math.ceil(( window.screen.width - _width )/2);
var _top = Math.ceil(( window.screen.width - _height )/2); 

chaticon.onclick = function() {

 	window.open("/mypet/member/chat.action", "a", "width=350, height=600"); 

}
</script>

