<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin page - FLT List</title>
<link rel="stylesheet" type="text/css" href="/../css/AdminZone.css">
<style>
	body{
		position:fixed;
	}
	#info{overflow-x: scroll;}
	#modalZone{
		display:none;
		position: fixed;
		z-index: 0;
		margin:50px;
		width:400px;
		//height:500px;
		overflow: auto;
		background-color:#C6CFFF;
		vertical-align: middle;
	}
	form{
		padding:30px;
	}
	#closeModal{
		float:right;
		font-size:30px;
		font-weight: bold;
	}
	#closeModal:hover,#closeModal:focus{
		color:#E8D3FF;
		text-decoration:none;
		cursor: pointer;
	}
	input[type=date],input[type=time],input[type=text]{width:150px;}
/*	
	#pkConst{
		color:red;
		animation: blink 1s step-end infinite;
	}
	@keyframes blink{
		50%{opacity:0;}
	}
*/
</style>
</head>
<body>
<!-- 	MODAL ZONE -->
	<div id="modalZone" style="z-index=0;position=fixed;">
		<span id="closeModal">&times;</span>
		<h1>FLT INFO</h1>
		<form role="form" action="flight/add" method="post" id="flightForm"><table> 
			<tr><td>FLT NO.</td><td><input type="text" name="flt_no" id="flt_no" required></td></tr>
			<tr><td>DATE</td><td><input type="date" name="flt_date" required></td></tr>
			<tr><td>CRAFT</td><td><input type="text" name="craft_id" list="crafts" required>
				<datalist id="crafts">
					<option value="TEST">
					<option value="A320">
					<option value="B737">
					<option value="B738">
					<option value="B747">
					<option value="B787">
				</datalist>
			</td></tr>
<!-- 			<tr><td colspan="2" id="pkConst">***FLT Already Exist***</td></tr> -->
			<tr><td>BOUND</td><td><input type="radio" name="flt_bound" value="0" required>INT<input type="radio" name="flt_bound" value="1" required>DOM</td></tr>
			<tr><td>DEP</td><td><input type="text" name="flt_dpt" required></td></tr>
			<tr><td>ARR</td><td><input type="text" name="flt_arr" required></td></tr>
			<tr><td>STA</td><td><input type="time" name="flt_sta"></td></tr>
			<tr><td>STD</td><td><input type="time" name="flt_std"></td></tr>
			<tr><td>AIRLINE</td><td><input type="text" name="flt_airline" list="airlines" required>
				<datalist id="airlines">
					<option value="TEST">
					<option value="AAR">
					<option value="VNL">
					<option value="KAL">
					<option value="JAL">
					<option value="ANA">
					<option value="CHH">
					<option value="UAL">
					<option value="THA">
				</datalist>
			</td></tr>
		</table>
		<input type="submit" value="CONFIRM"></form>
	</div>
	
	
	
<!-- 	MAIN ZONE	 -->
<%	List<String> stat=new LinkedList<String>();
		stat.add("SCHEDULED");
		stat.add("CHKIN");
		stat.add("BOARDING");
		stat.add("LANDED");
stat.add("ARRIVED");
	pageContext.setAttribute("stat", stat);
	List<String> bound=new LinkedList<String>();
	bound.add("DOM");
	bound.add("INT");
	pageContext.setAttribute("bound", bound);
%>
	<div>
		<p>PP</p> 
		<h4>Flight List</h4>
		<input id="cmd" type="text" placeholder="command line" autofocus></input>
		<div id="info">
		<table>
			<tr><th>FLT</th><th>DATE</th><th>CRAFT</th><th>BOUND</th><th>STATUS</th><th>DPT</th><th>ARR</th><th>STA</th><th>STD</th><th>AIR LINE</th></tr>
			<c:forEach var="flt" items="${flt}">
				<tr><td>${flt.flt_no}</td><td>${flt.flt_date}</td>
				<td>${flt.craft_id}</td><td>${bound[flt.flt_bound]}</td>
				<td>${stat[flt.flt_stat]}</td><td>${flt.flt_dpt}</td><td>${flt.flt_arr}</td>
				<td>${fn:substring(flt.flt_sta,0,5)}</td><td>${fn:substring(flt.flt_std,0,5)}</td><td>${flt.flt_airline}</td></tr>
			</c:forEach>
		</table>
		</div>
	</div>
	
	
	
	
	


