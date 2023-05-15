<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
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
            background-color: #336699;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            display: block;
            margin: 0 auto;
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
        
    </style>
</head>

<body>
    <form method="post" action="AdminServlet">
       <img src="finalimg.png" alt="Image description" width=400 height=130 style="display: block; margin: 0 auto;">
        <h3>Welcome, <%=session.getAttribute("name") %></h3>
        <input type="submit" name="logout" value="Log Out"><br><br>
        <input type="submit" name="Addcourses" value="Add Courses"><br><br>
        <input type="submit" name="Addchapters" value="Add Chapter"><br><br>
        <input type="submit" name="addquestion" value="Add Question"><br><br>
        <input type="submit" name="addAdmin" value="Add Admin">
    </form>
</body>
</html>