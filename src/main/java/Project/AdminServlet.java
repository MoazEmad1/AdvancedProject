package Project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("Addcourses") != null) {
			request.getRequestDispatcher("AddCoursePage.jsp").forward(request, response);

		}
		
		if(request.getParameter("confirmCourse")!=null)
		{
			
			Database d = new Database();
			
			d.Addcourse(request.getParameter("coursename"), request.getParameter("coursecode"), request.getParameter("courseDisc"));
			d.Addchapter(d.getCourseID(request.getParameter("coursename")), request.getParameter("chapter1Ex"));
			
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("q1"),request.getParameter("right1"),""+0);
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("q2"),request.getParameter("right2"),""+0);
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("q3"),request.getParameter("right3"),""+0);
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			
		}
		
		if(request.getParameter("AddChaptersubmit")!=null) {
		Database d = new Database();
		d.Addchapter(d.getCourseID(request.getParameter("coursename")), request.getParameter("ChapterEx"));
		
		request.getRequestDispatcher("AdminPage.jsp").forward(request, response);

		}
		
		if(request.getParameter("Addchapters")!=null)
		{
			
			request.getRequestDispatcher("AddChapterpage.jsp").forward(request, response);

		}
		
		if(request.getParameter("addAdmin")!=null)
		{
			request.getRequestDispatcher("AddAdminpage.jsp").forward(request, response);
			
		}
		
		if(request.getParameter("newadmin")!=null)
		{
			
			Database d = new Database();
			
			d.singupadmin(request.getParameter("firstname"), request.getParameter("username"), request.getParameter("Email"),request.getParameter("password"));
			  
			  
		 
			
			
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			
		}
		
		if(request.getParameter("addquestion")!=null)
		{
			request.getRequestDispatcher("Addquestionpage.jsp").forward(request, response);
			
		}
		if(request.getParameter("anotherquestion")!=null)
		{
			
			Database d = new Database();
			String[] separator = (request.getParameter("chaptername")).split(" / ");
			
			
			d.Addquestion(d.getCourseID(separator[1]),request.getParameter("question_text"),request.getParameter("rightanswer"),request.getParameter("difficulty"));
			request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
			
		}
		if(request.getParameter("finishquestion")!=null)
		{
			Database d = new Database();
			String[] separator = (request.getParameter("chaptername")).split(" / ");
			
			
			d.Addquestion(d.getCourseID(separator[1]),request.getParameter("question_text"),request.getParameter("rightanswer"),request.getParameter("difficulty"));
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			
		}
		

	}


}