<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.text.*,java.util.*,jl.pojo.*"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobs</title>
<style>

</style>
<link rel="stylesheet" href="/JobLocator/CSS/applicant-master.css">
</head>
<body>
<%@include file="Link.jsp" %>
<div class="ajbs">
<label>
<font color="red">
<%
	if(request.getParameter("msg")!=null){
		out.println(request.getParameter("msg"));
	}
%>
</font></label>
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


String imgPath="";
if(ut_date.compareTo(ulastdate)>0)
	imgPath="/JobLocator/Images/expire.png";
else
	imgPath="/JobLocator/Images/active.png";
%>

<div class="ajb">
<label id="jt"><a href="/JobLocator/AppJobDetails?jid=<%=jb.getId() %>"><%=jb.getJobtitle() %></a><img src="<%= imgPath %>" height="20px" width="80px"></label>
<%
if(jb.getRname()!=null){
%>
<label id="rn"><%=jb.getRname() %></label>
<%} %>
<table><tr><td>
<label id=""><b>Post: </b><%=jb.getPostname() %> </label>
<label id=""><b>Qualified Branches: </b><%=jb.getQbranch() %></label>
<label id=""><b>Skills: </b><%=jb.getRskill() %></label>
</td><td>
<label id=""><b>Location: </b><%=jb.getJoblocation() %></label>
<label id=""><b>Year of Experience: </b><%=jb.getYoe() %></label>
<label id=""><b>Salary: </b><%= jb.getSalary() %></label>
</td></tr></table>
</div>
<%
}
%>
</div>
</body>
</html>