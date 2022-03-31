<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<!-- 태그 적는 방식 2가지. -->
<!-- 1. 보통 태그는 여는 태그와 닫는 태그로 구성되는 데, 여는 태그와 닫는 태그가 반드시 다 있어야 할 경우 <h1></h1> -->
<!-- 2. <img> 태그 처럼 닫는 태그가 없을 때, <img/> 이렇게 표기하기 함 -->
<!-- 3. <img>처럼 쓰는 건 HTML표기법. <img/>처럼 쓰는 건 xhtml 표기법 -->

	<h1>책 회원가입</h1>
	<form method="POST">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="password" name="pw"></p>
		<p>이름 : <input type="text" name="name"></p>
		<p>나이 : <input type="text" name="age"></p>
		<p>이메일 : <input type="text" name="email"></p>
		<p>주소 : <input type="text" name="address"></p>
		<p> <input type="submit" value="회원가입"> </p>
	</form>

</body>
</html>