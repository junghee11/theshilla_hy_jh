<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 후기 목록</title>
<!-- 제이쿼리 라이브러리 외부CDN추가 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
	var $setRows = $('#setRows');

	$setRows
			.submit(function(e) {
				e.preventDefault();
				var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

				//    console.log(typeof rowPerPage);

				var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
				if (!rowPerPage) {
					alert(zeroWarning);
					return;
				}
				$('#nav').remove();
				var $products = $('#products');

				$products.after('<div id="nav">');

				var $tr = $($products).find('tbody tr');
				var rowTotals = $tr.length;
				//  console.log(rowTotals);

				var pageTotal = Math.ceil(rowTotals / rowPerPage);
				var i = 0;

				for (; i < pageTotal; i++) {
					$('<a href="#"></a>').attr('rel', i).html(i + 1).appendTo(
							'#nav');
				}

				$tr.addClass('off-screen').slice(0, rowPerPage).removeClass(
						'off-screen');

				var $pagingLink = $('#nav a');
				$pagingLink.on('click', function(evt) {
					evt.preventDefault();
					var $this = $(this);
					if ($this.hasClass('active')) {
						return;
					}
					$pagingLink.removeClass('active');
					$this.addClass('active');

					// 0 => 0(0*4), 4(0*4+4)
					// 1 => 4(1*4), 8(1*4+4)
					// 2 => 8(2*4), 12(2*4+4)
					// 시작 행 = 페이지 번호 * 페이지당 행수
					// 끝 행 = 시작 행 + 페이지당 행수

					var currPage = $this.attr('rel');
					var startItem = currPage * rowPerPage;
					var endItem = startItem + rowPerPage;

					$tr.css('opacity', '0.0').addClass('off-screen').slice(
							startItem, endItem).removeClass('off-screen')
							.animate({
								opacity : 1
							}, 300);

				});

				$pagingLink.filter(':first').addClass('active');

			});

	$setRows.submit();
 });
</script> 
</head>
<body>
	<h1>이용 후기 목록</h1>

	<p>
	<form>
		<!-- 아무것도 안 넣음. 어차피 자기 자신으로 그대로 올거니까. -->
		<!-- placeholder input태그에 기본으로 연하게 적힌 값 -->
		<input type="text" placeholder="검색" name="keyword" value="${keyword}" />
		<input type="submit" value="검색" />
	</form>
	</p>


	<table id="products">
		<form action="" id="setRows">
			<p>
				showing <input type="text" name="rowPerPage" value="3"> item
				per page
			</p>
		</form>
		<thead>
			<tr>
				<td>제목</td>
				<td>내용</td>
				<td>예약한 룸</td>
				<td>별점</td>
				<td>아이디</td>
				<td>입실일</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<!-- data라는 키는 list를 가지고 있고, row는 이 리스트 안에 있는 값들 하나 하나 이다. -->
			<c:forEach var="row" items="${data}">
				<tr>
					<td>${row.review_title}</td>
					<td>${row.review_content }</td>
					<td>${row.type }</td>
					<td><fmt:formatNumber type="number" pattern=".0"
							value="${row.room_rating}" /></td>
					<td>${row.id}</td>
					<td>${row.date_in}</td>
					<td><fmt:formatDate value="${row.review_date}"
							pattern="yyyy.MM.dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="/review/create">생성</a>
	</p>
</body>
</html>



