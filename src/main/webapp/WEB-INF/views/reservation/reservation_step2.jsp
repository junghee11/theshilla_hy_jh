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
		<div>
			<img src="${data.imgLink}" alt="room" style="width:170px; height:100px;" />
			<p>${data.type } </p>
			<p>인원 ${data.person } 명</p>
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${data.base_price }" />
			
			<input type="button" onclick="mySubmit(1)" value="결제하기">
			<input type="button" onclick="mySubmit(2)" value="취소하기">
		</div>
	</form>
	<script>
		function mySubmit(index){
			if(index == 1){
				document.myForm.action='/payCredit?rsv_idx='+${rsv_idx}
			} else{
				document.myForm.action='/cancelDeal?rsv_idx='+${rsv_idx}
			}
		}
	</script>
	<h4>결제정보</h4>
	
	<label for="account" >계좌</label> <input type="text" name="account" id="account">

</body>
</html>
