<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param name="menu" value="홈" />
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>홈입니다.</h1>
			<p>${message }</p>
		</div>
	</div>
<%--
	<div class="row">
		<div class="col-12">
			<h3>EL 표현식으로 객체의 값 표현하기</h3>
			<p>${p1 }</p>
			<dl>
				<dt>상품번호</dt><dd>${p1.no }</dd>
				<dt>상품이름</dt><dd>${p1.name }</dd>
				<dt>제조회사</dt><dd>${p1.maker }</dd>
				<dt>가격</dt><dd>${p1.price }</dd>
				<dt>할인율</dt><dd>${p1.discountRate }</dd>
				<dt>재고수량</dt><dd>${p1.stock }</dd>
				<dt>등록일</dt><dd>${p1.createDate }</dd>
			</dl>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<h3>EL 표현식의 연산자</h3>
			<dl>
				<dt>덧셈 연산</dt><dd>${p1.stock + p2.stock }</dd>
				<dt>뺄셈 연산</dt><dd>${p1.price - p2.price }</dd>
				<dt>곱셈 연산</dt><dd>${p1.price*p1.discountRate }</dd>
				<dt>나눗셈 연산</dt><dd>${p1.price/p1.stock }</dd>
				<dt>나눗셈 연산</dt><dd>${p1.price div p1.stock }</dd>
				
				<dt>크다</dt><dd>${p1.price > p2.price }</dd>
				<dt>크다</dt><dd>${p1.price gt p2.price }</dd>
				
				<dt>크거나 같다</dt><dd>${p1.price >= p2.price }</dd>
				<dt>크거나 같다</dt><dd>${p1.price ge p2.price }</dd>
				
				<dt>작다</dt><dd>${p1.price < p2.price }</dd>
				<dt>작다</dt><dd>${p1.price lt p2.price }</dd>
				
				<dt>작거나 같다</dt><dd>${p1.price <= p2.price }</dd>
				<dt>작거나 같다</dt><dd>${p1.price le p2.price }</dd>
				
				<dt>같다</dt><dd>${p1.price == p2.price }</dd>
				<dt>같다</dt><dd>${p1.price eq p2.price }</dd>
				
				<dt>같다</dt><dd>${p1.name == '연필' }</dd>
				<dt>같다</dt><dd>${p1.name eq '연필' }</dd>
				
				<dt>같지않다</dt><dd>${p1.price != p2.price }</dd>
				<dt>같지않다</dt><dd>${p1.price ne p2.price }</dd>
				
				<dt>같지않다</dt><dd>${p1.name != '연필' }</dd>
				<dt>같지않다</dt><dd>${p1.name != '연필' }</dd>
				
				<dt>비어있는가?</dt><dd>${empty p1 }</dd>
				<dt>비어있는가?</dt><dd>${empty p2 }</dd>
				<dt>비어있는가?</dt><dd>${empty p3 }</dd>
				
				<dt>비어있는가?</dt><dd>${empty items1 }</dd>
				<dt>비어있는가?</dt><dd>${empty items2 }</dd>
				<dt>비어있는가?</dt><dd>${empty items3 }</dd>
				<dt>비어있는가?</dt><dd>${empty items4 }</dd>
			</dl>
		</div>
	</div>
--%>
</div>
</body>
</html>