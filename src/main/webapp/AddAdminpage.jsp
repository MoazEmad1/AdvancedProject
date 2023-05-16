<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="icon" href="hhhh.ico" type="image/x-icon"><title>New Admin</title>
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
		
		input[type="text"],
		input[type="password"] {
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
	</style>
</head>
<body>

<%
 	//response.setHeader("Cache-Control", "no-cache, no-store");
    // response.setHeader("Pragma", "no-cache");
    // response.setHeader("Expires", "0");
        
                
        if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>

	<form method="post" action="AdminServlet">
		<h1>New Admin</h1>
		<label for="firstname">First Name:</label>
		<input type="text" id="firstname" name="firstname" placeholder="First Name" >
		
		<label for="username">Username:</label>
		<input type="text" id="username" name="username" placeholder="Username" >
		
		<label for="Email">Email:</label>
		<input type="text" id="Email" name="Email" placeholder="Email" >
		
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" placeholder="Password" >
		
		<label for="confirmpassword">Confirm Password:</label>
		<input type="password" id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" >
		
		<input type="submit" name="newadmin" value="Create Admin">
		
		<input type="submit" name="back" value="Return to Main Page">
	</form>
</body>
</html>