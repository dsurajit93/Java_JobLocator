<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.*,java.util.*,jl.pojo.Job" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Posted Jobs</title>
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
.jbs{
	margin-left: 230px;
	margin-top:5px;
	padding: 10px;
    width: 80%;
}
.jb{
	background: rgb(178,255,255,0.6);
	margin: 25px 100px;
	box-shadow: 0 10px 15px 15px rgba(0,0,0,0.5);
}
.jb th{
	text-align: left;
	width: 150px;
}
#jt{
	display: block;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	background-color: aqua;
}
#mod{
    font-size: 15px;
    font-family: sans-serif;
    font-weight: bold;
    text-decoration: none;
	background-color:aquamarine;
    display: inline-block;
    margin: 0px 5px;
    padding: 10px 50px;
}
#mod:hover{
	background-color:azure; 
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<div class="jbs">
<%

if(session.getAttribute("msg")!=null){
	out.println("<script>alert('"+session.getAttribute("msg")+"')</script>");
	session.setAttribute("msg",null);
}

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

Calendar cl=Calendar.getInstance();
int year=cl.get(Calendar.YEAR);
int month=cl.get(Calendar.MONTH)+1;
int day=cl.get(Calendar.DATE);
String t_date=year+"-"+month+"-"+day;
java.util.Date ut_date=sdf.parse(t_date);

ArrayList<Job> al=(ArrayList<Job>)request.getAttribute("jobdetails");
for(Job jb:al){
java.sql.Date sqlastdate=jb.getLastdate();
java.util.Date ulastdate=(java.util.Date)sqlastdate;


String imgPath="";
if(ut_date.compareTo(ulastdate)>0)
	imgPath="/JobLocator/Images/expire.png";
else
	imgPath="/JobLocator/Images/active.png";
%>
<div class="jb">
<table width="100%">
<tr><td colspan="2"><label id="jt"><%=jb.getJobtitle() %><img src="<%=imgPath %>" height="30px" width="80px"></label></td></tr>
<tr><th>Description:</th>
	<td><%=jb.getJobdescription() %></td></tr>
<tr><th>Location: </th>
	<td><%=jb.getJoblocation() %></td></tr>
<tr><th>Post Name</th>
	<td><%=jb.getPostname() %></td></tr>
<tr><th>Vacancy: </th>
	<td><%=jb.getVacancy() %></td></tr>
<tr><th>Job For:</th>
	<td>
		<ul>
			<%
				if(jb.getDiploma().equals("yes"))
					out.print("<li>Diploma</li>");
				if(jb.getBachelor().equals("yes"))
					out.print("<li>Bachelor's</li>");
				if(jb.getMaster().equals("yes"))
					out.print("<li>Master's</li>");
				if(jb.getPhd().equals("yes"))
					out.print("<li>PHD</li>");
			%>
		</ul>
	</td></tr>
<tr><th>Qualified Branches:</th>
	<td><%=jb.getQbranch() %></td></tr>
<tr><th>Required Skills: </th>
	<td><%=jb.getRskill() %></td></tr>
<tr><th>Year of Experience: </th>
	<td><%=jb.getYoe() %></td></tr>
<tr><th>Posted Date: </th>
	<td><%=jb.getC_date() %></td></tr>
<tr><th>Last date to Apply</th>
	<td><%=jb.getLastdate() %></td></tr>
<tr><th>Expected Salary:</th>
	<td><%=jb.getSalary() %></td></tr>
<tr><td colspan="2" align="center">
	<a href="/JobLocator/GetJobDetails?jid=<%=jb.getId() %>" id="mod">EDIT</a>
	<a href="/JobLocator/DeleteJob?jid=<%=jb.getId() %>" id="mod" onclick="return ConfirmDelete();">DELETE</a>
	<a href="/JobLocator/RecPendingRequest?jid=<%=jb.getId() %>" id="mod">PENDING REQUESTS</a>
	<a href="/JobLocator/RecApprovedRequest?jid=<%=jb.getId() %>" id="mod">APPROVED REQUESTS</a>
</td></tr>
</table>
</div>
<%
}
%>
</div>
</body>
</html>