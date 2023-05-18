<%@page import="Project.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
      <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<html>
<head>
<meta charset="UTF-8">
<title>Feed back</title>
</head>
<body>
<form action="AdminServlet" method="post">
<input type="submit"name="backtofeedback" value="back">
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
		String sql ="SELECT * FROM feedbacks WHERE id ='"+session.getAttribute("feedbackid")+"'";
		rs = s.executeQuery(sql); // stores records that follow the mysql code condition

		rs.next();
		session.setAttribute("feeduser", rs.getInt("sender_id"));
		%>
		<h3><%=rs.getString("Feedback") %></h3><br><br>
		Reply : <br>
		<input type="text" name="reply">
		<input type="submit" name="sendreply">
		<%
		
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