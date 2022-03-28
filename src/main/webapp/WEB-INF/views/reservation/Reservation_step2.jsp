<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기_Step2</title>
</head>
<body>
	<h4>예약정보</h4>
	<form name="myForm" method="post">
		<input type="text" name="rsv_idx" value="${Rsv_idx}">
		<div>
			<img src="${detail.imgLink}" alt="room" style="width:170px; height:100px;" />
			<p>선택하신 옵션 : ${detail.type } </p>
			<p>인원 : ${detail.base_person } 명</p>
			<p>기간 : ${detail.date_in } ~ ${detail.date_out }</p>
			<span>결제예정금액 : </span>><fmt:formatNumber type="number" maxFractionDigits="3" value="${detail.cash }" />
			<br>
			<p>결제여부 : ${detail.payment } </p>
			<input type="button" onclick="mySubmit(1)" value="결제하기">
			<input type="button" onclick="mySubmit(2)" value="취소하기">
		</div>
	</form>
	<script>
		function mySubmit(index){
			if(index == 1){
				document.myForm.action="kakaoPay"
			} else{
				document.myForm.action="cancelDeal"
			}
			document.myForm.submit()
		}
	</script>
	<h4>결제정보</h4>
	
	<label for="account" >계좌</label> <input type="text" name="account" id="account">

</body>
</html>
