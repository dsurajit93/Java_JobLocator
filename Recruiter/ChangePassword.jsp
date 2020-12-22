<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.changepass{
	margin: 20px 100px 20px 240px;
	background:rgb(225,225,210, .8);
	padding: 30px 0px;
}
.changepass caption{
	font-size: 20px;
	text-decoration: underline;
	font-weight: bold;
}
.changepass input[type='submit']{
	padding: 8px;
	font-size: 15px;
	font-weight: bold;
	background:rgb(225,225,210, .8);
}
</style>
<script>
function checkPass(){
    var a=document.getElementsByName("newpassword")[0].value;
    var b=document.getElementsByName("cnewpassword")[0].value;
    if(a!=b){
        alert("Passward and Repassword doesnot match");
        return false;
    }
}
</script>
</head>
<body>
<%@include file="Link.jsp"%>
<div class="changepass">
<form action="/JobLocator/RecChangePassword" method="post">
<table align="center">
<caption>Change Your Password</caption>
<tr><td>
<%
if(session.getAttribute("msg")!=null){
	out.print("<script>alert('"+session.getAttribute("msg")+"')</script>");
	session.setAttribute("msg", null);
}
%>
</td></tr>
<tr><td>Current Password</td>
	<td><input type="password" name="password" required></td></tr>
<tr><td>New Password</td>
	<td><input type="password" name="newpassword" required></td></tr>
<tr><td>Confirm New Password</td>
	<td><input type="password" name="cnewpassword" required onblur="return checkPass();"></td></tr>
<tr><td colspan="2" align="right">
	<input type="submit" value="Change"></td></tr>
</table>
</form>
</div>
</body>
</html>