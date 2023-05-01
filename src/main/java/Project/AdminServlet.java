package Project;

import java.io.IOException;
import java.io.PrintWriter;

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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("back")!=null)
		{
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
		}
		else if(request.getParameter("logout")!=null)
		{// lesa hyt3ml validation 3lashan y2fl al session wa ymn3 ay access 
			request.getRequestDispatcher("HomePage.jsp").forward(request, response);
		}
		else if (request.getParameter("Addcourses") != null) {
			request.getRequestDispatcher("AddCoursePage.jsp").forward(request, response);

		}
		
		else if(request.getParameter("confirmCourse")!=null)
		{
			if(request.getParameter("coursename")=="" ||request.getParameter("coursename")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("coursecode")=="" ||request.getParameter("coursecode")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("courseDisc")=="" ||request.getParameter("courseDisc")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("chapter1Name")=="" ||request.getParameter("chapter1Name")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("chapter1Ex")=="" ||request.getParameter("chapter1Ex")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("q1")=="" ||request.getParameter("q1")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("q2")=="" ||request.getParameter("q2")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("q3")=="" ||request.getParameter("q3")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else {	
			Database d = new Database();
			
			d.Addcourse(request.getParameter("coursename"), request.getParameter("coursecode"), request.getParameter("courseDisc"));
			d.Addchapter(d.getCourseID(request.getParameter("coursename")),request.getParameter("chapter1Name"), request.getParameter("chapter1Ex"));
			
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("q1"),request.getParameter("right1"),""+0);
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("q2"),request.getParameter("right2"),""+0);
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("q3"),request.getParameter("right3"),""+0);
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			}
		}
		
		else if(request.getParameter("AddChaptersubmit")!=null) {
		
			if(request.getParameter("ChapterName")=="" ||request.getParameter("ChapterName")==null )
			{
				request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("ChapterEx")=="" ||request.getParameter("ChapterEx")==null )
			{
				request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else {
			Database d = new Database();
		d.Addchapter(d.getCourseID(request.getParameter("coursename")),request.getParameter("ChapterName"), request.getParameter("ChapterEx"));
		
		request.getRequestDispatcher("AdminPage.jsp").forward(request, response);

		}
		}
		else if(request.getParameter("Addchapters")!=null)
		{
			
			request.getRequestDispatcher("AddChapterpage.jsp").forward(request, response);

		}
		
		else if(request.getParameter("addAdmin")!=null)
		{
			request.getRequestDispatcher("AddAdminpage.jsp").forward(request, response);
			
		}
		
		else if(request.getParameter("newadmin")!=null)
		{
			Database d = new Database();
			
			if(request.getParameter("firstname")=="" ||request.getParameter("firstname")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("username")=="" ||request.getParameter("username")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("Please fill all data");
			}else if(request.getParameter("Email")=="" ||request.getParameter("Email")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("password")=="" ||request.getParameter("password")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(request.getParameter("confirmpassword")=="" ||request.getParameter("confirmpassword")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else if(d.checkusername(request.getParameter("username"))==false)
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("username already taken");
			}
			else if(d.checkemail(request.getParameter("Email"))==false)
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("email is associated to another account");
			}
			else if((request.getParameter("password")).length()<8)
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("password is weak , use more than 8 characters");
			}
			else if(!(request.getParameter("password")).equals(request.getParameter("confirmpassword")))
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("passwords doesn't match");
			}
			else {
			
			
			
			d.singupadmin(request.getParameter("firstname"), request.getParameter("username"), request.getParameter("Email"),request.getParameter("password"));
			  
			  
		 
			
			
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			}
		}
		
		else if(request.getParameter("addquestion")!=null)
		{
			request.getRequestDispatcher("Addquestionpage.jsp").forward(request, response);
			
		}
		else if(request.getParameter("anotherquestion")!=null)
		{
			if(request.getParameter("question_text")=="" ||request.getParameter("question_text")==null )
			{
				request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else {
			Database d = new Database();
			String[] separator = (request.getParameter("chaptername")).split(" / ");
			
			
			d.Addquestion(d.getCourseID(separator[1]),request.getParameter("question_text"),request.getParameter("rightanswer"),request.getParameter("difficulty"));
			request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
			}
		}
		else if(request.getParameter("finishquestion")!=null)
		{
			if(request.getParameter("question_text")=="" ||request.getParameter("question_text")==null )
			{
				request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
				out.write("Please fill all data");
			}
			else {
			Database d = new Database();
			String[] separator = (request.getParameter("chaptername")).split(" / ");
			
			
			d.Addquestion(d.getCourseID(separator[1]),request.getParameter("question_text"),request.getParameter("rightanswer"),request.getParameter("difficulty"));
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			}
		}
		

	}


}