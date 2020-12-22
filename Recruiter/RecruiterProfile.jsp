<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jl.pojo.Recruiter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Locator || Profile</title>
<style>
.profile{
	margin-left: 250px;
	margin-top:15px;
	margin-bottom:20px;
	width: 700px;
	background: transparent;
	float:left;
}
.profile table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise); 
}
.profile td,th{
    height: 20px;
	font-size: 18px;
	padding-left: 3px;
} 
.profile #tdh{
	text-align: left;
	width: 200px;
	font-weight: bold;
}
.profile tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
.profile #recd{
	width: 200px;
	text-align: center;
}
.ql{
float:left;
background-color: rgb(0,206,209, 0.5);
width: 250px;
margin-left: 5px;
margin-top:15px;
}
.ql a{
	font-size: 18px;
	color: black;
	text-decoration: none;
	padding: 2px;
}
.ql li{
	margin-top: 10px;
}
.ql a:hover{
	background-color: white;
}
#cjp{
	display: block;
	margin: 30px 530px 0px 530px;
	background:rgb(255,255,255);
	font-size: 20px;
	padding: 20px;
}
#cjp a{
	text-align:center;
	text-decoration: none;
	color: black;
}
#cjp a:hover{
	background-color: cyan;
	padding: 10px;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
if(session.getAttribute("msg")!=null){
	out.print("<script>alert('"+session.getAttribute("msg")+"')</script>");
	session.setAttribute("msg",null);
}
String exist=(String)request.getAttribute("checkId");
if(exist.equals("no")){
%>
<div id="cjp"><center><a href="Recruiter/RecCreateProfile.jsp">Create JobLocator Profile</a></center></div>
<%
}else if(exist.equals("yes")){
	Recruiter rct=(Recruiter)request.getAttribute("recDetails");
%>
<div class="profile">
<table align="center">
<tr><td id="tdh">Company Name:</td>
	<td><%=rct.getName() %></td></tr>
<tr><td id="tdh">Head Office:</td>
	<td><%=rct.getHeadoffice() %></td></tr>
<tr><td id="tdh">Branches:</td>
	<td><%=rct.getBranches() %></td></tr>
<tr><td id="tdh">Contact No:</td>
	<td><%=rct.getCno() %></td></tr>
<tr><td id="tdh">Email: </td>
	<td><%=rct.getEmail() %></td></tr>
<tr><td id="tdh" colspan="2">Last Recruitmant Details:</td></tr>
<tr><td colspan="2">
	<table id="recd"align="center">
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
<tr><td id="tdh">About Company:</td>
	<td><%=rct.getDescription() %>
</table>
</div>
<div class="ql">
<ul>
<li><a href="/JobLocator/GetRecruterProfile">Update Company Profile</a></li>
<li><a href="/JobLocator/Recruiter/ChangePassword.jsp">Change Password</a></li>
</ul>
</div>
<%
}
%>
</body>
</html>