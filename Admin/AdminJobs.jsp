<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.text.*,java.util.*,jl.pojo.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobs</title>
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
.ajbs{
	margin-left:230px;
	margin-top: 5px;
	width: 70%;
	padding: 5px 70px;
}
.ajbs table{
	width: 100%;
	background:linear-gradient(to bottom right, darkturquoise, paleturquoise);
}
.ajbs th{
	text-align: left;
}
.ajbs td,th{
    height: 20px;
	font-size: 18px;
	padding-left: 3px;
}
.ajbs tr:nth-child(even){
	    background:linear-gradient(to bottom, cyan, lightcyan);
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<div class="ajbs">
<table align="center" width="100%">
<tr><th>Job Title</th><th>Posted By</th><th>Last Date to Apply</th><th>Status</th><th></th></tr>
<%
if(request.getAttribute("msg")!=null){
	out.print("<script>");
	out.println("alert('"+request.getAttribute("msg")+"')");
	out.print("</script>");
}
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

Calendar cl=Calendar.getInstance();
int year=cl.get(Calendar.YEAR);
int month=cl.get(Calendar.MONTH)+1;
int day=cl.get(Calendar.DATE);
String t_date=year+"-"+month+"-"+day;
java.util.Date ut_date=sdf.parse(t_date);

ArrayList<Job> al=(ArrayList<Job>)request.getAttribute("alljobs");

for(Job jb:al){
java.sql.Date sqlastdate=jb.getLastdate();
java.util.Date ulastdate=(java.util.Date)sqlastdate;

String status="";
if(ut_date.compareTo(ulastdate)>0)
	status="Expire";
else
	status="Active";
%>
<tr><td><a href="/JobLocator/AppJobDetails?jid=<%=jb.getId() %>"><%=jb.getJobtitle() %></a></td>
	<td>
		<%
			if(jb.getRname()!=null){
				out.print(jb.getRname());
			}else{
				out.print("Administrator");
			}
		%>
	</td>
	<td><%=jb.getLastdate() %></td>
	<td><%=status %></td>
	<td><a href="/JobLocator/AdminDeleteJob?jid=<%=jb.getId() %>" onclick="return ConfirmDelete();">Remove</a></td>
</tr>
<%
}
%>
</table>
</div>
</body>
</html>