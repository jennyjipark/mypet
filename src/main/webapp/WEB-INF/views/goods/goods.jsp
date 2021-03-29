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
    
    #goods {
    	border: 1px solid black;
    	width: 650px;
    	height: 800px;
    	float:left;
    }
    
    .image {
    	clear:both;
    	padding-top: 50px;
    	padding-left: 50px;
    	width: 600px;
    	height: 750px;
    }
    
    #goods_info {
    	border: 1px solid black;
    	width: 500px;
    	height: 800px;
    	margin-left: 25px;
    	float: left;
    	padding-left: 60px;
    	padding-top: 150px;
    }
    
    .line {
    	border-bottom: 1px solid black;
    	width: 350px;
    	margin-top: 30px;
    	margin-bottom: 10px;
    }
    
    .name, .price, .company, .totalPrice {
    	margin-left: 100px;
    	font-size: 20px;
    }
    
    .btnBuy {
    	margin-left: 100px;
    	background-color: #B27208;
    	border-radius: 8px;
    	padding: 14px 40px;
    	font-size: 20px;
    }
    
    #goodsCnt {
    }
    
    #tblGoodsCnt {
    	margin-left: 50px;
    	margin-top: 25px;
    }
    

</style>

<div id="content">
	<div id="goods">
		<img class="image" src="../resources/images/goods${dto.image }">
	</div>
	<form method="POST" action="/mypet/goods/order.action">
		<div id="goods_info">
			<input type="text" name="seqGoods" value="${dto.seqGoods }" style="display: none">
			<div>상품명</div>
			<div class="name">${dto.name }</div>
			<div class="line"></div>
			<div>판매가</div>
			<div class="price" value="${dto.price }">${dto.price }</div>
			<div class="line"></div>
			<div>제조사</div>
			<div class="company">${dto.companyName }</div>
			<div class="line"></div>
			<div>주문수량</div>
			<table id="tblGoodsCnt">
				<tr>
					<td rowspan="2">
						<input type="text" id="goodsCnt" value="1" name="goodsCnt">
					</td>
					<td>
						<button type="button" class="up">증가</button>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="down">감소</button>
					</td>
				</tr>
			</table>
			<div class="line"></div>
			<div>총 상품금액</div>
			<div class="totalPrice"></div>
			<div class="line"></div>
			<input type="submit" class="btnBuy" value="구매하기">
		</div>
	</form>
</div>


<script>

	//물품개수
	var value = $("#goodsCnt").val();
	//제품 금액
	var price = $(".price").attr('value');
	
	$(".totalPrice").html((price*value)+" 원");
	
	$(".up").click(function() {
		
		value++;
		$("#goodsCnt").attr('value', value);
		
		//총 금액 증가
		$(".totalPrice").html((price*value)+" 원");
		
	});
	
	$(".down").click(function() {
		
		value--;
		//0보다 아래면 1로 fix
		if(value == 0)
			value = 1;
		$("#goodsCnt").attr('value', value);
		
		//총 금액 감소
		$(".totalPrice").html((price*value)+" 원");
	});
	
</script>

