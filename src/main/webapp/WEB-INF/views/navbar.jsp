<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link ${param.menu eq '홈' ? 'active' : '' }" href="/model2/home.hta">홈</a></li>
			<li class="nav-item"><a class="nav-link ${param.menu eq '게시판' ? 'active' : '' }" href="/model2/board/list.hta">게시판</a></li>
		</ul>
		<c:if test="${not empty loginCustomer }">
			<span class="navbar-text me-5"><strong class="text-white">${loginCustomer.name }</strong>님 환영합니다.</span>
		</c:if>
		<ul class="navbar-nav ">
			<c:choose>
				<c:when test="${empty loginCustomer }">
					<li class="nav-item"><a class="nav-link ${param.menu eq '로그인' ? 'active' : '' }" href="/model2/loginform.hta">로그인</a></li>
					<li class="nav-item"><a class="nav-link ${param.menu eq '회원가입' ? 'active' : '' }" href="/model2/registerform.hta">회원가입</a></li>				
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link " href="/model2/logout.hta">로그아웃</a></li>				
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>