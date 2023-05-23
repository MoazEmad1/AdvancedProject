package Project;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class userpageservlet
 */
@WebServlet("/userpageservlet")
public class userpageservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Database d=new Database();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
//		response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
//        response.setHeader("Pragma", "no-cache");
//        response.setHeader("Expires", "0");
	//	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	       
		HttpSession session = request.getSession();
		
		if(session.getAttribute("studentID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
		
		else if(request.getParameter("logout")!=null)
		{
			// matnsash t2fl kol al sessions
			
			
			String loginTime = (String)session.getAttribute("LoginTime");
			int questioncounter = (int)session.getAttribute("questionshistory");// history FF
			int rightanswerscounter = (int)session.getAttribute("rightanswershistory");// history FF
			int pointscounter = (int)session.getAttribute("pointshistory");// history FF
			
			
			d.storehistory((int)session.getAttribute("studentID"),loginTime,questioncounter,rightanswerscounter,pointscounter);// history FF
			
			session.removeAttribute("logintime");// history FF
			session.removeAttribute("questionshistory");// history FF
			session.removeAttribute("rightanswershistory");// history FF
			session.removeAttribute("pointshistory");// history FF
			
			session.removeAttribute("studentID");
			session.invalidate();
			request.getRequestDispatcher("Logoutbuffer.jsp").forward(request, response);
			
		}
		
		
		else if(request.getParameter("back")!=null)
		{
			request.getRequestDispatcher("UserPage.jsp").forward(request, response);
			
		}
		
		
		else if(request.getParameter("backtocoursepage")!=null)
		{
			request.getRequestDispatcher("coursepage.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("browsecourses")!=null)
		{
			request.getRequestDispatcher("BrowseCourses.jsp").forward(request, response);
			
		}
		
		
		else if(request.getParameter("history")!=null)
		{
			request.getRequestDispatcher("YourTimeOnCoursesOverflow.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("leaderboard")!=null) {
			request.getRequestDispatcher("Leaderboard.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("selectcourse")!=null)
		{
			String[] name =request.getParameterValues("selectcourse");
			session.setAttribute("coursename", name[0]);
			session.setAttribute("courseID", d.getCourseID(""+session.getAttribute("coursename")));
			request.getRequestDispatcher("coursepage.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("backfeedback")!=null)
		{
			request.getRequestDispatcher("coursepage.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("dofeedback")!=null)
		{
			request.getRequestDispatcher("MakeFeedBack.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("backfeedbackafter")!=null)
		{
			if((""+request.getParameter("sendfeedback")).length()<10) {
			    out.write("<div class=\"error-container\" style=\"position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;\">");
		        out.write("<p class=\"error-message\" style=\"font-weight: bold; color: red;\">Please enter a feedback that has more than 10 letters</p>");
		        out.write("</div>");
				request.getRequestDispatcher("MakeFeedBack.jsp").include(request, response);
			}else {
			d.makefeedback((int)session.getAttribute("studentID"),request.getParameter("sendfeedback"), (int)session.getAttribute("courseID"));
			request.getRequestDispatcher("coursepage.jsp").forward(request, response);}
		}
		
		
		else if(request.getParameter("chapterselected")!=null)
		{
			d.attachCourseToStudent(""+session.getAttribute("coursename"),""+session.getAttribute("studentID"));
			String[] chapter =request.getParameterValues("chapterselected");
			String[] chapterid =chapter[0].split(" ");
			//System.out.println(chapterid[1]);
			//request.setAttribute("coursename", name[0]);
			session.setAttribute("chapterid", chapterid[1]);
			request.getRequestDispatcher("courseExplaination.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("test")!=null)
		{
			request.getRequestDispatcher("Test.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("next")!=null)
		{
			int chapterid = Integer.parseInt(""+session.getAttribute("chapterid"));
			chapterid++;
			session.setAttribute("chapterid",chapterid);
			response.sendRedirect("courseExplaination.jsp");
		}
		
		
		else if(request.getParameter("checkanswers")!=null)
		{
			
			int questioncounter = (int)session.getAttribute("questionshistory");// history FF
			
			
			int rightanswerscounter = (int)session.getAttribute("rightanswershistory");// history FF
			int pointscounter = (int)session.getAttribute("pointshistory");// history FF
			
			
			
			String rightanswers[] = (String[])session.getAttribute("rightanswers");
			int rightAnswerDifficulty[] = (int[])session.getAttribute("rightAnswerDifficulty");
			String username=(String) session.getAttribute("name");
			int points[]=new int[3];


			String q1[] =request.getParameterValues("0");
			String q2[] =request.getParameterValues("1");
			String q3[] =request.getParameterValues("2");
			
			if(q1==null || q2==null|| q3==null ) {
				out.write("Please answer the questions");
				request.getRequestDispatcher("courseExplaination.jsp").include(request, response);
			}
			else {
			out.print("<html><body><form action='userpageservlet' method='get'>");
			for (int i=0;i<3;i++) {
				points[i]=10;
				out.print("<style>");
			    out.print("html, body {");
			    out.print("background: linear-gradient(to bottom, #2b9ada, #B3FFFF);");
			    out.print("font-family: Arial, sans-serif;");
			    out.print("height: 100%;");
			    out.print("margin: 0;");
			    out.print("}");

			    out.print(".container {");
			    out.print("display: flex;");
			    out.print("flex-direction: column;");
			    out.print("justify-content: center;");
			    out.print("align-items: center;");
			    out.print("height: 100vh;");
			    out.print("background: linear-gradient(to bottom, #797EF6, #4ADEDE);");
			    out.print("background-repeat: no-repeat;");
			    out.print("}");

			    out.print("form {");
			    out.print("background-color: #fff;");
			    out.print("padding: 10px;");
			    out.print("border-radius: 30px;");
			    out.print("box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);");
			    out.print("max-width: 400px;");
			    out.print("max-height: 800;");
			    out.print("margin: 0 auto;");
			    out.print("position: absolute;");
			    out.print("top: 50%;");
			    out.print("left: 50%;");
			    out.print("transform: translate(-50%, -50%);");
			    out.print("}");

			    out.print("label {");
			    out.print("display: block;");
			    out.print("font-weight: bold;");
			    out.print("margin-bottom: 10px;");
			    out.print("}");

			    out.print("input[type=\"text\"],");
			    out.print("input[type=\"password\"] {");
			    out.print("padding: 10px;");
			    out.print("border-radius: 10px;");
			    out.print("border: none;");
			    out.print("margin-bottom: 20px;");
			    out.print("width: 100%;");
			    out.print("box-sizing: border-box;");
			    out.print("font-size: 16px;");
			    out.print("background-color: #f2f2f2;");
			    out.print("}");

			    out.print("input[type=\"submit\"] {");
			    out.print("background: #27589C;");
			    out.print("border-radius: 999px;");
			    out.print("box-shadow: #5E5DF0 0 10px 20px -10px;");
			    out.print("box-sizing: border-box;");
			    out.print("color: #FFFFFF;");
			    out.print("cursor: pointer;");
			    out.print("font-family: Inter,Helvetica,\"Apple Color Emoji\",\"Segoe UI Emoji\",NotoColorEmoji,\"Noto Color Emoji\",\"Segoe UI Symbol\",\"Android Emoji\",EmojiSymbols,-apple-system,system-ui,\"Segoe UI\",Roboto,\"Helvetica Neue\",\"Noto Sans\",sans-serif;");
			    out.print("font-size: 16px;");
			    out.print("font-weight: 700;");
			    out.print("line-height: 24px;");
			    out.print("opacity: 1;");
			    out.print("outline: 0 solid transparent;");
			    out.print("padding: 8px 18px;");
			    out.print("user-select: none;");
			    out.print("-webkit-user-select: none;");
			    out.print("touch-action: manipulation;");
			    out.print("width: fit-content;");
			    out.print("word-break: break-word;");
			    out.print("border: 0;");
			    out.print("}");

			    out.print("h3 {");
			    out.print("margin: -1rem 0rem 0rem 0rem;");
			    out.print("}");

			    out.print(".sin {");
			    out.print("margin: 0;");
			    out.print("}");

			    out.print("input[type=\"submit\"]:hover {");
			    out.print("background-color: #204d74;");
			    out.print("}");

			    out.print("</style>");
						
			}
			
			if(q1[0].equals(rightanswers[0]))
			{
				out.write("<strong>question 1 is correct</strong> <br><br>");
				d.addStudentPoints(username, points[0]);
				rightanswerscounter++;// history FF
				pointscounter+=10;// history FF
				
			}
			else {
				out.write("<strong>question 1 is Incorrect , the right answer is</strong> "+rightanswers[0]+"<br><br>");
			}if(q2[0].equals(rightanswers[1]))
			{
				out.write("<strong>question 2 is correct </strong><br><br>");
				d.addStudentPoints(username, points[1]);
				rightanswerscounter++;// history FF
				pointscounter+=10;// history FF
			}
			else {
				out.write("<strong>question 2 is Incorrect , the right answer is </strong>"+rightanswers[1]+"<br><br>");
			}if(q3[0].equals(rightanswers[2]))
			{
				out.write("<strong>question 3 is correct</strong> <br>");
				d.addStudentPoints(username, points[2]);
				rightanswerscounter++;// history FF
				pointscounter+=10;// history FF
			}
			else {
				out.write("<strong>question 3 is In correct , the right answer is </strong>"+rightanswers[2]+"<br><br>");
			}
			
			out.print("<input type='submit' name='next' value='Next'>");
			out.print("</form></body></html>");
			
			questioncounter+=3;// history FF
			session.setAttribute("questionshistory", questioncounter);	// history FF
			session.setAttribute("pointshistory", pointscounter);	// history FF
			session.setAttribute("rightanswershistory", rightanswerscounter);	// history FF
			}
			
			
			
		}
		
		
		else if(request.getParameter("nextQuestions")!=null) {
			
			String rightanswers[] = (String[])session.getAttribute("rightanswers");
			int rightAnswerDifficulty[] = (int[])session.getAttribute("rightAnswerDifficulty");
			String username=(String) session.getAttribute("name");
			int questionID[]=(int[])session.getAttribute("questionID");
			int points[]=new int[5];

//			String q1[] =request.getParameterValues("0");
//			String q2[] =request.getParameterValues("1");
//			String q3[] =request.getParameterValues("2");
//			String q4[] =request.getParameterValues("3");
//			String q5[] =request.getParameterValues("4");
//removed because it is hard to check every variable index 0 by a while loop
			
			

			out.print("<html><body><form action='userpageservlet' method='get'>");
			out.write("<input type=\"submit\" name=\"back\" value=\"Home\"class = backandhome> <input type=\"submit\" name=\"backtocoursepage\" value=\"back to course page\" class = backandhome> <br><br>");
			Connection con;
			int id=(int)session.getAttribute("studentID");
			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
				ResultSet rs;
				
					Statement s = con.createStatement();
					for (int i=0;i<5;i++) {
						String sql = "SELECT * FROM answered WHERE student_id = '" + id + "' AND question_id = '"+questionID[i]+"'";
						rs = s.executeQuery(sql);
						if(rs.next()) {
							points[i]=0;
							continue;
						}
						s.executeUpdate("INSERT INTO answered (student_id,question_id) VALUES ("+id+","+questionID[i]+")");
						if(rightAnswerDifficulty[i]==1) {
							points[i]=20;
						}
						else if(rightAnswerDifficulty[i]==2) {
							points[i]=30;
						}
						else if(rightAnswerDifficulty[i]==3) {
							points[i]=40;
						}
						
					}
					con.close();

			} catch (ClassNotFoundException e) {
				System.out.println("class not found");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			
			int qcount=(int) session.getAttribute("qcount");
			
			int questioncounter = (int)session.getAttribute("questionshistory");// history FF
			questioncounter+=qcount;// history FF , take care it might contain error because of misunderstanding
			session.setAttribute("questionshistory", questioncounter);	// history FF
			
			int rightanswerscounter = (int)session.getAttribute("rightanswershistory");// history FF
			int pointscounter = (int)session.getAttribute("pointshistory");// history FF
			
			
			
			
			out.print("<style>");
		    out.print("html, body {");
		    out.print("background: linear-gradient(to bottom, #2b9ada, #B3FFFF);");
		    out.print("font-family: Arial, sans-serif;");
		    out.print("height: 100%;");
		    out.print("margin: 0;");
		    out.print("}");

		    out.print(".container {");
		    out.print("display: flex;");
		    out.print("flex-direction: column;");
		    out.print("justify-content: center;");
		    out.print("align-items: center;");
		    out.print("height: 100vh;");
		    out.print("background: linear-gradient(to bottom, #797EF6, #4ADEDE);");
		    out.print("background-repeat: no-repeat;");
		    out.print("}");
		    
		    out.print(".backandhome{");
		    out.print("background: #27589C;");
		    out.print("box-shadow: #5E5DF0 0 10px 20px -10px;");
		    out.print("box-sizing: border-box;");
		    out.print("color: #FFFFFF;");
		    out.print("cursor: pointer;");
		    out.print("font-family: Inter,Helvetica,\"Apple Color Emoji\",\"Segoe UI Emoji\",NotoColorEmoji,\"Noto Color Emoji\",\"Segoe UI Symbol\",\"Android Emoji\",EmojiSymbols,-apple-system,system-ui,\"Segoe UI\",Roboto,\"Helvetica Neue\",\"Noto Sans\",sans-serif;");
		    out.print("font-size: 16px;");
		    out.print("font-weight: 700;");
		    out.print("line-height: 24px;");
		    out.print("opacity: 1;");
		    out.print("outline: 0 solid transparent;");
		    out.print("padding: 12px 22px;");
		    out.print("user-select: none;");
		    out.print("-webkit-user-select: none;");
		    out.print("touch-action: manipulation;");
		    out.print("width: fit-content;");
		    out.print("word-break: break-word;");
		    out.print("border: 0;");
		    out.print("}");

		    out.print("form {");
		    out.print("background-color: #fff;");
		    out.print("padding: 10px;");
		    out.print("border-radius: 30px;");
		    out.print("box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);");
		    out.print("max-width: 400px;");
		    out.print("max-height: 800;");
		    out.print("margin: 0 auto;");
		    out.print("position: absolute;");
		    out.print("top: 50%;");
		    out.print("left: 50%;");
		    out.print("transform: translate(-50%, -50%);");
		    out.print("}");

		    out.print("label {");
		    out.print("display: block;");
		    out.print("font-weight: bold;");
		    out.print("margin-bottom: 10px;");
		    out.print("}");

		    out.print("input[type=\"text\"],");
		    out.print("input[type=\"password\"] {");
		    out.print("padding: 10px;");
		    out.print("border-radius: 10px;");
		    out.print("border: none;");
		    out.print("margin-bottom: 20px;");
		    out.print("width: 100%;");
		    out.print("box-sizing: border-box;");
		    out.print("font-size: 16px;");
		    out.print("background-color: #f2f2f2;");
		    out.print("}");

		    out.print("input[type=\"submit\"] {");
		    out.print("background: #27589C;");
		    out.print("border-radius: 999px;");
		    out.print("box-shadow: #5E5DF0 0 10px 20px -10px;");
		    out.print("box-sizing: border-box;");
		    out.print("color: #FFFFFF;");
		    out.print("cursor: pointer;");
		    out.print("font-family: Inter,Helvetica,\"Apple Color Emoji\",\"Segoe UI Emoji\",NotoColorEmoji,\"Noto Color Emoji\",\"Segoe UI Symbol\",\"Android Emoji\",EmojiSymbols,-apple-system,system-ui,\"Segoe UI\",Roboto,\"Helvetica Neue\",\"Noto Sans\",sans-serif;");
		    out.print("font-size: 16px;");
		    out.print("font-weight: 700;");
		    out.print("line-height: 24px;");
		    out.print("opacity: 1;");
		    out.print("outline: 0 solid transparent;");
		    out.print("padding: 8px 18px;");
		    out.print("user-select: none;");
		    out.print("-webkit-user-select: none;");
		    out.print("touch-action: manipulation;");
		    out.print("width: fit-content;");
		    out.print("word-break: break-word;");
		    out.print("border: 0;");
		    out.print("}");

		    out.print("h3 {");
		    out.print("margin: -1rem 0rem 0rem 0rem;");
		    out.print("}");

		    out.print(".sin {");
		    out.print("margin: 0;");
		    out.print("}");

		    out.print("input[type=\"submit\"]:hover {");
		    out.print("background-color: #204d74;");
		    out.print("}");

		    out.print("</style>");
		    
			int i=0;
			while (i < qcount) {
				String q1[] =request.getParameterValues(""+i);
				
				if (q1[0].equals(rightanswers[i])) {
					out.write("<strong>question </strong>"+(i+1)+" <strong>is correct </strong><br><br>");
					d.addStudentPoints(username, points[i]);
					
					pointscounter+=points[i]; //history FF
					rightanswerscounter++; 	// history FF
					
				} 
				else {
					

					out.write("<strong>question </strong>"+(i+1)+" <strong>is Incorrect , the right answer is</strong> " + rightanswers[i] + "<br><br>");
				}
				i++;
			}
			
			
			if((int)session.getAttribute("questionsDisplayed")>=(int)session.getAttribute("total")) {
				out.print("<input type='submit' name='finish' value='Finish'>");
				out.print("<style>");
			    out.print("html, body {");
			    out.print("background: linear-gradient(to bottom, #2b9ada, #B3FFFF);");
			    out.print("font-family: Arial, sans-serif;");
			    out.print("height: 100%;");
			    out.print("margin: 0;");
			    out.print("}");

			    out.print(".container {");
			    out.print("display: flex;");
			    out.print("flex-direction: column;");
			    out.print("justify-content: center;");
			    out.print("align-items: center;");
			    out.print("height: 100vh;");
			    out.print("background: linear-gradient(to bottom, #797EF6, #4ADEDE);");
			    out.print("background-repeat: no-repeat;");
			    out.print("}");

			    out.print("form {");
			    out.print("background-color: #fff;");
			    out.print("padding: 10px;");
			    out.print("border-radius: 30px;");
			    out.print("box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);");
			    out.print("max-width: 400px;");
			    out.print("max-height: 800;");
			    out.print("margin: 0 auto;");
			    out.print("position: absolute;");
			    out.print("top: 50%;");
			    out.print("left: 50%;");
			    out.print("transform: translate(-50%, -50%);");
			    out.print("}");

			    out.print("label {");
			    out.print("display: block;");
			    out.print("font-weight: bold;");
			    out.print("margin-bottom: 10px;");
			    out.print("}");

			    out.print("input[type=\"text\"],");
			    out.print("input[type=\"password\"] {");
			    out.print("padding: 10px;");
			    out.print("border-radius: 10px;");
			    out.print("border: none;");
			    out.print("margin-bottom: 20px;");
			    out.print("width: 100%;");
			    out.print("box-sizing: border-box;");
			    out.print("font-size: 16px;");
			    out.print("background-color: #f2f2f2;");
			    out.print("}");

			    out.print("input[type=\"submit\"] {");
			    out.print("background: #27589C;");
			    out.print("border-radius: 999px;");
			    out.print("box-shadow: #5E5DF0 0 10px 20px -10px;");
			    out.print("box-sizing: border-box;");
			    out.print("color: #FFFFFF;");
			    out.print("cursor: pointer;");
			    out.print("font-family: Inter,Helvetica,\"Apple Color Emoji\",\"Segoe UI Emoji\",NotoColorEmoji,\"Noto Color Emoji\",\"Segoe UI Symbol\",\"Android Emoji\",EmojiSymbols,-apple-system,system-ui,\"Segoe UI\",Roboto,\"Helvetica Neue\",\"Noto Sans\",sans-serif;");
			    out.print("font-size: 16px;");
			    out.print("font-weight: 700;");
			    out.print("line-height: 24px;");
			    out.print("opacity: 1;");
			    out.print("outline: 0 solid transparent;");
			    out.print("padding: 8px 18px;");
			    out.print("user-select: none;");
			    out.print("-webkit-user-select: none;");
			    out.print("touch-action: manipulation;");
			    out.print("width: fit-content;");
			    out.print("word-break: break-word;");
			    out.print("border: 0;");
			    out.print("}");

			    out.print("h3 {");
			    out.print("margin: -1rem 0rem 0rem 0rem;");
			    out.print("}");

			    out.print(".sin {");
			    out.print("margin: 0;");
			    out.print("}");

			    out.print("input[type=\"submit\"]:hover {");
			    out.print("background-color: #204d74;");
			    out.print("}");

			    out.print("</style>");
			}
			
			else {
				out.print("<input type='submit' name='continue' value='Next'>");
			}
			
			out.print("</form></body></html>");
			

			session.setAttribute("pointshistory", pointscounter);	// history FF
			session.setAttribute("rightanswershistory", rightanswerscounter);	// history FF
			
			
		}
	
		else if(request.getParameter("continue")!=null)
		{
			System.out.println("sha8ala");
			request.getRequestDispatcher("TheQuestions.jsp").forward(request, response);
			
		}
		else if(request.getParameter("finish")!=null)
		{
			
			
			Connection con = (Connection) session.getAttribute("con");
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("bazet");
			}
			request.getRequestDispatcher("UserPage.jsp").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
