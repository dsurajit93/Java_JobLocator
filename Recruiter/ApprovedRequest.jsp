<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,jl.pojo.Applicant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approved Candidates</title>
<style>
.ar{
	margin: 10px 100px 10px 230px;
}
.ar th{
	text-align: left;
}
.ar caption{
	background-color: #00cdcd;
	padding: 10px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 12px;
	margin-left: 300px;
	margin-right: 300px;
}
.ar th{
	text-align: left;
}
.ar table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise); 
}
.ar td,th{
    height: 20px;
	font-size: 18px;
	padding-left: 3px;
}
.ar tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>

<div class="ar">
<table align="center" width="60%">
<caption>Approved Candidates</caption>
<tr><th>Name</th><th>Mobile</th><th>Email</th></tr>
<%
ArrayList<Applicant> al=(ArrayList<Applicant>)request.getAttribute("approvedlist");
if(al.size()==0){
	out.print("<tr><td colspan='3'> No information found</td></tr>");
}
else{
for(Applicant app: al){
%>
<tr><td><a href="/JobLocator/ApplicantDetails?aid=<%=app.getId() %>"><%=app.getName() %></a></td>
	<td><%=app.getMob() %></td>
	<td><%=app.getEmail() %></td>
</tr>
<%
	}
}
%>
</table>
</div>
</body>
</html>