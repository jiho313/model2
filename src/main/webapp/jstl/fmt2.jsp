<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:bundle basename="resources.messages">
	<h1>국제화처리</h1>
	
	<table border="1" style="width: 100%;">
		<thead>
			<tr>
				<th><fmt:message key="board.header.no"/></th>
				<th><fmt:message key="board.header.title"/></th>
				<th><fmt:message key="board.header.writer"/></th>
				<th><fmt:message key="board.header.date"/></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>국제화처리 연습</td>
				<td>홍길동</td>
				<td>2023-06-21</td>
			</tr>
			<tr>
				<td>1</td>
				<td>국제화처리 연습</td>
				<td>홍길동</td>
				<td>2023-06-21</td>
			</tr>
			<tr>
				<td>1</td>
				<td>국제화처리 연습</td>
				<td>홍길동</td>
				<td>2023-06-21</td>
			</tr>
			<tr>
				<td>1</td>
				<td>국제화처리 연습</td>
				<td>홍길동</td>
				<td>2023-06-21</td>
			</tr>
			<tr>
				<td>1</td>
				<td>국제화처리 연습</td>
				<td>홍길동</td>
				<td>2023-06-21</td>
			</tr>
		</tbody>
	</table>
</fmt:bundle>
</body>
</html>