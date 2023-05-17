package Project;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
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
//		response.setHeader("Cache-Control", "no-cache, no-store");
//        response.setHeader("Pragma", "no-cache");
//        response.setHeader("Expires", "0");
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
			request.getRequestDispatcher("HomePage.jsp").forward(request, response);
			
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
		
		
		else if(request.getParameter("selectcourse")!=null)
		{
			String[] name =request.getParameterValues("selectcourse");
			session.setAttribute("coursename", name[0]);
			session.setAttribute("courseID", d.getCourseID(""+session.getAttribute("coursename")));
			request.getRequestDispatcher("coursepage.jsp").forward(request, response);
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
			questioncounter+=3;// history FF
			session.setAttribute("questionshistory", questioncounter);	// history FF
			
			int rightanswerscounter = (int)session.getAttribute("rightanswershistory");// history FF
			int pointscounter = (int)session.getAttribute("pointshistory");// history FF
			
			
			
			String rightanswers[] = (String[])session.getAttribute("rightanswers");
			int rightAnswerDifficulty[] = (int[])session.getAttribute("rightAnswerDifficulty");
			String username=(String) session.getAttribute("name");
			int points[]=new int[3];


			String q1[] =request.getParameterValues("0");
			String q2[] =request.getParameterValues("1");
			String q3[] =request.getParameterValues("2");
			
			
			
			out.print("<html><body><form action='userpageservlet' method='get'>");
			for (int i=0;i<3;i++) {
				points[i]=10;
						
			}
			
			if(q1[0].equals(rightanswers[0]))
			{
				out.write("question 1 is correct <br>");
				d.addStudentPoints(username, points[0]);
				rightanswerscounter++;// history FF
				pointscounter+=10;// history FF
				
			}
			else {
				out.write("question 1 is Incorrect , the right answer is "+rightanswers[0]+"<br>");
			}if(q2[0].equals(rightanswers[1]))
			{
				out.write("question 2 is correct <br>");
				d.addStudentPoints(username, points[1]);
				rightanswerscounter++;// history FF
				pointscounter+=10;// history FF
			}
			else {
				out.write("question 2 is Incorrect , the right answer is "+rightanswers[1]+"<br>");
			}if(q3[0].equals(rightanswers[2]))
			{
				out.write("question 3 is correct <br>");
				d.addStudentPoints(username, points[2]);
				rightanswerscounter++;// history FF
				pointscounter+=10;// history FF
			}
			else {
				out.write("question 3 is In correct , the right answer is "+rightanswers[2]+"<br>");
			}
			
			out.print("<input type='submit' name='next' value='Next'>");
			out.print("</form></body></html>");
			
			session.setAttribute("pointshistory", pointscounter);	// history FF
			session.setAttribute("rightanswershistory", rightanswerscounter);	// history FF
			
			
			
			
		}else if(request.getParameter("nextQuestions")!=null) {
			
			
			
			
			
			
			String rightanswers[] = (String[])session.getAttribute("rightanswers");
			int rightAnswerDifficulty[] = (int[])session.getAttribute("rightAnswerDifficulty");
			String username=(String) session.getAttribute("name");
			int points[]=new int[5];

//			String q1[] =request.getParameterValues("0");
//			String q2[] =request.getParameterValues("1");
//			String q3[] =request.getParameterValues("2");
//			String q4[] =request.getParameterValues("3");
//			String q5[] =request.getParameterValues("4");
//removed because it is hard to check every variable index 0 by a while loop
			
			out.print("<html><body><form action='userpageservlet' method='get'>");
			for (int i=0;i<5;i++) {
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
			int qcount=(int) session.getAttribute("qcount");
			
			int questioncounter = (int)session.getAttribute("questionshistory");// history FF
			questioncounter+=qcount;// history FF , take care it might contain error because of misunderstanding
			session.setAttribute("questionshistory", questioncounter);	// history FF
			
			int rightanswerscounter = (int)session.getAttribute("rightanswershistory");// history FF
			int pointscounter = (int)session.getAttribute("pointshistory");// history FF
			
			
			int i=0;
			while (i < qcount) {
				String q1[] =request.getParameterValues(""+i);
				if (q1[0].equals(rightanswers[i])) {
					out.write("question "+i+" is correct <br>");
					d.addStudentPoints(username, points[i]);
					
					pointscounter+=points[i]; //history FF
					rightanswerscounter++; 	// history FF
					
				} else {
					out.write("question "+i+" is Incorrect , the right answer is " + rightanswers[i] + "<br>");
				}
				i++;
			}
			if((int)session.getAttribute("questionsDisplayed")>=(int)session.getAttribute("total")) {
				out.print("<input type='submit' name='finish' value='Finish'>");
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
