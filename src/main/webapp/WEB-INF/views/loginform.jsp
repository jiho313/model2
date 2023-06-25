<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<jsp:param name="menu" value="로그인"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1>로그인 폼입니다.</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<c:choose>
				<c:when test="${param.error eq 'fail' }">
					<div class="alert alert-danger">
						아이디 혹은 비밀번호가 올바르지 않습니다.
					</div>
				</c:when>
				<c:when test="${param.error eq 'disabled' }">
					<div class="alert alert-danger">
						탈퇴처리된 고객은 로그인할 수 없습니다.
					</div>
				</c:when>
				<c:when test="${param.error eq 'login' }">
					<div class="alert alert-danger">
						로그인이 필요한 서비스입니다.
					</div>
				</c:when>
			</c:choose>
		
			<form class="border bg-light p-3" method="post" action="login.hta">
				<div class="form-group mb-2">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="id" />
				</div>
				<div class="form-group mb-2">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password" />
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>