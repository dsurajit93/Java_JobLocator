<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,jl.pojo.Applicant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Candidate</title>
<style>
.search{
	margin: 20px 100px 10px 240px;
}
.re th{
	text-align: left;
}
.kys{
	background-color: #19d2d2;
	width: 900px;
	padding: 10px;
	margin: 50px;
	border-radius: 5px;
}
.kys input[type='text']{
	border-radius: 4px;
	outline: none;
	height: 28px;
	font-size: 15px;
	padding-left: 4px;
}
::placeholder{
font-weight: bold;
}
.kys input[type='submit']{
	border-radius: 4px;
	outline: none;
	height: 35px;
	font-size: 20px;
	padding: 5px;
	background-color: #00b8b8;
	color: white;
}
.scan{
	margin: 30px 35px 10px 45px;
	padding: 10px;
}
.scan table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise); 
}
.scan td,th{
    height: 30px;
	font-size: 16px;
	padding-left: 3px;
} 
.scan th{
	background: darkturquoise;
}
.scan tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
	    //background-color: white;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<div class="search">
<div class="kys">
<form action="/JobLocator/CandidateSearch" method="post">
<table align="center" width="60%">
<tr><td><input type="text" name="location" placeholder="Location" required></td>
	<td><input type="text" name="skill" placeholder="Key Skill" required></td>
	<td><input type="submit" value="Search">
</table>
</form>
</div>
<div class="scan">
<%
if(request.getAttribute("sc")!=null){
ArrayList<Applicant> al=(ArrayList<Applicant>)request.getAttribute("sc");
if(al.size()==0){
%>
<label id="smsg">Sorry, No Candidate Found</label>
<%
}
else{
%>
<table align="center">
<tr><th>Name</th><th>Address</th><th>Key Skill</th><th>Qualification</th></tr>
<%
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
</tr>
<%
	}
%>
</table>
<%
  }
}
%>
</div>
</div>
</body>
</html>