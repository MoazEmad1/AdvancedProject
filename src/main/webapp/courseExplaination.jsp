<%@page import="com.mysql.cj.protocol.Resultset.Concurrency"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<style>


 html, body {
    background: linear-gradient(to bottom, #2b9ada, #B3FFFF);
    font-family: Arial, sans-serif;
    height: 100%;
    margin: 0;
  }
  .backandhome{

  background: #27589C;
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
  padding: 12px 22px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: 0;
}
.next{
  background: #27589C;
  box-shadow: #5E5DF0 0 10px 20px -10px;
  box-sizing: border-box;
  border-radius:999px;
  color: #FFFFFF;
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
<head>
<meta charset="UTF-8">
<link rel="icon" href="hhhh.ico" type="image/x-icon"> <title><%="chapter "+session.getAttribute("chapterid") %></title>
</head>
<body>


	<form method="get" action="userpageservlet">
	
	<%
//	response.setHeader("Cache-Control", "no-cache, no-store");
  //  response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");
        if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
	
	<input type="submit" name="back" value="Home"class = backandhome> <input type="submit" name="backtocoursepage" value="back to course page" class = backandhome> <br><br>
		<h1>
			<% System.out.println(session.getAttribute("coursename"));//error %>
		</h1>
		<%
int chapterselected=Integer.parseInt(""+session.getAttribute("chapterid"));
Connection con ;
ResultSet rs = null; //the object that hold the record,records data
String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
String curriculum="";
String coursedescription="";
int i=1;
int flag=0;
int courseID=0;
try {
	
	Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
	// keep in mind the 3306 can differ between us so check first in XAMPP	
	
	
		Statement s = con.createStatement(); 
		String sql ="SELECT * FROM course WHERE course_name ='"+session.getAttribute("coursename")+"'";
		rs = s.executeQuery(sql); // stores records that follow the mysql code condition

		if (rs.next()) // check if there is a record stored in the object
		{
			
			 courseID=rs.getInt("id");
			
		}
		
		sql="SELECT * FROM chapter WHERE course_id ='"+courseID+"' ORDER BY id";
		rs=s.executeQuery(sql);
		while(rs.next()){
		if(i==chapterselected)
		{
			flag=1;
			curriculum=rs.getString("chapter_explanation");
			break;
		}
		i++;
		
		}
		
		if(flag==0)
		{
			request.getRequestDispatcher("Test.jsp").forward(request, response);
			
			
		}
		
		con.close();
		
		%>



		<h2>
			<%=curriculum%>
		</h2>
		<%
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
				// keep in mind the 3306 can differ between us so check first in XAMPP	
			
			int questioncount=0;
			 int answerscounter=1 ;
			 char choice='a';
			 i=0;
			 String[] rightanswer = new String[3];
			 int[] rightAnswerDifficulty=new int[3];
			 s = con.createStatement(); 
			System.out.println(chapterselected);
			sql="SELECT * FROM question WHERE course_id ='"+courseID+"' AND difficulty ='0' ORDER BY chapter_id";
			rs=s.executeQuery(sql);
			while (rs.next()) {
				if (i < ((chapterselected - 1) * 3)) {
					i++;
					continue;

				}
				
				if (questioncount > 2)
					break;

				String[] questionANDchoices = (rs.getString("question_text")).split("-");
				rightanswer[questioncount] = rs.getString("right_answer");
				rightAnswerDifficulty[questioncount]=rs.getInt("difficulty");
				//session.setAttribute(arg0, arg1)

				out.write(questionANDchoices[0] + "<br>");
				while (answerscounter < 4) {
		%>

		<input type="radio" name=<%=questioncount %> value=<%=choice%> > <%=questionANDchoices[answerscounter]%><br>

		<% 
					choice++;
					answerscounter++;
				}
				 choice='a';
				 answerscounter=1 ;
				 questioncount++;
				
			}
			
			
			
			session.setAttribute("rightanswers", rightanswer);
			session.setAttribute("rightAnswerDifficulty", rightAnswerDifficulty);
			
			
			con.close();

}
catch (ClassNotFoundException e) {
	System.out.println("class not found");
}

catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	System.out.println("al code atmn3");
}









%>
<br><br>
		<input type="submit" name="checkanswers" value="next" class = next>
	

	</form>






</body>
</html>