<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form  method="post" action ="AdminServlet">
<h1>new admin</h1> <input type="submit" name="back" value="Return To Main Page"><br><br>
first name  <input type = "text" name="firstname" placeholder= "firstname"><br><br>
username  <input type = "text" name="username" placeholder= "username"><br><br>
email <input type = "text" name="Email" placeholder= "email"><br><br>
password <input type = "password" name="password" ><br><br>
confirm password <input type = "password" name="confirmpassword" ><br><br>
activate admin: <input type="submit" name="newadmin" value="new Admin">
</form>
</body>
</html>