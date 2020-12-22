<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.Applicant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Personal Details</title>
</head>
<style>
.pd{
	margin: 10px 100px 10px 240px;
}
</style>
<body>
<%@include file="Link.jsp" %>
<%
Applicant app=(Applicant)request.getAttribute("apd");
%>
<div class="pd">
<form action="/JobLocator/AppUpdatePersonalDetails">
<table align="center">
<tr><td>Name</td>
	<td><input type="text" name="name" value="<%=app.getName() %>"></td></tr>
<tr><td>Father's Name</td>
	<td><input type="text" name="fname" value="<%=app.getFname() %>"></td></tr>
<tr><td>Date of Birth:</td>
	<td><input type="date" name="dob" value="<%=app.getDob() %>"></td></tr>
<tr><td>Address:</td>
	<td><textarea rows="5" cols="20" name="address"><%=app.getAddress()%></textarea></td></tr>
<tr><td>Mobile:</td>
	<td><input type="text" name="mob" value="<%=app.getMob() %>"></td></tr>
<tr><td>Email:</td>
	<td><input type="text" name="email" value="<%=app.getEmail() %>"></td></tr>
<tr><td>Objective:</td>
	<td><textarea rows="5" cols="40" name="objective"><%=app.getObjective()%></textarea></td></tr>
<tr><td>Key Skill:</td>
	<td><input type="text" name="skill" size="40" value="<%=app.getSkill() %>"></td></tr>
<tr><td colspan="2" align="right">
	<input type="submit" value="Update">
</td></tr>
</table>
</form>
</div>
</body>
</html>