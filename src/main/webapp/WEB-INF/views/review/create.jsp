<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 후기 쓰기</title>
</head>
<body>
<%-- <% String id = request.getParameter("id"); %> --%>
<!-- 태그 적는 방식 2가지. -->
<!-- 1. 보통 태그는 여는 태그와 닫는 태그로 구성되는 데, 여는 태그와 닫는 태그가 반드시 다 있어야 할 경우 <h1></h1> -->
<!-- 2. <img> 태그 처럼 닫는 태그가 없을 때, <img/> 이렇게 표기하기 함 -->
<!-- 3. <img>처럼 쓰는 건 HTML표기법. <img/>처럼 쓰는 건 xhtml 표기법 -->

	<h1>이용 후기 쓰기</h1>
	<form method="POST">
		<p>제목 : <input type="text" name="review_title"></p>
		<p>내용 : <input type="text" name="review_content"></p>
		<p>예약한 룸 : <input type="text" name="type" value="${review.type }"></p>
		<p>별점 : <input type="text" name="room_rating"></p>
		<p>아이디 : <input type="text" name="id" value="${review.id }"> </p>
		<p>입실일 : <input type="text" name="date_in" value="${review.date_in }"></p>
		<p style="display:none;">작성일 : <fmt:formatDate value="${data.review_date}" pattern="yyyy.MM.dd"/></p>
		<p> <input type="submit" value="저장"> </p>
	</form>

</body>
</html>