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
    padding: 10px;
    border-radius: 30px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    max-width: 400px;
    max-height: 800;
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
    margin-top: 15px;
  }
  
  h3 {
    margin:-1rem 0rem 0rem 0rem
  }
  .sin{
  margin: 0
  }
   input[type="submit"]:hover {
			background-color: #204d74;
		}
   
</style>


<head> <link rel="icon" href="hhhh.ico" type="image/x-icon"><title>Sign Up</title></head>

    <body>
    
        <form method="post" action="homepageservlet">
            <center>
            	
             <img src="finalimg.png" alt="Image description"width=400 height=200 >	
                <h3>Please Fill Data Fields</h3>
                First Name : <input type="text" name="firstname" placeholder="First Name">
                Last Name : <input type="text" name="lastname" placeholder="Last Name">
                  Username : <input type="text" name="username" placeholder="Username">
                 Email : <input type="text" name="email" placeholder="Email">
                Password : <input type="password" name="password" placeholder="Password">
                 Confirm Password : <input type="password" name="confirmpassword" placeholder="Re enter Password">
               <div> <input type="submit" name="signupcheck" value="Sign Up" class = sin></div>
                
            </center>            
        </form>
    </body>
</html>