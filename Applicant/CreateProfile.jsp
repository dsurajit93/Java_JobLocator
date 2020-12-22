<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Locator || Create Profile</title>
<script>
function addRow(){
	var table=document.getElementById("accDetails");
    var row=table.insertRow(table.rows.length);
    var cell=row.insertCell(0);
    var tt=document.createElement("input");
    tt.name="degree";
    cell.appendChild(tt);
    
    cell=row.insertCell(1);
    tt=document.createElement("input");
    tt.name="course";
    cell.appendChild(tt);
    
    cell=row.insertCell(2);
    tt=document.createElement("input");
    tt.name="ub";
    cell.appendChild(tt);
    
    cell=row.insertCell(3);
    tt=document.createElement("input");
    tt.name="marks";
    cell.appendChild(tt);
    
    cell=row.insertCell(4);
    tt=document.createElement("input");
    tt.name="pyr";
    cell.appendChild(tt);
    
}
</script>
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
.createProfile input[type='text'],
input[type='date']{
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
	width: 250px;
	background-color: #00cdcd;
	border: none;
	border-radius: 10px;
	outline: none;
	font-size: 20px;
	font-weight: bold;
	padding: 15px;
	margin-left: 60px;
}
.createProfile textarea{
	width: 500px;
	background-color: #e5fafa;
	border: none;
	outline: none;
	font-size: 18px;
	padding-left: 5px;
	
}
.btns{
margin-left: 50px;
}
#pd,#ad{
	display: block;
	text-align:center;
	font-size: 18px;
	font-weight: bold;
	text-decoration: underline;
}
#pdt{
	margin-left:100px;
}
#accDetails{
}
#accDetails input[type='text']{
	width: 130px;
}
</style>
</head>
<body>
<%@include file="Link.jsp"%>
<div class="createProfile">
<form action="../AppCreateProfile" method="post">
<label id="pd">:Personal Details:</label>
<table id="pdt">

<tr><td colspan="2"></td></tr>
<tr><td>Father's Name:</td>
	<td><input type="text" name="fname"></td></tr>
<tr><td>Date of Birth:</td>
	<td><input type="date" name="dob"></td></tr>
<tr><td>Address:</td>
	<td><textarea name="address" rows="5" cols="20"></textarea></td></tr>
<tr><td>Mobile: </td>
	<td><input type="text" name="mob"></td></tr>
<tr><td>Objective:<br>(with in 200 character)</td>
	<td><textarea name="objective" rows="5" cols="20"></textarea></td></tr>
<tr><td>Key Skill:<br>(Enter multiple skills<br> separated by comma (,))</td>
	<td><input type="text" size="40" name="skill"></td></tr>
<tr><td>You have: </td>
	<td>
	<input type="checkbox" name="diploma">Diploma 
	<input type="checkbox" name="bachelor">Bachelor's Degree
	<input type="checkbox" name="master">Master's Degree
	<input type="checkbox" name="phd">P.Hd
</td></tr>
</table>
<label id="ad"> :Academic Details:</label>
<table id="accDetails" align="center">
<tr><th>Degree</th><th>Course</th><th>University/Board</th><th>Marks</th><th>Passing Year</th></tr>
<tr><td><input type="text" name="degree"></td>
	<td><input type="text" name="course"></td>
	<td><input type="text" name="ub"></td>
	<td><input type="text" name="marks"></td>
	<td><input type="text" name="pyr"></td>
</table>
<div class="btns">
<input type="button" value="Add More" onclick="addRow();"><br><br><br>

<input type="reset" value="Clear">
<input type="submit" value="Create">
</div>
</form>
</div>
</body>
</html>