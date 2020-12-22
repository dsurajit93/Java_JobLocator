<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
*{
margin: 0;
padding: 0;
}
body{
background: url(/JobLocator/Images/back8.jpg);
background-size: cover;
}
.head{
	background: rgb(0,206,209,0.7);
}
#lg{
	height:100px;
	width:200px;
	margin-left: 50px;
}
.menu{
	float: right;
	margin-top: -35px;
}
.menu a{
	color: black;
	padding: 10px 20px;
	font-size: 20px;
	text-decoration: none;
	border: 1px solid black;
}
.menu a:hover{
	color: white;
	background-color: black;
}
.login-form{
  width: 450px;
  height: 400px;
  margin: 30px auto;
  box-shadow: 0 15px 25px rgba(0,0,0,.5);
  background: rgb(224,255,255,0.7);
  padding: 40px;
  box-sizing: border-box;
}

.login-form table{
	width: 100%;
}
.login-form td{
	height: 30px;
	padding: 5px;
	
}

.login-form input{
	border: none;
	border-bottom: 2px solid teal;
	outline: none;
	background:transparent;
	width: 100%;
	font-size: 16px;
	padding: 4px;
}

.login-form input[type='submit']{
	border-radius: 4px;
	width: 45%;
	height: 40px;
	padding: 5px;
	background-color: teal;
	color: white;
	font-weight: bold;
}
::placeholder{
opacity: 1;
}

</style>
</head>
<body>
<div class="head">
<div class="logo">
<img src="../Images/logo.png" id="lg">
</div>
<div class="menu">
<a href="../JobHighlights">Home</a>&nbsp;
</div>
</div>

<div class="login-form">
<form action="../AdminLogin" method="post">
<table align="center">
<tr><td colspan="2" align="center">
<%
int flag=Integer.parseInt(request.getParameter("ok"));
if(flag==-1){
%>
<font color="red">Invalid Username or Password</font>
<%} %>
</td></tr>
<tr><td>Email:</td>
	<td><input type="email" placeholder="Enter Your Email" name="email"></td></tr>
<tr><td>Password</td>
	<td><input type="password" placeholder="Enter Your Password" name="password"></td></tr>
<tr><td colspan="2" align="right">
	<input type="submit" value="Sign In"></td></tr>
</table>

</form>
</div>
</body>
</html>