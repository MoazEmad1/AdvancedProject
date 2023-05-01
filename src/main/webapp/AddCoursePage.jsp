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