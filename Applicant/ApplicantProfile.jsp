<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="jl.pojo.Applicant" %>
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
	width: 800px;
	background: transparent;
	float:left;
}
.profile table{
	width: 80%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise); 
}
.profile td,th{
    height: 20px;
	font-size: 16px;
	padding-left: 3px;
} 
.profile th{
	background: darkturquoise;
}
.profile tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
#dtab{
width:750px;
}
#acd{
	text-align:center;
}
.ql{
float:left;
background-color: rgb(0,206,209, 0.5);
width: 250px;
margin-left: 5px;
margin-top:15px;
}
.ql a{
	font-size: 16px;
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
.cjr{
	margin:30px 450px;
	text-align: center;
	padding: 10px;
	background-color: white;
}
.cjr a{
	font-size: 20px;
	color: black;;
	text-decoration: none;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
String exist=(String)request.getAttribute("checkId");
System.out.println(exist);
if(exist.equals("no")){
%>
<div class="cjr"><a href="Applicant/CreateProfile.jsp">Create JobLocator Resume</a></div>
<%
}else if(exist.equals("yes")){
	
	if(session.getAttribute("msg")!=null){
		out.print("<script>alert('"+session.getAttribute("msg")+"')</script>");
		session.setAttribute("msg",null);
	}
	
	Applicant appPersonal=(Applicant)request.getAttribute("appPersonal");
	Applicant appAcademic=(Applicant)request.getAttribute("appAcademic");
	Applicant appJob=(Applicant)request.getAttribute("appJob");
%>
<div class="profile">
<%if(appPersonal!=null){ %>
<table align="center" id="dtab">
<tr><th colspan="2">:Personal Details:</th></tr>
<tr><td>Name:</td>
	<td><%=appPersonal.getName() %></td></tr>
<tr><td>Father's Name:</td>
	<td><%=appPersonal.getFname() %></td></tr>
<tr><td>DOB:</td>
	<td><%=appPersonal.getDob() %></td></tr>
<tr><td>Address:</td>
	<td><%=appPersonal.getAddress() %></td></tr>
<tr><td>Mobile:</td>
	<td><%=appPersonal.getMob() %></td></tr>
<tr><td>Email:</td>
	<td><%=appPersonal.getEmail() %></td></tr>
<tr><td>Key Skills:</td>
	<td><%=appPersonal.getSkill() %></td></tr>
<tr><td>Objective:</td>
	<td><%=appPersonal.getObjective() %></td></tr>
<tr><th colspan="2">:Academic Details:</th></tr>
<tr><td>You Have:</td>
	<td>
		<%
		out.println("<ul>");
		if(appAcademic.getDiploma().equals("yes"))
			out.println("<li>Diploma</li>");
		if(appAcademic.getBachelor().equals("yes"))
			out.println("<li>Bachelor's Degree</li>");
		if(appAcademic.getMaster().equals("yes"))
			out.println("<li>Master's Degree</li>");
		if(appAcademic.getPhd().equals("yes"))
			out.println("<li>PHD</li>");
		out.println("</ul>");
		%>
	</td></tr>
</table>
<%
} 
if(appAcademic!=null){ %>
<table align="center" id="dtab">
<tr><th>Degree</th><th>Course</th><th>University/Board</th><th>Marks</th><th>Passing Year</th></tr>
<%
String qualification=appAcademic.getQualification();
String s1[]=qualification.split(";");
for(int i=0;i<s1.length;i++){
	String s2[]=s1[i].split(",");
	out.println("<tr>");
	for(int j=0;j<s2.length;j++)
		out.print("<td id='acd'>"+s2[j]+"</td>");
	out.print("</tr>");
}
%>
</table>
<%
}
if(appJob!=null){
%>
<table align="center" id="dtab">
<tr><th colspan="4">Job Details:</th></tr>
<tr><th>Company</th><th>Designation</th><th>From</th><th>To</th></tr>
<%
String jobs=appJob.getJobdetails();
String s1[]=jobs.split(";");
for(int i=0;i<s1.length;i++){
	String s2[]=s1[i].split(",");
	out.println("<tr>");
	for(int j=0;j<s2.length;j++)
		out.print("<td id='acd'>"+s2[j]+"</td>");
	out.print("</tr>");
}
%>
</table>
<%} %>
</div>
<div class="ql">
<ul>
<li><a href="/JobLocator/AppGetPersonalDetails">Update Personal Details</a></li>
<li><a href="/JobLocator/AppGetAcademicDetails">Update Academic Details</a></li>
<li><a href="/JobLocator/AppGetJobDetails">Update Working Experience</a></li>
<li><a href="/JobLocator/Applicant/ApplicantJobDetails.jsp">Add Working experience</a></li>
<li><a href="/JobLocator/Applicant/AppUploadImage.jsp">Update Profile Picture</a></li>
<li><a href="/JobLocator/Applicant/AppUploadResume.jsp">Update Resume</a></li>
<li><a href="/JobLocator/Applicant/ChangePassword.jsp">Change Password</a></li>
</ul>
</div>
<%
}
%>
</body>
</html>