<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Test</title>
</head>
<body>
	<form method="get" action="Questions.jsp">
		<center>
			<h1>
				<%
				out.print(session.getAttribute("coursename"));
				%>
			</h1><br/><br/><br/>
			<input type="submit" name="easy" value="Easy questions">
		<input type="submit" name="medium" value="Medium questions">
		<input type="submit" name="hard" value="Hard questions"><br/><br/>
		<input type="submit" name="random" value="Random questions"><br/>
		</center>
	</form>
</body>
</html>