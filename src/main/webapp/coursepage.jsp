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
  .chapter{
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
 padding: 12px 22px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: 0;
  }
.test{
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
  padding: 12px 22px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: 0;
}
.backandhome{

  background: #27589C;
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
  padding: 12px 22px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: 0;
}
input[type="submit"]:hover {
			background-color: #204d74;
		}
</style>

<head> <link rel="icon" href="hhhh.ico" type="image/x-icon"><title> <%=session.getAttribute("coursename") %>  </title></head>

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
       
        <input type="submit" name="back" value="Home" class = backandhome><input type="submit" name="dofeedback" value="Make FeedBack" class = backandhome><br><br>
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
                <center>
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
        			<input type=submit name="chapterselected" value="<%="chapter "+i+""%>" class = chapter>
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
             <input type=submit name="test" value="Test" class= test>   
        
            </center>
            
        </form>
    
    
    
    
    
    
    </body>













</html>