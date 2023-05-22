<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
<style>
html, body {
    background: linear-gradient(to bottom, #2b9ada, #B3FFFF);
    font-family: Arial, sans-serif;
    height: 100%;
    margin: 0;
         font-size: 20px;
    
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
  padding: 10px 18px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: 0;
}
.container {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  user-select: none;
   font-size: 16px;
}

.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

.checkmark {
  position: absolute;
  top: 50%;
  left: 0;
  transform: translateY(-50%);
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

.container:hover .checkmark {
  background-color: #ccc;
}

.container input:checked + .checkmark {
  background-color: #2196F3;
}

.container input:checked + .checkmark:after {
  display: block;
}

.container .checkmark:after {
  content: "";
  position: absolute;
  display: none;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: white;
}

</style>
<head>
<meta charset="windows-1256">
<link rel="icon" href="hhhh.ico" type="image/x-icon"><title>The Questions</title>
</head>
<body>

<script type="text/javascript">
  // Open the Google window
  function breakmessage() {
	  alert("Have some rest now");
	  setTimeout(studyaudio, 15000);
	  
	  }
  function studyaudio() {
	  var audio = new Audio("Testing2.mp3");
	    audio.preload='auto';
	    audio.play();
	    
	    setTimeout(breakmessage, 60000);
	    
	  }
  // Close the popup after 5 seconds
  setTimeout(breakmessage, 60000);
  
</script>

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
		if((int)session.getAttribute("total")==0)
			request.getRequestDispatcher("Test.jsp").include(request, response); // front
		
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
		int questionID[]=new int[5];
		while(i<5 ){
			checker++;
			rs.next();
			if(rs.isAfterLast()==false ){
			System.out.print(""+checker);
			System.out.println("ok");
			questionID[i]=rs.getInt("id");
			String[] questionANDchoices = (rs.getString("question_text")).split("-");
			rightanswer[i] = rs.getString("right_answer");
			rightAnswerDifficulty[i]=rs.getInt("difficulty");

			out.write(questionANDchoices[0] + "<br>");
			while (answerscounter < 4) {
	%>
<label class="container">
		<input type="radio" name=<%=i%> value=<%=choice%> required> 
 <span class="checkmark"></span>
 <%=questionANDchoices[answerscounter]%>
 </label>
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
		session.setAttribute("questionID",questionID);
		%>
		
		<input type="submit" name="nextQuestions" value="Next" class = next>
	</form>
</body>
</html>