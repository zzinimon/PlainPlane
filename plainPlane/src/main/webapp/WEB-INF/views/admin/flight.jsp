<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin page - GS List</title>
<style>
	body{
		margin:auto;
		text-align: center;
	}
	table{
		margin:auto;
	}
	th{
		border:1px solid black; 
	}
</style>
</head>
<body>
	<div> 
		<table>
			<caption>Flight List</caption>
			<tr><th>NO</th><th>DATE</th><th>CRAFT</th><th>BOUND</th><th>STATUS</th><th>DPT</th><th>ARR</th><th>STA</th><th>STD</th><th>AIR LINE</th></tr>
			<c:forEach var="flt" items="${flt}">
				<tr><td>${flt.flt_no}</td><td>${flt.flt_date}</td><td>${flt.craft_id}</td><td>${flt.flt_bound}</td><td>${flt.flt_stat}</td><td>${flt.flt_dpt}</td><td>${flt.flt_arr}</td><td>${flt.flt_sta}</td><td>${flt.flt_std}</td><td>${flt.flt_airline}</td></tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>