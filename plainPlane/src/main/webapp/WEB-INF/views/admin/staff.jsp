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
<style>
	body{
		margin:auto;
		text-align: center;
		background-color: #F3F8FF;
	}
	div{
		margin:auto;
		background-color: white;
		width:500px;
	}
	table{
		margin:auto;
		padding:10px;
		padding-bottom: 30px;
	}
	th{
		//border:1px solid black; 
		width:100px;
	}
	tr:nth-child(2n){
		background-color: #C6CFFF;
	}
	#cmd{
		width: 100%;
	}
	p{
		font-size:80px; 
	}
</style>
</head>
<body>
	<% List<String> auth=new LinkedList<String>();
		auth.add("OJT");
		auth.add("GS");
		auth.add("GC");
		auth.add("DS");
		auth.add("SUPERVISOR");
		auth.add("ADMIN");
		pageContext.setAttribute("auth", auth);
	%>
	<div> 
		<p>PP</p>
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
	const authority=["OJT","GS","GC","DS","SUPERVISIOR","ADMIN"];
	
	input.addEventListener("keyup",function(event){
		if(event.keyCode===13){	//press Enter key
			if(input.value.startsWith("/")){
				const instr=cmd.value.substring(0,cmd.value.indexOf(" ")).toLowerCase();
				const data=cmd.value.substring(cmd.value.indexOf(" ")+1);
				if(instr=="/del"){
					del(instr,data);
				}
				else{cmdtrigger(instr,data);}
			}else {cmd.value="";console.log("nothing happened")}
		}
	});
	function del(instr,data){
		let code=prompt("Enter Admin code to confirm");
		if(code=="admin"){cmdtrigger(instr,data);}
		else{alert("wrong code");}
	}
	function cmdtrigger(instr,data){
		$.ajax({
			type : "post",
			url : "/admin/staff"+instr+"?data="+data,
			data : {cmd:cmd.value},
			dataType : "text",
			success : function(){
				console.log("success");
				window.location.href="/admin/staff";
			},
			error : function(e){
				alert("CHK CMD");
			}
		});
	}
	//present authority
	document.getElementsByClassName("auth").innerText="test";
	
	
</script>
</body>
</html>