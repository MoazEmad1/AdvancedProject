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
		
		a {
  color: #336699;
  text-decoration: none;
  font-size: 20px;
}

a:hover {
  text-decoration: underline;
}
       input[type="submit"]:hover {
			background-color: #204d74;
		}
   
   
</style>

<head> <link rel="icon" href="hhhh.ico" type="image/x-icon"><title>Courses Overflow</title></head>

    <body>
    	<% session.invalidate(); %>
        <form method="post" action="homepageservlet">
<img src="finalimg.png" alt="Image description" width=400 height=200 style="display: block; margin: 0 auto;">
             
                <h3>welcome to courses overflow where we here aim<br> to make it 
                easier to learn any course or field for free</h3> <br>
                
              <center>  <input type="submit" name="login" value="Log in">
                <br><br>
                
                <input type="submit" name="signup" value="Sign Up">
        </center>
            
            
        </form>
    
    
    
    
    
    
    </body>













</html>