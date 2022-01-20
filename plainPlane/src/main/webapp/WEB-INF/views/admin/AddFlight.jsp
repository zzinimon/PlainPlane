<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<form role="form" action="addFlight" method="post">
					<input type="text" name="flt_no" placeholder="flight number" required><br>
					<input type="date" name="flt_date" required><br>
					<input type="text" name="craft_id" placeholder="craft id" required><br>
					<input type="text" name="flt_bound" placeholder="flight bound" required><br>
					<input type="text" name="flt_stat" placeholder="flight status" value="ARRIVED"><br>
					<input type="text" name="flt_dpt" placeholder="departure" required><br>
					<input type="text" name="flt_arr" placeholder="arrival" required><br>
					<input type="time" name="flt_sta"><br>
					<input type="time" name="flt_std"><br>
					<input type="text" name="flt_airline" list="airlines" required><br>
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
</form>




</body>
</html>