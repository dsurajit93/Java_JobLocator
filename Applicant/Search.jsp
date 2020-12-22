<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<style>
body{
    background: url(/JobLocator/Images/back1.jpg);
    background-size: cover;
}
.search{
	margin: 30px 50px 5px 240px;
}
.ky{
	background-color: #19d2d2;
	width: 900px;
	padding: 10px;
	margin: 50px;
	border-radius: 5px;
}
.ky input[type='text']{
	border-radius: 4px;
	outline: none;
	height: 28px;
	font-size: 15px;
	padding-left: 4px;
}
::placeholder{
font-weight: bold;
}
.ky select{
	border-radius: 4px;
	outline: none;
	height: 35px;
	width: 200px;
	font-size: 16px;
	padding-left: 4px;
}
.ky input[type='submit']{
	border-radius: 4px;
	outline: none;
	height: 35px;
	font-size: 20px;
	padding: 5px;
	background-color: #00b8b8;
	color: white;
}
.qrf{
	margin: 50px 55px 50px 60px;
}
.qrf #hh{
	display: block;
	font-weight: bold;
	text-align:center;
	text-decoration: underline;
}
.qrf .ql,.ps,.or{
	width: 30%;
	height: 120px;
	float: left;
	margin: 2px 5px;
	padding: 3px;
	background-color: #b2f0f0; 
	border-radius: 8px;
}

</style>
</head>
<body>
<%@include file="Link.jsp" %>
<%
ArrayList<String> al=(ArrayList<String>)request.getAttribute("postnames");
%>
<div class="search">
<div class="ky">
<form action="/JobLocator/JobSearch" method="post">
<table align="center" width="100%">
<tr>
	<!-- <td><input type="radio" name="degree" value="diploma">Diploma
	</td> -->
	<td><input type="text" name="location" placeholder="Location"></td>
	<td>
		<select name="postname">
		<option>Job For</option>
		<%
		for(String ss:al){
		%>
		<option value="<%=ss%>"><%=ss%></option>
		<%	
		}
		%>
		</select>
	</td>
	<td><input type="text" name="skill" placeholder="Key Skill"></td>
	<td><input type="submit" value="Search"></td>
</tr>
</table>
</form>
</div>
<div class="qrf">
<div class="ql">
<label id="hh">Quick Search</label>
	<ul>
		<li><a href="">Job for Bachelor's</a></li>
		<li><a href="">Job for Master's</a></li>
		<li><a href="">Job for Diploma</a></li>
	</ul>
</div>
<div class="ps">
<label id="hh">Popular Search</label>
	<ul>
		<li><a href="">Job for PHP Developers</a></li>
		<li><a href="">Job for Java Developers</a></li>
		<li><a href="">Job for Associate Faculty</a></li>
	</ul>
</div>
<div class="or">
<label id="hh">Other References</label>
	<ul>
		<li><a href="">Job for Fresher's</a></li>
		<li><a href="">Job for Experienced Candidate</a></li>
	</ul>
</div>
</div>
</div>
</body>
</html>