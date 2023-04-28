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
			// go to test page
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
			
			if(q1[0].equals(rightanswers[0]))
			{
				out.write("question 1 is correct <br>");
				d.addStudentPoints(username, points[0]);
			}
			else {
				out.write("question 1 is In correct , the right answer is "+rightanswers[0]+"<br>");
			}
			
			if(q2[0].equals(rightanswers[1]))
			{
				out.write("question 2 is correct<br>");
				d.addStudentPoints(username, points[1]);

			}
			else {
				System.out.println(q2[0]);
				System.out.println(rightanswers[1]);
				out.write("question 2 is In correct , the right answer is "+rightanswers[1]+"<br>");
			}
			
			if(q3[0].equals(rightanswers[2]))
			{
				out.write("question 3 is correct<br>"+"<br>");
				d.addStudentPoints(username, points[2]);
			}
			else {
				out.write("question 3 is In correct , the right answer is "+rightanswers[2]+"<br>");

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
