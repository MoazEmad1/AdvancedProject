<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><style>
html, body {
 background: linear-gradient(to bottom, #2b9ada, #B3FFFF);
			font-family: Arial, sans-serif;
  height: 100%;
  margin: 0;
  background-repeat: no-repeat;
}
.container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: linear-gradient(to bottom, #797EF6, #4ADEDE);
}


      
		form {
			background-color: #fff;
			padding: 30px;
			border-radius: 30px;	
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			max-width: 600px;
			margin: 0 auto;
			position: absolute;
  			top: 50%;
  			left: 50%;
  			transform: translate(-50%, -50%);
  			 justify-content: center;
  			  align-items: center;
		}
		
		label {
			display: block;
			font-weight: bold;
			margin-bottom: 10px;
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
			display: block;
			margin: 0 auto;

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
    input[type="submit"]:hover {
			background-color: #204d74;
		}
</style>

<head> <title>Courses Overflow</title></head>

    <body>
    	<% session.invalidate(); %>
        <form method="post" action="homepageservlet">
<img src="finalimg.png" alt="Image description" width=400 height=130 style="display: block; margin: 0 auto;">
             
                <h3>welcome to courses overflow where we here aim<br> to make it 
                easier to learn any course or field for free</h3> <br>
                
                <input type="submit" name="login" value="Log in">
                <br><br>
                
                <input type="submit" name="signup" value="Sign Up">
        
            
            
        </form>
    
    
    
    
    
    
    </body>













</html>