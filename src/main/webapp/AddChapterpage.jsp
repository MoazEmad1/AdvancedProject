<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action ="AdminServlet">

<input type="submit" name="back" value="Return To Main Page"><br><br>
<%
try {
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
	Statement s = con.createStatement();
	ResultSet rs=null;
	String sql="SELECT * FROM course";
	rs=s.executeQuery(sql);
	%>
	<select name="coursename">
	<%
	while(rs.next()){
	
	String coursename = rs.getString("course_name");
	
	%>
	<option><%=coursename %> </option> 
	<% 
	
	
	
	}
	%>
	</select>
	<%
	sql="";
	s.executeUpdate(sql);
	con.close();
} catch (ClassNotFoundException e) {
	System.out.println("class not found");
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



%>
<br><br>

Add Chapter Name <input type="text" name="ChapterName" >
<br><br>
Add Explanation <input type="text" name="ChapterEx" >
<input type = "submit" name = "AddChaptersubmit" >

</form>
</body>
</html>