<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.Recruiter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JL</title>
<style>
.rp{
	margin-left: 250px;
	margin-top:15px;
	margin-right: 100px;
}
.rp td,th{
    background:linear-gradient(to bottom right, darkturquoise, paleturquoise);    
    height: 30px;
	font-size: 20px;
    border: 1px solid grey;
}
.rp th{
	text-align:left;
	width: 220px;
	padding-left: 3px;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
Recruiter rct=(Recruiter)request.getAttribute("recdetails");
%>
<div class="rp">
<table>
<tr><th>Company Name:</td>
	<td><%=rct.getName() %></td></tr>
<tr><th>Head Office:</td>
	<td><%=rct.getHeadoffice() %></td></tr>
<tr><th>Branches:</td>
	<td><%=rct.getBranches() %></td></tr>
<tr><th>Contact No:</td>
	<td><%=rct.getCno() %></td></tr>
<tr><th>Email: </td>
	<td><%=rct.getEmail() %></td></tr>
<tr><th colspan="2">Last Recruitmant Details:</td></tr>
<tr><td colspan="2">
	<table align="center" width="40%">
	<tr><th>Year</th><th>Total Recruitment</th></tr>
	<%
	String lastrecruitment=rct.getLastrecruitment();
	String[] s1=lastrecruitment.split(";");
	for(int i=0;i<s1.length;i++){
		String[] s2=s1[i].split(",");
		out.println("<tr>");
		for(int j=0;j<s2.length;j++){
			out.print("<td>"+s2[j]+"</td>");
		}
		out.print("</tr>");
	}
	%>
	</table>
</td></tr>
<tr><td>About Company:</td>
	<td><%=rct.getDescription() %>
</table>
</div>
</body>
</html>