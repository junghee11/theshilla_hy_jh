<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
</head>
<body>
<h4>예약하기</h4>
<hr/>
<h5>숙박기간</h5>
<form method="GET" action="/date_check">
	<input type="date" name="date_in" value="${date_in }" />
	<input type="date" name="date_out" value="${date_out }" />
	<input type="submit" value="선택" />
</form>

<br>
<br>
<br>
<br>
<h5>Step2. 방 선택</h5>
<form>
<!-- <input type="hidden" name="date_in" value="" /> -->
<!-- <input type="hidden" name="date_out"  value="" /> -->
<input type="hidden" name="date_in" value="${date_in }" />
<input type="hidden" name="date_out" value="${date_out }" />
<input type="text" name="id" placeholder="ID">
<input type="text" name="price" placeholder="price">
<input type="text" name="room_no" placeholder="room_no">
<table style="border:1px solid gray;">
	<thead>
		<tr>
			<td>사진</td>
			<td>룸넘버</td>
			<td>타입</td>
			<td>기준인원</td>
			<td>최대인원</td>
			<td>인원</td>
			<td>가격</td>
			<td>선택</td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${data }">
		
		<tr>
		
			<td><img src="${row.imgLink}" alt="room" style="width:170px; height:100px;"></td>
			<td>${row.room_no }</td>
			<td>${row.type }</td>
			<td>${row.base_person }</td>
			<td>${row.max_person }</td>
			<td>${row.base_person }</td>
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.base_price }" />
			</td>
			<td><input type="checkbox" name="abc" value="${row.room_no }"></td>
		
		</tr>
		
	</c:forEach>
	</tbody>
</table>
</form>


<c:forEach var="row" items="${data }">
	<form method="post" action="reservation">
	<div>
		<input type="submit" name="abc" value="${row.room_no }">
		<img src="${row.imgLink}" alt="room" style="width:170px; height:100px;">
		${row.room_no }
		${row.type }
		${row.base_person }
		${row.max_person }
		${row.base_person }
		<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.base_price }" />
		
		<input type="checkbox">
		<input type="submit" value="예약하기">
	</div>
	</form>
</c:forEach>
	

</body>
</html>