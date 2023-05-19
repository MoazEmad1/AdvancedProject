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
<head>
<meta charset="UTF-8">
<title>Feedback</title>
</head>
<body>

<form action="AdminServlet" method="post">

<input type="submit"name="back" value="back">
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
</form>


</body>
</html>