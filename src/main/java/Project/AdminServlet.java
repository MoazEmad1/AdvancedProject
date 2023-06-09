package Project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
//		response.setHeader("Cache-Control", "no-cache, no-store");
//        response.setHeader("Pragma", "no-cache");
//        response.setHeader("Expires", "0");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("adminID")==null)
        {
        	response.sendRedirect("HomePage.jsp");
        }
		
		
		
		else if(request.getParameter("back")!=null)
		{
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("logout")!=null)
		{// lesa hyt3ml validation 3lashan y2fl al session wa ymn3 ay access 
			
			session.removeAttribute("adminID");
			request.getRequestDispatcher("Logoutbuffer.jsp").forward(request, response);
			
		}
		
		
		else if (request.getParameter("Addcourses") != null) {
			request.getRequestDispatcher("AddCoursePage.jsp").forward(request, response);

		}
		
		
		
		else if(request.getParameter("confirmCourse")!=null)
		{
			if(request.getParameter("coursename")=="" ||request.getParameter("coursename")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("coursecode")=="" ||request.getParameter("coursecode")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("courseDisc")=="" ||request.getParameter("courseDisc")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("chapter1Name")=="" ||request.getParameter("chapter1Name")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("chapter1Ex")=="" ||request.getParameter("chapter1Ex")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("q1")=="" ||request.getParameter("q1")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("q2")=="" ||request.getParameter("q2")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("q3")=="" ||request.getParameter("q3")==null )
			{
				request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else {	
				
				
			Database d = new Database();
			int i=1;
			int x=0;
			int flag=0;
			validat:{	
			while(i<=3) {
				
				String arr[]=(request.getParameter("q"+i).split("-"));
				int flag2=1;
				if(arr.length!=4) {
					request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
					out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
				    out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
				    out.write("</div>");
				    i++;
				    flag2=1;
				    x=1;
				    flag=1;
					break validat;
				}else {
				for(int j=0;j<4;j++) {
					if(arr[j]==null||arr[j]=="") {
						
						flag2=1;
						request.getRequestDispatcher("AddCoursePage.jsp").include(request, response);
						out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
					    out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
					    out.write("</div>");
					    x=1;
					    flag=1;
					    break validat;
					}else {
					
						flag2=0;
					}
					
				}
				i++;
				}
				i++;
				if(x==1) {
					flag=1;
					break validat;
				}
			
			}
			}
			if(flag==0) {
			d.Addcourse(request.getParameter("coursename"), request.getParameter("coursecode"), request.getParameter("courseDisc"));
			d.Addchapter(d.getCourseID(request.getParameter("coursename")),request.getParameter("chapter1Name"), request.getParameter("chapter1Ex"));
			
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("chapter1Name"),request.getParameter("q1"),request.getParameter("right1"),""+0);
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("chapter1Name"),request.getParameter("q2"),request.getParameter("right2"),""+0);
			d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("chapter1Name"),request.getParameter("q3"),request.getParameter("right3"),""+0);
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			}
			}
			
		}
		
		
		
		else if(request.getParameter("AddChaptersubmit")!=null) {
		
			if(request.getParameter("ChapterName")=="" ||request.getParameter("ChapterName")==null )
			{
				request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("ChapterEx")=="" ||request.getParameter("ChapterEx")==null )
			{
				request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("q1")=="" ||request.getParameter("q1")==null )
			{
				request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("q2")=="" ||request.getParameter("q2")==null )
			{
				request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("q3")=="" ||request.getParameter("q3")==null )
			{
				request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else {
				
			Database d = new Database();
			int i=1;
			int flag=0;
			int x=0;	validat:{	
				while(i<=3) {
					
					String arr[]=(request.getParameter("q"+i).split("-"));
					int flag2=1;
					if(arr.length!=4) {
						request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
						out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
					    out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
					    out.write("</div>");
					    i++;
					    flag2=1;
					    x=1;
					    flag=1;
						break validat;
					}else {
					for(int j=0;j<4;j++) {
						if(arr[j]==null||arr[j]=="") {
							
							flag2=1;
							request.getRequestDispatcher("AddChapterpage.jsp").include(request, response);
							out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
						    out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
						    out.write("</div>");
						    x=1;
						    flag=1;
						    break validat;
						}else {
						
							flag2=0;
						}
						
					}
					i++;
					}
					i++;
					if(x==1) {
						flag=1;
						break validat;
					}
				
				}
				}
			
			if(flag==0) {
		d.Addchapter(d.getCourseID(request.getParameter("coursename")),request.getParameter("ChapterName"), request.getParameter("ChapterEx"));
		d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("ChapterName"),request.getParameter("q1"),request.getParameter("r1"),""+0);
		d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("ChapterName"),request.getParameter("q2"),request.getParameter("r2"),""+0);
		d.Addquestion(d.getCourseID(request.getParameter("coursename")),request.getParameter("ChapterName"),request.getParameter("q3"),request.getParameter("r3"),""+0);
		
		request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			}

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
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("username")=="" ||request.getParameter("username")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			else if(request.getParameter("Email")=="" ||request.getParameter("Email")==null || !request.getParameter("Email").matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"))
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Email not valid</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("password")=="" ||request.getParameter("password")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(request.getParameter("confirmpassword")=="" ||request.getParameter("confirmpassword")==null )
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else if(d.checkusername(request.getParameter("username"))==false)
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">username already taken</p>");
			    out.write("</div>");
			}
			
			
			else if(d.checkemail(request.getParameter("Email"))==false)
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">email is associated to another account</p>");
			    out.write("</div>");
			}
			
			
			else if((request.getParameter("password")).length()<8)
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">password is weak , use more than 8 characters</p>");
			    out.write("</div>");
				
			}
			
			
			else if(!(request.getParameter("password")).equals(request.getParameter("confirmpassword")))
			{
				request.getRequestDispatcher("AddAdminpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">passwords doesn't match</p>");
			    out.write("</div>");
				
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
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			else {
			Database d = new Database();
			String[] separator = (request.getParameter("chaptername")).split(" / ");

			String arr[] = (request.getParameter("question_text").split("-"));
			int flag2=1;
			
			if (arr.length != 4) {
				
				request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
				out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
				out.write("</div>");
			}else {
			
				for(int j=0;j<4;j++) {
					if(arr[j]==null||arr[j]=="") {
						flag2=1;
						request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
						out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
						out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
						out.write("</div>");
						break;
					}
					else
						flag2=0;
				}
			}
			if(flag2==0) {
				d.Addquestion(d.getCourseID(separator[1]),separator[0],request.getParameter("question_text"),request.getParameter("rightanswer"),request.getParameter("difficulty"));
			request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
			}
			}
			
		}
		
		
		else if(request.getParameter("finishquestion")!=null)
		{
			if(request.getParameter("question_text")=="" ||request.getParameter("question_text")==null )
			{
				request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 17%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			
			
			else {
			Database d = new Database();
			String[] separator = (request.getParameter("chaptername")).split(" / ");
			
			String arr[] = (request.getParameter("question_text").split("-"));
			int flag2=1;
			
			if (arr.length != 4) {
				
				request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
				out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
				out.write("</div>");
			}else {
			
				for(int j=0;j<4;j++) {
					if(arr[j]==null||arr[j]=="") {
						flag2=1;
						request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
						out.write("<div style=\"position: absolute; top: 16%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
						out.write("<p style=\"font-weight: bold; color: red;\">Question must have 3 answers exactly</p>");
						out.write("</div>");
						break;
					}
					else
						flag2=0;
				}
			}
			if(flag2==0) {
				d.Addquestion(d.getCourseID(separator[1]),separator[0],request.getParameter("question_text"),request.getParameter("rightanswer"),request.getParameter("difficulty"));
			request.getRequestDispatcher("Addquestionpage.jsp").include(request, response);
			}
			}
			
			
		}
		
		
		else if(request.getParameter("feedback")!=null)
		{
			
			request.getRequestDispatcher("SeeFeedBack.jsp").forward(request, response);
		}
		
		
		else if(request.getParameter("feedbackselected")!=null)
		{
			String[] feedback = request.getParameterValues("feedbackselected");
			session.setAttribute("feedbackid", feedback[0]);
			request.getRequestDispatcher("replyfeedback.jsp").forward(request, response);
			
			
		}
		
		
		else if(request.getParameter("sendreply")!=null)
		{
			String feedback = request.getParameter("reply");
			Database d = new Database();
		d.sendreply((int)session.getAttribute("feeduser"),(String)session.getAttribute("feedbackid"),feedback);
			request.getRequestDispatcher("SeeFeedBack.jsp").forward(request, response);
			
			
		}
		
		
		else if(request.getParameter("back")!=null)
		{
			request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
			
			
		}
		
		
		else if(request.getParameter("backtofeedback")!=null)
		{
			request.getRequestDispatcher("SeeFeedBack.jsp").forward(request, response);
			
			
		}
		
	}
}