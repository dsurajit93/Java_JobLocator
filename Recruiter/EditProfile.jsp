<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.Recruiter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%
Recruiter rec=(Recruiter)request.getAttribute("rd");
%>
<div class="createProfile">
<form action="/JobLocator/RecUpdateProfile" method="post">

<table align="center" id="recp">
<tr><td>Address of Head Office:</td>
	<td><textarea name="headoffice" rows="5" cols="20"><%=rec.getHeadoffice() %></textarea></td></tr>
<tr><td>Contact No:</td>
	<td><input type="text" name="cno" value="<%=rec.getCno() %>"></td></tr>
<tr><td>Branches:<br>(Enter multiple branches<br> separated by comma (,))</td>
	<td><input type="text" size="40" name="branch" value="<%=rec.getBranches()%>"></td></tr>
<tr><td>About Company:<br>(within 200 character)</td>
	<td><textarea name="description" rows="5" cols="20"><%=rec.getDescription() %></textarea></td></tr>
<tr><td colspan="2">Last 3 year's Recruitment Details:</td></tr>
<tr><td colspan="2">
	<table align="center" id="recd">
		<tr><th>Year</th><th>No. of Recruitments</th></tr>
<%
String lastrecruit=rec.getLastrecruitment();
String[] s1=lastrecruit.split(";");
for(int i=0;i<s1.length;i++){
	String s2[]=s1[i].split(",");
%>

		<tr><td><input type="text" name="t1" value="<%=s2[0] %>"></td><td><input type="text" name="t2" value="<%=s2[1] %>"></td></tr>
<%
}
%>
		</table>
</tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="Update">
</td></tr>
</table>
</form>
</div>
</body>
</html>