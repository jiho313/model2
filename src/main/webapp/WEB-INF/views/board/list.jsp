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
			<h1>게시글 목록</h1>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 15%;">번호</th>
						<th style="width: 30%;">제목</th>
						<th style="width: 15%;">작성자</th>
						<th style="width: 20%;">조회수</th>
						<th style="width: 20%;">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty boardList }">
							<tr>
								<td colspan="5" class="text-center">게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${boardList }">
								<tr>
									<td>${board.no }</td>
									<td>
										<a href="read.hta?no=${board.no }">${board.title }</a>
										<c:if test="${board.commentCnt ne 0 }">
											<span class="text-primary">(${board.commentCnt })</span>
										</c:if>
									</td>
									<td>${board.customer.name }</td>
									<td><fmt:formatNumber value="${board.readCnt }" /></td>
									<td><fmt:formatDate value="${board.createDate }" pattern="yyyy년 M월 d일" /></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<c:if test="${not empty loginCustomer }">
				<div class="text-end">
					<a href="insertform.hta" class="btn btn-primary">새 글쓰기</a>
				</div>
			</c:if>
		</div>
	</div>
	
	<c:if test="${paging.totalRows gt 0 }">
		<div class="row mb-3">
			<div class="col-12">
				<ul class="pagination justify-content-center">
					<li class="page-item ${paging.firstPage ? 'disabled': ''}">
						<a href="list.hta?page=${paging.pageNo - 1 }" class="page-link">이전</a>
					</li>
					<c:forEach var="num" begin="${paging.beginPage }" end="${paging.endPage }">
						<li class="page-item ${paging.pageNo eq num ? 'active' : '' }">
							<a href="list.hta?page=${num }" class="page-link">${num }</a>
						</li>
					</c:forEach>
					
					<li class="page-item ${paging.lastPage ? 'disabled': ''}">
						<a href="list.hta?page=${paging.pageNo + 1 }" class="page-link">다음</a>
					</li>
				</ul>
			</div>
		</div>
	</c:if>
</div>
</body>
</html>