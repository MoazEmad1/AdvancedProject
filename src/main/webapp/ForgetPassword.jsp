<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
 	
		
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
	input[type="text"]{
			padding: 10px;
			border-radius: 10px;
			border: none;
			margin-bottom: 20px;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
			background-color: #f2f2f2;
			  border: 1px solid #000000;
			
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
 display: inline-block;
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
    
    input[type="submit"]:hover {
			background-color: #204d74;
		}
		   .btn {
  display: block;
  margin: 0 auto;
}
   
</style>

<head><link rel="icon" href="hhhh.ico" type="image/x-icon"> <title>Sign Up</title></head>

    <body>
    
        <form method="post" action="homepageservlet">
        
              <img src="finalimg.png" alt="Image description"width=400 height=200 style="display: block; margin: 0 auto;">	
                <h3>Please Enter the Email Associated With The Account</h3> <br>
                
                <input type="text" name="email" placeholder="Email"><br><br>
                
                
                <input type="submit" name="forgetpassword" value="send">
                
                
        
            
            
        </form>
    
    
    
    
    
    
    </body>













</html>