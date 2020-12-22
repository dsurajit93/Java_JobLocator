<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Locator || Administrator</title>
<style>
body{
	margin:0;
	padding: 0;
	background: url(/JobLocator/Images/back16.jpg);
	background-repeat: none;
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
	margin-top: -50px;
	margin-right: 20px;
}
#proPic{
        height: 75px;
        width: 75px;
        border-radius: 300px;
        margin-left: 50px;
    }
    #rn{
        text-align: center;
        font-size: 30px;
        font-weight: bold;
    }
    

.menu a{
	padding: 10px 20px;
	font-size: 20px;
	color: black;
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
        height: 83%;
        float: left;
        //background-color: rgb(0,206,209, 0.8);
        //background: transparent;
        margin-top: 5px;
        padding-top: 20px;
        padding-left: 20px;
    }
    .links a{
        text-decoration: none;
        font-size: 25px;
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
    
</style>
</head>
<body>
<%
if(session.getAttribute("recId")==null){
	response.sendRedirect("/JobLocator/index.jsp");
}
%>
<div class="head">
<div class="logo">
<img src="/JobLocator/Images/logo.png" id="lg">
</div>
<div class="menu">
<label id="rn">Welcome, Administrator</label>
</div>
</div>
<div class="links">
<br>
    <a href="/JobLocator/Admin/AdminHome.jsp">Home</a>
    <a href="/JobLocator/Admin/AddJob.jsp">Add Job</a>
    <a href="/JobLocator/AdminPostedJob">Posted Jobs</a>
    <a href="/JobLocator/AdminJobs">Jobs</a>
    <a href="/JobLocator/AdminApplicantList">Applicants</a>
    <a href="/JobLocator/AdminRecruiterList">Recruiters</a>
    <a href="/JobLocator/FeedBacks">Feedbacks</a>
    <a href="/JobLocator/LogOut.jsp">Log Out</a>
</div>
</body>
</html>