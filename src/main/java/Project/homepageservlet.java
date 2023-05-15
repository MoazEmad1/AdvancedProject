package Project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;

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
				out.write("Please fill all data entry");

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
					session.setAttribute("adminID", d.getID(request.getParameter("username")));
					session.setAttribute("name", d.getAdminUsername(Integer.parseInt(""+session.getAttribute("adminID"))));
					session.setMaxInactiveInterval(1800);
					request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
				} 
				else if (result.equals("student"))
				{
					//azbotha bl session
					// this is a temporary code for saving the username for displaying in userpage
					session.setAttribute("studentID", d.getID(request.getParameter("username")));
					session.setAttribute("name", d.getStudentUsername(Integer.parseInt(""+session.getAttribute("studentID"))));
					session.setMaxInactiveInterval(1800);
					
					Timestamp loginTime = new  Timestamp(System.currentTimeMillis()); // history FF
					
					
					session.setAttribute("pointshistory", 0);	// history FF
					session.setAttribute("questionshistory", 0);	// history FF
					session.setAttribute("rightanswershistory", 0);	// history FF
					
					session.setAttribute("LoginTime", loginTime);	// history FF
					request.getRequestDispatcher("UserPage.jsp").forward(request, response);
				}

				else
				{
					request.getRequestDispatcher("LoginPage.jsp").include(request, response);
					out.write("Username or Password isn't correct");
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
				out.write("Please fill all data");

			} 
			else if (d.checkusername(request.getParameter("username")) == false) 
			{
				//checks if the username is used in the database for another account

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("Username is already taken");

			} 
			else if (request.getParameter("firstname") == "") 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("Please fill all data");

			}
			else if (request.getParameter("lastname") == "")
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("Please fill all data");

			} 
			else if (request.getParameter("email") == "") 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("Please fill all data");

			} 
			//checks if the email is used in the database for another account
			else if (d.checkemail(request.getParameter("email")) == false) 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("Email is already Associated with another account");

			}
			//check if the password is more than 8 characters and not empty
			else if (request.getParameter("password").length() < 8 || request.getParameter("password") == "") 
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("Password should contain at least 8 characters");

			} 
			// checks that both the password and its confirmation is identical
			else if (!request.getParameter("password").equals(request.getParameter("confirmpassword")))
			{

				request.getRequestDispatcher("SignupPage.jsp").include(request, response);
				out.write("Passwords doesn't match");

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
				out.write("Username is not valid");
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
				out.write("Please enter an email");

			}
				
			else
			{
				Database d = new Database();
				
				//call a method to check for the email existance
				boolean result= d.retrievePassword(request.getParameter("email"));
				
				if(result==true)//works if the email is in our database
				{
					//redirects the user to another basic page telling him that the password is sent to his email 
					request.getRequestDispatcher("PasswordSentPage.jsp").forward(request, response);
								
				}
				else
				{ // works if the email doesn't exist in our database
					request.getRequestDispatcher("ForgetPassword.jsp").include(request, response);
					out.write("This email isn't associated with any account");					
						
				}
			}

		}

	}

}
