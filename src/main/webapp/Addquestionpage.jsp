<%@page import="java.util.ArrayList"%>
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
<title>Add Question</title>
</head>
<body>

<form action="AdminServlet" method="post">
<input type="submit" name="back" value="Return To Main Page"><br><br>

 <%
 	//response.setHeader("Cache-Control", "no-cache, no-store");
     //response.setHeader("Pragma", "no-cache");
     //response.setHeader("Expires", "0");
        
                
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
    

<%
try {
	//ArrayList <String> arrayList  = new ArrayList<String>() ;
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
	Statement s = con.createStatement();
	Statement s1 = con.createStatement();
	ResultSet rs=null;
	ResultSet rs1=null;
	String sql="SELECT * FROM chapter";
	rs=s.executeQuery(sql);
	%>
	Select Course : <select name="chaptername">
	<%
	while(rs.next()){
	
	rs1=s1.executeQuery("SELECT * FROM course WHERE id='"+rs.getString("course_id")+"' ");
	rs1.next();
	%>
	<option><%= rs.getString("chapter_name")+" / "+rs1.getString("course_name") %> </option> 
	<% 
		
	}

	
	%>
	</select>
	<%
	
	
	
	con.close();
} catch (ClassNotFoundException e) {
	System.out.println("class not found");
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



%>

<input type="text" name="question_text" placeholder="enter question">
right answer : <select name="rightanswer">
<option>a</option>
<option>b</option>
<option>c</option>

</select>	
Difficulty : <select name="difficulty">
<option>1</option>
<option>2</option>
<option>3</option>

</select>	
<br>
<input type="submit" name="anotherquestion" value="Add another">

<input type="submit" name="finishquestion" value="End">
	





</form>



</body>
</html>