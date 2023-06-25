<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<jsp:param name="menu" value="게시판" />
</jsp:include>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
			<h1>게시글 상세정보</h1>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			<table class="table">
				<tbody>
					<tr>
						<th style="width: 15%;">번호</th>
						<td style="width: 35%;">${board.no }</td>
						<th style="width: 15%;'">제목</th>
						<td style="width: 35%;"><c:out value="${board.title }" /> </td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><fmt:formatNumber value="${board.readCnt }" /></td>
						<th>댓글갯수</th>
						<td><fmt:formatNumber value="${board.commentCnt }" /></td>
					<tr>
						<th>최종 수정일</th>
						<td><fmt:formatDate value="${board.updateDate }" /> </td>
						<th>등록일</th>
						<td><fmt:formatDate value="${board.createDate }" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><c:out value="${board.content }" /></td>
					</tr>
				</tbody>
			</table>
			<div class="text-end">
				<c:if test="${not empty loginCustomer and loginCustomer.id eq board.customer.id }">
					<a href="updateform.hta?no=${board.no }" class="btn btn-warning">수정</a>
					<a href="delete.hta?no=${board.no }" class="btn btn-danger">삭제</a>
				</c:if>
				<a href="list.hta" class="btn btn-primary">목록</a>
			</div>
		</div>
	</div>

</div>
</body>
</html>