<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 후기 수정</title>
</head>
<body>
	<h1>이용 후기 수정</h1>
	<form method="post">
		<p>제목 : <input type="text" name="review_title" value="${data.review_title}"></p>
		<p>내용 : <input type="text" name="review_content" value="${data.review_content}"></p>
		<p>예약한 룸 : ${data.type }</p>
		<p>별점 : <input type="text" name="room_rating" value="${data.room_rating}"></p>
		<p>아이디 : ${data.id} </p>
		<p>입실일 : ${data.date_in}</p>
		<p>작성일 : <fmt:formatDate value="${data.review_date}" pattern="yyyy.MM.dd"/></p>
		<p> <input type="submit" value="저장"> </p>
	</form>
</body>
</html>