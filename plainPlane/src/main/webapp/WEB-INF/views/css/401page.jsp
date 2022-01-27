<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Unauthorized Error Page</title>
<style>
	body{
		background-color: #E8D3FF;
	}
	div{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		width:600px;
		height:150px;
		text-align: center;
	}
	p{
		font-size: 50px;
		//color: #F3F8FF;
	}
</style>
</head>
<body>
	<div>
		<p>*****Unauthorized*****</p><br>
		<a href="javascript:history.back();">back</a>
	</div>
</body>
</html>