<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 제이쿼리 라이브러리 외부CDN추가 -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="../resources/css/reset.css">
	<link rel="stylesheet" href="../resources/css/header.css">
	<link rel="stylesheet" href="../resources/css/login.css">
	<link rel="stylesheet" href="../resources/css/footer.css">
</head>
<body>
  
<!-- header 시작 -->
<div class="header-wrap">
	<header>
		
		<% 
// 		String id = (String)request.getAttribute("id");
		String id = request.getParameter("id");
		
		if(id == null) {
		%>
		<div class="rt_gnb">
			<span><a href="/member/login">로그인 &nbsp; |</a></span>
			<span><a href="/member/join">&nbsp;신라리워드가입</a></span>
			</div>
		<div class="ct_gnb">
			<a href="/"><img src="../resources/img/logo.gif" alt="신라호텔로고"></a>
		</div>
		<nav class="lb_gnb">
			<ul>
				<li><a href="/member/login">예약확인</a></li>
				<li><a href="/member/login">예약</a></li>
			</ul>
		</nav>

		<nav class="rb_gnb">
			<ul>
				<li><a href="/info_about">신라호텔소개</a></li>
				<li><a href="/review/list">이용후기</a></li>
			</ul>
		</nav>
		<% } else { %>
		<div class="rt_gnb">
	    	<span><b><%=id %></b>님 &nbsp; |</span>
	        <span><a href="/member/logout">&nbsp;로그아웃 &nbsp; |</a></span>   
	         <span><a href="/member/update?id=<%=id %>">&nbsp;회원정보수정</a></span>
	         </div>
	         
		<div class="ct_gnb">
			<a href="/?id=<%=id%>"><img src="../resources/img/logo.gif" alt="신라호텔로고"></a>
		</div>
		<nav class="lb_gnb">
			<ul>
				<li><a href="/reservation/my_room?id=<%=id%>">예약확인</a></li>
				<li><a href="/reservation/list?id=<%=id %>">예약</a></li>
			</ul>
		</nav>

		<nav class="rb_gnb">
			<ul>
				<li><a href="/info_about?id=<%=id %>">신라호텔소개</a></li>
				<li><a href="/review/list?id=<%=id %>">이용후기</a></li>
			</ul>
		</nav>
	   <% } %>
	</header>
</div>
<!-- header 끝 -->
		<main>
		<section class="content_wrap1">
			<h1><img src="../resources/img/loginTit.gif" alt="로그인이미지"></h1>
			<hr style="border: 2px solid #856f56; ">
			<div class="log1">
			<form method="POST">
				<label for="id">ID</label>
				<input type="text" name="id" placeholder="id"> <br>
				<label for="pw">PASSWORD</label>
				<input type="password" name="pw" placeholder="pw">
				<label for="log_btn" style="opacity:0;">ID</label>
				<input type="submit" name="id_btn" value="로그인"> <br>
				<script>
// 					function dologin(){
// 						document.id_btn.action = "/member/login"
// 						document.id_btn.submit()
// 					}
// 				var id_btn = document.getElementById("id_btn")
// 				document.id_btn.submit()
				</script>
				<div class="btn_all">
				<label for="log_btn" style="opacity:0;">ID</label>
					<a href="/member/join"><img src="../resources/img/loginBtnJoin.gif" alt="회원가입버튼"></a>
					<a href="/member/findId"><img src="../resources/img/loginBtnLostId.gif" alt="아이디찾기버튼"></a>
					<a href="/member/findPw"><img src="../resources/img/loginBtnLostPw.gif" alt=비밀번호찾기버튼""></a>
				</div>
				</form>
			</div>
		</section>
		<!-- content_wrap1 끝 -->

		<!-- footer 시작 -->
		<div class="info_wrap">
			<div class="info_main">
				<h3><img src="../resources/img/localBoxCompInfo.gif" alt="신라인포로고"></h3>
				<div class="info_content1">
					<ul>
						<li class="brand"><a href="#">The Shilla</a></li>
						<li class="mono"><a href="#">Shilla Monogra</a></li>
						<li class="stay"><a href="#">Shilla Stay</a></li>
					</ul>
				</div>
				<div class="info_content2">
					<div class="num">
						<div class="num1">
						</div>

					</div>
					<div class="map">
						<div class="map_img">
							<dl class="map_float">
								<dd><a href="#">호텔신라소개</a></dd>
							</dl>
							<dl class="map_float">
								<dd><a href="#">고객문의</a></dd>
							</dl>
							<dl>
								<dd><a href="#">사이트맵</a></dd>
							</dl>
							<dl class="map_float map_margin">
								<dd><a href="#">The Shilla shop</a></dd>
							</dl>
							<dl class="map_margin">
								<dd><a href="#">삼성상품권</a></dd>
							</dl>
						</div>
					</div>
					<div class="sns">
						<h2 class="sns_title">제목</h2>
						<dl>
							<a href="#">
								<dt class="face">페이스북</dt>
							</a>
							<a href="#">
								<dt class="ins">인스타그램</dt>
							</a>
							<a href="#">
								<dt class="wei">웨이보</dt>
							</a>
						</dl>
					</div>
				</div>
			</div>
		</div>

		<div class="footer_main">
			<div class="footer_content1">
				<ul class="content1_img">
					<li><a href="#">신라리워즈 약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">이메일무단수집금지</a></li>
					<li><a href="#">윤리경영(부정제보)</a></li>
				</ul>
			</div>
			<div class="footer_content2">
				<ul class="content2_img">
					<li><a href="#">한국어</a></li>
					<li><a href="#">ENGLISH</a></li>
					<li><a href="#">日本語</a></li>
					<li><a href="#">简体中文</a></li>
				</ul>
			</div>
			<div class="footer_content3">
				<p>㈜호텔신라 서울특별시 중구 동호로 249 (우: 04605) Tel: 02-2233-3131 Fax: 02-2230-3769 사업자등록번호: 203-81-43363 통신판매신고번호:
					중구00272호 대표이사 이부진 호스팅서비스제공자 삼성SDS㈜ 서울객실예약 shilla.reserve@samsung.com 제주객실예약 jejushilla@samsung.com</p>
				<p class="footer_content3_p"><a href="#"><img src="../resources/img/footLinkbtn.gif" alt="사업자정보확인"></a></p>
			</div>
		</div>


		<!-- footer 끝 -->




	</main>
</body>
</html>