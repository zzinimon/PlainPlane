<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CHKIN</title>
<link rel="stylesheet" type="text/css" href="/../css/AdminZone.css">
<style>


</style>
</head>
<body>


<div>
		<p>PP</p> 
		<h4>Passenger List</h4>
		<input id="cmd" type="text" placeholder="command line" autofocus></input>
		<div id="info">
		<h1>FLIGHT:${param.flt_no} DATE:${param.flt_date}</h1>
		
<!-- 		<table> 
			<tr><th>IDX</th><th>FLT</th><th>DATE</th><th>CRAFT</th><th>BOUND</th><th>STATUS</th><th>DPT</th><th>ARR</th><th>STA</th><th>STD</th><th>AIR LINE</th></tr>
			<c:forEach var="flt" items="${flt}" varStatus="status">
			
				<tr><td>${status.index+1}</td><td>${flt.flt_no}</td><td>${flt.flt_date}</td>
				<td>${flt.craft_id}</td><td>${bound[flt.flt_bound]}</td>
				<td>${stat[flt.flt_stat]}</td><td>${flt.flt_dpt}</td><td>${flt.flt_arr}</td>
				<td>${fn:substring(flt.flt_sta,0,5)}</td><td>${fn:substring(flt.flt_std,0,5)}</td><td>${flt.flt_airline}</td></tr>
			</c:forEach>
		</table>
-->

		</div>
	</div>
	
<!-- 	SCRIPT ZONE -->
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
			else {
				cmdtrigger(instr,data);
				
			}
		}
	});
	
	// COMMAND TRIGGER
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