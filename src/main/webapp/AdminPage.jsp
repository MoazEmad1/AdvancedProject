<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="hhhh.ico" type="image/x-icon"><title>Admin Page</title>
    <style>
       body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  font-weight: bold;
  color: black;
}

        h1 {
          
            margin-top: 40px;
            margin-bottom: 20px;
            text-align: center;
        }

        h3 {
            color: #336699;
            margin-top: 20px;
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
        h3 {
  margin-top: 20px;
  margin-bottom: 20px;
  text-align: center;
  font-weight: bold;
  color: black;
}
input[type="submit"][name="logout"] {
    background-color: red;
}
         input[type="submit"][name = logout]:hover {
            background-color:#8B0000;
        }
         .bold-underlined {
        font-weight: bold;
        text-decoration: underline;
        font-size:20px;
      }
   
    </style>
</head>

<body>
    <form method="post" action="AdminServlet">
       <img src="finalimg.png" alt="Image description" width=400 height=200 style="display: block; margin: 0 auto;">
       <center>  <p class="bold-underlined">Welcome <%=session.getAttribute("name") %></p></center>
       <center> <input type="submit" name="Addcourses" value="Add Courses"><br><br>
        <input type="submit" name="Addchapters" value="Add Chapter"><br><br>
        <input type="submit" name="addquestion" value="Add Question"><br><br>
        <input type="submit" name="addAdmin" value="Add Admin"><br><br>
        <input type="submit" name="logout" value="Log Out">
        </center>
    </form>
</body>
</html>