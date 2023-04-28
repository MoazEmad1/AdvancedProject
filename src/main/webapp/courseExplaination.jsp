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
<head>
<meta charset="UTF-8">
<title><%="chapter "+request.getAttribute("chapterid") %></title>
</head>
<body>

	<form method="get" action="userpageservlet">
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

		<input type="radio" name=<%=questioncount %> value=<%=choice%>>
		<%=questionANDchoices[answerscounter]%><br>

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
		<input type="submit" name="checkanswers" value="next">
	

	</form>






</body>
</html>