<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Locator</title>
<link rel="stylesheet" href="/JobLocator/CSS/index-master.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("a").on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
        window.location.hash = hash;
      });
    }
  });
});
</script>
</head>
<body>
<div class="head">
<div class="logo">
<img src="Images/logo.png" id="lg">
</div>
<div class="menu">
<table><tr>
<td><a href="#hm">Home</a></td>
<td><a href="Applicant/ApplicantLogin.jsp?ok=2">Applicant</a></td>
<td><a href="Recruiter/RecruiterLogin.jsp?ok=2">Recruiter</a>
<td><a href="Admin/AdminLogin.jsp?ok=2">Administrative Login</a></td>
<td><a href="#au">About Us</a></td>
<td><a href="#cu">Contact Us</a></td>
<td><a href="#fb">Feedback</a></td>
</tr></table>
</div>
</div>
<div class="container">
<div class="hm" id="hm">
	<div class="content">
		<div class="adv">
		<label id="hh1">Are You a Fresher?</label>
		<label id="hh2">LOOKING FOR A JOB?</label>
		<label id="hh3">To Get Job Details</label>
		<label><a href="Applicant/ApplicantLogin.jsp?ok=2">Login/Sign Up</a></label>
		</div>
		<div class="highlights">
		<%
		ArrayList<String> al=new ArrayList<String>();
		if(request.getAttribute("jh")!=null)
			al=(ArrayList<String>)request.getAttribute("jh");
		for(int i=0;i<al.size();i++){
		%>
		<%=al.get(i) %>
		<img src="/JobLocator/Images/new_1.gif" alt="animated">
		<hr>
		<%} %>
		</div>
	</div>
</div>
<div class="au" id="au">
	<div class="content">
	<div name="txt">
		<p id="dt">About Us</p>
		<p id="dd">At JobLocator we all come to work everyday with a singular thought in our mind- How to make 
		things simpler yet advanced, business focussed yet User-Friendly & strive to be Agile yet reach the masses.
		It's this thought that helps us be the "The No.1 Jobsite For Freshers in India" and makes us move forward.
		 JobLocator is NO.1 job Portal for freshers hiring in India with a database of over 1.5+ Crore resumes.
		  More than 3 Lakh+ resumes are added every month from entry level graduates across the country.<br> We offer 
		  Fresher Recruitment Solutions for 60K+ recruiters and we have a presence in colleges in 100+ cities across 
		  India. Our client list includes Facebook, EMC, Toshiba, Huawei, Sonus Networks, Motorola,Alcatel Lucent, 
		  NetApp, Goodrich, Siemens, Amazon, Symphony Services, ABB, MuSigma, Akamai, Flipkart, Oracle, Practo,Berger 
		  Paints, HDFC Life and many more.<br>
		  Welcome to the future of Job Portals</p>
	</div>
	</div>
</div>
<div class="cu" id="cu">
	<div class="content">
	<p id="dt">Contact Us</p>
	<table width="90%" align="center" id="cut"><tr>
	<td>
		<label id="ch1">Corporates, Recruiters, Consultants & Advertisers</label>
		 <label id="ch2">Contact:</label>ceo@joblocaror.com
		<label id="ch1">Are you a premium member? </label>
		<label id="ch2">Contact:</label>premium@jobloator.com
		<label id="ch1">TPO's, Placement Officers & Campus Relations</label>
		<label id="ch2">Contact:</label>campus@gmail.com
	</td>
	<td>
		<label id="ch1">Office Address:</label>
		<label id="ch2">
		Block-5<br>
		New LIC Colony<br>
		Maitri Bihar<br>
		Bhubaneswar, Odisha<br>
		T: 1800 363 363
		</label>
	</td>
	</tr></table>
	</div>
</div>
<div class="fb" id="fb">
<%
if(request.getAttribute("msg")!=null){
	out.print("<script>alert('"+request.getAttribute("msg")+"')</script>");
}
%>
<div class="content">
<p id="dt">Feedback</p>
<form action="feedback" method="post">
<table align="center">
<tr><td>Name: </td>
	<td><input type="text" name="name"></td></tr>
<tr><td>Email:</td>
	<td><input type="email" name="email"></td></tr>
<tr><td>Contact Number:</td>
	<td><input type="text" name="cn"></td></tr>
<tr><td>Feedback</td>
	<td><textarea rows="5" cols="40" name="feedback"> </textarea></td></tr>
<tr><td colspan="2" align="right">
	<input type="submit" value="Submit"></td></tr>
</table>
</form>
</div>
</div>
</div>
</body>
</html>