<!-- SCRIPT ZONE -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	function test(){
		console.log(sta.value);
	}

	const input=document.getElementById("cmd");
	const modal=document.getElementById("modalZone")
	modal.style.display="none";
	
	document.getElementById("closeModal").onclick=function(){
		modal.style.display="none";
	}
	//When the user clicks anywhere outside of the modal, close it
	window.onclick=function(event){
		if(event.target==modal){
			modal.style.display="none;"
		}
	}
	
	
//COMMAND LINE EVENT LISTENER
	input.addEventListener("keyup",function (event){
		if(event.keyCode===13&&modal.style.display=="none"){	//press Enter key && while modal is displayed, cannot use cmdline
			const lowcmd=input.value.toLowerCase();
			const cmd=input.value.split(' ');
			
			//COMMAND SHOULD BE START WITH "/"
			if(!lowcmd.startsWith("/")){cmd.value="";console.log("nothing happened")}
			//ADD FLIGHT COMMAND
			else if(lowcmd.startsWith("/add")) fltSelecter(cmd);
			//SHOW ONLY SPECIFIED FLT
			else if(lowcmd.startsWith("/only")) location.href="/flight?only="+cmd[1]+"&condition="+cmd[2];
			else if(lowcmd.startsWith("/show")) fltSelecter(cmd);
			//GO BACK TO SEE ALL OF THE FLT
			else if(lowcmd=="/all") location.href="flight";
			//TEST COMMAND
			else{
				console.log("your input:"+lowcmd)
				console.log("cmd trigger is operated")
				//cmdTrigger(cmd)
				input.value="";
			}
		}
	});
	
	//SELECT FLT COMMAND TRIGGER
	function selecter(cmd,url){
		if(cmd.length!=3) alert("CHK CMD")
		else{
			
			/*
			$.ajax({
				type : "get",
				url : url,
				data : {cmd:cmd.value},
				dataType : "text",
				success : function(){
					location.href=url;
				},
				error : function(e){
					alert("CHK CMD");
				}
			});
			
			*/
		}
	}
	
	//ADD COMMAND TRIGGER
	function fltSelecter(cmd){
		console.log(cmd)
		if(cmd.length!=3) alert("CHK CMD");
		else if(cmd[2].length!=8) alert("DATE FORM ERROR");
		else{
			$.ajax({
				type : "post",
				url : "/flight/chkflt",
				data : {no:cmd[1],date:cmd[2]},
				dataType : "text",
				success : function(data){	//TRUE=ALREADY EXIST, FALSE=SHOULD BE ADDED
					if(data=="true") {
						if(cmd[0].toLowerCase()=="/add") alert("ALREADY EXISTS")
						location.href="/flight?no="+cmd[1]+"&date="+cmd[2];
					}else if(data=="false"){//SHOULD ADD IT
						if(cmd[0].toLowerCase()=="/show") {
							let quest=confirm("NO SUCH FLIGHT, DO YOU WANT TO ADD IT?")
							if(quest==false) return null;
						}
						modal.style.display="block";flt_no.focus();
						
					}
				},
				error : function(data){
					alert("[ajax]error");
				}
			});
		}
	}
	
	// COMMAND TRIGGER
	function cmdTrigger(cmd){
		$.ajax({
			type : "post",
			url : "/flight"+cmd[0],
			data : {cmd:cmd.value},
			dataType : "text",
			success : function(){
				location.href="/flight";
				console.log("success");
			},
			error : function(e){
				alert("CHK CMD");
			}
		});
	}
			
	
</script>


</body>
</html>