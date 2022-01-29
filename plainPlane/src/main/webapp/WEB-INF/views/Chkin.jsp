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
	.uidInfo{
		display: none;
	}

</style>
</head>
<body>
<%@ include file="css/Header.jsp" %>
<div>
	<h4>Passenger on ${param.flt_no}/${param.flt_date}</h4>
	<div id="info">
	
		<table> 
		<tr><th>IDX</th><th>STATUS</th><th>NAME</th><th>PSPT</th><th>BIRTH</th><th>NATIONALITY</th><th>AGE</th><th>RSV NO</th><th>SEAT</th><th>SSR</th></tr>
		<c:forEach var="psgr" items="${psgr}" varStatus="status">
		
			<tr><td>${status.count}</td><td>${psgr.chkin_stat}</td>
			<td>${psgr.pax_name}</td><td>${psgr.pax_pspt}</td>
			<td>${psgr.pax_birth}</td><td>${psgr.pax_nationality}</td>
			<td>${psgr.pax_age}</td><td>${psgr.rsv_no}</td><td>${psgr.chkin_seat}</td>
			<td>${psgr.chkin_ssr}</td></tr>
			<p class="uidInfo" id="${status.count}thPax">${psgr.pax_uid}</p>
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
			const cmdArr=cmd.value.split(' ');
			console.log("command="+instr+",data="+data)
			
			//COMMAND SHOULD BE START WITH "/"
			if(!lowcmd.startsWith("/")) {cmd.value="";console.log("nothing happened")}
			//BACK TO FLIGHT LIST
			else if(lowcmd=="/flist"){location.href="/flight"}
			
			//SEARCH PSGR
			else if(lowcmd.startsWith("/find")){location.href="/chkin?flt_no="+"${param.flt_no}"+"&flt_date="+"${param.flt_date}"+"&search="+data;}
			else if(lowcmd=="/all"){location.href="/chkin?flt_no="+"${param.flt_no}"+"&flt_date="+"${param.flt_date}";}
			
			//TO PSGR DETAIL PAGE
			else if(lowcmd.startsWith("/sel")){
				if(parseInt(cmdArr[1])<parseInt(1) || parseInt(cmdArr[1])>${fn:length(psgr)})	alert("ERROR : OUT OF RANGE");
				else if(cmdArr.length!=2) alert("CMD CHK");
				else{
					var uid=document.getElementById(cmd[1]+"thPax")
					location.href="/pax?uid="+uid;
				}
			}
			//ELSE COMMAND
			else {
				console.log("cmd trigger operated")
				cmdtrigger(instr,data);
			}
		}
	});
	
	// COMMAND TRIGGER
	function cmdtrigger(instr,data){
		$.ajax({
			type : "post",
			url : "/chkin"+instr,
			data : {"data":data},
			dataType : "text",
			success : function(){
				//location.href="/admin/staff";
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