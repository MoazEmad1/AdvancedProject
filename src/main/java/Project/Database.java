package Project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.net.*;
import java.io.*;
//libraries needed for email sending
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.catalina.connector.Response;

public class Database {

	Connection con;

	public Database() {
		//empty constructor cause i need the methods to open a connection for a short while before closing it again
		// so no need to intialize anything here
		
	}

	public String checkdata(String user, String pass) { // checks if the log in data exist in the data base or not ,and is it for admin or student
		
		ResultSet rs = null; //the object that hold the record,records data
		String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			// keep in mind the 3306 can differ between us so check first in XAMPP	
			user.toLowerCase();
			String userUpdated="";
			for (int i = 0; i < user.length(); i++) {
				// comparing alphabets with their ASCII value
				if ((user.charAt(i) >= 97 && user.charAt(i) <= 122) || (user.charAt(i) >= 48 && user.charAt(i) <= 57))
				{
					userUpdated = userUpdated + user.charAt(i);
				}
			}
			System.out.println(userUpdated);
				Statement s = con.createStatement(); 
				String sql = "SELECT * FROM admin WHERE username = '" + userUpdated + "' AND password = '" + pass + "'"; // the mysql code needed for the operation
				rs = s.executeQuery(sql); // stores records that follow the mysql code condition

				if (rs.next()) // check if there is a record stored in the object
				{
					con.close(); // closes the connection to avoid unnessecary load on memory
					result = "admin"; // mark that this data is belonging to admin 
				}
				
				else //in case he didn't find in admin data , he will start searching in User's
				{
					
					s = con.createStatement();
					sql = "SELECT * FROM student WHERE username = '" + userUpdated + "' AND password = '" + pass + "'";
					rs = s.executeQuery(sql);

					if (rs.next()) 
					{
						con.close();
						result = "student";

					}
					
					else // if it wasn't found too in users data then it is a wrong data
					{
						con.close();
						result = "fail"; // indicates it is wrong data
					}

				}

			 

		}
		catch (ClassNotFoundException e) {
			System.out.println("class not found");
		}
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("al code atmn3");
		}
		
		return result; // returns the state of the data back to server

	}

	public int signupuser(String fname, String lname, String email, String username, String pass) {

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			username.toLowerCase();
			for (int i = 0; i < username.length(); i++) {
				// comparing alphabets with their ASCII value
				if ((username.charAt(i) >= 97 && username.charAt(i) <= 122) || (username.charAt(i) >= 48 && username.charAt(i) <= 9))
				{
					continue;
				}
				return 0;
			}
			
				Statement s = con.createStatement();
				String sql = "INSERT INTO student (first_name, last_name, username,email,password) VALUES ('" + fname+ "', '" + lname + "', '" + username + "', '" + email + "','" + pass + "')";
				s.executeUpdate(sql);
				
				//this long sql code is just to insert data into database (id is generated automatically)
			
			con.close();// close the connection
			return 1;


		}
		catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
		
		
	}

	public boolean checkusername(String username) { // used for sign up validation to check nobody has the same username
		
	// if it returned true then username is unique , false means another account have it
		
		ResultSet rs = null;
		boolean result = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

			Statement s = con.createStatement();
			String sql = "SELECT * FROM admin WHERE username = '" + username + "'"; //search in admin's usernames first
			rs = s.executeQuery(sql);

			if (rs.next()) {
				con.close();
				result = false; 
			}
			
			else { // if not found then search in user's usernames
				
				s = con.createStatement();
				sql = "SELECT * FROM student WHERE username = '" + username + "'";
				rs = s.executeQuery(sql);

				if (rs.next()) {
					con.close();
					result = false;

				} 
				
				else { // if not found in either admins or users then it is valid
					con.close();
					result = true;

				}

			}

		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(result);
		return result;
		
		
	}
	
public int getID(String username) { // checks if the log in data exist in the data base or not ,and is it for admin or student
		
		ResultSet rs = null; //the object that hold the record,records data
		int result = 0; // the indicator that will be returned to server to decide to what page the user will be forwarded to
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			// keep in mind the 3306 can differ between us so check first in XAMPP	
			
			
				Statement s = con.createStatement(); 
				String sql = "SELECT * FROM admin WHERE username = '"+username+"'"; // the mysql code needed for the operation
				rs = s.executeQuery(sql); // stores records that follow the mysql code condition

				if (rs.next()) // check if there is a record stored in the object
				{
					result = rs.getInt("id"); // mark that this data is belonging to admin 
					con.close(); // closes the connection to avoid unnessecary load on memory
				}
				
				else //in case he didn't find in admin data , he will start searching in User's
				{
					
					s = con.createStatement();
					sql = "SELECT * FROM student WHERE username = '" +username+"'";
					rs = s.executeQuery(sql);

					if (rs.next()) 
					{
						result = rs.getInt("id"); // mark that this data is belonging to admin 
						con.close();

					}
					
					

				}

			 

		}
		catch (ClassNotFoundException e) {
			System.out.println("class not found");
		}
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("al code atmn3");
		}
		
		return result; // returns the state of the data back to server

	}

