<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
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
    height: 98.5%;
    margin: 0;
  }
.btn1{
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
  .backandhome{

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
<head>
<meta charset="windows-1256">
<link rel="icon" href="hhhh.ico" type="image/x-icon"><title>Test</title>
</head>
<body>
	<form method="get" action="Questions.jsp">
	<input type="submit" name="back" value="Home"class = backandhome> <input type="submit" name="backtocoursepage" value="back to course page" class = backandhome> <br><br>
	
	<%
	//response.setHeader("Cache-Control", "no-cache, no-store");
    //response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");
        if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
	
		<center>
			<h1>
				<%
				out.print(session.getAttribute("coursename"));
				%>
			</h1><br/><br/><br/>
			<input type="submit" name="easy" value="Easy questions"class = btn1>
		<input type="submit" name="medium" value="Medium questions"class = btn1>
		<input type="submit" name="hard" value="Hard questions"class = btn1><br/><br/>
		<input type="submit" name="random" value="Random questions"class = btn1><br/>
		</center>
	</form>
</body>
</html>