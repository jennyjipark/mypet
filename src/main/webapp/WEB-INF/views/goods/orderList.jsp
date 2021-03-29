<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    #contentnav {
        border: 1px solid black;
        width: 1200px;
        height: 100px;
        padding: 20px 20px;
    }
    
    .table {
    	text-align: center;
    }
    
    .pagination {
    	margin-left: 500px;
    }
    
    
</style>

<div id="content">
	<h2>내 주문내역 보기</h2>
	<hr>
	<div>
		<table class="table table-bordered">
			<tr class="active">
				<th>상품정보</th>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>주문금액(수량)</th>
				<th>주문상태</th>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.goodsName }</td>
					<td>2021.03.14</td>
					<td>${dto.seqOrder }</td>
					<td>${dto.totalPrice}(${dto.goodsCnt })</td>
					<td>${dto.deliveryState }</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
</div>