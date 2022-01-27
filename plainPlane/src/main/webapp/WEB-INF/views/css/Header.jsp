<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
	#cmd{
		width: 500px;
	}
</style>
</head>
<body>
<% List<String> auth=new LinkedList<String>();
		auth.add("OJT");
		auth.add("GS");
		auth.add("GC");
		auth.add("DS");
		auth.add("SV");
		auth.add("ADMIN");
		pageContext.setAttribute("auth", auth);
%>
	<c:choose>
		<c:when test="${empty sessionScope.staff}" >
			<button onclick="location.href='/login'" >LOGIN</button>
			
			
			<input id="cmd" type="text" placeholder="command line" autofocus></input>
			
			
			
		</c:when>
		<c:otherwise>
			LOGIN:${sessionScope.staff.gs_id}(${sessionScope.staff.gs_airline}/${auth[sessionScope.staff.gs_auth]})
			<c:if test="${sessionScope.staff.gs_auth eq 5}">
				<a href="http://localhost:8080/admin/staff">Staff List</a>
			</c:if>
			<button id="logoutbtn">LOGOUT</button>
			<p>PP</p> 
			<input id="cmd" type="text" placeholder="command line" autofocus></input>
		</c:otherwise>
	</c:choose>





<!-- 	script zone -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
		logoutbtn.onclick=function(){
			$.ajax({
				type : "post",
				url : "/logout",
				success : function(){location.href="/login";},
				error:function(){alert("error")}
			});
		}
	</script>
</body>
</html>