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
<style>
 html, body {
background: linear-gradient(to bottom, #2b9ada, #B3FFFF);
    font-family: Arial, sans-serif;
    margin: 0;
    height: auto;
  }

  h1 {
    text-align: center;
  }

  table {
    margin: 20px auto;
    border-collapse: collapse;
    width: 80%;
    background-color: #fff;
  }

  th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  th {
    background-color: #364f6b;
    color: #fff;
  }

 tbody tr {
    background-color: #f5f5f5;
  }
a {
   background-color: #364f6b;
    border: 0;
    border-radius: 56px;
    color: #fff;
    cursor: pointer;
    font-family: system-ui, -apple-system, system-ui, "Segoe UI", Roboto, Ubuntu, "Helvetica Neue", sans-serif;
    font-size: 18px;
    font-weight: 600;
    outline: 0;
    padding: 12px 18px;
    text-align: center;
    text-decoration: none;
    transition: all .3s;
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
    display: block;
  text-align: center;
  margin: 20px auto;
  max-width: 200px;
}
.btn1{

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
<meta charset="UTF-8">
<link rel="icon" href="hhhh.ico" type="image/x-icon"><title>Your Progress</title>
</head>
<body>

<form action="userpageservlet" method="get">
<%
//	response.setHeader("Cache-Control", "no-cache, no-store");
  //  response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");
        if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
<input type="submit" name="back" value="back" class = btn1>

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