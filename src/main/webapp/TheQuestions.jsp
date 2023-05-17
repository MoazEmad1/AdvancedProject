<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<link rel="icon" href="hhhh.ico" type="image/x-icon"><title>The Questions</title>
</head>
<body>
	<form action="userpageservlet" method="get">
	
	<%
//	response.setHeader("Cache-Control", "no-cache, no-store");
  //  response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "0");
        if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
        
        
        %>
	
		<%
		int count = (int) session.getAttribute("count");
		ResultSet rs=(ResultSet)session.getAttribute("rs");
		int answerscounter=1 ;
		char choice='a';
		String[] rightanswer = new String[5];
		int[] rightAnswerDifficulty=new int[5];
		int i = 0;
	//	while (i < (count * 5)) {
	//		rs.next();
	//		i++;
	//	}
		count++;
		session.setAttribute("count", count);
		System.out.println("count = "+count);
		
		i=0;
		int j =0;
		int checker=0;
		int questionsDisplayed=(int)session.getAttribute("questionsDisplayed");
		while(i<5 ){
			checker++;
			rs.next();
			if(rs.isAfterLast()==false){
			System.out.print(""+checker);
			System.out.println("ok");
			String[] questionANDchoices = (rs.getString("question_text")).split("-");
			rightanswer[i] = rs.getString("right_answer");
			rightAnswerDifficulty[i]=rs.getInt("difficulty");

			out.write(questionANDchoices[0] + "<br>");
			while (answerscounter < 4) {
	%>

		<input type="radio" name=<%=i%> value=<%=choice%> required> <%=questionANDchoices[answerscounter]%><br>
		<% 
				choice++;
				answerscounter++;
			}
			 choice='a';
			 answerscounter=1 ;
			 j++;
		%>
		<%
		session.setAttribute("rightanswers", rightanswer);
		session.setAttribute("rightAnswerDifficulty", rightAnswerDifficulty);
		}
			 i++;
			 questionsDisplayed++;
		}
		session.setAttribute("questionsDisplayed", questionsDisplayed);
		session.setAttribute("qcount", j);
		%>
		<input type="submit" name="nextQuestions" value="Next">
	</form>
</body>
</html>