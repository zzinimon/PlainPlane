<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin page - GS List</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
	#cmd{
		width: 100%;
	}
</style>
</head>
<body>
	<div> 
		<details>
			<summary>auth</summary>
			<p>OJT=0<br>GS=1<br>GC=2<br>DS=3<br>SV=4</p>
		</details>
		<table>
			<caption><input id="cmd" type="text" placeholder="command line"></input></caption>
			<tr><th>Employee no</th><th>Authority</th><th>Air Line</th></tr>
			<c:forEach var="gs" items="${gs}">
				<tr><td>${gs.gs_id}</td><td>${gs.gs_auth}</td><td>${gs.gs_airline}</td></tr>
			</c:forEach>
		</table>
	</div>
	
	
	
	
	
<!-- script zone	 -->
<script>
	var input=document.getElementById("cmd");
	
	input.addEventListener("keyup",function(event){
		if(event.keyCode===13){	//press Enter key
			$.ajax({
				type : "POST",
				url : "/admin/staff/inputCmd",
				data : {cmd:cmd.value},
				dataType : "text",
				success : function(){alert("test")}
			});
		}
	});
</script>
</body>
</html>