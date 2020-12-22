<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.Job"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JL || Job Details</title>
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
.jb{
	//border: 1px dotted black;
	margin: 20px 100px 0px 230px;
    padding: 10px 15px;
}
.jb td,th{
    background-color: aliceblue;    
    //margin-top: 20px;
    height: 30px;
	font-size: 20px;
    border: 1px solid grey;
}
.jb th{
	text-align: left;
	width: 200px;
    //border-top-left-radius: 10px;
    //border-bottom-left-radius: 10px;
}
.jb td{
    border: 1px solid grey;
    //border-top-right-radius: 10px;
    //border-bottom-right-radius: 10px;
}
#fr,#lr{
	border: none;
    background-color: white;
    background: transparent;
}
#jt{
	display: block;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	background-color: aqua;
	border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    height: 30px;
    padding-top: 2px;
}
#action{
    font-size: 15px;
    font-family: sans-serif;
    text-decoration: none;
	background-color:aquamarine;
    display: inline-block;
    margin: 0px 5px;
    padding: 10px 160px;
    font-weight: bold;
    border-radius: 20px;
}
#action:hover{
	background-color:cadetblue; 
}
</style>

</head>
<body>
<%@include file="Link.jsp" %>
<%
Job jb=(Job)request.getAttribute("jdetails");
%>
<div class="jb">
<table width="100%">
<tr><td colspan="2" id="fr"><label id="jt"><%=jb.getJobtitle() %></label></td></tr>
<%
if(jb.getRname()!=null){
%>
<tr><th>Organization:</th>
	<td><a href="/JobLocator/RecruiterDetails?rid=<%=jb.getRid()%>"><%=jb.getRname() %></a></td></tr>
<%} %>
<tr><th>Description:</th>
	<td><%=jb.getJobdescription() %></td></tr>
<tr><th>Location: </th>
	<td><%=jb.getJoblocation() %></td></tr>
<tr><th>Post Name</th>
	<td><%=jb.getPostname() %></td></tr>
<tr><th>Vacancy: </th>
	<td><%=jb.getVacancy() %></td></tr>
<tr><th>Qualified Branches:</th>
	<td><%=jb.getQbranch() %></td></tr>
<tr><th>Required Skills: </th>
	<td><%=jb.getRskill() %></td></tr>
<tr><th>Year of Experience: </th>
	<td><%=jb.getYoe() %></td></tr>
<tr><th>Last date to Apply</th>
	<td><%=jb.getLastdate() %></td></tr>
<tr><th>Expected Salary:</th>
	<td><%=jb.getSalary() %></td></tr>
<tr><td colspan="2" align="center" id="lr">
	<%-- /JobLocator/ApplyJob?jid=<%=jb.getId() %>&rid=<%=jb.getRid() %>&aid=<%=appId%> --%>
	<a href="/JobLocator/AdminDeleteJob?jid=<%=jb.getId() %>" onclick="return ConfirmDelete();" id="action">REMOVE</a>
</td></tr>
</table>
</div>

</body>
</html>