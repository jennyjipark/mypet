<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

	#footer {
		height: 200px;
		padding: 5px 300px;
		font-family: 'NanumSquare';
		color: #301B00;		
	}
	
	.start {
		/* border: 1px solid black; */
		width: 1300px;
		height: 180px;
	}
	
	
	.customer {
		/* border: 1px solid black; */
		width: 200px;
		height: 130px;
		background-size: contain;
		background-position: 50% 50%;
    	background-repeat: no-repeat;
    	float: left;
    	margin-left: 520px;
    	margin-top: 25px;
	}
	
	.tel {
		font-size: 26px;
		margin-bottom: 5px;
	}
	
	
	.logo-box {
		/* border: 1px solid black; */
		width: 150px;
		height: 150px;
		background-image: url(/mypet/resources/images/logo.png);
		background-size: contain;
		background-position: 50% 50%;
    	background-repeat: no-repeat;
    	float: right;
    	margin-top: 15px;
	}
	
	.decs {
		/* border: 1px solid black; */
		width: 400px;
		height: 140px;
		float: left;
		margin-top: 20px;
		
	}
	
	.decs > span {
		display: block;
	}
	
	.name {
		font-size: 18px;
		font-family: 'Jal_Onuel';
		text-align: left;
		margin-bottom: 15px;
		font-weight: bold;
	}
	
	#custom {
		font-weight: bolder;
    	font-family: 'NanumSquare';
	}
	
	#footer-table {
		border: 0px solid transparent;
	}
	
	#footer-table > tbody > .headtr > .th {
		width: 130px; 
		height: 20px;
		font-size: 13px;
		text-align: left !important;
	}
	
	#footer-table > tbody > .headtr > .td {
		text-align: left;
		width: 400px;
		font-size: 13px;
	}
	
	.customer > span {
		display: block;
		text-align: left;
	}
	
	.copy {
		/* border: 1px solid black; */
		width: 500px;
		text-align: left;
		float: left;
		margin-top: 13px;
		font-weight: lighter;
		
	}
	
	.etc {
		font-size: 13px;
	}
	
	
</style>


<footer id="footer">
	<div class="start">		
		<div class="decs">
			<span class="name">MYPET Coporation.</span>
			<table id="footer-table">
				<tr class="headtr">
					<th class="th">법인명</th>
					<td class="td">마이펫</td>
				</tr>
				<tr class="headtr">
					<th class="th">사업자등록번호</th>
					<td class="td">123-456-7890</td>
				</tr>
				<tr class="headtr">
					<th class="th">creator</th>
					<td class="td">노푸른 박지현 이준오 이대홍 윤지현 장진영</td>
				</tr>
				<tr class="headtr">
					<th class="th">위치</th>
					<td class="td">서울시 강남구 역삼동 한독빌딩 8층</td>
				</tr>				
			</table>
			<div class="copy">Copyright © MYPET Corp. All Rights Reserved.</div>
		</div>
		<div class="customer">		
			<span class="name" id="custom">고객센터</span>
			<span class="tel"><b>T. 1234-5678</b></span>
			<span class="etc"><b>팩스</b> 012-123-4567</span>
			<span class="etc"><b>평일</b> AM 09:00 ~ PM 18:00</span>
			<span class="etc" style="margin-top: 5px;">이용약관 ｜ 개인정보처리방침</span>
		</div>
		<div class="logo-box"></div>
		
	</div>
	
	
</footer>