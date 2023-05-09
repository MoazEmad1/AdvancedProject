<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>

<head> <title> <%=session.getAttribute("coursename") %>  </title></head>

    <body>
    	
        <form method="get" action="userpageservlet">
        
        <%
      //  response.setHeader("Cache-Control", "no-cache, no-store");
       // response.setHeader("Pragma", "no-cache");
       // response.setHeader("Expires", "0");
        if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
        
        <input type="submit" name="back" value="Home"><input type="submit" name="browsecourses" value="back"><br><br>
            <center>
                <h1> <%=session.getAttribute("coursename") %> </h1><br>
            <%
            	Connection con ;
        		ResultSet rs = null; //the object that hold the record,records data
        		String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
        		String coursecode="";
        		String coursedescription="";
        		int courseID=0;
        		try {
        			
        			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
        			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        			// keep in mind the 3306 can differ between us so check first in XAMPP	
        			
        			
        				Statement s = con.createStatement(); 
        				String sql ="SELECT * FROM course WHERE course_name ='"+session.getAttribute("coursename")+"'";
        				rs = s.executeQuery(sql); // stores records that follow the mysql code condition

        				if (rs.next()) // check if there is a record stored in the object
        				{
        					 coursecode = rs.getString("course_code");
        					 coursedescription = rs.getString("course_description");
        					 courseID=rs.getInt("id");
        					
        					
        					
        				}
        					

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
           
           
           
           
           
           
           
           
           
                <h4> <%=coursecode%> </h4> <br>
                 <h3> <%=coursedescription%> </h3> <br>
                
            </center>
                
            <%
          
       
        		try {
        			
        			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
        			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        			// keep in mind the 3306 can differ between us so check first in XAMPP	
        			
        			
        				Statement s = con.createStatement(); 
        				String sql ="SELECT * FROM chapter WHERE course_id ='"+courseID+"'";
        				rs = s.executeQuery(sql); // stores records that follow the mysql code condition
						int i =1;
        				while (rs.next()) // check if there is a record stored in the object
        				{
        					
        					%>
        					<input type=submit name="chapterselected" value="<%="chapter "+i+""%>"><br><br>
        					<%
        					
        					
        					
        					
        				i++;	
        					
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
             <input type=submit name="test" value="Test">   
        
            
            
        </form>
    
    
    
    
    
    
    </body>













</html>