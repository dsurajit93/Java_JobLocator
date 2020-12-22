<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.Applicant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Academic Details</title>
<script>
function addRow(){
	alert("hello");
	var table=document.getElementById("accDetails");
    var row=table.insertRow(table.rows.length);
    for(var i=0;i<5;i++){
	    var cell=row.insertCell(i);
	    var tt=document.createElement("input");
	    tt.name="t1";
	    cell.appendChild(tt);
    }
}
</script>
<style>
.uacd{
	margin: 20px 100px 20px 240px;
}
.btns{
	margin-left: 100px;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
Applicant app=(Applicant)request.getAttribute("appac");
%>
<div class="uacd">
<form action="/JobLocator/UpdateAcademicDetails" method="post">
<table align="center" width="80%">
<caption>Edit Academic Details</caption>
<tr><th>You have:</th>
	<td>
	<input type="checkbox" name="diploma" 
	<% if(app.getDiploma().equals("yes")) 
		out.print("checked");
	%>
	/>Diploma
	
	<input type="checkbox" name="bachelor" 
	<% if(app.getBachelor().equals("yes")) 
		out.print("checked");
	%>
	/>Bachelor
	
	<input type="checkbox" name="master" 
	<% if(app.getMaster().equals("yes")) 
		out.print("checked");
	%>
	/>Master
	
	<input type="checkbox" name="phd" 
	<% if(app.getPhd().equals("yes")) 
		out.print("checked");
	%>
	/>PHD
	</td></tr>
<tr><td colspan="2">
	<table id="accDetails">
	<tr><th>Degree</th><th>Course</th><th>University/Board</th><th>Marks</th><th>Passing Year</th></tr>
	<%
	String qualification=app.getQualification();
	String[] s1=qualification.split(";");
	for(int i=0;i<s1.length;i++){
		out.print("<tr>");
		String s2[]=s1[i].split(",");
		for(int j=0;j<s2.length;j++){
			out.print("<td><input type='text' name='t1' value='"+s2[j]+"'></td>");
		}
		out.print("</tr>");
	}
	
	 %>
	</table>
	</td></tr>
</table>
<div class="btns">
		<input type="button" value="Add More" onclick="addRow();"> &nbsp;&nbsp;&nbsp;
		<input type="submit" value="Update">
</div>
</form>
</div>
</body>
</html>