public int getCourseID(String coursename) { // checks if the log in data exist in the data base or not ,and is it for admin or student
	
	ResultSet rs = null; //the object that hold the record,records data
	int result = 0; // the indicator that will be returned to server to decide to what page the user will be forwarded to
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
		// keep in mind the 3306 can differ between us so check first in XAMPP	
		
		
			Statement s = con.createStatement(); 
			String sql = "SELECT * FROM course WHERE course_name = '"+coursename+"'"; // the mysql code needed for the operation
			rs = s.executeQuery(sql); // stores records that follow the mysql code condition

			if (rs.next()) // check if there is a record stored in the object
			{
				result = rs.getInt("id"); // mark that this data is belonging to admin 
			}
			con.close(); // closes the connection to avoid unnessecary load on memory
			
	
		 

	}
	catch (ClassNotFoundException e) {
		System.out.println("class not found");
	}
	
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("al code atmn3");
	}
	
	return result; // returns the state of the data back to server

}


public String getAdminUsername(int id) { // checks if the log in data exist in the data base or not ,and is it for admin or student
	
	ResultSet rs = null; //the object that hold the record,records data
	String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
		// keep in mind the 3306 can differ between us so check first in XAMPP	
		
		
			Statement s = con.createStatement(); 
			String sql = "SELECT * FROM admin WHERE id = '"+id+"'"; // the mysql code needed for the operation
			rs = s.executeQuery(sql); // stores records that follow the mysql code condition

			if (rs.next()) // check if there is a record stored in the object
			{
				result = rs.getString("username"); // mark that this data is belonging to admin 
			}
			
			con.close(); // closes the connection to avoid unnessecary load on memory
			

		 

	}
	catch (ClassNotFoundException e) {
		System.out.println("class not found");
	}
	
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("al code atmn3");
	}
	
	return result; // returns the state of the data back to server

}

