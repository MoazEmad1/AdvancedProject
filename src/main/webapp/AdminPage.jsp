<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head> <title>Admin Page</title></head>

    <body>
    
     <%
 	//response.setHeader("Cache-Control", "no-cache, no-store");
     //response.setHeader("Pragma", "no-cache");
     //response.setHeader("Expires", "0");
        
                
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
    
        <form method="post" action ="AdminServlet">
        
        
            <center>
                <h1>Courses Overflow</h1><br><br>
                <h3>Welcome , <%=session.getAttribute("name") %> </h3>    <input type="submit" name="logout" value="Log Out"><br><br> <br>
                
            </center>
                 <input type="submit" name="Addcourses" value="Add Courses"><br><br>
                 <input type="submit" name="Addchapters" value = "Add chapter"><br><br>
                 <input type="submit" name="addquestion" value="Add question"><br><br>
                 <input type="submit" name="addAdmin" value="Add Admin"><br><br>
                 
        </form>
    
    </body>













</html>