<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	margin:0;
	padding: 0;
}
.head{
	background-color:darkturquoise;
}
#lg{
	height:100px;
	width:200px;
	margin-left: 50px;
}
#imgUpload{
	height:100px;
	width:200px;
	margin-left: 50px;
}
.imgUpload{
    margin: 20px 250px;
    padding-bottom:20px;
    border: 1px solid black;
    background-color: azure;
}
.imgUpload h3{
    text-decoration: underline;
    font-family: serif;
    text-align: center;
}
#more{
    margin-left: 150px;
}
.btn{    
    margin-left: 200px;
}
.imgIn{
	margin-left:250px;
}
</style>
<script type="text/javascript">
function checkImage(){
	var fileUpload = document.getElementById("fileUpload");
    // alert(fileUpload.value);
     var filename=fileUpload.value;
     //alert(filename.substring(filename.lastIndexOf('.')+1, filename.length));
     var validExt = ".png, .gif, .jpeg, .jpg";
     var getFileExt = filename.substring(filename.lastIndexOf('.'), filename.length);
     var pos = validExt.indexOf(getFileExt);
     if(pos < 0) {
  	 	alert("This file is not allowed, please upload valid file.");
  	 	return false;
  	  } else {
  	  	return true;
  	  }
  	if (typeof (fileUpload.files) != "undefined") {
          var size = parseFloat(fileUpload.files[0].size / 1024).toFixed(2);
          //alert(size + " KB.");
          if(size > 512){
          	alert("Image Size must be less then 500 KB");
          	return false;
          }
      } else {
          alert("This browser does not support HTML5.");
      }
	
}
</script>
</head>
<body>
<div class="head">
<div class="logo">
<img src="/JobLocator/Images/logo.png" id="lg">
</div>
</div>
<div class="imgUpload">
<h3>Upload Image</h3>
<form method="POST" action="../uploadImage" enctype="multipart/form-data" onsubmit="return checkImage();">
<div class="imgIn">
 Select Photo to Upload:
 <input type="file" name="uploadFile" id="fileUpload" required/>
 <br><br>
<div class="btn">
<a href="ApplicantHome.jsp">Skip >></a>
&nbsp;&nbsp;
<input type="submit" value="Next">
</div>
</div>
</form>
</div>
</body>
</html>