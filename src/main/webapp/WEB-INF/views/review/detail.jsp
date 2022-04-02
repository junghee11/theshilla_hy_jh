<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- fmt: JSTL라이브러리 중 하나 -->
<!-- 포맷에 관련된 것! -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 후기 상세</title>
</head>
<body>
<% String id = request.getParameter("id"); %>
	<h1>이용 후기 상세</h1>
	<p>제목 : ${data.review_title} </p> <br>
	<p>내용 : ${data.review_content }</p> <br>
	<p>예약한 룸 : ${data.type }</p> <br>
	<p>별점 : <fmt:formatNumber type="number" pattern=".0" value="${data.room_rating}"/></p> <br>
	<p>아이디 :<%=id %></p><br>
	<p>입실일 : ${data.date_in}</p> <br>
	<p>작성일 : <fmt:formatDate value="${data.review_date}" pattern="yyyy.MM.dd"/></p> <br>
	
	<p><a href="/review/update?review_no=${review_no}">수정</a>
	<form method="POST" action="/review/delete">
		<input type="hidden" name="review_no" value="${review_no}"/>
		<input type="submit" value="삭제"/>
	</form>
	<p><a href="/review/list">목록으로</a></p>
	

</body>
</html>