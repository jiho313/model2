<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setAttribute("totalPrice", 10000);
	request.setAttribute("amount", 3);
	request.setAttribute("orderDate", new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fmt 태그 라이브러리</h1>
	
	<h3>formatNumber 태그</h3>
	<p>숫자를 지정한 형식의 포맷으로 출력한다.</p>
	<p>총구매가격 : <fmt:formatNumber value="${totalPrice }" /> 원</p>
	<p>1개당 가격 : <fmt:formatNumber value="${totalPrice/amount }" /> 원</p>
	<p>1개당 가격 : <fmt:formatNumber value="${totalPrice/amount }" pattern="#,###"/> 원</p>
	<p>1개당 가격 : <fmt:formatNumber value="${totalPrice/amount }" pattern="#,###.#" /> 원</p>
	
	<h3>formatDate 태그</h3>
	<p>날짜와 시간정보를 지정한 형식의 포맷으로 출력한다.</p>
	<p>주문날짜 : ${orderDate }</p>
	<p>주문날짜 : <fmt:formatDate value="${orderDate }" /></p>
	<p>주문날짜 : <fmt:formatDate value="${orderDate }" pattern="yyyy-MM-dd"/></p>
	<p>주문날짜 : <fmt:formatDate value="${orderDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
	<p>주문날짜 : <fmt:formatDate value="${orderDate }" pattern="yyyy년 M월 d일 EEEE"/></p>
	<p>주문날짜 : <fmt:formatDate value="${orderDate }" pattern="a hh:mm:ss"/></p>
</body>
</html>