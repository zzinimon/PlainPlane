<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin page - FLT List</title>
<!-- <link rel="stylesheet" type="text/css" href="/../css/AdminZone.css"> -->
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
		background-color:#E8D3FF;
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
		color:#C6CFFF;
		text-decoration:none;
		cursor: pointer;
	}
</style>
</head>
<body>
<!-- 	modal zone -->
	<div id="modalZone" style="z-index=0;position=fixed;">
		<span id="closeModal">&times;</span>
		<form role="form" action="addFlight" method="post"><table>
		<tr><td>content</td><td>	</td></tr>
		
			<tr><td>FLT NO.</td><td><input type="text" name="flt_no" placeholder="flight number" required><br>
			<tr><td>DATE</td><td><input type="date" name="flt_date" required><br>
			<tr><td>CRAFT</td><td><input type="text" name="craft_id" placeholder="craft id" required><br>
			<tr><td>BOUND</td><td><input type="text" name="flt_bound" placeholder="flight bound" required><br>
			<tr><td>STATUS</td><td><input type="text" name="flt_stat" placeholder="flight status" value="ARRIVED"><br>
			<tr><td>DEP</td><td><input type="text" name="flt_dpt" placeholder="departure" required><br>
			<tr><td>ARR</td><td><input type="text" name="flt_arr" placeholder="arrival" required><br>
			<tr><td>STA</td><td><input type="time" name="flt_sta"><br>
			<tr><td>STD</td><td><input type="time" name="flt_std"><br>
			<tr><td>AIRLINE</td><td><input type="text" name="flt_airline" list="airlines" required><br>
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
		</form></table>
	</div>
	<div>
		<p>PP</p> 
		<h4>Flight List</h4>
		<input id="cmd" type="text" placeholder="command line" autofocus></input>
		<div id="info">
		<table>
			<tr><th>NO</th><th>DATE</th><th>CRAFT</th><th>BOUND</th><th>STATUS</th><th>DPT</th><th>ARR</th><th>STA</th><th>STD</th><th>AIR LINE</th></tr>
			<c:forEach var="flt" items="${flt}">
				<tr><td>${flt.flt_no}</td><td>${flt.flt_date}</td><td>${flt.craft_id}</td><td>${flt.flt_bound}</td><td>${flt.flt_stat}</td><td>${flt.flt_dpt}</td><td>${flt.flt_arr}</td><td>${flt.flt_sta}</td><td>${flt.flt_std}</td><td>${flt.flt_airline}</td></tr>
			</c:forEach>
		</table>
		</div>
	</div>
	
	
	
	
	


<!-- script zone -->

<script>
	const input=document.getElementById("cmd");
	const modal=document.getElementById("modalZone")
	const liStatus=["SCHEDULED","CHKIN","BOARDING","LANDED","ARRIVED"];
	
	document.getElementById("closeModal").onclick=function(){
		modal.style.display="none";
	}
	//When the user clicks anywhere outside of the modal, close it
	window.onclick=function(event){
		if(event.target==modal){
			modal.style.display="none;"
		}
	}
	
	input.addEventListener("keyup",function(event){
		if(event.keyCode===13){	//press Enter key
			const lowcmd=input.value.toLowerCase();
			console.log("lowercase="+lowcmd);
			
			//ADD FLIGHT COMMAND
			if(lowcmd=="/add flt"){
				input.value="";
				modal.style.display="block";
			}
			
			//cmdtrigger(cmd,data)
		}
	});
			
	
</script>


</body>
</html>