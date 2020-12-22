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
	weidth:200px;
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
.container{
  width: 450px;
  margin: 30px auto;
  //float:right;
  box-shadow: 0 15px 25px rgba(0,0,0,.5);
}
.signup,
.login{
  width: 50%;
  background: rgb(224,255,255,0.7);
  float: left;
  height: 60px;
  line-height: 60px;
  text-align: center;
  cursor: pointer;
  text-transform: uppercase;
}
.signup-form,
.login-form{
  background: rgb(224,255,255,0.7);
  padding: 40px;
  clear: both;
  width: 100%;
  box-sizing: border-box;
  height: 400px;
}
.signup-form table,
.login-form table{
	width: 100%;
}
.signup-form td,
.login-form td{
	height: 30px;
	padding: 5px;
	
}
.signup-form input,
.login-form input{
	border: none;
	border-bottom: 2px solid teal;
	outline: none;
	background:transparent;
	width: 100%;
	font-size: 16px;
	padding: 4px;
}
.signup-form input[type='submit'],
.signup-form input[type='reset'],
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $(".signup-form").hide();
			$(".signup").css("background", "#4cdcdc");

			$(".login").click(function(){
			  $(".signup-form").hide();
			  $(".login-form").show();
			  $(".signup").css("background", "#4cdcdc");
			  $(".login").css("background", "rgb(224,255,255,0.7)");
			});
			
			$(".signup").click(function(){
			  $(".signup-form").show();
			  $(".login-form").hide();
			  $(".login").css("background", "#4cdcdc");
			  $(".signup").css("background", "rgb(224,255,255,0.7)");
			});

        })
        
        function checkPass(){
            var a=document.getElementsByName("password")[0].value;
            var b=document.getElementsByName("cpassword")[0].value;
            if(a!=b){
	            alert("Passward and Re-password does not match");
	            return false;
            }
        }
    </script>

</head>
<body>
<div class="head">
<div class="logo">
<img src="../Images/logo.png" id="lg">
</div>
<div class="menu">
<a href="../index.jsp">Home</a>&nbsp;
<a href="">About Us</a>&nbsp;
<a href="">Contact US</a>&nbsp;
<a href="">Feedback</a>&nbsp;
</div>
</div>
<div class="container">
	<div class="login">Log In</div>
	<div class="signup">Sign Up</div>
<div class="signup-form">
<form action="../RecruiterRegister" method="post">
<table align="center">
<tr><td colspan="2" align="center">
<%
int flag=Integer.parseInt(request.getParameter("ok"));
if(flag==1){
%>
<font color="green">Account Created Successfully</font>
<%
}else if(flag==0){
%>
<font color="red">Something Wrong !! Please Try Again</font>
<%} %>
</td></tr>
<tr><td>Organization Name:</td>
	<td><input type="text" name="name" required></td></tr>
<tr><td>Organization Email:</td>
	<td><input type="email" name="email" required></td></tr>
<tr><td>Password:</td>
	<td><input type="password" name="password" required></td></tr>
<tr><td>Confirm Password:</td>
	<td><input type="password" name="cpassword" required onblur="return checkPass();"></td></tr>
<tr><td colspan="2" align="center">
	<input type="reset" value="Clear">
	<input type="submit" value="Register"></td></tr>	
</table>
</form>
</div>
<div class="login-form">
<form action="../RecruiterLogin" method="post">
<table align="center">
<tr><td colspan="2" align="center">
<%
if(flag==-1){
%>
<font color="red">Invalid Username or Password</font>
<%} %>
</td></tr>
<tr><td>Email:</td>
	<td><input type="email" placeholder="Enter Your Email" name="email" required></td></tr>
<tr><td>Password</td>
	<td><input type="password" placeholder="Enter Your Password" name="password" required></td></tr>
<tr><td colspan="2" align="right">
	<input type="submit" value="Sign In"></td></tr>
</table>

</form>
</div>
</div>
</body>
</html>