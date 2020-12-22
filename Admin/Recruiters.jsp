<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,jl.pojo.Recruiter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recruiters</title>
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
.recs{
	margin: 10px 100px 10px 240px;
}
.recs th{
	text-align:left;
}
.recs caption{
	background-color: #00cdcd;
	padding: 10px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 12px;
	margin-left: 300px;
	margin-right: 300px;
}
.recs table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise);
}
.recs td,th{
    height: 20px;
	font-size: 18px;
	padding-left: 3px;
}
.recs tr:nth-child(even){
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
<div class="recs">
<table width="80%" align="center">
<caption>Recruiters</caption>
<tr><th>Name</th><th>Head Office</th><th>Mobile</th><th>Email</th><th></th></tr>
<%
ArrayList<Recruiter> al=(ArrayList<Recruiter>)request.getAttribute("recruiterlist");
for(Recruiter rec:al){
%>
<tr><td><a href="/JobLocator/RecruiterDetails?rid=<%=rec.getId() %>"><%=rec.getName() %></a></td>
	<td><%=rec.getHeadoffice() %></td>
	<td><%=rec.getCno() %></td>
	<td><%=rec.getEmail() %></td>
	<td>
		<a href="/JobLocator/AdminDeleteRecruiter?rid=<%=rec.getId() %>" onclick="return ConfirmDelete();">Remove</a>
	</td>
</tr>
<%
}
%>
</table>
</div>
</body>
</html>