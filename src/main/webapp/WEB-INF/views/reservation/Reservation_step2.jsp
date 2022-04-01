<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>예약하기_Step2</title>
</head>
<body>
	<h4>예약정보</h4>
	<form name="myForm" method="get">
		<input type="hidden" id="rsv_idx" name="rsv_idx" value="${Rsv_idx}">
		<input type="hidden" id="id" name="id" value="${detail.id}">
		<input type="hidden" id="item_name" name="item_name" value="${detail.type}">
		<input type="hidden" id="total_amount" name="total_amount" value="${detail.cash}">
		<div>
			<img src="${detail.imgLink}" alt="room" style="width:170px; height:100px;" />
			<p>예약자 : ${detail.id } </p>
			<p>선택하신 옵션 : ${detail.type } </p>
			<p>인원 : ${detail.base_person } 명</p>
			<p>기간 : ${detail.date_in } ~ ${detail.date_out }</p>
			<span>결제예정금액 : </span><fmt:formatNumber type="number" maxFractionDigits="3" value="${detail.cash }" />
			<br>
			<p>결제여부 : ${detail.payment } </p>
			<input type="button" id="apibtn" onclick="mySubmit(1)" value="결제하기">
			<input type="button" onclick="mySubmit(2)" value="취소하기">
			
		</div>
	</form>
<!-- 	<div id="apibtn" style="background-color:pink; cursor:pointer; color:white; width:110px; height:40px;">카카오페이</div> -->
<!-- 	<input type="button" id="apibtn" value="결제하기"> -->
<!-- 	<button id="apibtn">결제하기-kakao</button> -->
	
	<h4>결제정보</h4>
	
	<label for="account" >계좌</label> <input type="text" name="account" id="account">

</body>
	<script>
		function mySubmit(index){
			if(index == 1) {
// 				결제api 수행 이후, 결제상태 변환
//				api 기능 sucess시 수행하는것으로 설정
			} else {
				alert("해당 예약이 취소되었습니다.")
				document.myForm.action="/reservation/cancelDeal";
				document.myForm.submit();
			}
			
		}
		
// 		$(function(){
// 			$('#apibtn').click(function(){
// 				 $.ajax({
// 					url: '/kakaoPay' ,
// 			        dataType: 'json' ,
// 			        success: function(data){
// 			        	var box = data.next_redirect_pc_url;
// 			        	location.href = box;
// 			        } , 
// 			     	error: function(error){
			     		
// 			     		alert(error);
// 			     		alert("error");
// 		     		}   
// 		     	});
// 			});
// 		});
		
		$('#apibtn').click(function(){
			var IMP = window.IMP; // 생략가능
			var rsv_idx = document.getElementById("rsv_idx").value;
			var mem_id = document.getElementById("id").value;
			var item_name = document.getElementById("item_name").value;
			var total_amount = document.getElementById("total_amount").value;
			IMP.init('imp02494686'); 
			IMP.request_pay({
				pg: 'kakao',
				pay_method: 'card',
				merchant_uid: 'merchant_' + new Date().getTime() + rsv_idx,
				name: '주문명 : ' + item_name,
				amount: + total_amount,
				buyer_name: '주문자 Id' + mem_id,
				buyer_postcode: '123-456',
				}, function (rsp) {
					console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '결제 금액 : ' + rsp.paid_amount;
					
					document.myForm.action="/reservation/payOk"
					document.myForm.submit();
					
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				
				alert(msg);
			});
		});
	</script>
</html>
