package Project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class homepageservlet
 */
@WebServlet("/homepageservlet")
public class homepageservlet extends HttpServlet {
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
		
		
		
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
//		response.setHeader("Cache-Control", "no-cache, no-store");
//        response.setHeader("Pragma", "no-cache");
//        response.setHeader("Expires", "0");
//		/* this if condition triggers if the log in button that exist in the first homepage has been clicked */	
		session.removeAttribute("adminID");
		session.removeAttribute("studentID");
		
		if (request.getParameter("login") != null) {
			request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
		}

		/* this if condition triggers if the sign up button that exist in the first homepage has been clicked */	
		
		else if (request.getParameter("signup") != null) {
			request.getRequestDispatcher("SignupPage.jsp").forward(request, response);
		}

		/* this if condition triggers if the log in button that exist in the log in page has been clicked
		 * and this if condition is responisble for checking the data weather it is the admin's ,student's or if wrong */	
		
		else if (request.getParameter("logincheck") != null) {

			if (request.getParameter("username") == "" || request.getParameter("password") == "") {
				request.getRequestDispatcher("LoginPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data entry</p>");
			    out.write("</div>");
				
				

			}

			else 
			{

				Database d = new Database();

				String result = "";
				// result stores a string that indicates the state of the data {admin,student,fail}
				result = d.checkdata(request.getParameter("username"), request.getParameter("password"));

				if (result.equals("admin"))
				{
					// this is a temporary code for saving the username for displaying in adminpage
					session.setAttribute("admin", true);
					session.setAttribute("adminID", d.getID(request.getParameter("username")));
					request.setAttribute("adminID", d.getID(request.getParameter("username")));
					session.setAttribute("name", d.getAdminUsername(Integer.parseInt(""+session.getAttribute("adminID"))));
					session.setMaxInactiveInterval(1800);
					if(request.getParameter("password").length()>16) {
						request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
					}
					request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
				} 
				else if (result.equals("student"))
				{
					session.setAttribute("student", true);
					
					//azbotha bl session
					// this is a temporary code for saving the username for displaying in userpage
					session.setAttribute("studentID", d.getID(request.getParameter("username")));
					session.setAttribute("name", d.getStudentUsername(Integer.parseInt(""+session.getAttribute("studentID"))));
					request.setAttribute("studentID",d.getID(request.getParameter("username")));
					session.setMaxInactiveInterval(1800);
					
					 ZoneId zoneId = ZoneId.of("Africa/Cairo");
					 	ZonedDateTime zonedDateTime = ZonedDateTime.now(zoneId);
				        LocalDateTime localDateTime = zonedDateTime.toLocalDateTime();


				        Timestamp loginTime = Timestamp.valueOf(localDateTime.plusHours(1)); // history FF

					
					System.out.print(request.getParameter("username"));
					System.out.print(d.getID(request.getParameter("username")));
					
					SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, d MMM yyyy HH:mm:ss");

					// format the Timestamp object as a string
					String Loggedin = dateFormat.format(loginTime);
					System.out.println(Loggedin);
					loginTime=null;
					
					
					
					session.setAttribute("pointshistory", 0);	// history FF
					session.setAttribute("questionshistory", 0);	// history FF
					session.setAttribute("rightanswershistory", 0);	// history FF
					
					session.setAttribute("LoginTime", Loggedin);	// history FF
					if(request.getParameter("password").length()>16) {
						request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
					}
					else {
					request.getRequestDispatcher("UserPage.jsp").forward(request, response);
					}
				}

				else
				{
					request.getRequestDispatcher("LoginPage.jsp").include(request, response);
					out.write("<div style=\"position: absolute; top: 40%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
				    out.write("<p style=\"font-weight: bold; color: red;\">Username or Password isn't correct</p>");
				    out.write("</div>");

				}

			}
		}
		
		/* this if condition triggers if the sign up button that exist in the sign up page has been clicked
		 * it is responsible on checking that all entered data can be stored without any valiadation errors or conflict
		 * in the database ex. repeated username , unfilled fields ,weak password ,etc... */	
		
		else if (request.getParameter("signupcheck") != null) 
		{
			
			Database d = new Database();

			if (request.getParameter("username") =="") 
			{
				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");

			} 
			else if (d.checkusername(request.getParameter("username")) == false) 
			{
			
				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Username is already taken</p>");
			    out.write("</div>");


			} 
			else if (request.getParameter("firstname") == "") 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");

			}
			else if (request.getParameter("lastname") == "")
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");

			} 
			else if (!request.getParameter("email").matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please Enter a valid Email</p>");
			    out.write("</div>");

			} 
			