public String getStudentUsername(int id) { // checks if the log in data exist in the data base or not ,and is it for admin or student
	
	ResultSet rs = null; //the object that hold the record,records data
	String result = ""; // the indicator that will be returned to server to decide to what page the user will be forwarded to
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
		// keep in mind the 3306 can differ between us so check first in XAMPP	
		
		
			Statement s = con.createStatement(); 
			String sql = "SELECT * FROM student WHERE id = '"+id+"'"; // the mysql code needed for the operation
			rs = s.executeQuery(sql); // stores records that follow the mysql code condition

			if (rs.next()) // check if there is a record stored in the object
			{
				result = rs.getString("username"); // mark that this data is belonging to admin 
			}
			
			con.close(); // closes the connection to avoid unnessecary load on memory
		 

	}
	catch (ClassNotFoundException e) {
		System.out.println("class not found");
	}
	
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("al code atmn3");
	}
	
	return result; // returns the state of the data back to server

}


	public boolean checkemail(String email) { // just like check email but the only difference is it checks for emails 
		ResultSet rs = null;
		boolean result = false;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

			
				Statement s = con.createStatement();
				String sql = "SELECT * FROM admin WHERE email = '" + email + "'";
				rs = s.executeQuery(sql);
				
				if (rs.next()) {
					con.close();
					result = false;
				}
				
				else {

					s = con.createStatement();
					sql = "SELECT * FROM student WHERE email = '" + email + "'";
					rs = s.executeQuery(sql);
					
					if (rs.next()) {
						con.close();
						result = false;

					} 
					
					else {
						con.close();
						result = true;

					}

				}

			

		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return result;
	
	
	}
	
	public boolean retrievePassword(String email) {
		
		ResultSet rs = null;
		boolean result = false;

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

			
				Statement s = con.createStatement();
				String sql = "SELECT * FROM admin WHERE email = '" + email + "'"; //search if one of admin have that email
				rs = s.executeQuery(sql);
				
				if (rs.next()) { 
					sendEmail(email,rs.getString("password")); // it will call another method to make the email sending process
					con.close();
					result = true;//return state of its existance in database
				}
				
				else {

					s = con.createStatement();
					sql = "SELECT * FROM student WHERE email = '" + email + "'";
					rs = s.executeQuery(sql);
					
					if (rs.next()) {
						sendEmail(email,rs.getString("password"));
						con.close();
						result = true;
					} 
					
					else {
						con.close();
						result = false;
					}

				}

			

		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return result;
		
	}
	
	private void sendEmail(String email,String pass) { //this part is related to javax.mail and our email provider "send in blue"

		  String username="coursesoverflow2023@gmail.com"; // this is our server username which is the same as our email
		  String password="BzjfE4O5SMX9rkvI"; //this is the email server password , DON'T MESS WITH THAT !!!
		
		  
		  Properties prop = new Properties(); // it controls the properties of the connection (email side) (not related with our database)
			prop.put("mail.smtp.auth" ,"true"); // this code just to configure that there will be authentication in the mail
			prop.put("mail.smtp.ssl.protokls" ,"TLSv1.2"); // the protocol that email use, and yes it is written protokls , this is not a mistake
			prop.put("mail.smtp.host","smtp-relay.sendinblue.com"); // this config our host "send in blue" , don't mess with it 
			prop.put("mail.smtp.port","587");						//port number we use , don't change it
			
			Session session = Session.getDefaultInstance(prop,new javax.mail.Authenticator() { //this area is setting the authentication by java
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password); // we here send our server username and password which were above
			
			}	
			
			});
			session.setDebug(true); // it gives us a step by step knowledge for the email sending process
			try {
				
				Message message = new MimeMessage(session); // this creates the instance of our email
				message.setFrom(new InternetAddress("coursesoverflow2023@gmail.com")); // sender email
				message.setRecipient(Message.RecipientType.TO,new InternetAddress(email)); // reciever email , the reciver email is the one sent in method
				message.setSubject("Password Retriving"); // write the subject in email , the part you read without opening the email
				message.setText("Your password is "+pass); // the actual text in mail , the part you see when you open the email
				Transport.send(message); 				// the step that actually sends the email 
				
			} catch (Exception e) {
				
				System.out.println("error : "+ e.getMessage());
				
			}
			
		
	}
	
	//you need to know the difficulty in the userpagesservlet to send the right amount of addedPoints to this mehod
	public void addStudentPoints(String username,int addedPoints) {
		int points;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

			
				Statement s = con.createStatement();
				String sql = "SELECT * FROM student WHERE username = '" + username + "'";
				rs = s.executeQuery(sql);
				rs.next();
				points=rs.getInt("points");
				points+=addedPoints;
				System.out.println(points);
				s.executeUpdate("UPDATE student  SET points = '"+points+"' WHERE username = '"+username+"'");
				con.close();

		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public void attachCourseToStudent(String coursename,String id) {
		int studentID = Integer.parseInt(id);
		int courseID ;
		ResultSet rs = null;
		boolean result = false;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

			
				Statement s = con.createStatement();
				String sql = "SELECT * FROM course WHERE course_name = '" + coursename + "'";
				rs = s.executeQuery(sql);
				rs.next();
				courseID=rs.getInt("id");
				s.executeUpdate("INSERT INTO takes (student_id,course_id) VALUES ("+studentID+","+courseID+")");
				con.close();

		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public void Addcourse(String coursename , String coursecode, String coursedisc)
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			Statement s = con.createStatement();
			
			String sql="INSERT INTO course (course_name,course_code,course_description) VALUES ('"+coursename +"' ,'"+coursecode+"' ,'"+coursedisc+"' )";
			s.executeUpdate(sql);
			
			
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void Addchapter(int courseid ,String Chaptername, String explanation)
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			Statement s = con.createStatement();
			
			String sql="INSERT INTO chapter (course_id,chapter_explanation,chapter_name) VALUES ('"+courseid +"' ,'"+explanation+"','"+Chaptername+"'  )";
			s.executeUpdate(sql);
	
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void Addquestion(int courseid ,String chaptername,String questiontext , String rightanswer,String difficulty)
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
			Statement s = con.createStatement();
			ResultSet rs=null;
			String sql="SELECT * FROM chapter WHERE chapter_name = '"+chaptername +"'";
			rs=s.executeQuery(sql);
			rs.next();
			String chapterid = rs.getString("id");
			
			sql="INSERT INTO question (course_id,chapter_id,question_text,right_answer,difficulty) VALUES ('"+courseid+"','"+chapterid+"','"+ questiontext+"','"+rightanswer+"','"+difficulty+"')";
			s.executeUpdate(sql);
			con.close();
		} catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void singupadmin(String first_name, String username, String email, String password) {

		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");

			
				Statement s = con.createStatement();
				String sql = "INSERT INTO admin (first_name, username,email,password) VALUES ('" + first_name+ "', '" + username + "', '" + email + "', '" + password + "')";
				s.executeUpdate(sql);
				
				//this long sql code is just to insert data into database (id is generated automatically)
			

			con.close();// close the connection

		}
		catch (ClassNotFoundException e) {
			System.out.println("class not found");
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	


}
