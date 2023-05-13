<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

 <%
 //	response.setHeader("Cache-Control", "no-cache, no-store");
   //  response.setHeader("Pragma", "no-cache");
    // response.setHeader("Expires", "0");
        
                
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>

<style>
	body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
		}
		
		h1 {
			color: #336699;
			margin-top: 40px;
			margin-bottom: 20px;
			text-align: center;
		}
			
		form {
			background-color: #fff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			max-width: 400px;
			margin: 0 auto;
		}
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 10px;
		}
			input[type="text"] {
			padding: 10px;
			border-radius: 5px;
			border: none;
			margin-bottom: 20px;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
			background-color: #f2f2f2;
		}
		input[type="submit"] {
			background-color: #336699;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
			margin-top: 20px;
		}
		select {
  padding: 10px;
  border-radius: 5px;
  border: none;
  margin-bottom: 20px;
  width: 100%;
  box-sizing: border-box;
  font-size: 16px;
  background-color: #f2f2f2;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-image: url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30' width='15'><path d='M15 21L4 10h22z' fill='%23336699'/></svg>");
  background-repeat: no-repeat;
  background-position: calc(100% - 10px) center;
}


</style>
<body>
<form  method="post" action ="AdminServlet">
<h1>New Course</h1>
CourseName <input type = "text" name="coursename" placeholder= "insert course name here"><br>
CourseCode <input type = "text" name="coursecode" placeholder= "insert course code here"><br>
Add Description <input type="text" name="courseDisc" placeholder= "insert course Description here" ><br>
Chapter 1 Name <input type = "text"  name="chapter1Name" placeholder= "insert chapter name here"><br>
Chapter 1 Explanation <input type = "text"  name="chapter1Ex" placeholder= "insert chapter context here"><br>
Q1 <input type = "text" name="q1" placeholder= "insert Question 1"> right answer <select name="right1"> <option>a</option><option>b</option><option>c</option> </select><br>
Q2 <input type = "text"  name="q2" placeholder= "insert Question 2"> right answer <select name="right2"> <option>a</option><option>b</option><option>c</option> </select><br>
Q3 <input type = "text"  name="q3" placeholder= "insert Question 3"> right answer <select name="right3"> <option>a</option><option>b</option><option>c</option> </select><br>


<input type = "submit" name="confirmCourse" value= "Add Course">
<input type="submit" name="back" value="Return To Main Page">
</form>
</body>
</html>