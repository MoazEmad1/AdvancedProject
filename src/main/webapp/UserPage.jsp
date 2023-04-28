<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head> <title>User Page</title></head>

    <body>
    
        <form method="get" action="userpageservlet">
            <center>
                <h1>Courses Overflow</h1><br><br>
                <h3>Welcome , <%=session.getAttribute("name") %> </h3> <br>
                
            </center>
                 <input type="submit" name="browsecourses" value="Browse Courses"><br><br>
                
                <input type="submit" name="userReport" value="Your Time on Courses OverFlow">
                
                
        
            
            
        </form>
    
    
    
    
    
    
    </body>













</html>