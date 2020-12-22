<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,jl.pojo.Applicant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.pr{
	margin: 10px 100px 10px 240px;
}
.pr caption{
	background-color: #00cdcd;
	padding: 10px;
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 12px;
	margin-left: 300px;
	margin-right: 300px;
}
.pr th{
	text-align: left;
}
.pr table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise); 
}
.pr td,th{
    height: 20px;
	font-size: 18px;
	padding-left: 3px;
}
.pr tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
.pr input[type='submit']{
	background-color: #00cdcd;
	border-radius: 10px;
	outline: none;
	font-size: 18px;
	font-weight: bold;
	padding: 5px;
}

</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
int jid=(int)request.getAttribute("jid");
%>
<div class="pr">
<form action="/JobLocator/RecRequestApprove" method="post">
<input type="hidden" value="<%=jid %>" name="jid" />
<table align="center" width="90%">
<caption>Pending Requests</caption>
<tr><th>Applicant Name</th><th>Address</th><th>Key Skill</th><th>Qualification</th><th>Select?</th></tr>
<%
ArrayList<Applicant> al=(ArrayList<Applicant>)request.getAttribute("pendinglist");

if(al.size()==0)
	out.println("<tr><td colspan='5'>No Pending Request</th></tr>");
else{
	for(Applicant app:al){
%>

<tr><td><a href="/JobLocator/ApplicantDetails?aid=<%=app.getId() %>"><%=app.getName() %></a></td>
	<td><%=app.getAddress() %></td>
	<td><%=app.getSkill() %></td>
	<td>
		<%
			String qualification=app.getQualification();
			String[] s1=qualification.split(";");
			for(int i=0;i<s1.length;i++){
				String[] s2=s1[i].split(",");
				out.print(s2[0]+"("+s2[1]+") ");
				}
		%>
	</td>
	<td><input type="checkbox" name="aids" value="<%=app.getId() %>" /></td>
</tr>
<%
	}
%>
<tr><td colspan="5" align="right">
	<input type="submit" value="Approve">
<%
}
%>

</table>
</form>
</div>
</body>
</html>