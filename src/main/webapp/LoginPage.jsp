<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
 	
		
html, body {
 background: linear-gradient(to bottom, #797EF6, #4ADEDE);
			font-family: Arial, sans-serif;
  height: 100%;
  margin: 0;
}

.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: linear-gradient(to bottom, #797EF6, #4ADEDE);
  background-repeat: no-repeat;
}

      
		form {
			background-color: #fff;
			padding: 150px;
			border-radius: 50px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			max-width: 600px;
			margin: 0 auto;
			 position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
		}
		
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 10px;
		}
		
		input[type="text"],
		input[type="password"] {
			padding: 10px;
			border-radius: 10px;
			border: none;
			margin-bottom: 20px;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
			background-color: #f2f2f2;
		}
		input[type="submit"] {
			background-color: #336699;
			color: #fff;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 20px;
			margin-top: 24px;
		}
		
		a {
  color: #336699;
  text-decoration: none;
  font-size: 20px;
}

a:hover {
  text-decoration: underline;
}
    }
    
   
</style>

<head> <title>Log in</title></head>

    <body>
    
        <form method="post" action="homepageservlet">
            <center>
                <h1>Courses Overflow</h1><br><br>
                <h3>Please Enter Your Account Data</h3> <br>
                Username <input type="text" name="username" placeholder="Username"><br><br>
                Password <input type="password" name="password" placeholder="Password"><br><br>
                <a href=ForgetPassword.jsp>Forget Password?</a><br><br>
                <input type="submit" name="logincheck" value="Log in">
            </center>
        </form>
    </body>
</html>