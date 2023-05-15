<%@page import="Project.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<html>
	<style>
		
		form {
			background-color: #fff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.8);
			max-width: 400px;
			margin: 0 auto;
		}
		
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 10px;
		}
		
		html, body {
		background: linear-gradient(to bottom, #2b9ada, #B3FFFF);
			font-family: Arial, sans-serif;
			height: 100%;
			margin: 0;
			background-repeat: no-repeat;
		}
		.logout {
			background-color: #8B0000;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			font-size: 20px;
			margin-top: 24px;
		}

		.btn1 {
			background-color: #D3D3D3;
			color: #000000;
			padding: 30px 50px;
			border: 1px solid #000000;
			border-radius: 10px;
			cursor: pointer;
			font-size: 20px;
			margin-top: 24px;
		}
.btn-container {
  display: flex;
  justify-content: center;

}

.btn2 {
  border: 1px solid;
  width: 50%;
  padding: 20px;
}
.time{
	background-color: #D3D3D3;
			color: #000000;
			padding: 30px 50px;
			border: 1px solid #000000;
			border-radius: 10px;
			cursor: pointer;
			font-size: 20px;
			margin-top: 24px;
}
	</style>
<head> <title>User Page</title></head>

    <body>
    
        <form method="get" action="userpageservlet">
       <center><div class="image-container">
    <img src="finalimg.png" alt="Image description" width="400" height="130" style="display: block; margin: 0 auto;">
    </center>
</div>

        
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
                <h3>Welcome , <%=session.getAttribute("name") +" , your points : "+ points %></h3>    
                <input type="submit" name="logout" value="Log out" class = "logout"> <br>
                
                 <input type="submit" name="browsecourses" value="Browse Courses" class = "btn1"><br><br>
            
            </center>
                 
         
<input type="submit" name="history" value="Your Time on Courses OverFlow" class = "time">   <br><br>
<center>Your recent courses</center><br>         
         
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
<div class="btn-container">
  <input type="submit" name="selectcourse" value="<%=coursename%>" class="btn2">
</div>
    			
        					<%
        				}
        					con.close();
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