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
<link rel="icon" href="hhhh.ico" type="image/x-icon"><title>Add Question</title>
</head>

 <%
 //	response.setHeader("Cache-Control", "no-cache, no-store");
   //  response.setHeader("Pragma", "no-cache");
    // response.setHeader("Expires", "0");
        
                
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>

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
		select {
  padding: 10px;
  border-radius: 5px;
  border: none;
  margin-bottom: 20px;
  width: 100%;
  box-sizing: border-box;
  font-size: 16px;
  background-color: #f2f2f2;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-image: url("data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30' width='15'><path d='M15 21L4 10h22z' fill='%23336699'/></svg>");
  background-repeat: no-repeat;
  background-position: calc(100% - 10px) center;
}
	   input[type="submit"]:hover {
			background-color: #204d74;
		}
   	

</style>
<body>

<form action="AdminServlet" method="post">
<h1>New Question</h1>
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

<input type="text" name="question_text" placeholder="enter question"><br><br>
Right Answer : <select name="rightanswer">
<option>a</option>
<option>b</option>
<option>c</option>

</select>	<br><br>
Difficulty : <select name="difficulty">
<option>1</option>
<option>2</option>
<option>3</option>

</select>
<br>
<input type="submit" name="anotherquestion" value="Add another">
<input type="submit" name="finishquestion" value="End"><br><br>
	<input type="submit" name="back" value="Return To Main Page"><br><br>





</form>



</body>
</html>