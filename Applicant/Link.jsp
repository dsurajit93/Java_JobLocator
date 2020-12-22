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
	background: url(/JobLocator/Images/back1.jpg);
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
	margin-top: -80px;
	margin-right: 20px;
}
#proPic{
        height: 75px;
        width: 75px;
        border-radius: 300px;
        margin-left: 50px;
    }
    #un{
        //display: block;
        margin-top: -400px;
        text-align: center;
        font-size: 20px;
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
    </style>
</head>
<body>
<%!
String userName=null,imageName=null;
%>
<%
if(session.getAttribute("userName")==null){
	out.print("<script>alert('Session Expired!! Please Login Again')</script>");
	response.sendRedirect("/JobLocator/index.jsp");
}

userName=(String)session.getAttribute("userName");
imageName=(String)session.getAttribute("imageName");


String imagePath="/JobLocator/Images/user.png";
if(imageName!=null)
	imagePath="/JobLocator/ProfilePicture/"+imageName;
%>

<div class="head">
<div class="logo">
<img src="/JobLocator/Images/logo.png" id="lg">
</div>
<div class="menu">
<table><tr>
<td><label id="un"><%=userName %></label></td>
<td><img src="<%=imagePath %>" id="proPic"></td>
</tr></table>
</div>
</div>
<div class="links">
<br>
	<a href="/JobLocator/Applicant/ApplicantHome.jsp">Home</a>
    <a href="/JobLocator/AppJobs">Jobs</a>
    <a href="/JobLocator/PostName">Search Job</a>
    <a href="/JobLocator/AppliedJobs">Applied Jobs</a>
    <a href="/JobLocator/SavedJobs">Saved Jobs</a>
    <a href="/JobLocator/ApplicantProfile">Profile</a>
    <a href="/JobLocator/LogOut.jsp">Log Out</a>
</div>
</body>
</html>