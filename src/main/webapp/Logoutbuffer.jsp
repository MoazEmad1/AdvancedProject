<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><link rel="icon" href="hhhh.ico" type="image/x-icon"> 
    <style>
    html, body {
background: linear-gradient(to bottom, #2b9ada, #B3FFFF);
			font-family: Arial, sans-serif;
  height: 100%;
  margin: 0;
  background-repeat: no-repeat;
}
    body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			    font-size: 20px	;
			
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
		}	
				a {
  color: #336699;
  text-decoration: none;
  font-size: 20px;
}

a:hover {
  text-decoration: underline;
}	
		
    </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log Out</title>
        <script src="backNoWork.js" type="text/javascript"></script>
    </head>
    <body>
    <form>
    <center>
     <div class="image-container">
   <img src="finalimg.png" alt="Image description" width="550" height="300" style="display: block; margin: -50px auto 0 auto;" class="img">
</div>	
        <!-- this code clears the cache of your browser and also kills the session -->
        <%
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
            session.invalidate();
        %>
       <strong></a> You Successfully logged out <br> close the page or return to <a href="HomePage.jsp">Home Page</a>
</center>
    </form>
    </body>
</html>