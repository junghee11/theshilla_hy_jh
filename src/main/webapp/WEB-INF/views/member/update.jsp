<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보수정</title>
</head>
<body>
	<h1>책 수정</h1>
	<form method="post">
		<p>아이디 : ${data.id } </p>
		<p>비밀번호 : <input type="password" name="pw" value="${data.pw }"> </p>
		<p>비밀번호 학인 : <input type="password" name="pw" value="${data.pw }"> </p>
		<p>이름 : <input type="text" name="name" value="${data.name }"> </p>
		<p>나이 : <input type="text" name="age" value="${data.age }"> </p>
		<p>이메일 : <input type="text" name="email" value="${data.email }"> </p>
		<p>주소 : <input type="text" name="address" value="${data.address }"> </p>
		<p><input type="submit" value="수정"> </p>
	</form>
</body>
</html>