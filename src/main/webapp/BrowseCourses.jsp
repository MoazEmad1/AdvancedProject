<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>


<!DOCTYPE html>
<html>
<style>

		 html, body {
    background: linear-gradient(to bottom, #2b9ada, #B3FFFF);
    font-family: Arial, sans-serif;
    height: 100%;
    margin: 0;
  }

 .course-button{
 background: #27589C;
  border-radius: 999px;
  box-shadow: #5E5DF0 0 10px 20px -10px;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  font-family: Inter,Helvetica,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Noto Color Emoji","Segoe UI Symbol","Android Emoji",EmojiSymbols,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue","Noto Sans",sans-serif;
  font-size: 16px;
  font-weight: 700;
  line-height: 24px;
  opacity: 1;
  outline: 0 solid transparent;
  padding: 8px 18px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: 0;

}
.image-container {
        background-color: white;
        border: 1px solid #333;
        border-radius: 10px;
        padding: 10px;
        display: inline-block;
         width: 300px; /* Adjust the width as per your preference */
        height: 100px; /* Adjust the height as per your preference */
        
              display: flex;
        justify-content: center;
    }
      .bold-underlined {
        font-weight: bold;
        text-decoration: underline;
      }
</style>

<head><link rel="icon" href="hhhh.ico" type="image/x-icon"> <title>Browse Courses</title></head>

    <body>
    
        <form method="get" action="userpageservlet">
       <center>  <div class="image-container">
   <img src="finalimg.png" alt="Image description" width="400" height="180" style="display: block; margin: -50px auto 0 auto;" class="img">
</div>	
        </center>
        <%
      //  response.setHeader("Cache-Control", "no-cache, no-store");
       // response.setHeader("Pragma", "no-cache");
        //response.setHeader("Expires", "0");
        if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
        
        
            <center>
           <br><br><br>
                
              <p class="bold-underlined">Our courses :</p>
           
                
                
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
        					
        					<input type="submit" name="selectcourse" value="<%=coursename%>" class = course-button  >	
        					
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
            <br><br>
            <center>     <input type="submit" name="back" value="Return To Main Page" class = course-button></center>
        </form>
    
    
    
    
    
    </body>













</html>