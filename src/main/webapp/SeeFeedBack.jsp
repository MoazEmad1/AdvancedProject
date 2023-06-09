<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Project.Database"%>
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
  
  .container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: linear-gradient(to bottom, #797EF6, #4ADEDE);
    background-repeat: no-repeat;
  }
  
  form {
    background-color: #fff;
    padding: 10px;
    border-radius: 30px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    max-height: 800;
    margin: 0 auto;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  
  label {
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
  }
  
  input[type="text"],
  input[type="password"] {
    padding: 10px;
    border-radius: 10px;
    border: none;
    margin-bottom: 20px;
    width: 100%;
    box-sizing: border-box;
    font-size: 16px;
    background-color: #f2f2f2;
  }
  
  input[type="submit"] {
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
  
  h3 {
    margin:-1rem 0rem 0rem 0rem
  }
  .sin{
  margin: 0
  }
   input[type="submit"]:hover {
			background-color: #204d74;
		}
 
</style>


</style>
<head>
<meta charset="UTF-8">
<title>Feedback</title>
</head>
<body>

<form action="AdminServlet" method="post">

<%
//	response.setHeader("Cache-Control", "no-cache, no-store");
  //  response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
<table>
<tr>

<th>course name</th>
<th>feedback date</th>
<th>View Feedback</th>
</tr>

<%

Connection con ;
ResultSet rs = null; //the object that hold the record,records data
String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to

try {
	Database d = new Database();
	Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
	// keep in mind the 3306 can differ between us so check first in XAMPP	
	
	
		Statement s = con.createStatement(); 
		String sql ="SELECT * FROM feedbacks";
		rs = s.executeQuery(sql); // stores records that follow the mysql code condition

		while (rs.next()) // check if there is a record stored in the object
		{
			String coursename = d.getCoursename(rs.getInt("course_id"));
			Timestamp t = rs.getTimestamp("feedback_time");

			SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, d MMM yyyy HH:mm");

			// format the Timestamp object as a string
			String time = dateFormat.format(t);
			%>
			<tr>
			<td>
			<%=coursename %>	
			</td>
			
			<td>
			<%=time %>	
			</td>
			
			<td>
			<input type="submit" name="feedbackselected" value="<%=rs.getInt("id")%>" >	
			</td>
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
<input type="submit"name="back" value="back">
</form>


</body>
</html>