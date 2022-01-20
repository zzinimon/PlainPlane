<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin page - GS List</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/../css/AdminZone.css">
<style>
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
	<div id="info"> 
		<p>PP</p>
		<h4>Staff List</h4>
		<table>
			<caption><input id="cmd" type="text" placeholder="command line" autofocus></input></caption>
			<tr><th>Employee no</th><th>Authority</th><th>Air Line</th></tr>
			<c:forEach var="gs" items="${gs}">
				<tr><td>${gs.gs_id}</td><td class='auth'>${auth[gs.gs_auth]}</td><td>${gs.gs_airline}</td></tr>
			</c:forEach>
		</table>
	</div>
	
	
	
	
<!-- script zone	 -->
<script>
	const input=document.getElementById("cmd");
	
	input.addEventListener("keyup",function(event){
		if(event.keyCode===13){	//press Enter key
			const lowcmd=cmd.value.toLowerCase();
			const instr=cmd.value.substring(0,cmd.value.indexOf(" ")).toLowerCase();
			const data=cmd.value.substring(cmd.value.indexOf(" ")+1);
			
			console.log("command="+instr+",data="+data)
			
			//COMMAND SHOULD BE START WITH "/"
			if(!lowcmd.startsWith("/")) {cmd.value="";console.log("nothing happened")}
			//DELETE COMMAND
			else if(lowcmd.startsWith("/del")) del(data);
			//SHOW ONLY SPECIFIED STAFFS PROCESS
			else if(lowcmd.startsWith("/only")) location.href="staff?only="+data;
			//GO BACK TO SEE ALL OF THE STAFF
			else if(lowcmd=="/all") location.href="staff";
			//ELSE COMMAND LIKE ADD, AUTH, TEST
			else cmdtrigger(instr,data);
		}
	});
	
// 	DELETE THE STAFF PROCESS
	function del(data){
		let code=prompt("Enter Admin code to confirm");
		if(code=="ADMIN") cmdtrigger("/del",data);
		else alert("wrong code");
	}
// ELSE COMMAND TRIGGER(ADD, AUTH, TEST)	
	function cmdtrigger(instr,data){
		$.ajax({
			type : "post",
			url : "/admin/staff"+instr+"?data="+data,
			data : {cmd:cmd.value},
			dataType : "text",
			success : function(){
				location.href="/admin/staff";
				console.log("success");
				//$("#info").load(" #info > *");
			},
			error : function(e){
				alert("CHK CMD");
			}
		});
	}
	
	
</script>
</body>
</html>