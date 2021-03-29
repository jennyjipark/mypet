<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>MyPet :: 굿즈스토어</title>	

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

    #orderinfo {
        border: 1px solid black;
        width: 1200px;
        height: 550px;
        padding: 20px 20px;
    }
    
    #payment {
        border: 1px solid black;
        width: 1200px;
        height: 150px;
        padding: 20px 20px;
        margin-top: 10px;
    }
    
    .info {
    	background-color: #DDDDDD;
    	padding: 15px 15px;
    }
    
    .input {
    	padding: 15px 15px;
    }
    
    .payment_type {
    	padding-left: 10px;
    }
    
    #product_info {
    	margin-top: 30px;
    }
    
    #tblProductInfo > th {
    	background-color: #DDDDDD;
    }
    
    .tdProductInfoName, .tdProductInfoGoodsCnt, .tdProductPrice {
    	padding: 20px 20px;
    }
    
    #btnPayment {
    	margin-top: 5px;
    	margin-left: 550px;
    	width: 100px;
    	height: 50px;
    }
    
    
</style>

<div id="content">
	<div id="orderinfo">
		<form>
			<fieldset>
				<legend>주문자 정보</legend>
				<table border="1">
					<tr>
						<td class="info">■주문하시는분</td>
						<td class="input"><input type="text" id="name"></td>
					</tr>
					<tr>
						<td class="info">전화번호</td>
						<td class="input"><input type="text"></td>
					</tr>
					<tr>
						<td class="info">■휴대폰 번호</td>
						<td class="input"><input type="text" id="tel"></td>
					</tr>
					<tr>
						<td class="info">■이메일</td>
						<td class="input"><input type="text" id="email"></td>
					</tr>
				</table>
			</fieldset>
		</form>
		<form id="product_info">
			<fieldset>
				<legend>주문 제품</legend>
				<table border="1" id="tblProductInfo">
					<tr>
						<th class="info">상품정보</th>
						<th class="info">수량</th>
						<th class="info">주문금액</th>
					</tr>
					<tr>
						<td class="tdProductInfoName" value="${dto.seqGoods }">${dto.name }</td>
						<td class="tdProductInfoGoodsCnt" value="${dto.goodsCnt }">${dto.goodsCnt }</td>
						<td class="tdProductInfoPrice" value="${dto.totalPrice }">${dto.totalPrice }</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	
	<div id="payment">
		<form method="POST" action="/mypet/goods/orderok.action">
			<input type="text" value="" style="display:none;" name="info" id="txtInfo">
			<fieldset>
				<legend>결제 방법</legend>
				<input type="radio" name="payment" class="payment_type"><label for="pay1">무통장입금</label>
				<input type="radio" name="payment" class="payment_type"><label for="pay2">신용카드</label>
				<input type="radio" name="payment" class="payment_type"><label for="pay3">토스</label>
				<input type="radio" name="payment" class="payment_type"><label for="pay3">휴대전화</label>
				<input type="radio" name="payment" class="payment_type"><label for="pay3">카카오페이</label>
			</fieldset>
			<input type="submit" type="button" id="btnPayment" value="결제하기">
		</form>
	</div>
</div>

<script>

	var GoodsCnt = $(".tdProductInfoGoodsCnt").attr('value');
	var seqGoods = $(".tdProductInfoName").attr('value');
	var totalPrice = $(".tdProductInfoPrice").attr('value');
	
	$("#txtInfo").val(GoodsCnt+","+seqGoods+","+totalPrice);
	console.log($("#txtInfo").val())
	
	$("#btnPayment").click(function() {
		
		
		if($("#tel").val().trim() == "") {
			alert("전화번호를 입력하세요");
			$("#tel").focus();
		}
		
		if($("#email").val().trim() == "") {
			alert("이메일을 입력하세요");
			$("#email").focus();
		}
		
		if($("#name").val().trim() == "") {
			alert("성함을 입력하세요");
			$("#name").focus();
		}
		
		
	});
	
	
	
</script>