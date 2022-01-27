<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Flight List</title>
<link rel="stylesheet" type="text/css" href="/../css/AdminZone.css">
<style>
	body{
		position:fixed;
	}
	#info{overflow: scroll;}
	.modal{
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
	.closeModal{
		float:right;
		font-size:30px;
		font-weight: bold;
	}
	.closeModal:hover,#closeModal:focus{
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
<!-- header -->
<%@ include file="../css/Header.jsp" %>
<!-- 	MODAL ZONE -->
	<!-- 	ADD FLT MODAL -->
	<div class="modal" id="addModal" style="z-index=0;position=fixed;">
		<span class="closeModal" id="closeAdd" >&times;</span>
		<h1>NEW FLT INFO</h1>
		<form role="form" action="flight/add" method="post" id="flightForm"><table> 
			<tr><td>FLT NO.</td><td><input id="addFltNo" type="text" name="flt_no" readonly></td></tr>
			<tr><td>DATE</td><td><input id="addFltDate" type="date" name="flt_date" readonly></td></tr>
			<tr><td>CRAFT</td><td><input id="addCraft" type="text" name="craft_id" list="crafts" required>
				<datalist id="crafts">
					<option value="TEST">
					<option value="A320">
					<option value="B737">
					<option value="B738">
					<option value="B747">
					<option value="B787">
				</datalist>
			</td></tr>
			<tr><td>BOUND</td><td><input type="radio" name="flt_bound" value="1" required>INT<input type="radio" name="flt_bound" value="0" required>DOM</td></tr>
			<tr><td>DEP</td><td><input type="text" name="flt_dpt" required></td></tr>
			<tr><td>ARR</td><td><input type="text" name="flt_arr" required></td></tr>
			<tr><td>STA</td><td><input type="time" name="flt_sta" required></td></tr>
			<tr><td>STD</td><td><input type="time" name="flt_std" required></td></tr>
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
	
	<!-- 	MODIFY FLT MODAL -->
	<div class="modal" id="modModal" style="z-index=0;position=fixed;">
		<span class="closeModal" id="closeMod">&times;</span>
		<h1>MODIFY FLT</h1>
		<form role="form" action="flight/modify" method="post" id="flightForm"><table> 
			<tr><td>FLT NO.</td><td><input id="modFltNo" type="text" name="flt_no" readonly></td></tr>
			<tr><td>DATE</td><td><input id="modFltDate" type="date" name="flt_date" readonly></td></tr>
			<tr><td>CRAFT</td><td><input id="modCraft" type="text" name="craft_id" list="crafts" required>
				<datalist id="crafts">
					<option value="TEST">
					<option value="A320">
					<option value="B737">
					<option value="B738">
					<option value="B747">
					<option value="B787">
				</datalist>
			</td></tr>
			<tr><td>BOUND</td><td><input id="modBoundINT" type="radio" name="flt_bound" value="1" required>INT<input id="modBoundDOM" type="radio" name="flt_bound" value="0" required>DOM</td></tr>
			<tr><td>STATUS</td><td id="modStat"></td></tr>
			<tr><td>DEP</td><td><input id="modDep" type="text" name="flt_dpt" required></td></tr>
			<tr><td>ARR</td><td><input id="modArr" type="text" name="flt_arr" required></td></tr>
			<tr><td>STA</td><td><input id="modSta" type="time" name="flt_sta" required></td></tr>
			<tr><td>STD</td><td><input id="modStd" type="time" name="flt_std" required></td></tr>
			<tr><td>AIRLINE</td><td><input id="modAl" type="text" name="flt_airline" list="airlines" required>
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
		<input type="submit" value="MODIFY"></form>
	</div>
	
	
	
	
<!-- 	MAIN ZONE	 -->
<%	List<String> stat=new LinkedList<String>();
		stat.add("SCHEDULED");
		stat.add("CHKIN");
		stat.add("BOARDING");
		stat.add("LANDED");
		stat.add("ARRIVED");
		stat.add("DELAY");
		stat.add("<em>CANCELED</em>");
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
			<tr><th>IDX</th><th>FLT</th><th>DATE</th><th>CRAFT</th><th>BOUND</th><th>STATUS</th><th>DPT</th><th>ARR</th><th>STA</th><th>STD</th><th>AIR LINE</th></tr>
			<c:forEach var="flt" items="${flt}" varStatus="status">
			
				<tr><td>${status.count}</td><td id="${status.count}no" >${flt.flt_no}</td><td id='${status.count}date'>${flt.flt_date}</td>
				<td id="${status.count}craft">${flt.craft_id}</td><td id="${status.count}bound">${bound[flt.flt_bound]}</td>
				<td id="${status.count}stat">${stat[flt.flt_stat]}</td><td id="${status.count}dep">${flt.flt_dpt}</td><td id="${status.count}arr">${flt.flt_arr}</td>
				<td id="${status.count}sta">${fn:substring(flt.flt_sta,0,5)}</td><td id="${status.count}std">${fn:substring(flt.flt_std,0,5)}</td><td id="${status.count}al">${flt.flt_airline}</td></tr>
			</c:forEach>
		</table>
		</div>
	</div>
	
	
	
	
	


<!-- SCRIPT ZONE -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
// DEFAULT SETTING
	const input=document.getElementById("cmd");
	const addModal=document.getElementById("addModal")
	const modModal=document.getElementById("modModal")
	addModal.style.display="none"
	modModal.style.display="none"
	
	document.getElementById("closeAdd").onclick=function(){
		addModal.style.display="none";
	}
	document.getElementById("closeMod").onclick=function(){
		modModal.style.display="none";
	}
/*	
	//When the user clicks anywhere outside of the modal, close it
	window.onclick=function(event){
		if(event.target==modal){
			modal.style.display="none;"
		}
	}
*/	
	
//COMMAND LINE EVENT LISTENER
	input.addEventListener("keyup",function (event){
		if(event.keyCode===13&&addModal.style.display=="none"&&modModal.style.display=="none"){	//press Enter key && while modal is displayed, cannot use cmdline
			const lowcmd=input.value.toLowerCase();
			const cmd=input.value.split(' ');
			
			//COMMAND SHOULD BE START WITH "/"
			if(!lowcmd.startsWith("/")){cmd.value="";console.log("nothing happened")}
			//ADD FLIGHT COMMAND
			else if(lowcmd.startsWith("/add")) fltChecker(cmd);
			
			//SHOW ONLY SPECIFIED FLT
			else if(lowcmd.startsWith("/show")) fltChecker(cmd);
			else if(lowcmd.startsWith("/only")) location.href="/flight?only="+cmd[1]+"&condition="+cmd[2];
			//GO BACK TO SEE ALL OF THE FLT
			else if(lowcmd=="/all") location.href="flight";
			
			//SELECT(GO TO PSGR PAGE) FLT
			else if(lowcmd.startsWith("/sel")) fltSelecter(cmd);
			//MODIFY FLT
			else if(lowcmd.startsWith("/mod")) fltMod(cmd);
			//DELETE FLT
			else if(lowcmd.startsWith("/del")) fltDel(cmd);
			//ELSE COMMAND
			else{
				console.log("your input:"+lowcmd)
				console.log("INVALID COMMAND")
				//cmdTrigger(cmd)
				input.value="";
			}
		}
	});
	
	//DELETE COMMAND TRIGGERE
	function fltDel(cmd){
		if(cmd.length!=2) alert("CHK CMD");	//ONLY ONE PARAMETER REQUIRED
		else if(isNaN(cmd[1])) alert("INPUT IDX NO")	//PARAMETER SHOULD BE A NUMBER
		else if(cmd[1]>${fn:length(flt)} || cmd[1]<1) alert("OUT OF RANGE")	//THE NUMBER SHOULD BE IN THE LIST
		else{
			let code=prompt("***DELETE WARNING*** \n"+document.getElementById(cmd[1]+"no").innerText+"/"+document.getElementById(cmd[1]+"date").innerText+"\nEnter Admin code to confirm");
			if(code=="ADMIN") cmdTrigger(cmd)
			else alert("wrong code");
		}
		
	}
	
	//MODIFY COMMAND TRIGGER
	function fltMod(cmd){
		if(cmd.length!=2) alert("CHK CMD");	//ONLY ONE PARAMETER REQUIRED
		else if(isNaN(cmd[1])) alert("INPUT IDX NO")	//PARAMETER SHOULD BE A NUMBER
		else if(cmd[1]>${fn:length(flt)} || cmd[1]<1) alert("OUT OF RANGE")	//THE NUMBER SHOULD BE IN THE LIST
		else {
			modModal.style.display="block";
			
			modFltNo.value=document.getElementById(cmd[1]+"no").innerText;
			modFltDate.value=document.getElementById(cmd[1]+"date").innerText;
			modCraft.value=document.getElementById(cmd[1]+"craft").innerText;
			document.getElementById("modBound"+document.getElementById(cmd[1]+"bound").innerText).checked=true;
			modStat.innerText=document.getElementById(cmd[1]+"stat").innerText;
			modDep.value=document.getElementById(cmd[1]+"dep").innerText;
			modArr.value=document.getElementById(cmd[1]+"arr").innerText;
			modSta.value=document.getElementById(cmd[1]+"sta").innerText;
			modStd.value=document.getElementById(cmd[1]+"std").innerText;
			modAl.value=document.getElementById(cmd[1]+"al").innerText;
			
			modCraft.focus();
		}
		
	}
	
	
	//SELECT,ADD COMMAND TRIGGER
	function fltChecker(cmd){
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
						addFltNo.value=cmd[1].toUpperCase();
						addFltDate.value=cmd[2].substring(0,4)+"-"+cmd[2].substring(4,6)+"-"+cmd[2].substring(6,8);
						addModal.style.display="block";
						addCraft.focus();
					}
				},
				error : function(data){
					alert("[ajax]error");
				}
			});
		}
	}
	
	
	function fltSelecter(cmd){
		if(parseInt(cmd[1])<parseInt(1) || parseInt(cmd[1])>${fn:length(flt)})	alert("ERROR : OUT OF RANGE");
		else if(cmd.length!=2) alert("CMD CHK");
		else{
			var selNo=document.getElementById(cmd[1]+"no").innerText;
			var selDate=document.getElementById(cmd[1]+"date").innerText;
			location.href="/chkin?flt_no="+selNo+"&flt_date="+selDate;
		}
	}
	
	// COMMAND TRIGGER
	function cmdTrigger(cmd){
		$.ajax({
			type : "post",
			url : "/flight"+cmd[0].toLowerCase(),
			data : {"targetNo":document.getElementById(cmd[1]+"no").innerText,
					"targetDate":document.getElementById(cmd[1]+"date").innerText},
			dataType : "text",
			success : function(){
				location.href="/flight";
				console.log("success");
			},
			error : function(e){
				alert("ERROR OCCURED");
			}
		});
	}
			
	
</script>


</body>
</html>