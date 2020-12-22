<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applicant Login</title>
<link rel="stylesheet" href="/JobLocator/CSS/applicant-master.css">
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
	            alert("Passward and Repassword doesnot match");
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
<a href="../JobHighlights">Home</a>&nbsp;
</div>
</div>

<div class="container">
	<div class="login">Log In</div>
	<div class="signup">Sign Up</div>
<div class="signup-form">
<form action="../ApplicantRegister" method="post">
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
<tr>
	<td><input type="text" name="name" placeholder="Name" required></td></tr>
<tr>
	<td><input type="email" name="email" placeholder="Email" required></td></tr>
<tr>
	<td><input type="password" name="password" placeholder="Passward" required></td></tr>
<tr>
	<td><input type="password" name="cpassword" placeholder="Confirm Passward" required onblur="return checkPass();"></td></tr>
<tr><td colspan="2" align="center">
	<input type="reset" value="Clear">
	<input type="submit" value="Register"></td></tr>	
</table>
</form>
</div>
<div class="login-form">
<form action="../ApplicantLogin" method="post">
<table align="center">
<tr><td colspan="2" align="center">
<%
if(flag==-1){
%>
<font color="red">Invalid Username or Password</font>
<%} %>
</td></tr>
<tr>
	<td><input type="email" placeholder="Enter Your Email" name="email" required></td></tr>
<tr>
	<td><input type="password" placeholder="Enter Your Password" name="password" required></td></tr>
<tr><td colspan="2" align="right">
	<input type="submit" value="Sign In"></td></tr>
</table>

</form>
</div>
</div>
</body>
</html>