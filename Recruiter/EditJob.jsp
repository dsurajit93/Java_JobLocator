<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.aj{
	margin-left: 230px;
	margin-top: 20px;
	margin-bottom: 20px;
	background: rgb(223,255,255,0.7);
	width: 60%;
	//box-sizing: border-box;
	box-shadow: 0 15px 20px 15px rgba(0,0,0,.5);
	border-radius: 10px;
	padding: 10px;
}
.aj td{
	height: 30px;
	font-size: 20px;
	width: 200px;
	padding: 3px;
}
.aj input[type='text'],
	input[type='date']{
	height: 28px;
	width: 500px;
	background-color: #e5fafa;
	border: none;
	outline: none;
	font-size: 18px;
	padding-left: 5px;	
}
input[type='submit']{
	height: 60px;
	width: 300px;
	background-color: #00cdcd;
	border: none;
	border-radius: 10px;
	outline: none;
	font-size: 20px;
	font-weight: bold;
	padding: 15px;
}
.aj input[type='checkbox']{
    width: 20px;
    height: 20px;
    margin-left: 20px;
}
.aj textarea{
	width: 500px;
	background-color: #e5fafa;
	border: none;
	outline: none;
	font-size: 18px;
	padding-left: 5px;
	
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
Job jb=(Job)request.getAttribute("jdetails");
%>
<div class="aj">
<form action="/JobLocator/EditJob">
<table>
<tr><td>Job Title:</td>
	<td><input type="text" name="jobtitle" size="50" value="<%=jb.getJobtitle() %>" required></td></tr>
<tr><td>Job Description</td>
	<td><textarea rows="5" cols="40" name="jobdetails" required><%=jb.getJobdescription() %></textarea></td></tr>
<tr><td>Job Location:</td>
	<td><input type="text" name="jobloc" size="40" value="<%=jb.getJoblocation() %>" required></td></tr>
<tr><td>Post Name:</td>
	<td><input type="text" name="postname" size="40" value="<%=jb.getPostname() %>" required></td></tr>
<tr><td>Number of vacancy:</td>
	<td><input type="text" name="vac" value="<%=jb.getVacancy() %>" required></td></tr>
<tr><td>Job For:</td>
	<td><input type="checkbox" 
		<%
		if(jb.getDiploma().equals("yes"))
			out.print("checked");
		%>
		name="diploma">Diploma
		
		<input type="checkbox" 
		<%
		if(jb.getBachelor().equals("yes"))
			out.print("checked");
		%>
		name="bachelor">Bachelor's
		
		<input type="checkbox" 
		<%
		if(jb.getMaster().equals("yes"))
			out.print("checked");
		%>
		name="master">Masters's 
		<input type="checkbox" 
		<%
		if(jb.getPhd().equals("yes"))
			out.print("checked");
		%>
		name="phd">PHD
	</td></tr>
<tr><td>Qualified Branches:</td>
	<td><input type="text" name="qb" size="40" value="<%=jb.getQbranch() %>" required></td></tr>
<tr><td>Required Skills:</td>
	<td><input type="text" name="reqskill" value="<%=jb.getRskill() %>" required></td></tr>
<tr><td>Year of Experience:</td>
	<td><input type="text" name="yoe" value="<%=jb.getYoe() %>" required></td></tr>
<tr><td>Last date to apply:</td>
	<td><input type="date" name="lastdate" value="<%=jb.getLastdate() %>" required></td></tr>
<tr><td>Expected Salary:<br>(Per Month)</td>
	<td><input type="text" name="salary" value="<%=jb.getSalary() %>" required></td></tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="Update"></td></tr>
</table>
</form>
</div>
</body>
</html>