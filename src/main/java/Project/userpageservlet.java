package Project;


import java.io.IOException;
import java.io.PrintWriter;
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
		
		HttpSession session = request.getSession();
		
		if(request.getParameter("browsecourses")!=null)
		{
			request.getRequestDispatcher("BrowseCourses.jsp").forward(request, response);
			
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
			request.getRequestDispatcher("courseExplaination.jsp").forward(request, response);
		}
		else if(request.getParameter("checkanswers")!=null)
		{
			String rightanswers[] = (String[])session.getAttribute("rightanswers");
			int rightAnswerDifficulty[] = (int[])session.getAttribute("rightAnswerDifficulty");
			String username=(String) session.getAttribute("name");
			int points[]=new int[3];


			String q1[] =request.getParameterValues("0");
			String q2[] =request.getParameterValues("1");
			String q3[] =request.getParameterValues("2");
			
			
			
			out.print("<html><body><form action='userpageservlet' method='get'>");
			for (int i=0;i<3;i++) {
				if(rightAnswerDifficulty[i]==0) {
					points[i]=10;
				}
				else if(rightAnswerDifficulty[i]==1) {
					points[i]=20;
				}
				else if(rightAnswerDifficulty[i]==2) {
					points[i]=30;
				}
				
			}
			int i=0;
			while (i < 3) {
				if (q1[i].equals(rightanswers[i])) {
					out.write("question "+i+" is correct <br>");
					d.addStudentPoints(username, points[i]);
				} else {
					out.write("question "+i+" is Incorrect , the right answer is " + rightanswers[i] + "<br>");
				}
				i++;
			}
			
			out.print("<input type='submit' name='next' value='Next'>");
			out.print("</form></body></html>");
			
		}else if(request.getParameter("finish")!=null) {
			String rightanswers[] = (String[])session.getAttribute("rightanswers");
			int rightAnswerDifficulty[] = (int[])session.getAttribute("rightAnswerDifficulty");
			String username=(String) session.getAttribute("name");
			int points[]=new int[3];


			String q1[] =request.getParameterValues("0");
			String q2[] =request.getParameterValues("1");
			String q3[] =request.getParameterValues("2");
			String q4[] =request.getParameterValues("3");
			String q5[] =request.getParameterValues("4");

			
			
			
			out.print("<html><body><form action='userpageservlet' method='get'>");
			for (int i=0;i<5;i++) {
				if(rightAnswerDifficulty[i]==0) {
					points[i]=10;
				}
				else if(rightAnswerDifficulty[i]==1) {
					points[i]=20;
				}
				else if(rightAnswerDifficulty[i]==2) {
					points[i]=30;
				}
				
			}
			int i=0;
			while (i < 5) {
				if (q1[i].equals(rightanswers[i])) {
					out.write("question "+i+" is correct <br>");
					d.addStudentPoints(username, points[i]);
				} else {
					out.write("question "+i+" is Incorrect , the right answer is " + rightanswers[i] + "<br>");
				}
				i++;
			}
			
			out.print("<input type='submit' name='next' value='Next'>");
			out.print("</form></body></html>");
			
			
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
