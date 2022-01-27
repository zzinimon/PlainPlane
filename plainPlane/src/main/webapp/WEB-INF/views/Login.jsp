<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome to Plain Plane Main page</title>
<style>
	body{
		background-image: url("img/sky.jpg");
		background-repeat: no-repeat;
		background-size: cover;
	}
	div{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		background-color: #F3F8FF;
		width:300px;
		height:150px;
	}
	table{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		text-align: center;
	}
	td{height: 30px;}
</style>
</head>
<body>
<div id="login">
	<form method="post" action="login">
		<table>
		<tr><td>ID</td><td><input autofocus type="text" name="gs_id"></td></tr>
		<tr><td>PW</td><td><input type="password" name="gs_pw"></td></tr>
		<tr><td colspan="2"><input type="submit" value="login"></td></tr>
		</table>
	</form>
</div>
</body>
</html>