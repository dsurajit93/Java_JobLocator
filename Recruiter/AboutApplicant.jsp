<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.Applicant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applicant Details</title>
<style>
.aprofile{
	margin-left: 250px;
	margin-top:15px;
	margin-bottom:20px;
	width: 800px;
	background: transparent;
	float:left;
}
.aprofile table{
	width: 80%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise); 
}
.aprofile td,th{
    height: 20px;
	font-size: 16px;
	padding-left: 3px;
} 
.aprofile th{
	background: darkturquoise;
}
.aprofile #tdh{
	width: 200px;
	font-weight: bold;
}
.aprofile tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
#dtab{
width:750px;
}
.appFile{
	float: left;
	margin: 20px 50px 0px 10px;
	background: rgb(0,180,180, 0.9);
	padding: 20px;
}
.appFile a{
	font-size: 20px;
	color: black;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
	Applicant appPersonal=(Applicant)request.getAttribute("appPersonal");
	Applicant appAcademic=(Applicant)request.getAttribute("appAcademic");
	Applicant appJob=(Applicant)request.getAttribute("appJob");
	Applicant appFiles=(Applicant)request.getAttribute("appFiles");
%>
<div class="aprofile">
<%if(appPersonal!=null){ %>
<table align="center" id="dtab">
<tr><th colspan="2">:Personal Details:</th></tr>
<tr><td id="tdh">Name:</td>
	<td><%=appPersonal.getName() %></td></tr>
<tr><td id="tdh">Father's Name:</td>
	<td><%=appPersonal.getFname() %></td></tr>
<tr><td id="tdh">DOB:</td>
	<td><%=appPersonal.getDob() %></td></tr>
<tr><td id="tdh">Address:</td>
	<td><%=appPersonal.getAddress() %></td></tr>
<tr><td id="tdh">Mobile:</td>
	<td><%=appPersonal.getMob() %></td></tr>
<tr><td id="tdh">Email:</td>
	<td><%=appPersonal.getEmail() %></td></tr>
<tr><td id="tdh">Key Skills:</td>
	<td><%=appPersonal.getSkill() %></td></tr>
<tr><td id="tdh">Objective:</td>
	<td><%=appPersonal.getObjective() %></td></tr>
<tr><th colspan="2">:Academic Details:</th></tr>
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
		out.print("<td>"+s2[j]+"</td>");
	out.print("</tr>");
}
%>
</table>
<%
}
if(appJob!=null){
%>
<table align="center" id="dtab">
<tr><th colspan="4">:Job Details:</th></tr>
<tr><th>Company</th><th>Designation</th><th>From</th><th>To</th></tr>
<%
String jobs=appJob.getJobdetails();
String s1[]=jobs.split(";");
for(int i=0;i<s1.length;i++){
	String s2[]=s1[i].split(",");
	out.println("<tr>");
	for(int j=0;j<s2.length;j++)
		out.print("<td>"+s2[j]+"</td>");
	out.print("</tr>");
}
%>
</table>
<%} %>
</div>
<%
String imagePath="/JobLocator/Images/user.png";
if(appFiles.getImageName()!=null)
	imagePath="/JobLocator/ProfilePicture/"+appFiles.getImageName();
%>
<div class="appFile">
<img src="/JobLocator/ProfilePicture/<%=appFiles.getImageName() %>" height=150px width=150px>
<br>
<%
String resumePath="";
if(appFiles.getResumeName()!=null){
	resumePath="/JobLocator/Resume/"+appFiles.getResumeName();
%>
<a href="<%=resumePath %>" target="_blank">Download Resume</a>
<% } %>
</div>
</body>
</html>