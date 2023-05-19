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
    body {
        background-color: #cfe2f3;
        color: #000000;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th {
        background-color: #85a9cf;
        color: #ffffff;
        padding: 10px;
    }
    td {
        background-color: #ffffff;
        padding: 10px;
    }
    input[type="submit"] {
        background-color: #85a9cf;
        color: #ffffff;
        padding: 10px;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #6088b8;
    }
    h1 {
        text-align: center;
        font-size: 32px;
        margin-top: 20px;
        margin-bottom: 30px;
        color: #60851b4;
    }
</style>
<meta charset="windows-1256">
<title>Insert title here</title>
</head>
<body>
<form action="userpageservlet" method="get">

<input type="submit" name="back" value="back">

<table bgcolor="black">

<tr bgcolor="grey" align="center">
<h1 align="center"> Leaderboard</h1>
<th>Username</th>
<th>Points</th>
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
		String sql ="SELECT * FROM student ORDER BY points DESC";
		rs = s.executeQuery(sql); // stores records that follow the mysql code condition
		int i=0;
		while (i<10) // check if there is a record stored in the object
		{
			rs.next();
			
			String username=rs.getString("username");
			int points=rs.getInt("points");
			
			%>
			<tr bgcolor="lightgrey" align="center">
				<td> <%=username %> </td>
				<td><%=points %></td>
			</tr>
			
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
</table>
</body>
</html>