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
		<h4>Passenger on ${param.flt_no}/${param.flt_date}</h4>
		<input id="cmd" type="text" placeholder="command line" autofocus></input>
		<div id="info">
		
 		<table> 
			<tr><th>IDX</th><th>NAME</th><th>PSPT</th><th>BIRTH</th><th>NATIONALITY</th><th>AGE</th><th>RSV NO</th><th>SEAT</th><th>STATUS</th><th>SSR</th></tr>
			<c:forEach var="psgr" items="${psgr}" varStatus="status">
			
				<tr><td>${status.count}</td><td>${psgr.pax_name}</td><td>${psgr.pax_pspt}</td>
				<td>${psgr.pax_birth}</td><td>${psgr.pax_nationality}</td>
				<td>${psgr.pax_age}</td><td>${psgr.rsv_no}</td><td>${psgr.chkin_seat}</td>
				<td>${psgr.chkin_stat}</td><td>${psgr.chkin_ssr}</td></tr>
			</c:forEach>
		</table>


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
			//BACK TO FLIGHT LIST
			else if(lowcmd=="/flist"){location.href="/flight"}
			
			//ELSE COMMAND
			else {
				console.log("cmd trigger operated")
				//cmdtrigger(instr,data);
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