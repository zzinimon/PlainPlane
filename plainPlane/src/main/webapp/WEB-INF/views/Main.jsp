<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>test main page</title>
</head>
<body>
	<div> Employee List
		<tr><th>Employee no</th><th>Authority</th><th>Air Line</th></tr>
		<c:forEach var="gs" items="${gs}">
			<tr><td>${gs.gs_id}</td><td>${gs.gs_auth}</td><td>${gs.gs_airline}</td></tr>
		</c:forEach>
	</div>

</body>
</html>