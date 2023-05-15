<%@page import="Project.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<html>

<head> <title>User Page</title></head>

    <body>
    
        <form method="get" action="userpageservlet">
        
        <%
       // response.setHeader("Cache-Control", "no-cache, no-store");
       // response.setHeader("Pragma", "no-cache");
        //response.setHeader("Expires", "0");
        if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
        
        <%
        Connection con1 ;
		ResultSet rs3 = null; //the object that hold the record,records data
		String points="";
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
			con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			// keep in mind the 3306 can differ between us so check first in XAMPP	
			
			
				Statement s1 = con1.createStatement();
				rs3 = s1.executeQuery("SELECT * FROM student WHERE id = '"+session.getAttribute("studentID")+"'"); // stores records that follow the mysql code condition
				rs3.next();
				points=rs3.getString("points");
				
				con1.close(); // closes the connection to avoid unnessecary load on memory
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
        
        
            <center>
                <h1>Courses Overflow</h1><br><br>
                <h3>Welcome , <%=session.getAttribute("name") +" , your points : "+ points %></h3>    <input type="submit" name="logout" value="Log out"> <br>
                
            </center>
                 <input type="submit" name="browsecourses" value="Browse Courses"><br><br>
                
                <input type="submit" name="history" value="Your Time on Courses OverFlow">
                
              <br>  recent opened courses <br>
                
                <% 
          		Connection con ;
        		ResultSet rs1 = null; //the object that hold the record,records data
        		ResultSet rs2 = null;
        		String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
        		
        		try {
        			
        			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
        			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        			// keep in mind the 3306 can differ between us so check first in XAMPP	
        			
        			
        				Statement s1 = con.createStatement();
        				Statement s2 = con.createStatement(); 
        				String sql ="SELECT * FROM takes WHERE student_id = '"+session.getAttribute("studentID")+"' ";
        				rs1 = s1.executeQuery(sql); // stores records that follow the mysql code condition

        				while (rs1.next()) // check if there is a record stored in the object
        				{
        					int courseID=rs1.getInt("course_id");
        					String sql2 ="SELECT * FROM course WHERE id = '"+courseID+"' ";
            				rs2 = s2.executeQuery(sql2); // stores records that follow the mysql code condition
							rs2.next();
            				
        					String coursename = rs2.getString("course_name");
        					
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
        </form>
    </body>
</html>