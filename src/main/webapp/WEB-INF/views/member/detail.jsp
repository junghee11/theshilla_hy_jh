<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- fmt: JSTL라이브러리 중 하나 -->
<!-- 포맷에 관련된 것! -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세정보</title>
</head>
<body>
	<h1>책 상세</h1>
	<p>아이디 : ${data.id} </p>
	<p>비밀번호 : ${data.pw} </p>
	<p>이름 : ${data.name }</p>
	<p>나이 : ${data.age}</p>
	<p>이메일 : ${data.email }</p>
	<p>주소 : ${data.address }</p>
	
	<p><a href="/member/update?id=${id}">수정</a>
	<form method="POST" action="/member/delete">
		<input type="hidden" name="id" value="${id}"/>
		<input type="submit" value="탈퇴하기"/>
	</form>

	

</body>
</html>