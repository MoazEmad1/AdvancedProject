<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>The Questions</title>
</head>
<body>
	<form action="userpageservlet" method="get">
		<%
		int count = (int) request.getAttribute("count");
		ResultSet rs=(ResultSet)session.getAttribute("rs");
		int answerscounter=1 ;
		char choice='a';
		String[] rightanswer = new String[5];
		int[] rightAnswerDifficulty=new int[5];
		int i = 0;
		while (i < (count * 5)) {
			rs.next();
			i++;
		}
		count++;
		request.setAttribute("count", count);
		System.out.println("count = "+count);
		
		i=0;
		while(i<5 && rs.next()){ //||rs.next()
			System.out.println("ok");
			String[] questionANDchoices = (rs.getString("question_text")).split("-");
			rightanswer[i] = rs.getString("right_answer");
			rightAnswerDifficulty[i]=rs.getInt("difficulty");

			out.write(questionANDchoices[0] + "<br>");
			while (answerscounter < 4) {
	%>

		<input type="radio" name=<%=i%> value=<%=choice%>>
		<%=questionANDchoices[answerscounter]%><br>

		<% 
				choice++;
				answerscounter++;
			}
			 choice='a';
			 answerscounter=1 ;
			 i++;
			 
		%>
		<%
		}
		session.setAttribute("rightanswers", rightanswer);
		session.setAttribute("rightAnswerDifficulty", rightAnswerDifficulty);
		%>
		<%if(i==5){//WARNING we need to check if there's more questions%>
			<input type="submit" name="nextQuestions" value="Next">
		<%}else{%>
			<input type="submit" name="finish" value="Finish">
		<%} %>
	</form>
</body>
</html>