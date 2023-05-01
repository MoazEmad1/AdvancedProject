<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form  method="post" action ="AdminServlet">
CourseName <input type = "text" name="coursename" placeholder= "insert course name here"><br><br>
CourseCode <input type = "text" name="coursecode" placeholder= "insert course number here"><br><br>
Add Description <input type="text" name="courseDisc" ><br><br>
Chapter 1 Name <input type = "text"  name="chapter1Name" placeholder= "insert course number here"><br><br>
Chapter 1 Explanation <input type = "text"  name="chapter1Ex" placeholder= "insert course number here"><br><br>
Q1 <input type = "text" name="q1" placeholder= "insert course number here">right answer <input type = "text" name= "right1" placeholder= "insert course number here"><br><br>
Q2 <input type = "text"  name="q2" placeholder= "insert course number here">right answer <input type = "text"name= "right2" placeholder= "insert course number here"><br><br>
Q3 <input type = "text"  name="q3" placeholder= "insert course number here">right answer <input type = "text" name="right3" placeholder= "insert course number here"><br><br>

<input type = "submit" name="confirmCourse" value= "Add Course">
</form>
</body>
</html>