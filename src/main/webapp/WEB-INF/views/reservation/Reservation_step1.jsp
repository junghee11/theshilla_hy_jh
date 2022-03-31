<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기_Step1</title>
</head>
<body>
<h4>예약하기</h4>
<hr/>
<h5>숙박기간</h5>
<form method="GET" action="/reservation/date_check">
	<input type="date" name="date_in" value="${date_in }" />
	<input type="date" name="date_out" value="${date_out }" />
	<input type="submit" value="선택" />
</form>

<br>
<br>
<br>
<br>
<h5>객실선택</h5>
<c:forEach var="row" items="${data }">
	<form method="post" action="/reservation/select_room">
		<input type="hidden" name="date_in" value="${date_in }" />
		<input type="hidden" name="date_out" value="${date_out }" />
		<input type="hidden" name="room_no" value="${row.room_no }">
		<input type="hidden" name="price" value="${row.base_price }">
		<input type="text" name="mem_id" placeholder="ID">
		<div>
			<img src="${row.imgLink}" alt="room" style="width:170px; height:100px;">
			<p>${row.type } </p>
			<p>기준 ${row.base_person } 명</p>
			<p>최대 ${row.max_person } 명</p>
			<label for="person" ></label><input name="person" id="person" value="${row.base_person }">
			<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.base_price }" />
			<input type="submit" value="예약하기">
		</div>
	<hr />
	</form>
</c:forEach>
</body>
</html>