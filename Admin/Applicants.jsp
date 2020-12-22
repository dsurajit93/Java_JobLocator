<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,jl.pojo.Applicant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applicants</title>
<script>
function ConfirmDelete()
{
  var x = confirm("Are you sure you want to delete?");
  if (x)
      return true;
  else
    return false;
}
</script>
<style>
.apps{
	margin: 10px 100px 10px 240px;
}
.apps caption{
	background-color: #00cdcd;
	padding: 10px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 12px;
	margin-left: 300px;
	margin-right: 300px;
}
.apps th{
	text-align:left;
}
.apps table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise);
}
.apps th{
	text-align: left;
}
.apps td,th{
    height: 20px;
	font-size: 18px;
	padding-left: 3px;
}
.apps tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
if(request.getAttribute("msg")!=null)
	out.print("<script>alert('"+request.getAttribute("msg")+"')</script>");
%>
<div class="apps">
<table width="70%" align="center">
<caption>Applicants</caption>
<tr><th>Name</th><th>Address</th><th>Mobile</th><th>Email</th><th></th></tr>
<%
ArrayList<Applicant> al=(ArrayList<Applicant>)request.getAttribute("applicantlist");
for(Applicant app:al){
%>
<tr><td><a href="/JobLocator/ApplicantDetails?aid=<%=app.getId() %>"><%=app.getName() %></a></td>
	<td><%=app.getAddress() %></td>
	<td><%=app.getMob() %></td>
	<td><%=app.getEmail() %></td>
	<td>
		<a href="/JobLocator/AdminDeleteApplicant?appid=<%=app.getId() %>" onclick="return ConfirmDelete();">Remove</a>
	</td>
</tr>
<%
}
%>
</table>
</div>
</body>
</html>