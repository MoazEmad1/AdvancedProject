package Project;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String number = request.getParameter("number");
	    String level = request.getParameter("level");
	    String description = request.getParameter("description");
	    String val = request.getParameter("submit");
	    if(request.getParameter("Addcourses")!=null) {
	    	request.getRequestDispatcher("Addcc.jsp").forward(request, response);
	    }
	}
}