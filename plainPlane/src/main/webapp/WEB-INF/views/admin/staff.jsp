<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>test main page</title>
<style>
	body{
		align-items: center;
	}
	th{
		border:1px solid black; 
	}
</style>
</head>
<body>
	<div> 
		<table>
			<caption>Employee List</caption>
			<tr><th>Employee no</th><th>Authority</th><th>Air Line</th></tr>
			<c:forEach var="gs" items="${gs}">
				<tr><td>${gs.gs_id}</td><td>${gs.gs_auth}</td><td>${gs.gs_airline}</td></tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>