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
.jd{
    margin: 20px 250px;
    border: 1px solid black;
    background-color: azure;
}
.jd h3{
    text-decoration: underline;
    font-family: serif;
    text-align: center;
}
#more{
    margin-left: 150px;
}
.btn{    
    margin-left: 600px;
}
</style>
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
</head>
<body>
<div class="head">
<div class="logo">
<img src="/JobLocator/Images/logo.png" id="lg">
</div>
</div>
<div class="jd">
<h3>Enter Job Experience</h3>
<form action="../AppAddJobExperience" method="post">
<table id="jobdetails" align="center">
<tr><th>Company Name</th><th>Designation</th><th>From</th><th>To</th></tr>
<tr id="rowToClone">
	<td><input type="text" name="cname"></td>
    <td><input type="text" name="deg"></td>
    <td>
        <select name="fyear">
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
</table>
<input type="button" value="Add More" id="more" onclick="addRow();">
<div class="btn">
<a href="AppUploadImage.jsp">Skip >></a>
&nbsp;&nbsp;
<input type="submit" value="Next">
</div>
</form>
</div>
</body>
</html>