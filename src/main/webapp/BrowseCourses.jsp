<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>


<!DOCTYPE html>
<html>

<head> <title>Browse Courses</title></head>

    <body>
    
        <form method="get" action="userpageservlet">
            <center>
                <h1>Courses Overflow</h1><br><br>
                <h3>Our Courses</h3> <br>
                
           
                
                
            <%
          		Connection con ;
        		ResultSet rs = null; //the object that hold the record,records data
        		String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
        		
        		try {
        			
        			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
        			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        			// keep in mind the 3306 can differ between us so check first in XAMPP	
        			
        			
        				Statement s = con.createStatement(); 
        				String sql ="SELECT * FROM course";
        				rs = s.executeQuery(sql); // stores records that follow the mysql code condition

        				while (rs.next()) // check if there is a record stored in the object
        				{
        					String coursename = rs.getString("course_name");
        					
        					%>
        					<input type="submit" name="selectcourse" value="<%=coursename%>"   >	
        					
        					<%
        					
        					
        				}
        					con.close(); // closes the connection to avoid unnessecary load on memory
        				
        				
        					
        				
        			 

        		}
        		catch (ClassNotFoundException e) {
        			System.out.println("class not found");
        		}
        		
        		catch (SQLException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        			System.out.println("al code atmn3");
        		}
        		
        		
        	

            
            
            
            
            %>    
        
             </center>
            
        </form>
    
    
    
    
    
    
    </body>













</html>