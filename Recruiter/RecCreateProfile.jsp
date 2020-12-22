<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Locator || Create Profile</title>

<style>
.createProfile{
	margin-left: 230px;
	margin-top: 20px;
	margin-bottom: 20px;
	background: rgb(223,255,255,0.7);
	width: 60%;
	//box-sizing: border-box;
	box-shadow: 0 15px 20px 15px rgba(0,0,0,.5);
	border-radius: 10px;
	padding: 10px;
}
.createProfile td{
	height: 30px;
	font-size: 20px;
	//width: 200px;
	padding: 3px;
}
.createProfile input[type='text']{
	height: 28px;
	width: 500px;
	background-color: #e5fafa;
	border: none;
	outline: none;
	font-size: 18px;
	padding-left: 5px;	
}
input[type='submit'],
input[type='reset']{
	height: 60px;
	width: 300px;
	background-color: #00cdcd;
	border: none;
	border-radius: 10px;
	outline: none;
	font-size: 20px;
	font-weight: bold;
	padding: 15px;
}
.createProfile textarea{
	width: 500px;
	background-color: #e5fafa;
	border: none;
	outline: none;
	font-size: 18px;
	padding-left: 5px;
	
}
#recp{
	width: 100%;
}
#recd th{
	text-align: left;
}
#recd input[type='text']{
	height: 28px;
	width: 80px;
	background-color: #e5fafa;
	border: none;
	outline: none;
	font-size: 18px;
	padding-left: 5px;	
}
}
</style>
</head>
<body>
<%@include file="Link.jsp"%>
<div class="createProfile">
<form action="../RecCreateProfile" method="post">

<table align="center" id="recp">
<tr><td>Address of Head Office:</td>
	<td><textarea name="headoffice" rows="5" cols="20"></textarea></td></tr>
<tr><td>Contact No:</td>
	<td><input type="text" name="cno"></td></tr>
<tr><td>Branches:<br>(Enter multiple branches<br> separated by comma (,))</td>
	<td><input type="text" size="40" name="branch"></td></tr>
<tr><td>About Company:<br>(within 200 character)</td>
	<td><textarea name="description" rows="5" cols="20"></textarea></td></tr>
<tr><td colspan="2">Last 3 year's Recruitment Details:</td></tr>  
<tr><td colspan="2">
	<table align="center" id="recd">
		<tr><th>Year</th><th>No. of Recruitments</th></tr>
		<tr><td><input type="text" name="t1"></td><td><input type="text" name="t2"></td></tr>
		<tr><td><input type="text" name="t1"></td><td><input type="text" name="t2"></td></tr>
		<tr><td><input type="text" name="t1"></td><td><input type="text" name="t2"></td></tr>
		</table>
</tr>
<tr><td colspan="2" align="center">
	<input type="reset" value="Clear">
	<input type="submit" value="Create">
</td></tr>
</table>
</form>
</div>
</body>
</html>