			else if (request.getParameter("email") == "") 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");

			} 
			
			//checks if the email is used in the database for another account
			else if (d.checkemail(request.getParameter("email")) == false) 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Email is already Associated with another account</p>");
			    out.write("</div>");

			}
			//check if the password is more than 8 characters and not empty
			else if (request.getParameter("password").length() < 8 || request.getParameter("password") == "") 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
			
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Password should contain at least 8 characters</p>");
			    out.write("</div>");

			} 
			// checks that both the password and its confirmation is identical
			else if (!request.getParameter("password").equals(request.getParameter("confirmpassword")))
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Passwords doesn't match</p>");
			    out.write("</div>");

			}
			else if(request.getParameter("password").length()>16) {
				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Password must contain 16 characters at maximum</p>");
			    out.write("</div>");
			}
			else 
			{
				//if this code is reached then all data are valid and will be sent to database
				
				// this is a temporary code for saving the username for displaying in userpage
				request.setAttribute("name", request.getParameter("username"));

				String fname = request.getParameter("firstname");
				String lname = request.getParameter("lastname");
				String email = request.getParameter("email");
				String username = request.getParameter("username");
				String pass = request.getParameter("password");
				
				int x=d.signupuser(fname, lname, email, username, pass);
				if(x==1) {
					request.getRequestDispatcher("UserPage.jsp").forward(request, response);
				}
				
				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 25%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Username is not valid</p>");
			    out.write("</div>");
			}

		}
		
		/* this if condition triggers if the send button that exist in the forget password page has been clicked 
		 * it is responsible to check if the email exist and if so it will send an email , otherwise it will give an error 
		 * not done yet !!!! */	
		
		else if (request.getParameter("forgetpassword") != null) 
		{
			//checks if there is an email entered and not empty
			if(request.getParameter("email")=="")
			{
				request.getRequestDispatcher("ForgetPassword.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 51%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please enter an Email</p>");
			    out.write("</div>");
			}
				
			else
				
			{
				Database d = new Database();
				
				//call a method to check for the email existance
				boolean result= d.changePasswordToOTP(request.getParameter("email"));
				
				if(result==true)//works if the email is in our database
				{
					//redirects the user to another basic page telling him that the password is sent to his email 
					//request.getRequestDispatcher("PasswordSentPage.jsp").forward(request, response);
					//request.getRequestDispatcher("PasswordSentPage.jsp").forward(request, response);
					session.setAttribute("email", request.getParameter("email"));
					response.sendRedirect("PasswordSentPage.jsp");			
				}
				else
				{ // works if the email doesn't exist in our database
					request.getRequestDispatcher("ForgetPassword.jsp").include(request, response);
					out.write("<div style=\"position: absolute; top: 51%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
				    out.write("<p style=\"font-weight: bold; color: red;\">This email isn't associated with any account</p>");
				    out.write("</div>");
						
				}
			}

		}
		else if(request.getParameter("resetPassword")!=null) {
			if(request.getParameter("password")==""||request.getParameter("repassword")=="")
			{
				request.getRequestDispatcher("ResetPassword.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Please fill all data</p>");
			    out.write("</div>");
			}
			else if(request.getParameter("password").length()<8){
				request.getRequestDispatcher("ResetPassword.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Password must be at least 8 characters</p>");
			    out.write("</div>");
			}
			else if(request.getParameter("password").length()>16) {
				request.getRequestDispatcher("ResetPassword.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Password must contain 16 characters at maximum</p>");
			    out.write("</div>");
			}
			else if (!request.getParameter("password").equals(request.getParameter("repassword"))) {
				request.getRequestDispatcher("ResetPassword.jsp").include(request, response);
				out.write("<div style=\"position: absolute; top: 45%; left: 50%; transform: translate(-50%, -50%); text-align: center;\">");
			    out.write("<p style=\"font-weight: bold; color: red;\">Passwords doesn't match</p>");
			    out.write("</div>");
			}
			else {
				Database d = new Database();
				int res;
				int id;
				
				if(session.getAttribute("student")!=null) {
					id = (int)session.getAttribute("resID");
					
					res=d.changeToNewPassword(id,request.getParameter("password"),"student");
				}else {
					id = (int)session.getAttribute("adminresID");

					res=d.changeToNewPassword(id,request.getParameter("password"),"admin");

				}
				if(res==2) {
					request.getRequestDispatcher("UserPage.jsp").forward(request, response);
				}
				else if(res==1) {
					request.getRequestDispatcher("AdminPage.jsp").forward(request, response);

				}
				else {
					request.getRequestDispatcher("HomePage.jsp").forward(request, response);

				}
			}

		}

	}

}
