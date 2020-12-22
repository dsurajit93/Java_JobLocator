<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,jl.pojo.Feedback" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedbacks</title>
<style>
.feedback{
	margin: 30px 100px 30px 240px;
	background: rgb(0,190,190, 0.7); 
}
.feedback th{
	text-align:left;
}
.feedback caption{
	background-color: #00cdcd;
	padding: 10px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 12px;
	margin-left: 300px;
	margin-right: 300px;
}
.feedback table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise);
}
.feedback td,th{
    height: 20px;
	font-size: 18px;
	padding-left: 3px;
}
.feedback tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<div class="feedback">
<table align="center" width="90%">
<caption>Feedbacks</caption>
<tr><th>Name</th><th>Email</th><th>Contact No.</th><th>Feedback</th></tr>
<%
ArrayList<Feedback> al=(ArrayList<Feedback>)request.getAttribute("fd");
Feedback fd=new Feedback();
for(int i=0;i<al.size();i++){
	fd=al.get(i);
%>
<tr>
	<td><%=fd.getName() %></td>
	<td><%=fd.getEmail() %></td>
	<td><%=fd.getCno() %></td>
	<td><%=fd.getFeedback() %></td>
</tr>
<%} %>
</table>

</div>
</body>
</html>