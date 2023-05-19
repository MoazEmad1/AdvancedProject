<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>


<html>
<head><link rel="icon" href="hhhh.ico" type="image/x-icon">
<meta charset="ISO-8859-1">
<title>Add Chapter</title>
<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
		}
		
		h1 {
			color: #336699;
			margin-top: 40px;
			margin-bottom: 20px;
			text-align: center;
		}
		
		form {
			background-color: #fff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			max-width: 400px;
			margin: 0 auto;
		}
		
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 10px;
		}
		
		input[type="text"] {
			padding: 10px;
			border-radius: 5px;
			border: none;
			margin-bottom: 20px;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
			background-color: #f2f2f2;
		}
		
		input[type="submit"] {
		 background: #27589C;
  box-shadow: #5E5DF0 0 10px 20px -10px;
  box-sizing: border-box;
  color: #FFFFFF;
    border-radius: 999px;
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
		
		select {
			padding: 10px;
			border-radius: 5px;
			border: none;
			margin-bottom: 20px;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
			background-color: #f2f2f2;
		}
	</style>
</head>
<body>
<form method="post" action ="AdminServlet">
	<h1>New Chapter</h1><br>

 <%
 	//response.setHeader("Cache-Control", "no-cache, no-store");
    // response.setHeader("Pragma", "no-cache");
    // response.setHeader("Expires", "0");
        
                
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
    


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
Add Explanation <input type="text" name="ChapterEx" ><br>
<input type="text" name="q1" placeholder="enter question">
right answer : <select name="r1">
<option>a</option>
<option>b</option>
<option>c</option>

</select>	
	
<br>
<input type="text" name="q2" placeholder="enter question">
right answer : <select name="r2">
<option>a</option>
<option>b</option>
<option>c</option>

</select>	
	
<br>
<input type="text" name="q3" placeholder="enter question">
right answer : <select name="r3">
<option>a</option>
<option>b</option>
<option>c</option>
</select>

<br>
<input type = "submit" name = "AddChaptersubmit" >
<input type="submit" name="back" value="Return To Main Page"><br><br>
</form>
</body>
</html>