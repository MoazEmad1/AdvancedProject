<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="hhhh.ico" type="image/x-icon"><title>Your Progress</title>
</head>
<body>

<form action="userpageservlet" method="get">

<input type="submit" name="back" value="back">

<table bgcolor="black">

<tr bgcolor="grey" align="center">

<th>From Date</th>
<th>Till Date</th>
<th>Questions Answered</th>
<th>Right Answers</th>
<th>Accuracy</th>
<th>Points Gained</th>


</tr>

<%
          		Connection con ;
        		ResultSet rs = null; //the object that hold the record,records data
        		String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
        		
        		try {
        			
        			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
        			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        			// keep in mind the 3306 can differ between us so check first in XAMPP	
        			
        			
        				Statement s = con.createStatement(); 
        				String sql ="SELECT * FROM history WHERE student_id = '"+session.getAttribute("studentID")+"' ORDER BY From_Time DESC";
        				rs = s.executeQuery(sql); // stores records that follow the mysql code condition

        				while (rs.next()) // check if there is a record stored in the object
        				{
        					
        					Timestamp logintime = rs.getTimestamp("From_Time");
        					Timestamp logouttime = rs.getTimestamp("Till_Time");

        					SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, d MMM yyyy HH:mm");

        					// format the Timestamp object as a string
        					String Loggedin = dateFormat.format(logintime);
        					String Loggedout = dateFormat.format(logouttime);
        					
        					int questioncount = rs.getInt("questionscount");
        					int rightanscount = rs.getInt("rightanswerscount");
        					int pointscount = rs.getInt("points");
        					String accuracy = rs.getString("accuracy");
        					
        					
        					%>
        					<tr bgcolor="lightgrey" align="center">
        						<td> <%=Loggedin %> </td>
								<td><%=Loggedout %></td>
								<td><%=questioncount %></td>
								<td><%=rightanscount %></td>
								<td><%=accuracy %></td>
								<td><%=pointscount %></td>
        					</tr>
        					
        					
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







</table>






</form>






</body>
</html>