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
    .button-container {
    display: flex;
    justify-content: center;
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
			padding: 30px;
			border-radius: 30px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
			max-width: 600px;
			margin: 0 auto;
			 position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
   display: flex;
  flex-direction: column;
  align-items: center;
		}
		
		
	label {
			display: block;
			font-weight: bold;
			margin-bottom: 10px;
		}
	input[type="text"]{
			padding: 10px;
			border-radius: 5px;
			border: none;
			margin-bottom: 20px;
			width: 100%;
			box-sizing: border-box;
			font-size: 16px;
			background-color: #f2f2f2;
			border: 1px solid #000000;
		}
		.btn1{
		margin: 0rem 2rem 0rem 0rem
		}
</style>
<head>
<meta charset="UTF-8">
<link rel="icon" href="hhhh.ico" type="image/x-icon">
<title>Make Feed Back</title>
</head>
<body>
<form action="userpageservlet" method="get">
 <img src="finalimg.png" alt="Image description"width=400 height=200 >	
write feedback: <br>
<input type="text" name= "sendfeedback">
  <div class="button-container">
      <input type="submit" name="backfeedbackafter" value="send" class="btn1">
      <input type="submit" name="backfeedback" value="back" >
    </div>



</form>
</body>
</html>