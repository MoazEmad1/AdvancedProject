<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head> <title>Admin Page</title></head>

    <body>
    
        <form method="post" action ="AddCourseServlet">
            <center>
                <h1>Courses Overflow</h1><br><br>
                <h3>Welcome , <%=session.getAttribute("name") %> </h3> <br>
                
            </center>
                 <input type="submit" name="Addcourses" value="Add Courses"><br><br>
        </form>
    
    </body>













</html>