<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="jl.pojo.Applicant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script>
     function addRow() {
     var yr = ["2010","2011","2012","2013","2014","2015","2016","2017"];
     var month=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
    var table=document.getElementById("jobdetails");
    var row=table.insertRow(table.rows.length);
    var cell=row.insertCell(0);
    var tt=document.createElement("input");
    tt.name="cname";
    cell.appendChild(tt);
    
    cell=row.insertCell(1);
    tt=document.createElement("input");
    tt.name="deg";
    cell.appendChild(tt);
    
    cell=row.insertCell(2);
    var selectList_yr = document.createElement("select");
    selectList_yr.name = "fyear";
    cell.appendChild(selectList_yr);
    for (var i = 0; i < yr.length; i++) {
            var option = document.createElement("option");
            option.value = yr[i];
            option.text = yr[i];
            selectList_yr.appendChild(option);
    }
    
    var selectList_mnt = document.createElement("select");
    selectList_mnt.name = "fmonth";
         cell.appendChild(selectList_mnt);
    for (var i = 0; i < month.length; i++) {
            var option = document.createElement("option");
            option.value = month[i];
            option.text = month[i];
            selectList_mnt.appendChild(option);
    }
    
    cell=row.insertCell(3);
    var selectList_yr = document.createElement("select");
    selectList_yr.name = "tyear";
    cell.appendChild(selectList_yr);
    for (var i = 0; i < yr.length; i++) {
            var option = document.createElement("option");
            option.value = yr[i];
            option.text = yr[i];
            selectList_yr.appendChild(option);
    }
    
    var selectList_mnt = document.createElement("select");
    selectList_mnt.name = "tmonth";
         cell.appendChild(selectList_mnt);
    for (var i = 0; i < month.length; i++) {
            var option = document.createElement("option");
            option.value = month[i];
            option.text = month[i];
            selectList_mnt.appendChild(option);
    }
    }
    </script>
<style>
.ujbd{
	margin: 20px 100px 20px 240px;
}
.btn{
	margin-left: 250px;
}
</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
Applicant app=(Applicant)request.getAttribute("appjb");
String jobdetails=app.getJobdetails();
%>
<div class="ujbd">
<form action="/JobLocator/AppUpdateJobDetails" method="post">
<table align="center" id="jobdetails">
<caption>Update Job Profile</caption>
<tr><th>Company Name</th><th>Designation</th><th>From</th><th>To</th></tr>
<%
String[] s1=jobdetails.split(";");
for(int i=0;i<s1.length;i++){
	String s2[]=s1[i].split(",");
	for(int j=0;j<s2.length;j+=4){
		String s3[]=s2[2].split("-");
		String s4[]=s2[3].split("-");
%>

<tr>
	<td><input type="text" name="cname" value="<%= s2[j] %>"></td>
    <td><input type="text" name="deg" value="<%= s2[j+1] %>"></td>
    <td>
        <select name="fyear">
        	<option value="<%= s3[0] %>" selected><%= s3[0] %></option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016">2016</option>
            <option value="2017">2017</option>
        </select>
        <select name="fmonth">
        <option value="<%= s3[1] %>" selected><%= s3[1] %></option>
            <option value="Jan">Jan</option>
            <option value="Feb">Feb</option>
            <option value="Mar">Mar</option>
            <option value="Apr">Apr</option>
            <option value="May">May</option>
            <option value="Jun">Jun</option>
            <option value="Jul">Jul</option>
            <option value="Aug">Aug</option>
            <option value="Sep">Sep</option>
            <option value="Oct">Oct</option>
            <option value="Nov">Nov</option>
            <option value="Dec">Dec</option>
        </select>
    </td>
    <td>
        <select name="tyear">
        <option value="<%= s4[0] %>" selected><%= s4[0] %></option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016">2016</option>
            <option value="2017">2017</option>
        </select>
        <select name="tmonth">
        <option value="<%= s4[1] %>" selected><%= s4[1] %></option>
            <option value="Jan">Jan</option>
            <option value="Feb">Feb</option>
            <option value="Mar">Mar</option>
            <option value="Apr">Apr</option>
            <option value="May">May</option>
            <option value="Jun">Jun</option>
            <option value="Jul">Jul</option>
            <option value="Aug">Aug</option>
            <option value="Sep">Sep</option>
            <option value="Oct">Oct</option>
            <option value="Nov">Nov</option>
            <option value="Dec">Dec</option>
        </select>
    </td>
</tr>
<%
	}
}
%>
</table>

<div class="btn">
<input type="button" value="Add More" id="more" onclick="addRow();">
&nbsp;&nbsp;
<input type="submit" value="Update">
</form>
</div>
</div>
</body>
</html>