<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약하기_Step1</title>
<!-- 제이쿼리 라이브러리 외부CDN추가 -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 달력2 시작 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('.input-daterange').datepicker({
				format: 'yyyy-mm-dd',
				todayHighlight: true,
				startDate: '0d'
			});

		});
	</script>
	<!-- 부트스트랩 달력1 끝 -->
	<script src="../resources/js/reserve.js"></script>
	<link rel="stylesheet" href="../resources/css/reset.css">
	<link rel="stylesheet" href="../resources/css/header.css">
	<link rel="stylesheet" href="../resources/css/reserve.css?after">
	<link rel="stylesheet" href="../resources/css/date.css">
	<link rel="stylesheet" href="../resources/css/footer.css">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous"
	 referrerpolicy="no-referrer" />
</head>
<body>

<!-- header 시작 -->
<div class="header-wrap">
	<header>
		<div class="rt_gnb">
		<% 
		String id = request.getParameter("id");
		if(id == null) {
		%>
			<span><a href="/member/login">로그인 &nbsp; |</a></span>
		<% } else { %>
	    	<span><b><%=id %></b>님 &nbsp; |</span>
	        <span><a href="/member/logout">&nbsp;로그아웃 &nbsp; |</a></span>   
	   <% } %>
			<span><a href="join.html">&nbsp;신라리워드가입 &nbsp; |</a></span>
			<span><a href="#">&nbsp;예약확인 &nbsp; |</a></span>
		</div>
		<div class="ct_gnb">
			<a href="index.html"><img src="../resources/img/logo.gif" alt="신라호텔로고"></a>
		</div>
		<nav class="lb_gnb">
			<ul>
				<li><a href="#">이용후기</a></li>
				<li><a href="reservation/list?id=<%=id %>">예약</a></li>
			</ul>
		</nav>

		<nav class="rb_gnb">
			<ul>
				<li><a href="#">호텔신라 소개</a></li>
				<li><a href="#">고객문의</a></li>
				<li><a href="#">신라리워즈</a></li>
			</ul>
		</nav>
	</header>
</div>
<!-- header 끝 -->
	<main>
		<section class="content_wrap1">
		<!--	<h1 style="text-align:center;"><img src="img/rsv_step1_on.png" alt=""> </h1> -->

			<div class="container daterange px-1 px-sm-5 mx-auto">
				<form autocomplete="off" method="GET" action="/reservation/date_check">
				<input type="hidden" name="mem_id" value="${id }" />
					<div class="flex-sm-row flex-column d-flex">
						<div class="col-sm-9 col-12 px-0 mb-2">
							<div class="input-group input-daterange">
								<input type="text" class="form-control" name="date_in" value="${date_in }" placeholder="Arriving Date" readonly>
								<input type="text" class="form-control" name="date_out" value="${date_out }" placeholder="Leaving Date" readonly>
							</div>
						</div>
						<div class="col-sm-3 col-12 px-0"> <button type="submit" class="btn btn-black">Search</button> </div>
					</div>
				</form>
			</div>
			
			<!-- 부트스트랩 달력 끝 -->
			<h1 style="margin-left:10px; margin-bottom: 20px; font-size:18px;">객실선택</h1>
			<hr style="border: 2px solid #856f56; ">
			<div class="room_select">
				<ul>
				<c:forEach var="row" items="${data }">
					<li>
					<form method="post" action="/reservation/select_room">
						<input type="hidden" name="date_in" value="${date_in }" />
						<input type="hidden" name="date_out" value="${date_out }" />
						<input type="hidden" name="room_no" value="${row.room_no }">
						<input type="hidden" name="price" value="${row.base_price }">
						<input type="hidden" name="id" value="${id }" >
						<div class="select_flex">
							<div class="select1">
								<img src="${row.imgLink}" alt="room">
							</div>
							<div class="select2">
								<h2>${row.type }</h2>
								<p>기준 ${row.base_person }명, 최대 ${row.max_person }명</p>
							</div>
							<div class="select3">
								<div>
								<span style="margin-right:10px;">성인</span>
                           <input type=number name="person" onClick="javascript:this.form.amount.value++;" max="${row.max_person }" min="1" value="${row.base_person }">
<!--                            <input type="text" id="numberUpDown1" name="person" value=""> -->
								
								</div>
							</div>
							<div class="select4">
								<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${row.base_price }" /></p>
							</div>
							<div class="select5">
								<input type="submit" value="">
<!-- 								<a href="#" onclick="return chk_form()"> -->
<!-- 									<img src="../resources/img/reserve_step1_rsvopen.gif" alt="예약하기 버튼"> -->
								</input>
							</div>
<!-- 							<script> -->
<!-- // 								function chk_form(){ -->
<!-- // 									document.getElementById('check_room').submit() -->
<!-- // 								} -->
<!-- 							</script> -->
						</div>
						</form>
					</li>
				</c:forEach>
				</ul>
			</div>
		</section>


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