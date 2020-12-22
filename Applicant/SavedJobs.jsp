<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,jl.pojo.Job"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Saved Jobs</title>
<style>
.sdj{
	margin: 10px 200px 10px 240px;
}
.sdj caption{
	font-size: 25px;
	background-color: #32d7d7;
	padding: 5px;
	margin-left: 300px;
	margin-bottom: 12px;
	width: 200px;
	border-radius: 10px;
	
}
.sdj table{
	width: 80%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise); 
}
.sdj td,th{
    height: 30px;
	font-size: 16px;
	padding-left: 3px;
} 
.sdj th{
	background: darkturquoise;
}
.sdj tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
	    //background-color: white;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>

<div class="sdj">
<table align="center" width="60%">
<caption>Saved Jobs</caption>
<tr><th>Job Title</th><th>Organization</th></tr>
<%
ArrayList<Job> al=(ArrayList<Job>)request.getAttribute("savedjobs");
if(al.size()==0){
	out.print("<tr><td colspan='3'>You have not applied for any jobs</td></tr>");
}
else{
for(Job jb:al){
%>
<tr><td><a href="/JobLocator/AppJobDetails?jid=<%=jb.getId() %>"><%=jb.getJobtitle() %></a></td>
	<td>
	<%if(jb.getRname()!=null){ %>
	<%=jb.getRname() %>
	<%} %>
	</td>
</tr>
<%	
}
}
%>
</table>
</div>
</body>
</html>