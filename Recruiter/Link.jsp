<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Locator</title>
<style>
body{
	margin:0;
	padding: 0;
	background: url(/JobLocator/Images/back7.jpg);
	background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}
.head{
	//background-color: #e5fafa;
	background-color: rgb(0,206,209, 0.5);
	//background: transparent;
}
#lg{
	height:100px;
	width:200px;
	margin-left: 30px;
}
.menu{
	float: right;
	margin-top: -60px;
	margin-right: 20px;
}
.menu a{
	padding: 10px 20px;
	font-size: 20px;
	color: white;
	text-decoration: none;
	border: 1px solid black;
}
.menu a:hover{
        color: white;
        background-color: black;
    }
    .links{
        position: absolute;
        width: 13%;
        height: 81%;
        float: left;
        //background-color: rgb(0,206,209, 0.8);
        //background: transparent;
        margin-top: 5px;
        padding-top: 20px;
        padding-left: 20px;
    }
    .links a{
        text-decoration: none;
        font-size: 20px;
        display: block;
        color: white;
        padding: 5px 0px 5px 10px;
        margin-top: 5px;
        //margin-left: 10px;
        /* border-top: 1px solid gray;
        border-bottom: 1px solid gray; */
    }
    .links a:hover{
        color: white;
        background-color: black;
    }
    #proPic{
        height: 100px;
        width: 100px;
        border-radius: 300px;
        margin-left: 50px;
    }
    .rn{
    
        display: block;
        text-align: center;
        font-size: 25px;
        font-weight: bold;
        color: white;
    }
    
</style>
</head>
<body>
<%
if(session.getAttribute("recName")==null){
	out.print("<script>alert('Session Expired!! Please Login Again')</script>");
	response.sendRedirect("/JobLocator/index.jsp");
}
%>
<div class="head">
<div class="logo">
<img src="/JobLocator/Images/logo.png" id="lg">
</div>
<div class="menu">
<label class="rn">Welcome, <%=session.getAttribute("recName") %></label>
</div>
</div>
<div class="links">
<br>
    <a href="/JobLocator/Recruiter/RecruiterHome.jsp">Home</a>
    <a href="/JobLocator/Recruiter/AddJob.jsp">Add Job</a>
    <a href="/JobLocator/PostedJob?recId=<%=session.getAttribute("recId")%>">Posted Jobs</a>
    <a href="/JobLocator/Recruiter/CandidateSearch.jsp">Search Candidate</a>
    <a href="/JobLocator/RecruiterProfile">Profile</a>
    <a href="/JobLocator/LogOut.jsp">Log Out</a>
</div>
</body>
</html>