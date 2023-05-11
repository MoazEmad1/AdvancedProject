<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Course</title>
<style>
		body {
			background-color: #fff;
			font-family: Arial, sans-serif;
		}
		h1 {
			text-align: center;
			color: #0071C5;
			margin-top: 30px;
		}
		form {
			margin: 50px auto;
			padding: 20px;
			border-radius: 5px;
			box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.3);
			max-width: 600px;
		}
		input[type="submit"], select {
			background-color: #0071C5;
			color: #fff;
			border: none;
			padding: 10px;
			font-size: 16px;
			cursor: pointer;
			border-radius: 5px;
		}
		input[type="submit"]:hover, select:hover {
			background-color: #00509D;
		}
		input[type="text"], select {
			padding: 10px;
			border-radius: 5px;
			border: none;
			width: 100%;
			margin-bottom: 10px;
			font-size: 16px;
		}
		input[type="text"]::placeholder {
			color: #ccc;
		}
		label {
			display: block;
			margin-bottom: 5px;
			color: #0071C5;
			font-size: 16px;
			font-weight: bold;
		}
	</style>
</head>
<body>
<form  method="post" action ="AdminServlet">

 <%
 //	response.setHeader("Cache-Control", "no-cache, no-store");
   //  response.setHeader("Pragma", "no-cache");
    // response.setHeader("Expires", "0");
        
                
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
    

<input type="submit" name="back" value="Return To Main Page"><br><br>
CourseName <input type = "text" name="coursename" placeholder= "insert course name here"><br><br>
CourseCode <input type = "text" name="coursecode" placeholder= "insert course code here"><br><br>
Add Description <input type="text" name="courseDisc" placeholder= "insert course Description here" ><br><br>
Chapter 1 Name <input type = "text"  name="chapter1Name" placeholder= "insert chapter name here"><br><br>
Chapter 1 Explanation <input type = "text"  name="chapter1Ex" placeholder= "insert chapter context here"><br><br>
Q1 <input type = "text" name="q1" placeholder= "insert Question 1"> right answer <select name="right1"> <option>a</option><option>b</option><option>c</option> </select><br><br>
Q2 <input type = "text"  name="q2" placeholder= "insert Question 2"> right answer <select name="right2"> <option>a</option><option>b</option><option>c</option> </select><br><br>
Q3 <input type = "text"  name="q3" placeholder= "insert Question 3"> right answer <select name="right3"> <option>a</option><option>b</option><option>c</option> </select><br><br>



<input type = "submit" name="confirmCourse" value= "Add Course">
</form>
</body>
</html>