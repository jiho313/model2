<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
<jsp:include page="../navbar.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1>게시글 수정 폼입니다.</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<form class="border bg-light p-3" method="post" action="update.hta?no=${board.no }">
				<div class="form-group mb-2">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="title" value="${board.title }"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">내용</label>
					<textarea rows="5" class="form-control" name="content">${board.content }</textarea>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>